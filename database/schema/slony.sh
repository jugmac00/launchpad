#!/bin/sh -x

# Slony
# ./configure --prefix=/usr/local --with-perltools=/usr/local/bin
# make
# sudo make install


export CLUSTERNAME=lpcluster
export MASTERDBNAME=launchpad_dev
export MASTERHOST=localhost
export SLAVE1DBNAME=launchpad_slave1
export SLAVE1HOST=localhost
export SLAVE1PORT=5432
export SLAVE2DBNAME=launchpad_slave2
export SLAVE2HOST=localhost
export SLAVE2PORT=5432
export REPLICATIONUSER=slony
export SLONYNODES=/usr/local/etc/slon_tools.conf
export DBSCRIPTS=/home/stub/lp/replication/database/schema
#export DBSCRIPTARGS="\
#--dbname=$SLAVEDBNAME --user=$REPLICATIONUSER --host=$SLAVEHOST"

export SLAVE1CON="--host=$SLAVE1HOST --port=$SLAVE1PORT"
export SLAVE2CON="--host=$SLAVE2HOST --port=$SLAVE2PORT"

# Build a fresh Launchpad database
#make -C $DBSCRIPTS
dropdb --host=$MASTERHOST $MASTERDBNAME
createdb -E UNICODE --template=launchpad_ftest_template \
    --host=$MASTERHOST $MASTERDBNAME

# Create slony superusers.
createuser --host=$MASTERHOST --superuser slony
createuser $SLAVE1CON --superuser slony
createuser $SLAVE2CON --superuser slony

# Drop existing slave databases
dropdb $SLAVE1CON $SLAVE1DBNAME
dropdb $SLAVE2CON $SLAVE2DBNAME

# Create fresh slave databases
createdb -E UNICODE $SLAVE1CON $SLAVE1DBNAME
createdb -E UNICODE $SLAVE2CON $SLAVE2DBNAME
pg_dump --schema-only --no-privileges \
    --username=$REPLICATIONUSER --host=$MASTERHOST $MASTERDBNAME \
    | psql -q -U $REPLICATIONUSER $SLAVE1CON $SLAVE1DBNAME
pg_dump --schema-only --no-privileges \
    --username=$REPLICATIONUSER --host=$MASTERHOST $MASTERDBNAME \
    | psql -q -U $REPLICATIONUSER $SLAVE2CON $SLAVE2DBNAME
PGPORT=$SLAVE1PORT $DBSCRIPTS/security.py -qqq \
    -d $SLAVE1DBNAME -H $SLAVE1HOST -U postgres
PGPORT=$SLAVE2PORT $DBSCRIPTS/security.py -qqq \
    -d $SLAVE2DBNAME -H $SLAVE2HOST -U postgres

# Build slonik config
cat > slon_tools.conf << EOM
\$CLUSTER_NAME="$CLUSTERNAME";
\$LOGDIR="/var/log/postgresql";
\$APACHE_ROTATOR="/usr/sbin/rotatelogs";
\$MASTERNODE = 1;

EOM
slonik_build_env \
    -node $MASTERHOST:$MASTERDBNAME:slony \
    -node $SLAVE1HOST:$SLAVE1DBNAME:slony::$SLAVE1PORT \
    -node $SLAVE2HOST:$SLAVE2DBNAME:slony::$SLAVE2PORT \
    >> slon_tools.conf

#cat >> slon_tools.conf << EOM
#\$SLONY_SETS = {
#    "set1" => {
#        "set_id" => 1,
#	"table_id"    => 1,
#	"sequence_id" => 1,
#        "pkeyedtables" => grep(
#            !/^public.(launchpaddatabaserevision|fticache)$/,
#            \@KEYEDTABLES
#            ),
#        "sequences" => \@SEQUENCES,
#    },
#};
#
#EOM

cat >> slon_tools.conf << EOM
\$SLONY_SETS = {
    "set1" => {
        "set_id" => 1,
	"table_id"    => 1,
	"sequence_id" => 1,
        "pkeyedtables" => \@KEYEDTABLES,
        "sequences" => \@SEQUENCES,
    },
};

EOM

sudo cp slon_tools.conf $SLONYNODES

# Initialize the cluster
slonik_init_cluster | slonik

# Start slon daemons
slon -d 1 $CLUSTERNAME "dbname=$MASTERDBNAME user=$REPLICATIONUSER host=$MASTERHOST"&
slon -d 1 $CLUSTERNAME "dbname=$SLAVE1DBNAME user=$REPLICATIONUSER host=$SLAVE1HOST port=$SLAVE1PORT"&
slon -d 1 $CLUSTERNAME "dbname=$SLAVE2DBNAME user=$REPLICATIONUSER host=$SLAVE2HOST port=$SLAVE2PORT"&

# Create set1
slonik_create_set 1 | slonik

# Subscribe slave to set1
slonik_subscribe_set 1 2 | slonik
slonik_subscribe_set 1 3 | slonik


# Start the slon daemons
echo "# slon startup script" > startslon.sh
chmod a+rx startslon.sh
echo slon -d 1 $CLUSTERNAME \"dbname=$MASTERDBNAME user=$REPLICATIONUSER host=$MASTERHOST\"\& >> startslon.sh
echo slon -d 1 $CLUSTERNAME \"dbname=$SLAVE1DBNAME user=$REPLICATIONUSER host=$SLAVE1HOST port=$SLAVE1PORT\"\& >> startslon.sh
echo slon -d 1 $CLUSTERNAME \"dbname=$SLAVE2DBNAME user=$REPLICATIONUSER host=$SLAVE2HOST port=$SLAVE2PORT\"\& >> startslon.sh
echo '# end' >> startslon.sh

exit

# Test a DB patch
slonik_execute_script -c '
ALTER TABLE WikiName ADD COLUMN foo text;
INSERT INTO LaunchpadDatabaseRevision VALUES (88, 666, 1);
' 1 | slonik


