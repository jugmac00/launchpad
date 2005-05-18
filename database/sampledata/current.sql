
SET client_encoding = 'UNICODE';
SET check_function_bodies = false;

SET search_path = public, pg_catalog;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'person'::pg_catalog.regclass;

INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (27, 'Daniel Henrique Debonzi', 'Daniel', 'Henrique', 'DAJs/l1RrrYFPPd2mBY4b/aFjnTfodXOyg+L+U6uPxUy8rCp/IFC/w==', NULL, NULL, 0, '2005-01-10 13:08:28.753737', 'debonzi', NULL, '''daniel'':1,3 ''debonzi'':5 ''henriqu'':2,4', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (8, 'James Blackwell', 'James', 'Blackwell', NULL, NULL, NULL, 0, '2004-10-12 06:57:28.753737', 'jblack', NULL, '''jame'':1,3 ''blackwel'':2,4', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (19, 'Warty Gnome Team', NULL, NULL, NULL, 1, 'This Team is responsible for GNOME release Issues on Warty Distribution Release', 0, '2004-10-12 06:57:28.753737', 'name19', NULL, '''team'':3 ''gnome'':2 ''warti'':1', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (21, 'Hoary Gnome Team', NULL, NULL, NULL, 1, 'This team is responsible for Security Issues on Hoary Distribution Release', 0, '2004-10-12 06:57:28.753737', 'name21', NULL, '''team'':3 ''gnome'':2 ''hoari'':1', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (24, 'Buttress Source Administrators', NULL, NULL, NULL, 2, 'Ultimate control of the Buttress systems', 666, '2004-12-09 17:59:38.607384', 'buttsource', NULL, '''sourc'':2 ''buttress'':1 ''administr'':3', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (17, 'Ubuntu Team', NULL, NULL, NULL, 1, 'This Team is responsible for the Ubuntu Distribution', 0, '2004-10-12 06:57:28.753737', 'name17', NULL, '''team'':2 ''ubuntu'':1', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (32, 'GuadaMen', NULL, NULL, NULL, 16, 'The guadalinex maintainers team', 0, '2005-04-16 04:37:00.815842', 'guadamen', NULL, '''guadamen'':1', 700, 300, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (18, 'Ubuntu Gnome Team', NULL, NULL, NULL, 1, 'This Team is responsible for the GNOME releases Issues on whole Ubuntu Distribution', 0, '2004-10-12 06:57:28.753737', 'name18', NULL, '''team'':3 ''gnome'':2 ''ubuntu'':1', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (5, 'Scott James Remnant', 'Scott James', 'Remnant', NULL, NULL, NULL, 0, '2004-10-12 06:57:28.753737', 'keybuk', NULL, '''jame'':2,5 ''scott'':1,4 ''remnant'':3,6', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (3, 'Dave Miller', 'Dave', 'Miller', NULL, NULL, NULL, 0, '2004-10-12 06:57:28.753737', 'justdave', NULL, '''dave'':1,3 ''miller'':2,4', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (12, 'Sample Person', 'Sample', 'Person', 'K7Qmeansl6RbuPfulfcmyDQOzp70OxVh5Fcf', NULL, NULL, 30, '2004-10-12 06:57:28.753737', 'name12', NULL, '''sampl'':1,3 ''person'':2,4', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (30, 'Rosetta Administrators', NULL, NULL, NULL, 25, 'Rosetta Administrators', 0, '2005-03-07 13:05:56.480934', 'rosetta-admins', NULL, '''rosetta'':1 ''administr'':2', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (20, 'Warty Security Team', NULL, NULL, NULL, 1, 'This Team is responsible for Security Issues on Warty Distribution Release', 0, '2004-10-12 06:57:28.753737', 'name20', NULL, '''team'':3 ''secur'':2 ''warti'':1', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (13, 'Carlos Perelló Marín', 'Carlos', 'Perelló Marín', 'MdB+BoAdbza3BA6mIkMm6bFo1kv9hR2PKZ3U', NULL, NULL, 0, '2004-10-12 06:57:28.753737', 'carlos', NULL, '''carlo'':1,4 ''marín'':3,6 ''perelló'':2,5', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (14, 'Dafydd Harries', 'Dafydd', 'Harries', 'EvSuSe4k4tkRHSp6p+g91vyQIwL5VJ3iTbRZ', NULL, NULL, 0, '2004-10-12 06:57:28.753737', 'daf', NULL, '''harri'':2,4 ''dafydd'':1,3', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (25, 'Launchpad Administrators', NULL, NULL, NULL, 1, 'Launchpad Administrators', 0, '2004-12-13 18:08:27.2609', 'admins', NULL, '''administr'':2 ''launchpad'':1', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (31, 'Ubuntu Translators', NULL, NULL, NULL, 30, 'Ubuntu Translators', 0, '2005-03-07 13:05:57.563047', 'ubuntu-translators', NULL, '''ubuntu'':1 ''translat'':2', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (26, 'Daniel Silverstone', 'Daniel', 'Silverstone', NULL, NULL, NULL, 0, '2004-12-13 18:10:17.294019', 'kinnison', NULL, '''daniel'':1,3 ''silverston'':2,4', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (4, 'Colin Watson', 'Colin', 'Watson', NULL, NULL, NULL, 0, '2004-10-12 06:57:28.753737', 'kamion', NULL, '''colin'':1,3 ''watson'':2,4', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (10, 'Alexander Limi', 'Alexander', 'Limi', NULL, NULL, NULL, 0, '2004-10-12 06:57:28.753737', 'limi', NULL, '''limi'':2,4 ''alexand'':1,3', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (23, 'David Allouche', 'David', 'Allouche', NULL, NULL, NULL, 0, '2004-12-09 17:59:07.717254', 'ddaa', NULL, '''david'':1,3 ''allouch'':2,4', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (33, 'Edgar Bursic', 'Edgar', 'Bursic', '3JiiJZWCSnGbu71a+Qw1Dik7QAsrS4soxQTy1qzErmIA4F7zfmca8Q==', NULL, NULL, 0, '2005-05-06 20:09:31.825695', 'edgar', NULL, '''edgar'':1,3 ''bursic'':2,4', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (34, 'Jordi Vilalta', 'Jordi', 'Vilalta', 'gsTz0TyTUL7xrkoAH4Yz2WE6/w6WoYG5LjaO8p/xA1FDdSM6qkWiYA==', NULL, NULL, 0, '2005-05-06 20:09:51.386766', 'jvprat', NULL, '''jordi'':1,3 ''vilalta'':2,4', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (35, 'Sigurd Gartmann', 'Sigurd', 'Gartmann', 'FvPq9d4L5onnmcRA9wCzQ5lnPPYIzvW5rJA7GGnnsJuQqz8M8naZkQ==', NULL, NULL, 0, '2005-05-06 20:10:18.431259', 'sigurd-ubuntu', NULL, '''sigurd'':1,3 ''gartmann'':2,4', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (36, 'Vlastimil Skacel', 'Vlastimil', 'Skacel', 'lyA9CgUH9lHmTiaiWGP2vzkmytufiHBAnc9c8WCX1g5pYyBd6QgL3A==', NULL, NULL, 0, '2005-05-06 20:10:41.732277', 'skacel', NULL, '''skacel'':2,4 ''vlastimil'':1,3', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (37, 'Daniel Aguayo', 'Daniel', 'Aguayo', 'bpLapC1tQHUedQBP447krtcmaRPd3hrncPusTlNUKXh5ymfO5yVhhQ==', NULL, NULL, 0, '2005-05-06 20:11:16.591589', 'danner', NULL, '''aguayo'':2,4 ''daniel'':1,3', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (7, 'Andrew Bennetts', 'Andrew', 'Bennetts', NULL, NULL, NULL, 0, '2004-10-12 06:57:28.753737', 'spiv', NULL, '''andrew'':1,3 ''bennett'':2,4', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (38, 'Martin Pitt', 'Martin', 'Pitt', 'iNbxn63pi1VFuZ0byz76vhFtdMXQAj2L+Cn/1UpsbmOhjUZs+Z6Naw==', NULL, NULL, 0, '2005-05-06 20:11:41.773683', 'martin-pitt', NULL, '''pitt'':2,4 ''martin'':1,3', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (39, 'Nicolas Velin', 'Nicolas', 'Velin', 'U2QzusrIFlQZKb3hWzcLpfhFcB3WZ0fa0E+OwcV8q/WOtsQCjarzzA==', NULL, NULL, 0, '2005-05-06 20:12:08.283113', 'nsv', NULL, '''velin'':2,4 ''nicola'':1,3', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (40, 'Francesco Accattapà', 'Francesco', 'Accattapà', 'mSKDc1EKoi8a5L0zd+oueU33nuSEuFWy+JHIHxOukBVJt9LPW47RVg==', NULL, NULL, 0, '2005-05-06 20:12:35.976807', 'callipeo', NULL, '''francesco'':1,3 ''accattapà'':2,4', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (41, 'Aloriel', 'Aloriel', '', '94y1dy33Evut2/bLsGG8Pzguyuip9wHeRtFWp0cSItzHdD1tK3gmcQ==', NULL, NULL, 0, '2005-05-06 20:13:10.405056', 'jorge-gonzalez-gonzalez', NULL, '''aloriel'':1,2', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (42, 'Denis Barbier', 'Denis', 'Barbier', 'vI/vIVB2qsx1NvuaMy+q4l8rWUNMFINWzCSLOK1D5qi97/VmXvIrEw==', NULL, NULL, 0, '2005-05-06 21:12:18.833057', 'barbier', NULL, '''deni'':1,3 ''barbier'':2,4', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (43, 'André Luís Lopes', 'André', 'Luís Lopes', 'HG6qWB8PwzfIr3z+Tu+m3lQv7r1dsaWY6rxCxRuNypGomTPTzBh9iA==', NULL, NULL, 0, '2005-05-06 21:12:20.874654', 'andrelop', NULL, '''lope'':3,6 ''luís'':2,5 ''andré'':1,4', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (44, 'Carlos Valdivia Yagüe', 'Carlos', 'Valdivia Yagüe', 'xrXafuC+VBaIz3m2+0UMjxms+2KhGhj6qnQdoo2V/f4iNFHJgSDzzw==', NULL, NULL, 0, '2005-05-06 21:12:25.930403', 'valyag', NULL, '''carlo'':1,4 ''yagüe'':3,6 ''valdivia'':2,5', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (45, 'Luk Claes', 'Luk', 'Claes', 'w+f2krWWyQIIm76PIUEIsMCNQLhWLjObLcDONJNjjXcRaiKzKXeMAw==', NULL, NULL, 0, '2005-05-06 21:12:27.602384', 'luk-claes', NULL, '''luk'':1,3 ''clae'':2,4', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (46, 'Miroslav Kure', 'Miroslav', 'Kure', '1u05okOZJIa069F8COZ2vmxRq11c+4rolNUVRp539TI5ihnHwk9+Sw==', NULL, NULL, 0, '2005-05-06 21:12:29.45271', 'kurem', NULL, '''kure'':2,4 ''miroslav'':1,3', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (47, 'Morten Brix Pedersen', 'Morten', 'Brix Pedersen', 'n+KIa3PoihBN8ljj9Hjg9H3Im2LWnrn2yprgY4u/MnxOQx3dOh3bDw==', NULL, NULL, 0, '2005-05-06 21:12:31.382429', 'morten', NULL, '''brix'':2,5 ''morten'':1,4 ''pedersen'':3,6', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (48, 'Matti Pöllä', 'Matti', 'Pöllä', 'U4KMnp73AYdriB7QH2NpEYhlH+fBWJKziDPcDAt25OxItZMYh0QV4Q==', NULL, NULL, 0, '2005-05-06 21:12:33.238579', 'mpo', NULL, '''matti'':1,3 ''pöllä'':2,4', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (49, 'Kęstutis Biliūnas', 'Kęstutis', 'Biliūnas', 'YbUJ4nzlxjYtaLLFMqUFL3LplUpS3FxcYwiCAS0WaAcnXS8Sst9BgA==', NULL, NULL, 0, '2005-05-06 21:12:37.221421', 'kebil', NULL, '''biliūnas'':2,4 ''kęstutis'':1,3', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (50, 'Valentina Commissari', 'Valentina', 'Commissari', 'fgwbt51c6ajsTet6DTbQBqAzQ7Q9S1G7S0APNvMX7YN2qpdbNbEn3Q==', NULL, NULL, 0, '2005-05-06 21:12:39.082421', 'tsukimi', NULL, '''valentina'':1,3 ''commissari'':2,4', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (51, 'Helge Kreutzmann', 'Helge', 'Kreutzmann', 'sYVFKi2dWAfkFkWekcW296s2dZ0ihYcxAXtwumI1FQJes4PWD8xvqQ==', NULL, NULL, 0, '2005-05-06 21:12:42.747648', 'kreutzm', NULL, '''helg'':1,3 ''kreutzmann'':2,4', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (1, 'Mark Shuttleworth', 'Mark', 'Shuttleworth', 'K7Qmeansl6RbuPfulfcmyDQOzp70OxVh5Fcf', NULL, NULL, 0, '2004-10-12 06:57:28.753737', 'sabdfl', NULL, '''mark'':1,3 ''shuttleworth'':2,4', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (22, 'Stuart Bishop', 'Stuart', 'Bishop', 'I+lQozEFEr+uBuxQZuKGpL4jkiy6lE1dQsZx', NULL, NULL, 0, '2004-10-12 06:57:28.753737', 'stub', NULL, '''bishop'':2,4 ''stuart'':1,3', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (16, 'Foo Bar', 'Foo', 'Bar', 'K7Qmeansl6RbuPfulfcmyDQOzp70OxVh5Fcf', NULL, NULL, 0, '2004-10-12 06:57:28.753737', 'name16', NULL, '''bar'':2,4 ''foo'':1,3', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (9, 'Christian Reis', 'Christian', 'Reis', NULL, NULL, NULL, 0, '2004-10-12 06:57:28.753737', 'kiko', NULL, '''rei'':2,4 ''christian'':1,3', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (29, 'Guilherme Salgado', 'Guilherme', 'Salgado', 'DAJs/l1RrrYFPPd2mBY4b/aFjnTfodXOyg+L+U6uPxUy8rCp/IFC/w==', NULL, NULL, 0, '2005-01-10 13:08:28.753737', 'salgado', NULL, '''salgado'':2,4 ''guilherm'':1,3', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (28, 'Celso Providelo', 'Celso', 'Providelo', 'DAJs/l1RrrYFPPd2mBY4b/aFjnTfodXOyg+L+U6uPxUy8rCp/IFC/w==', NULL, NULL, 0, '2005-01-10 13:08:28.753737', 'cprov', NULL, '''celso'':1,3 ''providelo'':2,4', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (2, 'Robert Collins', 'Robert', 'Collins', NULL, NULL, NULL, 0, '2004-10-12 06:57:28.753737', 'lifeless', NULL, '''collin'':2,4 ''robert'':1,3', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (11, 'Steve Alexander', 'Steve', 'Alexander', NULL, NULL, NULL, 0, '2004-10-12 06:57:28.753737', 'stevea', NULL, '''steve'':1,3 ''alexand'':2,4', NULL, NULL, 1, NULL);
INSERT INTO person (id, displayname, givenname, familyname, "password", teamowner, teamdescription, karma, karmatimestamp, name, "language", fti, defaultmembershipperiod, defaultrenewalperiod, subscriptionpolicy, merged) VALUES (6, 'Jeff Waugh', 'Jeff', 'Waugh', NULL, NULL, NULL, 0, '2004-10-12 06:57:28.753737', 'jdub', NULL, '''jeff'':1,3 ''waugh'':2,4', NULL, NULL, 1, NULL);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'person'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'emailaddress'::pg_catalog.regclass;

INSERT INTO emailaddress (id, email, person, status) VALUES (7, 'steve.alexander@ubuntulinux.com', 11, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (8, 'colin.watson@ubuntulinux.com', 4, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (9, 'scott.james.remnant@ubuntulinux.com', 5, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (10, 'andrew.bennetts@ubuntulinux.com', 7, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (11, 'james.blackwell@ubuntulinux.com', 8, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (12, 'christian.reis@ubuntulinux.com', 9, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (13, 'jeff.waugh@ubuntulinux.com', 6, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (14, 'dave.miller@ubuntulinux.com', 3, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (17, 'testtest@canonical.com', 12, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (18, 'testtesttest@canonical.com', 12, 3);
INSERT INTO emailaddress (id, email, person, status) VALUES (20, 'stuart.bishop@canonical.com', 22, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (22, 'david@canonical.com', 23, 2);
INSERT INTO emailaddress (id, email, person, status) VALUES (23, 'daniel.debonzi@canonical.com', 27, 4);
INSERT INTO emailaddress (id, email, person, status) VALUES (24, 'celso.providelo@canonical.com', 28, 4);
INSERT INTO emailaddress (id, email, person, status) VALUES (25, 'guilherme.salgado@canonical.com', 29, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (1, 'mark@hbd.com', 1, 4);
INSERT INTO emailaddress (id, email, person, status) VALUES (2, 'robertc@robertcollins.net', 2, 4);
INSERT INTO emailaddress (id, email, person, status) VALUES (3, 'carlos@canonical.com', 13, 4);
INSERT INTO emailaddress (id, email, person, status) VALUES (4, 'daf@canonical.com', 14, 4);
INSERT INTO emailaddress (id, email, person, status) VALUES (6, 'foo.bar@canonical.com', 16, 4);
INSERT INTO emailaddress (id, email, person, status) VALUES (21, 'david.allouche@canonical.com', 23, 4);
INSERT INTO emailaddress (id, email, person, status) VALUES (5, 'lalo@canonical.com', 15, 3);
INSERT INTO emailaddress (id, email, person, status) VALUES (15, 'justdave@bugzilla.org', 3, 3);
INSERT INTO emailaddress (id, email, person, status) VALUES (16, 'test@canonical.com', 12, 4);
INSERT INTO emailaddress (id, email, person, status) VALUES (19, 'testing@canonical.com', 12, 2);
INSERT INTO emailaddress (id, email, person, status) VALUES (26, 'edgar@monteparadiso.hr', 33, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (27, 'jvprat@wanadoo.es', 34, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (28, 'sigurd-ubuntu@brogar.org', 35, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (29, 'skacel@svtech.cz', 36, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (30, 'danner@mixmail.com', 37, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (31, 'martin.pitt@canonical.com', 38, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (32, 'nsv@fr.st', 39, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (33, 'callipeo@libero.it', 40, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (34, 'jorge.gonzalez.gonzalez@hispalinux.es', 41, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (35, 'barbier@linuxfr.org', 42, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (36, 'andrelop@debian.org', 43, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (37, 'valyag@dat.etsit.upm.es', 44, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (38, 'luk.claes@ugent.be', 45, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (39, 'kurem@debian.cz', 46, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (40, 'morten@wtf.dk', 47, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (41, 'mpo@iki.fi', 48, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (42, 'kebil@kaunas.init.lt', 49, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (43, 'tsukimi@quaqua.net', 50, 1);
INSERT INTO emailaddress (id, email, person, status) VALUES (44, 'kreutzm@itp.uni-hannover.de', 51, 1);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'emailaddress'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'gpgkey'::pg_catalog.regclass;

INSERT INTO gpgkey (id, "owner", keyid, fingerprint, pubkey, revoked, algorithm, keysize) VALUES (1, 1, '09F89725', 'XVHJOU77IYTD0982FTG6OQFC0GF809POQW45MJ76', '<-- sample pubkey ??? -->', false, 17, 1024);
INSERT INTO gpgkey (id, "owner", keyid, fingerprint, pubkey, revoked, algorithm, keysize) VALUES (2, 11, '09F89890', 'XVHJOU77IYTD0981FTG6OQFC0GF809POQW45MJ76', '<-- sample pubkey ??? -->', false, 17, 1024);
INSERT INTO gpgkey (id, "owner", keyid, fingerprint, pubkey, revoked, algorithm, keysize) VALUES (3, 10, '09F89321', 'XVHJOU77IYTD0983FTG6OQFC0GF809POQW45MJ76', '<-- sample pubkey ??? -->', false, 17, 1024);
INSERT INTO gpgkey (id, "owner", keyid, fingerprint, pubkey, revoked, algorithm, keysize) VALUES (4, 8, '09F89098', 'XVHJOU77IYTD0984FTG6OQFC0GF809POQW45MJ76', '<-- sample pubkey ??? -->', false, 17, 1024);
INSERT INTO gpgkey (id, "owner", keyid, fingerprint, pubkey, revoked, algorithm, keysize) VALUES (5, 9, '09F89123', 'XVHJOU77IYTD0985FTG6OQFC0GF809POQW45MJ76', '<-- sample pubkey ??? -->', false, 17, 1024);
INSERT INTO gpgkey (id, "owner", keyid, fingerprint, pubkey, revoked, algorithm, keysize) VALUES (6, 4, '09F89124', 'XVHJOU77IYTA0985FTG6OQFC0GF809POQW45MJ76', '<-- sample pubkey ??? -->', false, 17, 1024);
INSERT INTO gpgkey (id, "owner", keyid, fingerprint, pubkey, revoked, algorithm, keysize) VALUES (7, 5, '09F89125', 'XVHJOU77IYTQ0985FTG6OQFC0GF809POQW45MJ76', '<-- sample pubkey ??? -->', false, 17, 1024);
INSERT INTO gpgkey (id, "owner", keyid, fingerprint, pubkey, revoked, algorithm, keysize) VALUES (8, 7, '09F89126', 'XVHJOU77IYTX0985FTG6OQFC0GF809POQW45MJ76', '<-- sample pubkey ??? -->', false, 17, 1024);
INSERT INTO gpgkey (id, "owner", keyid, fingerprint, pubkey, revoked, algorithm, keysize) VALUES (9, 3, '09F89127', 'XVHJOU77IYTZ0985FTG6OQFC0GF809POQW45MJ76', '<-- sample pubkey ??? -->', false, 17, 1024);
INSERT INTO gpgkey (id, "owner", keyid, fingerprint, pubkey, revoked, algorithm, keysize) VALUES (10, 6, '09F89120', 'XVHJOU77IYTP0985FTG6OQFC0GF809POQW45MJ76', '<-- sample pubkey ??? -->', false, 17, 1024);
INSERT INTO gpgkey (id, "owner", keyid, fingerprint, pubkey, revoked, algorithm, keysize) VALUES (11, 28, '681B6469', 'C85826521A6EF6A6037BB3F79FF2583E681B6469', '<-- sample pubkey ??? -->', false, 17, 1024);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'gpgkey'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'archuserid'::pg_catalog.regclass;

INSERT INTO archuserid (id, person, archuserid) VALUES (1, 1, 'mark.shuttleworth');
INSERT INTO archuserid (id, person, archuserid) VALUES (2, 11, 'steve.alexander');
INSERT INTO archuserid (id, person, archuserid) VALUES (3, 10, 'alexander.limi');
INSERT INTO archuserid (id, person, archuserid) VALUES (4, 8, 'james.blackwell');
INSERT INTO archuserid (id, person, archuserid) VALUES (5, 9, 'christian.reis');
INSERT INTO archuserid (id, person, archuserid) VALUES (6, 4, 'colin.watson');
INSERT INTO archuserid (id, person, archuserid) VALUES (7, 5, 'scott.james.remnant');
INSERT INTO archuserid (id, person, archuserid) VALUES (8, 7, 'andrew.bennetts');
INSERT INTO archuserid (id, person, archuserid) VALUES (9, 3, 'dave.miller');
INSERT INTO archuserid (id, person, archuserid) VALUES (10, 6, 'jeff.waugh');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'archuserid'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'wikiname'::pg_catalog.regclass;

INSERT INTO wikiname (id, person, wiki, wikiname) VALUES (1, 1, 'http://www.ubuntulinux.com/wiki/', 'MarkShuttleworth');
INSERT INTO wikiname (id, person, wiki, wikiname) VALUES (2, 11, 'http://www.ubuntulinux.com/wiki/', 'SteveAlexander');
INSERT INTO wikiname (id, person, wiki, wikiname) VALUES (3, 10, 'http://www.ubuntulinux.com/wiki/', 'AlexanderLimi');
INSERT INTO wikiname (id, person, wiki, wikiname) VALUES (4, 8, 'http://www.ubuntulinux.com/wiki/', 'JamesBlackwell');
INSERT INTO wikiname (id, person, wiki, wikiname) VALUES (5, 9, 'http://www.ubuntulinux.com/wiki/', 'ChristianReis');
INSERT INTO wikiname (id, person, wiki, wikiname) VALUES (6, 4, 'http://www.ubuntulinux.com/wiki/', 'ColinWatson');
INSERT INTO wikiname (id, person, wiki, wikiname) VALUES (7, 5, 'http://www.ubuntulinux.com/wiki/', 'ScottJamesRemnant');
INSERT INTO wikiname (id, person, wiki, wikiname) VALUES (8, 7, 'http://www.ubuntulinux.com/wiki/', 'AndrewBennetts');
INSERT INTO wikiname (id, person, wiki, wikiname) VALUES (9, 3, 'http://www.ubuntulinux.com/wiki/', 'DaveMiller');
INSERT INTO wikiname (id, person, wiki, wikiname) VALUES (10, 6, 'http://www.ubuntulinux.com/wiki/', 'JeffWaugh');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'wikiname'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'jabberid'::pg_catalog.regclass;

INSERT INTO jabberid (id, person, jabberid) VALUES (1, 1, 'markshuttleworth@jabber.org');
INSERT INTO jabberid (id, person, jabberid) VALUES (2, 11, 'stevea@jabber.org');
INSERT INTO jabberid (id, person, jabberid) VALUES (3, 10, 'limi@jabber.org');
INSERT INTO jabberid (id, person, jabberid) VALUES (4, 8, 'jblack@jabber.org');
INSERT INTO jabberid (id, person, jabberid) VALUES (5, 9, 'kiko@jabber.org');
INSERT INTO jabberid (id, person, jabberid) VALUES (6, 4, 'colin@jabber.org');
INSERT INTO jabberid (id, person, jabberid) VALUES (7, 5, 'scott@jabber.org');
INSERT INTO jabberid (id, person, jabberid) VALUES (8, 7, 'spiv@jabber.org');
INSERT INTO jabberid (id, person, jabberid) VALUES (9, 3, 'justdave@jabber.org');
INSERT INTO jabberid (id, person, jabberid) VALUES (10, 6, 'jeff@jabber.org');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'jabberid'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'ircid'::pg_catalog.regclass;

INSERT INTO ircid (id, person, network, nickname) VALUES (1, 1, 'irc.freenode.net', 'mark');
INSERT INTO ircid (id, person, network, nickname) VALUES (2, 11, 'irc.freenode.net', 'SteveA');
INSERT INTO ircid (id, person, network, nickname) VALUES (3, 10, 'irc.freenode.net', 'limi');
INSERT INTO ircid (id, person, network, nickname) VALUES (4, 8, 'irc.freenode.net', 'jblack');
INSERT INTO ircid (id, person, network, nickname) VALUES (5, 3, 'irc.freenode.net', 'justdave');
INSERT INTO ircid (id, person, network, nickname) VALUES (6, 9, 'irc.freenode.net', 'kiko');
INSERT INTO ircid (id, person, network, nickname) VALUES (7, 4, 'irc.freenode.net', 'Kamion');
INSERT INTO ircid (id, person, network, nickname) VALUES (8, 5, 'irc.freenode.net', 'Keybuk');
INSERT INTO ircid (id, person, network, nickname) VALUES (9, 6, 'irc.freenode.net', 'jeff');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'ircid'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'teammembership'::pg_catalog.regclass;

INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (1, 1, 17, 3, '2005-03-03 10:02:53.830191', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (2, 11, 17, 2, '2005-03-03 10:02:53.831231', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (3, 10, 17, 3, '2005-03-03 10:02:53.831725', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (4, 4, 17, 3, '2005-03-03 10:02:53.832216', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (5, 7, 17, 1, '2005-03-03 10:02:53.832809', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (6, 3, 17, 6, '2005-03-03 10:02:53.833299', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (7, 1, 18, 5, '2005-03-03 10:02:53.833759', '2005-03-13 10:02:53.833759', NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (8, 6, 18, 5, '2005-03-03 10:02:53.834248', '2005-03-13 10:02:53.833759', NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (9, 20, 17, 1, '2005-03-03 10:02:53.834789', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (10, 11, 18, 3, '2005-03-03 10:02:53.835303', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (11, 10, 18, 2, '2005-03-03 10:02:53.835792', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (12, 4, 18, 5, '2005-03-03 10:02:53.836299', '2005-03-13 10:02:53.833759', NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (13, 7, 18, 2, '2005-03-03 10:02:53.8368', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (14, 3, 18, 1, '2005-03-03 10:02:53.837284', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (15, 20, 18, 4, '2005-03-03 10:02:53.837789', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (16, 6, 17, 3, '2005-03-03 10:02:53.838301', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (17, 16, 17, 3, '2005-03-03 10:02:53.838806', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (18, 16, 18, 3, '2005-03-03 10:02:53.839322', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (19, 23, 24, 3, '2005-03-03 10:02:53.839822', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (20, 2, 24, 3, '2005-03-03 10:02:53.840339', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (21, 28, 25, 2, '2005-03-03 10:02:53.840813', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (22, 22, 25, 2, '2005-03-03 10:02:53.841292', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (23, 2, 25, 2, '2005-03-03 10:02:53.841836', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (24, 11, 25, 2, '2005-03-03 10:02:53.842335', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (25, 23, 25, 2, '2005-03-03 10:02:53.842821', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (26, 7, 25, 2, '2005-03-03 10:02:53.843319', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (27, 8, 25, 2, '2005-03-03 10:02:53.843811', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (28, 14, 25, 2, '2005-03-03 10:02:53.844315', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (29, 13, 25, 2, '2005-03-03 10:02:53.844834', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (30, 26, 25, 2, '2005-03-03 10:02:53.84533', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (31, 27, 25, 2, '2005-03-03 10:02:53.845844', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (32, 16, 25, 3, '2005-03-03 10:02:53.846352', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (33, 29, 25, 3, '2005-03-03 10:02:53.846864', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (34, 14, 30, 3, '2005-03-07 13:05:57.590333', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (35, 13, 30, 3, '2005-03-07 13:05:57.610314', NULL, NULL, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (36, 16, 24, 2, '2005-04-14 00:00:00', NULL, 16, NULL);
INSERT INTO teammembership (id, person, team, status, datejoined, dateexpires, reviewer, reviewercomment) VALUES (37, 13, 31, 2, '2005-05-07 00:00:00', NULL, 13, NULL);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'teammembership'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'teamparticipation'::pg_catalog.regclass;

INSERT INTO teamparticipation (id, team, person) VALUES (1, 17, 1);
INSERT INTO teamparticipation (id, team, person) VALUES (2, 17, 11);
INSERT INTO teamparticipation (id, team, person) VALUES (3, 17, 10);
INSERT INTO teamparticipation (id, team, person) VALUES (4, 17, 4);
INSERT INTO teamparticipation (id, team, person) VALUES (5, 18, 11);
INSERT INTO teamparticipation (id, team, person) VALUES (6, 18, 10);
INSERT INTO teamparticipation (id, team, person) VALUES (7, 18, 7);
INSERT INTO teamparticipation (id, team, person) VALUES (8, 17, 6);
INSERT INTO teamparticipation (id, team, person) VALUES (9, 17, 16);
INSERT INTO teamparticipation (id, team, person) VALUES (10, 18, 16);
INSERT INTO teamparticipation (id, team, person) VALUES (11, 24, 23);
INSERT INTO teamparticipation (id, team, person) VALUES (12, 24, 2);
INSERT INTO teamparticipation (id, team, person) VALUES (13, 25, 28);
INSERT INTO teamparticipation (id, team, person) VALUES (14, 25, 22);
INSERT INTO teamparticipation (id, team, person) VALUES (15, 25, 2);
INSERT INTO teamparticipation (id, team, person) VALUES (16, 25, 11);
INSERT INTO teamparticipation (id, team, person) VALUES (17, 25, 23);
INSERT INTO teamparticipation (id, team, person) VALUES (18, 25, 7);
INSERT INTO teamparticipation (id, team, person) VALUES (19, 25, 8);
INSERT INTO teamparticipation (id, team, person) VALUES (20, 25, 14);
INSERT INTO teamparticipation (id, team, person) VALUES (21, 25, 13);
INSERT INTO teamparticipation (id, team, person) VALUES (22, 25, 26);
INSERT INTO teamparticipation (id, team, person) VALUES (23, 25, 27);
INSERT INTO teamparticipation (id, team, person) VALUES (24, 25, 16);
INSERT INTO teamparticipation (id, team, person) VALUES (25, 25, 29);
INSERT INTO teamparticipation (id, team, person) VALUES (26, 30, 14);
INSERT INTO teamparticipation (id, team, person) VALUES (27, 30, 13);
INSERT INTO teamparticipation (id, team, person) VALUES (28, 2, 2);
INSERT INTO teamparticipation (id, team, person) VALUES (29, 5, 5);
INSERT INTO teamparticipation (id, team, person) VALUES (30, 26, 26);
INSERT INTO teamparticipation (id, team, person) VALUES (31, 27, 27);
INSERT INTO teamparticipation (id, team, person) VALUES (32, 29, 29);
INSERT INTO teamparticipation (id, team, person) VALUES (33, 3, 3);
INSERT INTO teamparticipation (id, team, person) VALUES (34, 8, 8);
INSERT INTO teamparticipation (id, team, person) VALUES (35, 10, 10);
INSERT INTO teamparticipation (id, team, person) VALUES (36, 13, 13);
INSERT INTO teamparticipation (id, team, person) VALUES (37, 14, 14);
INSERT INTO teamparticipation (id, team, person) VALUES (38, 23, 23);
INSERT INTO teamparticipation (id, team, person) VALUES (39, 9, 9);
INSERT INTO teamparticipation (id, team, person) VALUES (40, 1, 1);
INSERT INTO teamparticipation (id, team, person) VALUES (41, 15, 15);
INSERT INTO teamparticipation (id, team, person) VALUES (42, 22, 22);
INSERT INTO teamparticipation (id, team, person) VALUES (43, 16, 16);
INSERT INTO teamparticipation (id, team, person) VALUES (44, 28, 28);
INSERT INTO teamparticipation (id, team, person) VALUES (45, 7, 7);
INSERT INTO teamparticipation (id, team, person) VALUES (46, 6, 6);
INSERT INTO teamparticipation (id, team, person) VALUES (47, 11, 11);
INSERT INTO teamparticipation (id, team, person) VALUES (48, 4, 4);
INSERT INTO teamparticipation (id, team, person) VALUES (49, 12, 12);
INSERT INTO teamparticipation (id, team, person) VALUES (58, 24, 16);
INSERT INTO teamparticipation (id, team, person) VALUES (59, 32, 16);
INSERT INTO teamparticipation (id, team, person) VALUES (60, 33, 33);
INSERT INTO teamparticipation (id, team, person) VALUES (61, 34, 34);
INSERT INTO teamparticipation (id, team, person) VALUES (62, 35, 35);
INSERT INTO teamparticipation (id, team, person) VALUES (63, 36, 36);
INSERT INTO teamparticipation (id, team, person) VALUES (64, 37, 37);
INSERT INTO teamparticipation (id, team, person) VALUES (65, 38, 38);
INSERT INTO teamparticipation (id, team, person) VALUES (66, 39, 39);
INSERT INTO teamparticipation (id, team, person) VALUES (67, 40, 40);
INSERT INTO teamparticipation (id, team, person) VALUES (68, 41, 41);
INSERT INTO teamparticipation (id, team, person) VALUES (69, 42, 42);
INSERT INTO teamparticipation (id, team, person) VALUES (70, 43, 43);
INSERT INTO teamparticipation (id, team, person) VALUES (71, 44, 44);
INSERT INTO teamparticipation (id, team, person) VALUES (72, 45, 45);
INSERT INTO teamparticipation (id, team, person) VALUES (73, 46, 46);
INSERT INTO teamparticipation (id, team, person) VALUES (74, 47, 47);
INSERT INTO teamparticipation (id, team, person) VALUES (75, 48, 48);
INSERT INTO teamparticipation (id, team, person) VALUES (76, 49, 49);
INSERT INTO teamparticipation (id, team, person) VALUES (77, 50, 50);
INSERT INTO teamparticipation (id, team, person) VALUES (78, 51, 51);
INSERT INTO teamparticipation (id, team, person) VALUES (79, 31, 13);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'teamparticipation'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = '"schema"'::pg_catalog.regclass;

INSERT INTO "schema" (id, name, title, description, "owner", extensible) VALUES (2, 'schema', 'SCHEMA', 'description', 1, true);
INSERT INTO "schema" (id, name, title, description, "owner", extensible) VALUES (3, 'trema', 'XCHEMA', 'description', 1, true);
INSERT INTO "schema" (id, name, title, description, "owner", extensible) VALUES (4, 'enema', 'ENHEMA', 'description', 1, true);
INSERT INTO "schema" (id, name, title, description, "owner", extensible) VALUES (1, 'mark', 'TITLE', 'description', 1, true);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = '"schema"'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'label'::pg_catalog.regclass;

INSERT INTO label (id, "schema", name, title, description) VALUES (1, 1, 'blah', 'blah', 'blah');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'label'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'personlabel'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'personlabel'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'project'::pg_catalog.regclass;

INSERT INTO project (id, "owner", name, displayname, title, summary, description, datecreated, homepageurl, wikiurl, lastdoap, sourceforgeproject, freshmeatproject, reviewed, active, fti) VALUES (4, 12, 'mozilla', 'the Mozilla Project', 'The Mozilla Project', 'The Mozilla Project is the largest open source web browser collaborative project. Founded when Netscape released the source code to its pioneering browser in 1999, the Mozilla Project continues to set the standard for web browser technology.', 'The Mozilla Project produces several internet applications that are very widely used, and is also a center for collaboration on internet standards work by open source groups.

The Project now has several popular products, including the Firefox web browser, the Thunderbird mail client and the libraries that enable them to run on many platforms.

Organisationally, the Mozilla Project is hosted by the Mozilla Foundation, a not-for-profit company incorporated in the US.', '2004-09-24 20:58:02.177698', 'http://www.mozilla.org/', NULL, NULL, NULL, NULL, false, true, '''us'':118 ''run'':95 ''set'':38 ''use'':56 ''web'':16,42,82 ''1999'':32 ''also'':59 ''code'':26 ''host'':104 ''mail'':86 ''mani'':97 ''open'':14,69 ''wide'':55 ''work'':67 ''enabl'':92 ''found'':20 ''group'':71 ''sever'':49,76 ''sourc'':15,25,70 ''applic'':51 ''center'':61 ''client'':87 ''includ'':79 ''produc'':48 ''profit'':113 ''releas'':23 ''browser'':17,30,43,83 ''compani'':114 ''continu'':36 ''firefox'':81 ''foundat'':108 ''largest'':13 ''librari'':90 ''mozilla'':1,3,6,9,34,46,101,107 ''netscap'':22 ''organis'':99 ''pioneer'':29 ''popular'':77 ''product'':78 ''project'':4,7,10,19,35,47,73,102 ''collabor'':18,63 ''incorpor'':115 ''internet'':50,65 ''platform'':98 ''standard'':40,66 ''technolog'':44 ''thunderbird'':85 ''not-for-profit'':110');
INSERT INTO project (id, "owner", name, displayname, title, summary, description, datecreated, homepageurl, wikiurl, lastdoap, sourceforgeproject, freshmeatproject, reviewed, active, fti) VALUES (7, 16, 'aaa', 'the Test Project', 'The Test Project', 'This is a small project that has no purpose by to serve as a test data point. The only thing this project has ever produced is products, most of which are largely unheard of. This short description is long enough.', 'Of course, one can''t say enough about the Test Project. Not only is it always there, it''s often exactly in the same state that you saw it last. And it has an amazing ability to pop up in places where you just didn''t think you''d expect to find it. Very noticeable when you least want it noticed, that sort of thing.

It would be very interesting to know whether this second paragraph of text about the test project is in fact rendered as a second paragraph, or if it all blurs together in a haze of testing. Only time will tell.', '2004-10-03 22:27:25.02843', 'http://www.testmenow.com', NULL, NULL, NULL, NULL, false, true, '''d'':96 ''aaa'':1 ''one'':50 ''pop'':85 ''saw'':75 ''say'':53 ''abil'':83 ''amaz'':82 ''blur'':142 ''data'':23 ''didn'':92 ''ever'':31 ''fact'':132 ''find'':99 ''haze'':146 ''know'':119 ''larg'':39 ''last'':77 ''long'':46 ''serv'':19 ''sort'':110 ''tell'':152 ''test'':3,6,22,57,128,148 ''text'':125 ''time'':150 ''want'':106 ''alway'':63 ''cours'':49 ''exact'':68 ''least'':105 ''notic'':102,108 ''often'':67 ''place'':88 ''point'':24 ''short'':43 ''small'':11 ''state'':72 ''thing'':27,112 ''think'':94 ''would'':114 ''enough'':47,54 ''expect'':97 ''produc'':32 ''purpos'':16 ''render'':133 ''second'':122,136 ''togeth'':143 ''product'':34 ''project'':4,7,12,29,58,129 ''unheard'':40 ''whether'':120 ''descript'':44 ''interest'':117 ''paragraph'':123,137');
INSERT INTO project (id, "owner", name, displayname, title, summary, description, datecreated, homepageurl, wikiurl, lastdoap, sourceforgeproject, freshmeatproject, reviewed, active, fti) VALUES (5, 12, 'gnome', 'GNOME', 'The GNOME Project', 'The GNOME Project is an initiative to prduce a free desktop software framework. GNOME is more than a set of applications, it is a user interface standard (the Gnome HIG) and a set of libraries that allow applications to work together in a harmonious desktop-ish way.', 'The Gnome Project was founded (when?) to build on the success of early applications using the Gtk GUI toolkit. Many of those applications are still part of Gnome, and the Gtk toolkit remains an essential part of Gnome.

Gnome applications cover the full spectrum from office productivity applications to games, digital camera applications, and of course the Gnome Panel which acts as a launcher and general access point for apps on the desktop.', '2004-09-24 20:58:02.222154', 'http://www.gnome.org/', NULL, NULL, NULL, NULL, false, true, '''act'':114 ''app'':123 ''gtk'':70,84 ''gui'':71 ''hig'':35 ''ish'':52 ''set'':24,38 ''use'':68 ''way'':53 ''free'':15 ''full'':96 ''game'':103 ''mani'':73 ''part'':79,89 ''user'':30 ''work'':45 ''allow'':42 ''build'':61 ''cours'':109 ''cover'':94 ''digit'':104 ''earli'':66 ''found'':58 ''gnome'':1,2,4,7,19,34,55,81,91,92,111 ''initi'':11 ''offic'':99 ''panel'':112 ''point'':121 ''still'':78 ''access'':120 ''applic'':26,43,67,76,93,101,106 ''camera'':105 ''prduce'':13 ''remain'':86 ''togeth'':46 ''desktop'':16,51,126 ''essenti'':88 ''general'':119 ''harmoni'':49 ''librari'':40 ''product'':100 ''project'':5,8,56 ''softwar'':17 ''success'':64 ''toolkit'':72,85 ''interfac'':31 ''launcher'':117 ''spectrum'':97 ''standard'':32 ''framework'':18 ''desktop-ish'':50');
INSERT INTO project (id, "owner", name, displayname, title, summary, description, datecreated, homepageurl, wikiurl, lastdoap, sourceforgeproject, freshmeatproject, reviewed, active, fti) VALUES (2, 2, 'do-not-use-info-imports', 'DO NOT USE', 'DO NOT USE', 'DO NOT USE', 'TEMPORARY project till mirror jobs are assigned to correct project', '2004-09-24 20:58:00.637677', 'http://arch.ubuntu.com/', NULL, NULL, NULL, NULL, true, false, '''job'':20 ''use'':4,9,12,15 ''info'':5 ''till'':18 ''assign'':22 ''import'':6 ''mirror'':19 ''correct'':24 ''project'':17,25 ''temporari'':16 ''do-not-use-info-import'':1');
INSERT INTO project (id, "owner", name, displayname, title, summary, description, datecreated, homepageurl, wikiurl, lastdoap, sourceforgeproject, freshmeatproject, reviewed, active, fti) VALUES (8, 16, 'gimp', 'the GiMP Project', 'The GIMP Project', 'The GIMP Project works in the field of image manipulation and reproduction. The Project is responsible for several pieces of software, such as The GiMP and GiMP-Print.', 'Founded by Spencer Kimball in 1996 with the simple aim of producing a "paint" program, the GIMP project has become one of the defining projects of the open source world. The GIMP itself is an image manipulation program that is beginning to rival even Adobe Photoshop in features and functionality.

The project is loosely organised, with about 15 people making regular contributions. There is no fixed release schedule other than "when it is done".', '2004-10-03 22:27:45.283741', 'http://www.gimp.org/', NULL, NULL, NULL, NULL, false, true, '''15'':94 ''aim'':46 ''fix'':102 ''one'':57 ''1996'':42 ''adob'':81 ''done'':110 ''even'':80 ''gimp'':1,3,6,9,32,35,53,68 ''imag'':16,72 ''loos'':90 ''make'':96 ''open'':64 ''piec'':26 ''work'':11 ''becom'':56 ''begin'':77 ''defin'':60 ''field'':14 ''found'':37 ''paint'':50 ''peopl'':95 ''print'':36 ''rival'':79 ''sever'':25 ''simpl'':45 ''sourc'':65 ''world'':66 ''featur'':84 ''kimbal'':40 ''produc'':48 ''releas'':103 ''manipul'':17,73 ''organis'':91 ''program'':51,74 ''project'':4,7,10,21,54,61,88 ''regular'':97 ''respons'':23 ''schedul'':104 ''softwar'':28 ''spencer'':39 ''function'':86 ''contribut'':98 ''photoshop'':82 ''reproduct'':19 ''gimp-print'':34');
INSERT INTO project (id, "owner", name, displayname, title, summary, description, datecreated, homepageurl, wikiurl, lastdoap, sourceforgeproject, freshmeatproject, reviewed, active, fti) VALUES (1, 1, 'ubuntu', 'the Ubuntu Project', 'The Ubuntu Project', 'A community Linux distribution building a slick desktop for the global market. Ubuntu is absolutely free and will stay that way, contains no proprietary application software, always ships with the latest Gnome desktop software and Python integration.', 'The Ubuntu Project aims to create a freely redistributable OS that is easy to customize and derive from. Ubuntu is released every six months with contributions from a large community, especially the Gnome Project. While the full range of KDE and other desktop environments are available, Ubuntu''s Gnome desktop receives most of the polish and support work done for each release.

Ubuntu also includes work to unify the translation of common open source desktop applications and the tracking of bugs across multiple distributions.', '2004-09-24 20:58:00.633513', 'http://www.ubuntulinux.org/', NULL, NULL, NULL, NULL, false, true, '''os'':54 ''aim'':48 ''bug'':125 ''kde'':84 ''six'':67 ''way'':28 ''also'':108 ''done'':103 ''easi'':57 ''free'':23 ''full'':81 ''larg'':73 ''open'':117 ''rang'':82 ''ship'':35 ''stay'':26 ''work'':102,110 ''alway'':34 ''avail'':90 ''build'':12 ''creat'':50 ''deriv'':61 ''everi'':66 ''gnome'':39,77,93 ''linux'':10 ''month'':68 ''slick'':14 ''sourc'':118 ''track'':123 ''unifi'':112 ''across'':126 ''applic'':32,120 ''common'':116 ''commun'':9,74 ''custom'':59 ''especi'':75 ''freeli'':52 ''global'':18 ''includ'':109 ''integr'':44 ''latest'':38 ''market'':19 ''polish'':99 ''python'':43 ''receiv'':95 ''releas'':65,106 ''ubuntu'':1,3,6,20,46,63,91,107 ''absolut'':22 ''contain'':29 ''desktop'':15,40,87,94,119 ''environ'':88 ''multipl'':127 ''project'':4,7,47,78 ''softwar'':33,41 ''support'':101 ''translat'':114 ''contribut'':70 ''distribut'':11,128 ''proprietari'':31 ''redistribut'':53');
INSERT INTO project (id, "owner", name, displayname, title, summary, description, datecreated, homepageurl, wikiurl, lastdoap, sourceforgeproject, freshmeatproject, reviewed, active, fti) VALUES (3, 2, 'launchpad-mirrors', 'Launchpad SCM Mirrors', 'The Launchpad Mirroring Project', 'launchpad mirrors various revision control archives, that mirroring is managed here', 'A project to mirror revision control archives into Arch.', '2004-09-24 20:58:00.65398', 'http://arch.ubuntu.com/', NULL, NULL, NULL, NULL, false, true, '''scm'':5 ''arch'':30 ''manag'':20 ''revis'':14,26 ''archiv'':16,28 ''mirror'':3,6,9,12,18,25 ''control'':15,27 ''project'':10,23 ''various'':13 ''launchpad'':2,4,8,11 ''launchpad-mirror'':1');
INSERT INTO project (id, "owner", name, displayname, title, summary, description, datecreated, homepageurl, wikiurl, lastdoap, sourceforgeproject, freshmeatproject, reviewed, active, fti) VALUES (6, 12, 'iso-codes', 'iso-codes', 'iso-codes', 'foo', 'bar', '2004-09-24 20:58:02.238443', 'http://www.gnome.org/', NULL, NULL, NULL, NULL, false, true, '''bar'':11 ''foo'':10 ''iso'':2,5,8 ''code'':3,6,9 ''iso-cod'':1,4,7');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'project'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'projectrelationship'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'projectrelationship'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'product'::pg_catalog.regclass;

INSERT INTO product (id, project, "owner", name, displayname, title, summary, description, datecreated, homepageurl, screenshotsurl, wikiurl, listurl, programminglang, downloadurl, lastdoap, sourceforgeproject, freshmeatproject, reviewed, active, fti, autoupdate) VALUES (6, 5, 12, 'gnome-terminal', 'GNOME Terminal', 'The GNOME Terminal Emulator', 'Gnome Terminal is a simple terminal application for your Gnome desktop. It allows quick access to console applications, supports all console types, and has many useful features such as tabbed consoles (many consoles in a single window with quick switching between them).', 'The Gnome Terminal application fully supports Gnome 2 and is a standard part of the Gnome Desktop.', '2004-09-24 20:58:02.256678', 'http://www.gnome.org/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, true, '''2'':59 ''tab'':39 ''use'':35 ''emul'':9 ''mani'':34,41 ''part'':64 ''type'':31 ''allow'':22 ''fulli'':56 ''gnome'':2,4,7,10,19,53,58,67 ''quick'':23,48 ''simpl'':14 ''singl'':45 ''access'':24 ''applic'':16,27,55 ''consol'':26,30,40,42 ''featur'':36 ''switch'':49 ''termin'':3,5,8,11,15,54 ''window'':46 ''desktop'':20,68 ''support'':28,57 ''standard'':63 ''gnome-termin'':1', false);
INSERT INTO product (id, project, "owner", name, displayname, title, summary, description, datecreated, homepageurl, screenshotsurl, wikiurl, listurl, programminglang, downloadurl, lastdoap, sourceforgeproject, freshmeatproject, reviewed, active, fti, autoupdate) VALUES (8, 4, 12, 'thunderbird', 'Mozilla Thunderbird', 'Mozilla Thunderbird', 'The Mozilla Thunderbird email client', 'The Mozilla Thunderbird email client', '2004-09-24 20:58:04.478988', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, true, '''email'':9,14 ''client'':10,15 ''mozilla'':2,4,7,12 ''thunderbird'':1,3,5,8,13', false);
INSERT INTO product (id, project, "owner", name, displayname, title, summary, description, datecreated, homepageurl, screenshotsurl, wikiurl, listurl, programminglang, downloadurl, lastdoap, sourceforgeproject, freshmeatproject, reviewed, active, fti, autoupdate) VALUES (4, 4, 12, 'firefox', 'Mozilla Firefox', 'Mozilla Firefox', 'The Mozilla Firefox web browser', 'The Mozilla Firefox web browser', '2004-09-24 20:58:02.185708', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, true, '''web'':9,14 ''browser'':10,15 ''firefox'':1,3,5,8,13 ''mozilla'':2,4,7,12', false);
INSERT INTO product (id, project, "owner", name, displayname, title, summary, description, datecreated, homepageurl, screenshotsurl, wikiurl, listurl, programminglang, downloadurl, lastdoap, sourceforgeproject, freshmeatproject, reviewed, active, fti, autoupdate) VALUES (10, NULL, 2, 'python-gnome2-dev', 'python gnome2 dev', 'python gnome2 dev', 'Python bindings for the GNOME desktop environment', 'Python bindings for the GNOME desktop environment', '2004-09-24 20:58:00.674409', 'http://www.daa.com.au/~james/software/pygtk/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, false, '''dev'':4,7,10 ''bind'':12,19 ''gnome'':15,22 ''gnome2'':3,6,9 ''python'':2,5,8,11,18 ''desktop'':16,23 ''environ'':17,24 ''python-gnome2-dev'':1', false);
INSERT INTO product (id, project, "owner", name, displayname, title, summary, description, datecreated, homepageurl, screenshotsurl, wikiurl, listurl, programminglang, downloadurl, lastdoap, sourceforgeproject, freshmeatproject, reviewed, active, fti, autoupdate) VALUES (3, 3, 2, 'arch-mirrors', 'Arch mirrors', 'Arch archive mirrors', 'Arch Archive Mirroring project.', 'Arch archive full-archive mirror tasks', '2004-09-24 20:58:00.691047', 'http://arch.ubuntu.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, true, '''arch'':2,4,6,9,13 ''full'':16 ''task'':19 ''archiv'':7,10,14,17 ''mirror'':3,5,8,11,18 ''project'':12 ''full-arch'':15 ''arch-mirror'':1', false);
INSERT INTO product (id, project, "owner", name, displayname, title, summary, description, datecreated, homepageurl, screenshotsurl, wikiurl, listurl, programminglang, downloadurl, lastdoap, sourceforgeproject, freshmeatproject, reviewed, active, fti, autoupdate) VALUES (5, 5, 12, 'evolution', 'Evolution', 'The Evolution Groupware Application', 'Evolution is an email client, addressbook and calendar application that is very well integrated with the Gnome desktop. Evolution is the standard mail client in the Ubuntu distribution, and supports all current mail system standards.', 'Recently, Evolution has seen significant work to make it interoperable with the proprietary Microsoft Exchange Server protocols and formats, allowing organisations to replace Outlook on Windows with Evolution and Linux.

The current stable release series of Evolution is 2.0.', '2004-09-24 20:58:02.240163', 'http://www.gnome.org/evolution/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, true, '''2.0'':80 ''mail'':29,39 ''make'':49 ''seen'':45 ''seri'':76 ''well'':19 ''work'':47 ''allow'':61 ''email'':10 ''gnome'':23 ''linux'':71 ''stabl'':74 ''applic'':6,15 ''client'':11,30 ''evolut'':1,2,4,7,25,43,69,78 ''format'':60 ''integr'':20 ''recent'':42 ''releas'':75 ''replac'':64 ''server'':57 ''system'':40 ''ubuntu'':33 ''window'':67 ''current'':38,73 ''desktop'':24 ''exchang'':56 ''organis'':62 ''outlook'':65 ''support'':36 ''calendar'':14 ''groupwar'':5 ''protocol'':58 ''signific'':46 ''standard'':28,41 ''distribut'':34 ''interoper'':51 ''microsoft'':55 ''addressbook'':12 ''proprietari'':54', false);
INSERT INTO product (id, project, "owner", name, displayname, title, summary, description, datecreated, homepageurl, screenshotsurl, wikiurl, listurl, programminglang, downloadurl, lastdoap, sourceforgeproject, freshmeatproject, reviewed, active, fti, autoupdate) VALUES (12, NULL, 16, 'a52dec', 'a52dec', 'Liba52 Test Decoder', 'a52dec is a test program for liba52.', 'This tool decodes ATSC A/52 streams, and also includes a demultiplexer for mpeg-1 and mpeg-2 program streams. The liba52 source code is always distributed in the a52dec package, to make sure it easier for people to test it.', '2005-04-14 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, true, '''1'':27 ''2'':31 ''a/52'':17 ''also'':20 ''atsc'':16 ''code'':37 ''make'':46 ''mpeg'':26,30 ''sure'':47 ''test'':4,9,53 ''tool'':14 ''alway'':39 ''decod'':5,15 ''peopl'':51 ''sourc'':36 ''a52dec'':1,2,6,43 ''easier'':49 ''includ'':21 ''liba52'':3,12,35 ''mpeg-1'':25 ''mpeg-2'':29 ''packag'':44 ''stream'':18,33 ''program'':10,32 ''distribut'':40 ''demultiplex'':23', false);
INSERT INTO product (id, project, "owner", name, displayname, title, summary, description, datecreated, homepageurl, screenshotsurl, wikiurl, listurl, programminglang, downloadurl, lastdoap, sourceforgeproject, freshmeatproject, reviewed, active, fti, autoupdate) VALUES (11, 5, 12, 'netapplet', 'NetApplet', 'Network Applet', 'The Novell Network Applet', 'Displays current network status and allows network switching', '2005-03-10 16:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, true, '''allow'':14 ''novel'':6 ''applet'':4,8 ''status'':12 ''switch'':16 ''current'':10 ''display'':9 ''network'':3,7,11,15 ''netapplet'':1,2', false);
INSERT INTO product (id, project, "owner", name, displayname, title, summary, description, datecreated, homepageurl, screenshotsurl, wikiurl, listurl, programminglang, downloadurl, lastdoap, sourceforgeproject, freshmeatproject, reviewed, active, fti, autoupdate) VALUES (1, 1, 17, 'ubuntu', 'Ubuntu', 'Ubuntu', 'An easy-to-install version of Linux that has a complete set of desktop applications ready to use immediately after installation.', 'Ubuntu is a desktop Linux that you can give your girlfriend to install. Works out of the box with recent Gnome desktop applications configured to make you productive immediately. Ubuntu is updated every six months, comes with security updates for peace of mind, and is available everywhere absolutely free of charge.', '2004-09-24 20:58:00.655518', 'http://www.ubuntu.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, true, '''box'':43 ''set'':16 ''six'':59 ''use'':22 ''come'':61 ''easi'':6 ''free'':74 ''give'':34 ''make'':51 ''mind'':68 ''peac'':66 ''work'':39 ''avail'':71 ''charg'':76 ''everi'':58 ''gnome'':46 ''linux'':11,30 ''month'':60 ''readi'':20 ''secur'':63 ''updat'':57,64 ''applic'':19,48 ''immedi'':23,54 ''instal'':8,25,38 ''recent'':45 ''ubuntu'':1,2,3,26,55 ''absolut'':73 ''complet'':15 ''desktop'':18,29,47 ''product'':53 ''version'':9 ''configur'':49 ''everywher'':72 ''girlfriend'':36 ''easy-to-instal'':5', false);
INSERT INTO product (id, project, "owner", name, displayname, title, summary, description, datecreated, homepageurl, screenshotsurl, wikiurl, listurl, programminglang, downloadurl, lastdoap, sourceforgeproject, freshmeatproject, reviewed, active, fti, autoupdate) VALUES (9, 5, 16, 'applets', 'Gnome Applets', 'The Gnome Panel Applets', 'The Gnome Panel Applets are a collection of standard widgets that can be installed on your desktop Panel. These icons act as launchers for applications, or indicators of the status of your machine. For example, panel applets exist to show you your battery status or wifi network signal strength.', 'This is the collection of Panel Applets that is part of the default Gnome release. Additional Panel Applets are available from third parties. A complete set of Panel Applets is included in the Ubuntu OS, for example.

The Gnome Panel team includes Abel Kascinsky, Frederick Wurst and Andreas Andropovitch Axelsson.', '2004-10-03 16:46:09.113721', 'http://www.gnome.org/panel/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, true, '''os'':91 ''act'':28 ''set'':82 ''abel'':99 ''icon'':27 ''part'':66 ''show'':47 ''team'':97 ''wifi'':53 ''addit'':72 ''avail'':76 ''exist'':45 ''gnome'':2,5,9,70,95 ''indic'':34 ''panel'':6,10,25,43,62,73,84,96 ''parti'':79 ''third'':78 ''wurst'':102 ''andrea'':104 ''applet'':1,3,7,11,44,63,74,85 ''applic'':32 ''exampl'':42,93 ''includ'':87,98 ''instal'':21 ''machin'':40 ''releas'':71 ''signal'':55 ''status'':37,51 ''ubuntu'':90 ''widget'':17 ''batteri'':50 ''collect'':14,60 ''complet'':81 ''default'':69 ''desktop'':24 ''network'':54 ''axelsson'':106 ''launcher'':30 ''standard'':16 ''strength'':56 ''frederick'':101 ''kascinski'':100 ''andropovitch'':105', false);
INSERT INTO product (id, project, "owner", name, displayname, title, summary, description, datecreated, homepageurl, screenshotsurl, wikiurl, listurl, programminglang, downloadurl, lastdoap, sourceforgeproject, freshmeatproject, reviewed, active, fti, autoupdate) VALUES (2, 2, 2, 'unassigned', 'unassigned syncs', 'unassigned syncs', 'syncs still not assigned to a real product', 'unassigned syncs, will not be processed, to be moved to real projects ASAP.', '2004-09-24 20:58:00.674409', 'http://arch.ubuntu.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, false, '''asap'':26 ''move'':22 ''real'':12,24 ''sync'':3,5,6,15 ''still'':7 ''assign'':9 ''process'':19 ''product'':13 ''project'':25 ''unassign'':1,2,4,14', false);
INSERT INTO product (id, project, "owner", name, displayname, title, summary, description, datecreated, homepageurl, screenshotsurl, wikiurl, listurl, programminglang, downloadurl, lastdoap, sourceforgeproject, freshmeatproject, reviewed, active, fti, autoupdate) VALUES (7, 6, 12, 'iso-codes', 'iso-codes', 'The iso-codes', 'foo', 'bar', '2004-09-24 20:58:02.258743', 'http://www.novell.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, true, '''bar'':12 ''foo'':11 ''iso'':2,5,9 ''code'':3,6,10 ''iso-cod'':1,4,8', false);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'product'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'productlabel'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'productlabel'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'productseries'::pg_catalog.regclass;

INSERT INTO productseries (id, product, name, displayname, summary, branch, importstatus, datelastsynced, syncinterval, rcstype, cvsroot, cvsmodule, cvsbranch, cvstarfileurl, svnrepository, bkrepository, releaseroot, releasefileglob, releaseverstyle, targetarcharchive, targetarchcategory, targetarchbranch, targetarchversion, dateautotested, dateprocessapproved, datesyncapproved, datestarted, datefinished) VALUES (1, 4, 'milestones', 'Milestone Releases', 'The Firefox milestone releases are development releases aimed at testing new features in the developer community. They are not intended for widespread end-user adoption, except among the very brave.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO productseries (id, product, name, displayname, summary, branch, importstatus, datelastsynced, syncinterval, rcstype, cvsroot, cvsmodule, cvsbranch, cvstarfileurl, svnrepository, bkrepository, releaseroot, releasefileglob, releaseverstyle, targetarcharchive, targetarchcategory, targetarchbranch, targetarchversion, dateautotested, dateprocessapproved, datesyncapproved, datestarted, datefinished) VALUES (2, 4, '1.0', 'Mozilla Firefox', 'The 1.0 branch of the Mozilla web browser. Currently, this is the stable branch of Mozilla, and all stable releases are made off this branch.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO productseries (id, product, name, displayname, summary, branch, importstatus, datelastsynced, syncinterval, rcstype, cvsroot, cvsmodule, cvsbranch, cvstarfileurl, svnrepository, bkrepository, releaseroot, releasefileglob, releaseverstyle, targetarcharchive, targetarchcategory, targetarchbranch, targetarchversion, dateautotested, dateprocessapproved, datesyncapproved, datestarted, datefinished) VALUES (5, 11, 'releases', 'NetApplet Releases', 'Releases of Network Applet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO productseries (id, product, name, displayname, summary, branch, importstatus, datelastsynced, syncinterval, rcstype, cvsroot, cvsmodule, cvsbranch, cvstarfileurl, svnrepository, bkrepository, releaseroot, releasefileglob, releaseverstyle, targetarcharchive, targetarchcategory, targetarchbranch, targetarchversion, dateautotested, dateprocessapproved, datesyncapproved, datestarted, datefinished) VALUES (4, 8, 'main', 'MAIN', 'The primary "trunk" of development for this product. This series
was automatically created and represents the idea of a primary trunk
of software development without "stable branches". For most
products, releases in this series will be "milestone" or "test"
releases, and there should be other series for the stable releases
of the product.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO productseries (id, product, name, displayname, summary, branch, importstatus, datelastsynced, syncinterval, rcstype, cvsroot, cvsmodule, cvsbranch, cvstarfileurl, svnrepository, bkrepository, releaseroot, releasefileglob, releaseverstyle, targetarcharchive, targetarchcategory, targetarchbranch, targetarchversion, dateautotested, dateprocessapproved, datesyncapproved, datestarted, datefinished) VALUES (6, 12, 'main', 'MAIN', 'The primary upstream development branch, from which all releases are made.', NULL, 2, NULL, NULL, 1, ':pserver:anonymous@cvs.sourceforge.net:/cvsroot/liba52', 'a52dec', 'MAIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO productseries (id, product, name, displayname, summary, branch, importstatus, datelastsynced, syncinterval, rcstype, cvsroot, cvsmodule, cvsbranch, cvstarfileurl, svnrepository, bkrepository, releaseroot, releasefileglob, releaseverstyle, targetarcharchive, targetarchcategory, targetarchbranch, targetarchversion, dateautotested, dateprocessapproved, datesyncapproved, datestarted, datefinished) VALUES (3, 5, 'main', 'MAIN', 'The primary "trunk" of development for this product. This series
was automatically created and represents the idea of a primary trunk
of software development without "stable branches". For most
products, releases in this series will be "milestone" or "test"
releases, and there should be other series for the stable releases
of the product.', 14, 5, NULL, NULL, 1, ':pserver:anonymous@anoncvs.gnome.org:/cvs/gnome', 'evolution', 'MAIN', '', NULL, NULL, '', '', NULL, 'gnome@arch.ubuntu.com', 'evolution', 'MAIN', '0', NULL, NULL, NULL, NULL, NULL);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'productseries'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'productrelease'::pg_catalog.regclass;

INSERT INTO productrelease (id, datereleased, "version", title, description, changelog, "owner", summary, productseries, manifest) VALUES (6, '2005-02-28 00:00:00', '2.1.6', NULL, NULL, 'Bugzilla bugs fixed (see http://bugzilla.ximian.com/show_bug.cgi):

 * Addressbook
   #73005 - Cannot cancel ''Contact List Editor'' (Siva)
   #73005 - offline - setting/unsetting folder offline property is not working (Sushma)
   #70371 - Evolution crashes when adding contact list (Siva)
   #67724 - When unix user name, callendar points to old username (Siva)
   #54825 - Freeze on .vcf import from MacOS X AddressBook (Christophe Fergeau)
   #73013 - ''Right'' click on a ''Contact'' cannot select ''Cut'' (Siva)

 * Calendar
   #72958 - Unable to send delayed meeting (Chen)
   #72006 - Opened existing appointments with attachment - press cancel - popup info with save / discard / cancel changes (Chen)
   #63866 - Same name can be entered twice in invitations tab (JP)
   #67714 - Invitations Tab Allows Entry Of Empty Line (JP)
   #62089 - adding contact lists to meetings impossible (JP)
   #47747 - Changes to attendee not updated until click on different row (JP)
   #61495 - Existing text is placed off screen when editing attendee field (JP)
   #28947 - adding contact list to attendee list should expand it (JP)
   #67724 - When unix user name, callendar points to old username (Siva)
   #72038 - Changes meeting to appoinment after throwing warning invalid mail id (Rodrigo)
   #69556 - Crash attaching mime parts to calendar events (Harish)

 * Mail
   #66126 - attach File Chooser is modal (Michael)
   #68549 - Answering to Usenet article doesn''t consider the "Followup-To:" field (Michael)
   #71003 - threads still running at exit (Michael)
   #62109 - Inconsistent ways of determining 8-bit Subject: and From: header charsets (Jeff)
   #34153 - Confusing Outbox semantics for deleted outgoing messages (Michael)
   #71528 - Search Selection Widget Has Repeated Items (Michael)
   #71967 - Evolution delete mail from POP3 server even is checked the option "leave the mail on server (Michael)
   #40515 - Signature scripts do not allow switches (Michael)
   #68866 - Forward button doesn''t put newline between headers and body (Michael)
   #35219 - flag-for-followup crufting (Michael)
   #64987 - Go to next unread message doesn''t work when multiple messages are selected (Michael)
   #72337 - Evolution crashes if I click OK/Cancel on the password dialog after disabling the IMAP account (Michael)
   #70718 - Next and previous buttons don''t realize there''s new mail (Michael)
   #61363 - Setup wizard, IMAP for receiving server, sending default GW (Michael)
   #70795 - Next/Previous Message Should Only Display Listed Emails (Michael)
   #23822 - no copy text option when right-clicking on marked mail text (Rodney)
   #72266 - You shouldn''t be able to open more than one ''Select Folder'' dialog in the mail filters (Michael)
   #71429 - on NLD, menus in wrong order (Michae)l
   #72228 - cannot store into groupwise sent folder (Michael)
   #72209 - Evolution is crashing when you move a VFolder to a folder ''on this computer'' (Michael)
   #72275 - Can''t use Shift+F10 to popup context menu for link in message (Harry Lu)
   #54503 - "New" dropdown menu on toolbar has wrong widget style (Rodney)
   #72676 - Saved filter rule can''t be modified if it is selected with GOK. (Harry Lu)

 * SMIME
   #68592 - "Backup" buttons in certificate settings does nothing - work around (Michael)

 * Shell
   #33287 - "send/receive" button not greyed out when starting offline (JP)
   #48868 - Status bar changes its height when fonts are large (William Jon McCann)

 * Plugins
   #71527 - Save Calendar widget mixup between directory and file (Rodrigo)

Other bugs

 * Addressbook
   - Use new categories dialog in contact editor (Rodrigo)
   - HIG spacing fixes (Rodney)
   - Display warning dialog when GW server is old (Vivek)

 * Calendar
   - Always ensure default sources are available (Siva)
   - Don''t look up free/busy unless we need to (Harish)
   - Make sure new events don''t display twice (Chen)
   - Make sure double click opens attachments (Chen)

 * Mail
   - a11y fixes for composer (Harry Lu)
   - Use gnome-vfs API to launch external applications (Marco Pesenti Gritti)
   - New mailer context menus for messages (Rodney)

 * Shell
   - Fix leak (JP)
   - Use gnome-vfs API to open quick reference (Marco Pesenti Gritti)

 * Plugins
   - Make e-popup more robust (Michael)
   - Cleanup authors/descriptions (Björn Torkelsson)
   - out of office exchange fixes (Sushma)
   - retry send options if invalid session string (Chen)
   - set proper default port for shared folders (Vivek)

 * Miscellaneous
   - BSD runtime linking fixes (Hans)
   - distclean fixes (Björn Torkelsson)

Updated translations:
   - et (Priit Laes)
   - el (Kostas Papadimas, Nikos Charonitakis)
   - sv (Christian Rose)
   - es (Francisco Javier F. Serrador)
   - it (Luca Ferretti, Marco Ciampa)
   - da (Martin Willemoes Hansen)
   - ca (Josep Puigdemont, Xavi Conde)
   - nb (Kjartan Maraas)
   - no (Kjartan Maraas)
   - ru (Leonid Kanter)
   - gu (Ankit Patel)
   - cs (Miloslav Trmac)
   - nl (Vincent van Adrighem)
   - fi (Ilkka Tuohela)
   - pt (Duarte Loreto)
   - uk (Maxim Dziumanenko)
   - ko (Changwoo Ryu)
   - de (Frank Arnold)
   - fr (Vincent Carriere)
   - en_CA (Adam Weinberger)
   - cs (Miloslav Trmac)
   - pl (Artur Flinta)
   - bg (Vladimir Petkov)
   - ja (Takeshi AIHANA)
   - en_GB (David Lodge)
   - en_CA (Adam Weinberger)
   - lt (Zygimantas Berucka)', 12, NULL, 3, NULL);
INSERT INTO productrelease (id, datereleased, "version", title, description, changelog, "owner", summary, productseries, manifest) VALUES (2, '2004-06-28 00:00:00', '0.8', NULL, NULL, NULL, 12, NULL, 4, NULL);
INSERT INTO productrelease (id, datereleased, "version", title, description, changelog, "owner", summary, productseries, manifest) VALUES (7, '2005-03-10 16:20:00', '1.0', NULL, NULL, NULL, 12, NULL, 5, NULL);
INSERT INTO productrelease (id, datereleased, "version", title, description, changelog, "owner", summary, productseries, manifest) VALUES (5, '2004-10-15 18:32:35.717695', '0.9.2', 'One (secure) Tree Hill', 'Security fixes

    * 250180 - [Windows] Disallow access to insecure shell: protocol.
', NULL, 16, 'This was a security fix release for 0.9.', 1, 1);
INSERT INTO productrelease (id, datereleased, "version", title, description, changelog, "owner", summary, productseries, manifest) VALUES (4, '2004-10-15 18:31:19.164989', '0.9.1', 'One Tree Hill (v2)', '', NULL, 16, 'This was a bugfix release to patch up problems with the new extension system.', 1, 2);
INSERT INTO productrelease (id, datereleased, "version", title, description, changelog, "owner", summary, productseries, manifest) VALUES (3, '2004-10-15 18:27:09.878302', '0.9', 'One Tree Hill', 'What''s New

Here''s what''s new in this release of Firefox:

    * New Default Theme

      An updated Default Theme now presents a uniform appearance across all three platforms - a new crisp, clear look for Windows users. Finetuning for GNOME will follow in future releases.
    * Comprehensive Data Migration

      Switching to Firefox has never been easier now that Firefox imports data like Favorites, History, Settings, Cookies and Passwords from Internet Explorer. Firefox can also import from Mozilla 1.x, Netscape 4.x, 6.x and 7.x, and Opera. MacOS X and Linux migrators for browsers like Safari, OmniWeb, Konqueror etc. will arrive in future releases.
    * Extension/Theme Manager

      New Extension and Theme Managers provide a convenient way to manage and update your add-ons. SmartUpdate also notifies you of updates to Firefox.
    * Smaller Download

      Windows users will find Firefox is now only 4.7MB to download.
    * Help

      A new online help system is available.
    * Lots of bug fixes and improvements

      Copy Image, the ability to delete individual items from Autocomplete lists, SMB/SFTP support on GNOME via gnome-vfs, better Bookmarks, Search and many other refinements fine tune the browsing experience.

For Linux/GTK2 Users

    * Installer

      Firefox now comes with an installer for Linux/GTK2 users. The new installer makes the installation process much simpler.
    * Look and Feel Updates

      Ongoing improvements have been made to improve the way Firefox adheres to your GTK2 themes, such as menus.
    * Talkback for GTK2

      Help us nail down crashes by submitting talkback reports with this crash reporting tool.

', NULL, 16, 'Release 0.9 of Firefox introduced a new theme as well as improved migration tools for people switching to Firefox.', 1, 3);
INSERT INTO productrelease (id, datereleased, "version", title, description, changelog, "owner", summary, productseries, manifest) VALUES (1, '2004-06-28 00:00:00', '1.0.0', 'First Stable Release', '', '', 12, 'After four years of work the Mozilla project makes its first public stable release. Mozilla 1.0.0 is a major milestone in open source history.', 2, 4);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'productrelease'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'productcvsmodule'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'productcvsmodule'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'productbkbranch'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'productbkbranch'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'productsvnmodule'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'productsvnmodule'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'archarchive'::pg_catalog.regclass;

INSERT INTO archarchive (id, name, title, description, visible, "owner") VALUES (2, 'thunderbird@arch.ubuntu.com', 'Thunderbid', 'text', false, NULL);
INSERT INTO archarchive (id, name, title, description, visible, "owner") VALUES (3, 'twisted@arch.ubuntu.com', 'Twisted', 'text', false, NULL);
INSERT INTO archarchive (id, name, title, description, visible, "owner") VALUES (4, 'bugzilla@arch.ubuntu.com', 'Bugzilla', 'text', false, NULL);
INSERT INTO archarchive (id, name, title, description, visible, "owner") VALUES (5, 'arch@arch.ubuntu.com', 'Arch', 'text', false, NULL);
INSERT INTO archarchive (id, name, title, description, visible, "owner") VALUES (6, 'kiwi2@arch.ubuntu.com', 'Kiwi2', 'text', false, NULL);
INSERT INTO archarchive (id, name, title, description, visible, "owner") VALUES (7, 'plone@arch.ubuntu.com', 'Plone', 'text', false, NULL);
INSERT INTO archarchive (id, name, title, description, visible, "owner") VALUES (8, 'gnome@arch.ubuntu.com', 'GNOME', 'The GNOME Project', false, NULL);
INSERT INTO archarchive (id, name, title, description, visible, "owner") VALUES (9, 'iso-codes@arch.ubuntu.com', 'iso-codes', 'The iso-codes', false, NULL);
INSERT INTO archarchive (id, name, title, description, visible, "owner") VALUES (1, 'mozilla@arch.ubuntu.com', 'Mozilla', 'text', false, NULL);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'archarchive'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'archarchivelocation'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'archarchivelocation'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'archarchivelocationsigner'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'archarchivelocationsigner'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'archnamespace'::pg_catalog.regclass;

INSERT INTO archnamespace (id, archarchive, category, branch, "version", visible) VALUES (1, 1, 'mozilla', NULL, NULL, true);
INSERT INTO archnamespace (id, archarchive, category, branch, "version", visible) VALUES (2, 2, 'tunderbird', NULL, NULL, true);
INSERT INTO archnamespace (id, archarchive, category, branch, "version", visible) VALUES (3, 3, 'twisted', NULL, NULL, true);
INSERT INTO archnamespace (id, archarchive, category, branch, "version", visible) VALUES (4, 4, 'bugzila', NULL, NULL, true);
INSERT INTO archnamespace (id, archarchive, category, branch, "version", visible) VALUES (5, 5, 'arch', NULL, NULL, true);
INSERT INTO archnamespace (id, archarchive, category, branch, "version", visible) VALUES (6, 6, 'kiwi2', NULL, NULL, true);
INSERT INTO archnamespace (id, archarchive, category, branch, "version", visible) VALUES (7, 7, 'plone', NULL, NULL, true);
INSERT INTO archnamespace (id, archarchive, category, branch, "version", visible) VALUES (8, 8, 'gnome', 'evolution', '2.0', false);
INSERT INTO archnamespace (id, archarchive, category, branch, "version", visible) VALUES (9, 9, 'iso-codes', 'iso-codes', '0.35', false);
INSERT INTO archnamespace (id, archarchive, category, branch, "version", visible) VALUES (10, 1, 'mozilla', 'release', '0.9.2', true);
INSERT INTO archnamespace (id, archarchive, category, branch, "version", visible) VALUES (11, 1, 'mozilla', 'release', '0.9.1', true);
INSERT INTO archnamespace (id, archarchive, category, branch, "version", visible) VALUES (12, 1, 'mozilla', 'release', '0.9', true);
INSERT INTO archnamespace (id, archarchive, category, branch, "version", visible) VALUES (13, 1, 'mozilla', 'release', '0.8', true);
INSERT INTO archnamespace (id, archarchive, category, branch, "version", visible) VALUES (14, 8, 'evolution', 'MAIN', '0', true);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'archnamespace'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'branch'::pg_catalog.regclass;

INSERT INTO branch (id, archnamespace, title, description, "owner", product) VALUES (3, 3, 'Python Twisted 0.9.1', 'text', 7, NULL);
INSERT INTO branch (id, archnamespace, title, description, "owner", product) VALUES (4, 4, 'Bugzila 0.9.1', 'text', 3, NULL);
INSERT INTO branch (id, archnamespace, title, description, "owner", product) VALUES (5, 5, 'Arch 0.9.1', 'text', 8, NULL);
INSERT INTO branch (id, archnamespace, title, description, "owner", product) VALUES (6, 6, 'Kiwi2 0.9.1', 'text', 9, NULL);
INSERT INTO branch (id, archnamespace, title, description, "owner", product) VALUES (7, 7, 'Plone 0.9.1', 'text', 10, NULL);
INSERT INTO branch (id, archnamespace, title, description, "owner", product) VALUES (1, 1, 'Mozilla Firefox 0.9.1', 'text', 1, 4);
INSERT INTO branch (id, archnamespace, title, description, "owner", product) VALUES (2, 2, 'Mozilla Thunderbird 0.9.1', 'text', 11, 8);
INSERT INTO branch (id, archnamespace, title, description, "owner", product) VALUES (9, 9, 'Iso-codes 0.35', 'text', 13, 7);
INSERT INTO branch (id, archnamespace, title, description, "owner", product) VALUES (8, 8, 'Evolution 2.0', 'text', 13, 5);
INSERT INTO branch (id, archnamespace, title, description, "owner", product) VALUES (10, 10, 'Mozilla Firefox 0.9.2', 'text', 1, 4);
INSERT INTO branch (id, archnamespace, title, description, "owner", product) VALUES (11, 11, 'Mozilla Firefox 0.9.1', 'text', 1, 4);
INSERT INTO branch (id, archnamespace, title, description, "owner", product) VALUES (12, 12, 'Mozilla Firefox 0.9', 'text', 1, 4);
INSERT INTO branch (id, archnamespace, title, description, "owner", product) VALUES (13, 13, 'Mozilla Firefox 0.8', 'text', 1, 4);
INSERT INTO branch (id, archnamespace, title, description, "owner", product) VALUES (14, 14, 'Evolution HEAD', 'text', 1, 5);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'branch'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'changeset'::pg_catalog.regclass;

INSERT INTO changeset (id, branch, datecreated, name, logmessage, archid, gpgkey) VALUES (1, 10, '2005-03-09 15:45:00', 'base-0', 'Import of Mozilla Firefox 0.9.2', NULL, NULL);
INSERT INTO changeset (id, branch, datecreated, name, logmessage, archid, gpgkey) VALUES (2, 11, '2005-03-09 15:50:00', 'base-0', 'Import of Mozilla Firefox 0.9.1', NULL, NULL);
INSERT INTO changeset (id, branch, datecreated, name, logmessage, archid, gpgkey) VALUES (3, 12, '2005-03-09 15:55:00', 'base-0', 'Import of Mozilla Firefox 0.9', NULL, NULL);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'changeset'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'changesetfilename'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'changesetfilename'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'changesetfile'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'changesetfile'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'changesetfilehash'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'changesetfilehash'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'branchrelationship'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'branchrelationship'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'branchlabel'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'branchlabel'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'productbranchrelationship'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'productbranchrelationship'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'manifest'::pg_catalog.regclass;

INSERT INTO manifest (id, datecreated, uuid) VALUES (1, '2005-03-09 15:50:00', '24fce331-655a-4e17-be55-c718c7faebd0');
INSERT INTO manifest (id, datecreated, uuid) VALUES (2, '2005-03-09 15:55:00', 'bf819b15-10b3-4d1e-9963-b787753e8fb2');
INSERT INTO manifest (id, datecreated, uuid) VALUES (3, '2005-03-09 16:00:00', '2a18a3f1-eec5-4b72-b23c-fb46c8c12a88');
INSERT INTO manifest (id, datecreated, uuid) VALUES (4, '2005-03-09 16:05:00', '97b4ece8-b3c5-4e07-b529-6c76b59a5455');
INSERT INTO manifest (id, datecreated, uuid) VALUES (14, '2005-03-24 00:00:00', 'e0451064-b405-4f52-b387-ebfc1a7ee297');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'manifest'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'manifestentry'::pg_catalog.regclass;

INSERT INTO manifestentry (id, manifest, "sequence", branch, changeset, entrytype, "path", patchon, dirname) VALUES (1, 1, 1, 10, 1, 4, 'firefox-0.9.2.tar.gz', NULL, 'firefox-0.9.2/');
INSERT INTO manifestentry (id, manifest, "sequence", branch, changeset, entrytype, "path", patchon, dirname) VALUES (2, 2, 1, 11, 2, 4, 'firefox-0.9.1.tar.gz', NULL, 'firefox-0.9.1/');
INSERT INTO manifestentry (id, manifest, "sequence", branch, changeset, entrytype, "path", patchon, dirname) VALUES (3, 2, 2, NULL, NULL, 1, 'firefox-0.9.1.tar.gz/random/', NULL, NULL);
INSERT INTO manifestentry (id, manifest, "sequence", branch, changeset, entrytype, "path", patchon, dirname) VALUES (4, 3, 1, 12, 3, 5, 'firefox-0.9.zip', NULL, 'firefox-0.9/');
INSERT INTO manifestentry (id, manifest, "sequence", branch, changeset, entrytype, "path", patchon, dirname) VALUES (5, 3, 2, 12, NULL, 6, 'firefox-0.9_unix.patch', 1, 'firefox-0.9_unix/');
INSERT INTO manifestentry (id, manifest, "sequence", branch, changeset, entrytype, "path", patchon, dirname) VALUES (6, 4, 1, 13, NULL, 3, 'firefox-0.8.ar', NULL, NULL);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'manifestentry'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'archconfig'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'archconfig'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'archconfigentry'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'archconfigentry'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'processorfamily'::pg_catalog.regclass;

INSERT INTO processorfamily (id, name, title, description, "owner") VALUES (1, 'x86', 'Intel 386 compatible chips', 'Bring back the 8086!', 1);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'processorfamily'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'processor'::pg_catalog.regclass;

INSERT INTO processor (id, family, name, title, description, "owner") VALUES (1, 1, '386', 'Intel 386', 'Intel 386 and its many derivatives and clones, the basic 32-bit chip in the x86 family', 1);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'processor'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'builder'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'builder'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'component'::pg_catalog.regclass;

INSERT INTO component (id, name) VALUES (1, 'main');
INSERT INTO component (id, name) VALUES (2, 'restricted');
INSERT INTO component (id, name) VALUES (3, 'universe');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'component'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'section'::pg_catalog.regclass;

INSERT INTO section (id, name) VALUES (1, 'default_section');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'section'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'distribution'::pg_catalog.regclass;

INSERT INTO distribution (id, name, title, description, domainname, "owner", lucilleconfig, displayname, summary, members) VALUES (1, 'ubuntu', 'Ubuntu Linux', 'Ubuntu is a new
approach to Linux Distribution that includes regular releases, and a
simplified single-CD installation system.', 'ubuntulinux.org', 17, NULL, 'ubuntu', 'Ubuntu is a new
approach to Linux Distribution that includes regular releases, and a
simplified single-CD installation system.', 1);
INSERT INTO distribution (id, name, title, description, domainname, "owner", lucilleconfig, displayname, summary, members) VALUES (2, 'redhat', 'Redhat Advanced Server', 'Red Hat is a
commercial distribution of the GNU/Linux Operating System.', 'redhat.com', 1, NULL, 'redhat', 'Red Hat is a
commercial distribution of the GNU/Linux Operating System.', 1);
INSERT INTO distribution (id, name, title, description, domainname, "owner", lucilleconfig, displayname, summary, members) VALUES (3, 'debian', 'Debian GNU/Linux', 'Debian GNU/Linux is
a non commercial distribution of a GNU/Linux Operating System for many
platforms.', 'debian.org', 1, NULL, 'debian', 'Debian GNU/Linux is
a non commercial distribution of a GNU/Linux Operating System for many
platforms.', 1);
INSERT INTO distribution (id, name, title, description, domainname, "owner", lucilleconfig, displayname, summary, members) VALUES (4, 'gentoo', 'The Gentoo Linux', 'Gentoo is a very
customizeable GNU/Linux Distribution that is designed to let you build every
single package yourself, with your own preferences.', 'gentoo.org', 1, NULL, 'gentoo', 'Gentoo is a very
customizeable GNU/Linux Distribution that is designed to let you build every
single package yourself, with your own preferences.', 1);
INSERT INTO distribution (id, name, title, description, domainname, "owner", lucilleconfig, displayname, summary, members) VALUES (5, 'kubuntu', 'Kubuntu - Free KDE-based Linux', 'Kubuntu is an entirely free Linux distribution that uses the K Desktop
Environment as its default desktop after install.', 'kubuntu.org', 1, NULL, 'kubuntu', 'Kubuntu is an entirely free Linux distribution that uses the K Desktop
Environment as its default desktop after install.', 1);
INSERT INTO distribution (id, name, title, description, domainname, "owner", lucilleconfig, displayname, summary, members) VALUES (7, 'guadalinex', 'GuadaLinex: Linux for Andalucia', 'GuadaLinex is based on Ubuntu and adds full support for applications specific to the local environment in Andalucia.', 'guadalinex.es', 4, NULL, 'GuadaLinex', 'The GuadaLinex team produces a high quality linux for the Andalucian marketplace.', 32);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'distribution'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'distrorelease'::pg_catalog.regclass;

INSERT INTO distrorelease (id, distribution, name, title, description, "version", components, sections, releasestatus, datereleased, parentrelease, "owner", lucilleconfig, summary, displayname) VALUES (1, 1, 'warty', 'The Warty Warthog
Release', 'Warty was the first stable release of Ubuntu. Key feature goals
included releasing on time, with the latest version of the Gnome Desktop
Environment, and the creation of all the infrastructure required to manage
Ubuntu itself. Warty includes excellent support for Python, with most of the
widely used Python libraries installed by default.', '4.10', 1, 1, 4, '2004-08-20 00:00:00', NULL, 17, NULL, 'Warty is the first release of Ubuntu,
with a planned release date of October 2004.', 'warty');
INSERT INTO distrorelease (id, distribution, name, title, description, "version", components, sections, releasestatus, datereleased, parentrelease, "owner", lucilleconfig, summary, displayname) VALUES (2, 2, 'six', 'Six Six Six', 'some text to describe the whole 666 release of RH', '6.0.1', 1, 1, 4, '2004-03-21 00:00:00', NULL, 8, NULL, 'some text to describe the whole 666 release of RH', 'six');
INSERT INTO distrorelease (id, distribution, name, title, description, "version", components, sections, releasestatus, datereleased, parentrelease, "owner", lucilleconfig, summary, displayname) VALUES (3, 1, 'hoary', 'The Hoary Hedgehog Release', 'Hoary is the second release of Ubuntu. Key feature goals include the integration of Hoary with the Launchpad for bugs and translation information, as well as Gnome 2.10 and the X.org window system.', '5.04', 1, 1, 2, '2004-08-25 00:00:00', 1, 1, NULL, 'Hoary is the second released of Ubuntu, with release planned for April 2005.', 'hoary');
INSERT INTO distrorelease (id, distribution, name, title, description, "version", components, sections, releasestatus, datereleased, parentrelease, "owner", lucilleconfig, summary, displayname) VALUES (4, 2, '7.0', 'Seven', 'The release that we would not expect', '7.0.1', 1, 1, 3, '2004-04-01 00:00:00', 2, 7, NULL, 'The release that we would not expect', '7.0');
INSERT INTO distrorelease (id, distribution, name, title, description, "version", components, sections, releasestatus, datereleased, parentrelease, "owner", lucilleconfig, summary, displayname) VALUES (6, 3, 'woody', 'WOODY', 'WOODY is the current stable verison of Debian GNU/Linux', '3.0', 1, 1, 4, '2003-01-01 00:00:00', NULL, 2, NULL, 'WOODY is the current stable verison of Debian GNU/Linux', 'woody');
INSERT INTO distrorelease (id, distribution, name, title, description, "version", components, sections, releasestatus, datereleased, parentrelease, "owner", lucilleconfig, summary, displayname) VALUES (7, 3, 'sarge', 'Sarge', 'Sarge is the FROZEN unstable version of Debian GNU/Linux.', '3.1', 1, 1, 3, '2004-09-29 00:00:00', 6, 5, NULL, 'Sarge is the FROZEN unstable version of Debian GNU/Linux.', 'sarge');
INSERT INTO distrorelease (id, distribution, name, title, description, "version", components, sections, releasestatus, datereleased, parentrelease, "owner", lucilleconfig, summary, displayname) VALUES (8, 3, 'sid', 'Sid', 'Sid is the CRAZY unstable version of Debian GNU/Linux.', '3.2', 1, 1, 1, '2004-12-29 00:00:00', 6, 6, NULL, 'Sid is the CRAZY unstable version of Debian GNU/Linux.', 'sid');
INSERT INTO distrorelease (id, distribution, name, title, description, "version", components, sections, releasestatus, datereleased, parentrelease, "owner", lucilleconfig, summary, displayname) VALUES (5, 1, 'grumpy', 'The Grumpy
Groundhog Release', 'Grumpy, the third release of Ubuntu Linux, is not yet
in active development. This information is purely a placeholder.', '5.10', 1, 1, 1, '2004-08-29 00:00:00', 1, 1, NULL, 'Grumpy is the third release of
Ubuntu, planned for October 2005.', 'grumpy');
INSERT INTO distrorelease (id, distribution, name, title, description, "version", components, sections, releasestatus, datereleased, parentrelease, "owner", lucilleconfig, summary, displayname) VALUES (9, 7, '2k5', 'Guada 2005', 'This release places extra emphasis on usability and installability. The installer is adapted from Ubuntu to assume your country, language, keyboard and time zone preference, thus ensuring that installs ask the minimum number of questions possible.', '2005', 1, 1, 2, NULL, 3, 4, NULL, 'Guada 2005 is a rapid-install version of
Ubuntu Hoary for the Andalucian marketplace.', 'Guada2005');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'distrorelease'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'distroarchrelease'::pg_catalog.regclass;

INSERT INTO distroarchrelease (id, distrorelease, processorfamily, architecturetag, "owner", chroot) VALUES (1, 1, 1, 'i386', 1, NULL);
INSERT INTO distroarchrelease (id, distrorelease, processorfamily, architecturetag, "owner", chroot) VALUES (6, 3, 1, 'i386', 1, NULL);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'distroarchrelease'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'libraryfilecontent'::pg_catalog.regclass;

INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (1, '2005-04-07 16:46:05.265391', NULL, 178859, '378b3498ead213d35a82033a6e9196014a5ef25c');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (2, '2005-04-07 16:46:05.266763', NULL, 9922560, 'a57faa6287aee2c58e115673a119c6083d31d1b9');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (3, '2005-04-07 16:46:05.26727', NULL, 309386, 'b218ca7b52fa813550e3f14cdcf3ba68606e4446');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (4, '2005-04-07 16:46:05.267803', NULL, 162927750, 'cfbd3ee1f510c66d49be465b900a3334e8488184');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (5, '2005-05-18 08:03:28.021862', NULL, 4381, '9b1f78faa39fb09a9fd955d744002c2d8f32d88d');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (6, '2005-05-18 08:03:28.021862', NULL, 7910, 'afdf21d698587a6601e2ffed0f44292b7ad5dd07');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (7, '2005-05-18 08:03:28.021862', NULL, 10826, '502828e7591277535abe9015ffbc6918dbba8ef4');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (8, '2005-05-18 08:03:28.021862', NULL, 10826, '502828e7591277535abe9015ffbc6918dbba8ef4');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (9, '2005-05-18 08:03:28.021862', NULL, 2655, 'ca3b107af84c05eaf98ba073376153986566ec28');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (10, '2005-05-18 08:03:28.021862', NULL, 13110, 'bc7bebca1e3c5c166838b19f0eeb7f171e51805d');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (11, '2005-05-18 08:03:28.021862', NULL, 13499, '78a26efee75a54f113063b78783b2d4612fee409');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (12, '2005-05-18 08:03:28.021862', NULL, 12695, '8812d04c170ca90bb1423e188ce9706869aa03d7');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (13, '2005-05-18 08:03:28.021862', NULL, 13133, 'db1b50cbde7142d344bd8ef9b2e1fe3b3116f77c');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (14, '2005-05-18 08:03:28.021862', NULL, 13641, 'e19cc1446e3004f10475c37b2cd363f75b8ae89a');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (15, '2005-05-18 08:03:28.021862', NULL, 13269, 'fc8cab1cb1e5fb1efa3c3c475b8f7c8dc5038d50');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (16, '2005-05-18 08:03:28.021862', NULL, 13983, 'e17ee3031bd29dcd1e5905c0fd17945600a91ccf');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (17, '2005-05-18 08:03:28.021862', NULL, 12652, '07b01d1e6fe9a729f911e72dfe674a5e0abdc4ee');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (18, '2005-05-18 08:03:28.021862', NULL, 13240, '801dc911c2bd67e17eff087516fdc63a2ac322ce');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (19, '2005-05-18 08:03:28.021862', NULL, 4165, 'fca78a2292e4034b8dfbb2de6f69e17ebeecaaa1');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (20, '2005-05-18 08:03:28.021862', NULL, 4093, 'fc67a1770f78c45c396b4724195aeb10683aa2fd');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (21, '2005-05-18 08:03:28.021862', NULL, 3635, '4ab2ca308dafe152789640942488e23a33e4f46c');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (22, '2005-05-18 08:03:28.021862', NULL, 3553, '20815563ee33368d51e3213354f97c05b4685968');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (23, '2005-05-18 08:03:28.021862', NULL, 3778, '965968d3e6668f39ebc64bc11a3f1a5cd07c213b');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (24, '2005-05-18 08:03:28.021862', NULL, 3666, 'cca8fb78e05a34481e07683cea8c3a47f01c609e');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (25, '2005-05-18 08:03:28.021862', NULL, 3793, '28a7accfb491a2b4895b49b810ca7cda0badc787');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (26, '2005-05-18 08:03:28.021862', NULL, 4773, '03efb176f04f3897de7d5e6484864b0559fd6cd6');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (27, '2005-05-18 08:03:28.021862', NULL, 2961, '4468039e1d2cbdfc78d2e53477e5fe0537bae302');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (28, '2005-05-18 08:03:28.021862', NULL, 3558, 'd6c2ddacdab7618ce2a555c20a4a730fcdb42600');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (29, '2005-05-18 08:03:28.021862', NULL, 3561, '9eb09455e6a568605c1bbab4cdf1936eee92222d');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (30, '2005-05-18 08:03:28.021862', NULL, 3305, 'b45b170da29f9b22650315657505124766c93720');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (31, '2005-05-18 08:03:28.021862', NULL, 3987, '9668ba9f0a59f9e6e6bc73fc5dc9f116b202bceb');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (32, '2005-05-18 08:03:28.021862', NULL, 4908, '874a6ef9cd1aaef17653c6c12f4b83ef9487c1c3');
INSERT INTO libraryfilecontent (id, datecreated, datemirrored, filesize, sha1) VALUES (33, '2005-05-18 08:03:28.021862', NULL, 4908, '874a6ef9cd1aaef17653c6c12f4b83ef9487c1c3');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'libraryfilecontent'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'libraryfilealias'::pg_catalog.regclass;

INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (1, 1, 'netapplet-1.0.0.tar.gz', 'application/x-gtar', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (2, 1, 'netapplet_1.0.0.orig.tar.gz', 'application/x-gtar', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (3, 2, 'firefox-0.9.2.tar.gz', 'application/x-gtar', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (4, 3, 'evolution-1.0.tar.gz', 'application/x-gtar', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (5, 5, 'netapplet.pot', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (6, 6, 'pmount.pot', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (7, 7, 'evolution-2.2.pot', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (8, 8, 'evolution-2.2.pot', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (9, 9, 'pkgconf-mozilla.pot', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (10, 10, 'hr.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (11, 11, 'ca.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (12, 12, 'nb.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (13, 13, 'cs.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (14, 14, 'es_ES.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (15, 15, 'de.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (16, 16, 'fr.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (17, 17, 'it_IT.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (18, 18, 'es.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (19, 19, 'fr.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (20, 20, 'pt_BR.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (21, 21, 'ja.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (22, 22, 'es.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (23, 23, 'nl.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (24, 24, 'cs.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (25, 25, 'da.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (26, 26, 'fi.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (27, 27, 'gl.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (28, 28, 'lt.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (29, 29, 'it.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (30, 30, 'tr.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (31, 31, 'de.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (32, 32, 'es.po', 'application/x-po', NULL);
INSERT INTO libraryfilealias (id, content, filename, mimetype, expires) VALUES (33, 33, 'es.po', 'application/x-po', NULL);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'libraryfilealias'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'productreleasefile'::pg_catalog.regclass;

INSERT INTO productreleasefile (productrelease, libraryfile, filetype, id) VALUES (7, 1, 1, 1);
INSERT INTO productreleasefile (productrelease, libraryfile, filetype, id) VALUES (5, 3, 1, 2);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'productreleasefile'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'sourcepackagename'::pg_catalog.regclass;

INSERT INTO sourcepackagename (id, name) VALUES (1, 'mozilla-firefox');
INSERT INTO sourcepackagename (id, name) VALUES (9, 'evolution');
INSERT INTO sourcepackagename (id, name) VALUES (10, 'netapplet');
INSERT INTO sourcepackagename (id, name) VALUES (14, 'pmount');
INSERT INTO sourcepackagename (id, name) VALUES (15, 'a52dec');
INSERT INTO sourcepackagename (id, name) VALUES (16, 'mozilla');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'sourcepackagename'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'packaging'::pg_catalog.regclass;

INSERT INTO packaging (packaging, id, sourcepackagename, distrorelease, productseries) VALUES (1, 1, 1, 3, 2);
INSERT INTO packaging (packaging, id, sourcepackagename, distrorelease, productseries) VALUES (1, 2, 9, 3, 3);
INSERT INTO packaging (packaging, id, sourcepackagename, distrorelease, productseries) VALUES (1, 4, 9, 1, 3);
INSERT INTO packaging (packaging, id, sourcepackagename, distrorelease, productseries) VALUES (1, 3, 10, 1, 5);
INSERT INTO packaging (packaging, id, sourcepackagename, distrorelease, productseries) VALUES (1, 6, 10, 3, 5);
INSERT INTO packaging (packaging, id, sourcepackagename, distrorelease, productseries) VALUES (1, 7, 15, 1, 6);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'packaging'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'sourcepackagerelease'::pg_catalog.regclass;

INSERT INTO sourcepackagerelease (id, creator, "version", dateuploaded, urgency, dscsigningkey, component, changelog, builddepends, builddependsindep, architecturehintlist, dsc, section, manifest, maintainer, sourcepackagename, uploaddistrorelease, format) VALUES (14, 1, '0.9', '2004-09-27 11:57:13', 1, 1, 1, 'Mozilla dummy Changelog......', 'gcc-3.4-base, libc6 (>= 2.3.2.ds1-4), gcc-3.4 (>= 3.4.1-4sarge1), gcc-3.4 (<< 3.4.2), libstdc++6-dev (>= 3.4.1-4sarge1)', 'bacula-common (= 1.34.6-2), bacula-director-common (= 1.34.6-2), postgresql-client (>= 7.4)', NULL, NULL, 1, NULL, 1, 1, 3, 1);
INSERT INTO sourcepackagerelease (id, creator, "version", dateuploaded, urgency, dscsigningkey, component, changelog, builddepends, builddependsindep, architecturehintlist, dsc, section, manifest, maintainer, sourcepackagename, uploaddistrorelease, format) VALUES (15, 1, '1.0', '2004-09-27 11:57:13', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 9, 3, 1);
INSERT INTO sourcepackagerelease (id, creator, "version", dateuploaded, urgency, dscsigningkey, component, changelog, builddepends, builddependsindep, architecturehintlist, dsc, section, manifest, maintainer, sourcepackagename, uploaddistrorelease, format) VALUES (16, 1, '1.0-1', '2005-03-10 16:30:00', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 10, 3, 1);
INSERT INTO sourcepackagerelease (id, creator, "version", dateuploaded, urgency, dscsigningkey, component, changelog, builddepends, builddependsindep, architecturehintlist, dsc, section, manifest, maintainer, sourcepackagename, uploaddistrorelease, format) VALUES (17, 1, '0.99.6-1', '2005-03-14 18:00:00', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 10, 1, 1);
INSERT INTO sourcepackagerelease (id, creator, "version", dateuploaded, urgency, dscsigningkey, component, changelog, builddepends, builddependsindep, architecturehintlist, dsc, section, manifest, maintainer, sourcepackagename, uploaddistrorelease, format) VALUES (20, 1, '0.1-1', '2005-03-24 20:59:31.439579', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 14, 1, 14, 3, 1);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'sourcepackagerelease'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'sourcepackagereleasefile'::pg_catalog.regclass;

INSERT INTO sourcepackagereleasefile (sourcepackagerelease, libraryfile, filetype, id) VALUES (16, 2, 1, 1);
INSERT INTO sourcepackagereleasefile (sourcepackagerelease, libraryfile, filetype, id) VALUES (15, 4, 1, 2);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'sourcepackagereleasefile'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'build'::pg_catalog.regclass;

INSERT INTO build (id, datecreated, processor, distroarchrelease, buildstate, datebuilt, buildduration, buildlog, builder, gpgsigningkey, changes, sourcepackagerelease) VALUES (2, '2004-09-27 11:57:13', 1, 1, 1, '2004-09-27 11:57:13', NULL, NULL, NULL, NULL, 'Sample changes :)....', 14);
INSERT INTO build (id, datecreated, processor, distroarchrelease, buildstate, datebuilt, buildduration, buildlog, builder, gpgsigningkey, changes, sourcepackagerelease) VALUES (7, '2005-03-24 00:00:00', 1, 6, 1, NULL, NULL, NULL, NULL, NULL, 'changes', 20);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'build'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'binarypackagename'::pg_catalog.regclass;

INSERT INTO binarypackagename (id, name) VALUES (8, 'mozilla-firefox');
INSERT INTO binarypackagename (id, name) VALUES (13, 'pmount');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'binarypackagename'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'binarypackage'::pg_catalog.regclass;

INSERT INTO binarypackage (id, binarypackagename, "version", summary, description, build, binpackageformat, component, section, priority, shlibdeps, depends, recommends, suggests, conflicts, replaces, provides, essential, installedsize, copyright, licence, architecturespecific, fti) VALUES (12, 8, '0.9', 'Mozilla Firefox Web Browser', 'Mozilla Firefox Web Browser is .....', 2, 1, 1, 1, 1, NULL, 'gcc-3.4-base, libc6 (>= 2.3.2.ds1-4), gcc-3.4 (>= 3.4.1-4sarge1), gcc-3.4 (<< 3.4.2), libstdc++6-dev (>= 3.4.1-4sarge1)', 'gcc-3.4-base, libc6 (>= 2.3.2.ds1-4), gcc-3.4 (>= 3.4.1-4sarge1), gcc-3.4 (<< 3.4.2), libstdc++6-dev (>= 3.4.1-4sarge1)', NULL, NULL, NULL, 'mozilla-firefox', NULL, NULL, NULL, NULL, true, '''web'':3,7 ''browser'':4,8 ''firefox'':2,6 ''mozilla'':1,5');
INSERT INTO binarypackage (id, binarypackagename, "version", summary, description, build, binpackageformat, component, section, priority, shlibdeps, depends, recommends, suggests, conflicts, replaces, provides, essential, installedsize, copyright, licence, architecturespecific, fti) VALUES (15, 13, '0.1-1', 'pmount shortdesc', 'pmount description', 7, 1, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, NULL, NULL, false, '''pmount'':1,3 ''descript'':4 ''shortdesc'':2');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'binarypackage'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'binarypackagefile'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'binarypackagefile'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'packageselection'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'packageselection'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'osfile'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'osfile'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'osfileinpackage'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'osfileinpackage'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'pomsgid'::pg_catalog.regclass;

INSERT INTO pomsgid (id, msgid) VALUES (1, 'evolution addressbook');
INSERT INTO pomsgid (id, msgid) VALUES (2, 'current addressbook folder');
INSERT INTO pomsgid (id, msgid) VALUES (3, 'have ');
INSERT INTO pomsgid (id, msgid) VALUES (4, 'has ');
INSERT INTO pomsgid (id, msgid) VALUES (5, ' cards');
INSERT INTO pomsgid (id, msgid) VALUES (6, ' card');
INSERT INTO pomsgid (id, msgid) VALUES (7, 'contact''s header: ');
INSERT INTO pomsgid (id, msgid) VALUES (8, 'evolution minicard');
INSERT INTO pomsgid (id, msgid) VALUES (9, 'This addressbook could not be opened.');
INSERT INTO pomsgid (id, msgid) VALUES (10, 'This addressbook server might unreachable or the server name may be misspelled or your network connection could be down.');
INSERT INTO pomsgid (id, msgid) VALUES (11, 'Failed to authenticate with LDAP server.');
INSERT INTO pomsgid (id, msgid) VALUES (12, 'Check to make sure your password is spelled correctly and that you are using a supported login method. Remember that many passwords are case sensitive; your caps lock might be on.');
INSERT INTO pomsgid (id, msgid) VALUES (13, 'Migrating `%s'':');
INSERT INTO pomsgid (id, msgid) VALUES (14, 'The location and hierarchy of the Evolution contact folders has changed since Evolution 1.x.

Please be patient while Evolution migrates your folders...');
INSERT INTO pomsgid (id, msgid) VALUES (15, '%d contact');
INSERT INTO pomsgid (id, msgid) VALUES (16, '%d contacts');
INSERT INTO pomsgid (id, msgid) VALUES (17, 'Opening %d contact will open %d new window as well.
Do you really want to display this contact?');
INSERT INTO pomsgid (id, msgid) VALUES (18, 'Opening %d contacts will open %d new windows as well.
Do you really want to display all of these contacts?');
INSERT INTO pomsgid (id, msgid) VALUES (19, '%d foo');
INSERT INTO pomsgid (id, msgid) VALUES (20, '%d bars');
INSERT INTO pomsgid (id, msgid) VALUES (21, 'EncFS Password: ');
INSERT INTO pomsgid (id, msgid) VALUES (22, 'When specifying daemon mode, you must use absolute paths (beginning with ''/'')');
INSERT INTO pomsgid (id, msgid) VALUES (23, 'Please select a key size in bits.  The cipher you have chosen
supports sizes from %i to %i bits in increments of %i bits.
For example: ');
INSERT INTO pomsgid (id, msgid) VALUES (24, 'Found %i invalid file.');
INSERT INTO pomsgid (id, msgid) VALUES (25, 'Found %i invalid files.');
INSERT INTO pomsgid (id, msgid) VALUES (26, '
      <p>Thousands of sites (particularly news sites and weblogs) publish their latest headlines and/or stories in a machine-readable format so that other sites can easily link to them. This content is usually in the form of an <a href="http://blogs.law.harvard.edu/tech/rss">RSS</a> feed (which is an XML-based syndication standard).</p>
      <p>You can read aggregated content from many sites using RSS feed readers, such as <a href="http://www.disobey.com/amphetadesk/">Amphetadesk</a>.</p>
      <p>Drupal provides the means to aggregate feeds from many sites and display these aggregated feeds to your site''s visitors. To do this, enable the aggregator module in site administration and then go to the aggregator configuration page, where you can subscribe to feeds and set up other options.</p>
      <h3>How do I find RSS feeds to aggregate?</h3>
      <p>Many web sites (especially weblogs) display small XML icons or other obvious links on their home page. You can follow these to obtain the web address for the RSS feed. Common extensions for RSS feeds are .rss, .xml and .rdf. For example: <a href="http://slashdot.org/slashdot.rdf">Slashdot RSS</a>.</p>
      <p>If you can''t find a feed for a site, or you want to find several feeds on a given topic, try an RSS syndication directory such as <a href="http://www.syndic8.com/">Syndic8</a>.</p>
      <p>To learn more about RSS, read Mark Pilgrim''s <a href="http://www.xml.com/pub/a/2002/12/18/dive-into-xml.html">What is RSS</a> and WebReference.com''s <a href="http://www.webreference.com/authoring/languages/xml/rss/1/">The Evolution of RSS</a> articles.</p>
      <p>NOTE: Enable your site''s XML syndication button by turning on the Syndicate block in block management.</p>
      <h3>How do I add a news feed?</h3>
      <p>To subscribe to an RSS feed on another site, use the <a href="% admin-news">aggregation page</a>.</p>
      <p>Once there, click the <a href="%new-feed">new feed</a> tab. Drupal will then ask for the following:</p>
      <ul>
       <li><strong>Title</strong> -- The text entered here will be used in your news aggregator, within the administration configuration section, and as a title for the news feed block. As a general rule, use the web site name from which the feed originates.</li>
       <li><strong>URL</strong> -- Here you''ll enter the fully-qualified web address for the feed you wish to subscribe to.</li>
       <li><strong>Update interval</strong> -- This is how often Drupal will scan the feed for new content. This defaults to every hour. Checking a feed more frequently that this is typically a waste of bandwidth and is considered somewhat impolite. For automatic updates to work, cron.php must be called regularly. If it is not, you''ll have to manually update the feeds one at a time within the news aggregation administration page by using <a href="%update-items">update items</a>.</li>
       <li><strong>Latest items block</strong> -- The number of items selected here will determine how many of the latest items from the feed will appear in a block which may be enabled and placed in the <a href="%block">blocks</a> administration page.</li>
       <li><strong>Automatically file items</strong> -- As items are received from a feed they will be put in any categories you have selected here.</li>
      </ul>
      <p>Once you have submitted the new feed, check to make sure it is working properly by selecting <a href="%update-items">update items</a> on the <a href="%admin-news">aggregation page</a>. If you do not see any items listed for that feed, edit the feed and make sure that the URL was entered correctly.</p>
      <h3>Adding categories</h3>
      <p>News items can be filed into categories. To create a category, start at the <a href="%admin-news">aggregation page</a>.</p>
      <p>Once there, select <a href="%new-category">new category</a> from the menu. Drupal will then ask for the following:</p>
      <ul>
       <li><strong>Title</strong> -- The title will be used in the <em>news by topics</em> listing in your news aggregator and for the block created for the bundle.</li>
       <li><strong>Description</strong> -- A short description of the category to tell users more details about what news items they might find in the category.</li>
       <li><strong>Latest items block</strong> -- The number of items selected here will determine how many of the latest items from the category will appear in a block which may be enabled and placed in the <a href="%block">blocks</a> administration page.</li>
      </ul>
      <h3>Using the news aggregator</h3>
      <p>The news aggregator has a number of ways that it displays your subscribed content:</p>
      <ul>
       <li><strong><a href="%news-aggregator">News aggregator</a></strong> (latest news) -- Displays all incoming items in the order in which they were received.</li>
       <li><strong><a href="%sources">Sources</a></strong> -- Organizes incoming content by feed, displaying feed titles (each of which links to a page with the latest items from that feed) and item titles (which link to that item''s actual story/article).</li>
       <li><strong><a href="%categories">Categories</a></strong> -- Organizes incoming content by category, displaying category titles (each of which links to a page with the latest items from that category) and item titles (which link to that item''s actual story/article).</li>
      </ul>
      <p>Pages that display items (for sources, categories, etc.) display the following for each item:
      <ul>
       <li>The title of the item (its headline).</li>
       <li>The categories that the item belongs to, each of which links to that particular category page as detailed above.</li>
       <li>A description containing the first few paragraphs or a summary of the item (if available).</li>
       <li>The name of the feed, which links to the individual feed''s page, listing information about that feed and items for that feed only. This is not shown on feed pages (they would link to the page you''re currently on).</li>
      </ul>
      <p>Additionally, users with the <em>administer news feeds permission</em> will see a link to categorize the news items. Clicking this will allow them to select which category(s) each news item is in.</p>
      <h3>Technical details</h3>
      <p>Drupal automatically generates an OPML feed file that is available by selecting the XML icon on the News Sources page.</p>
      <p>When fetching feeds Drupal supports conditional GETs, this reduces the bandwidth usage for feeds that have not been updated since the last check.</p>
      <p>If a feed is permanently moved to a new location Drupal will automatically update the feed URL to the new address.</p>');
INSERT INTO pomsgid (id, msgid) VALUES (27, '_Add Group');
INSERT INTO pomsgid (id, msgid) VALUES (28, 'Disconnected');
INSERT INTO pomsgid (id, msgid) VALUES (29, 'Ethernet connection');
INSERT INTO pomsgid (id, msgid) VALUES (30, 'Dial-up connection');
INSERT INTO pomsgid (id, msgid) VALUES (31, 'Wireless connection');
INSERT INTO pomsgid (id, msgid) VALUES (32, 'Wireless connection (secure)');
INSERT INTO pomsgid (id, msgid) VALUES (33, '<span weight="bold" size="larger">Network switching is currently unavailable</span>

The "netdaemon" service is not running');
INSERT INTO pomsgid (id, msgid) VALUES (34, '<span weight="bold" size="larger">Do you want to disconnect all network connections?</span>

Applications which use the network, such as web browsers and email programs, will likely stop working while you are disconnected.');
INSERT INTO pomsgid (id, msgid) VALUES (35, 'Error trying to set default keyring: %d');
INSERT INTO pomsgid (id, msgid) VALUES (36, 'Error trying to create keyring: %d');
INSERT INTO pomsgid (id, msgid) VALUES (37, 'Error trying to get default keyring: %d');
INSERT INTO pomsgid (id, msgid) VALUES (38, 'Unable to save to keyring!  Err: %d');
INSERT INTO pomsgid (id, msgid) VALUES (39, 'Password for network "%s"');
INSERT INTO pomsgid (id, msgid) VALUES (40, '<span weight="bold" size="larger">Error displaying connection information: </span>

No active connection!');
INSERT INTO pomsgid (id, msgid) VALUES (41, '<span weight="bold" size="larger">Error displaying connection information: </span>

Unable to open socket!');
INSERT INTO pomsgid (id, msgid) VALUES (42, '<span weight="bold" size="larger">Error displaying information: </span>

SIOCGIFFLAGS failed on socket!');
INSERT INTO pomsgid (id, msgid) VALUES (43, '<span weight="bold" size="larger">Network configuration could not be run</span>

%s');
INSERT INTO pomsgid (id, msgid) VALUES (44, 'Network Connections');
INSERT INTO pomsgid (id, msgid) VALUES (45, 'No network connections available');
INSERT INTO pomsgid (id, msgid) VALUES (46, '%s: %s (active)');
INSERT INTO pomsgid (id, msgid) VALUES (47, 'Wireless Networks');
INSERT INTO pomsgid (id, msgid) VALUES (48, 'Wireless disabled');
INSERT INTO pomsgid (id, msgid) VALUES (49, 'No wireless networks available');
INSERT INTO pomsgid (id, msgid) VALUES (50, '%s (active)');
INSERT INTO pomsgid (id, msgid) VALUES (51, 'Connection _Information');
INSERT INTO pomsgid (id, msgid) VALUES (52, '_Configure Network Settings');
INSERT INTO pomsgid (id, msgid) VALUES (53, '_Remove from Panel');
INSERT INTO pomsgid (id, msgid) VALUES (54, '<span weight="bold" size="larger">Network switching is currently unavailable</span>

You do not have the permissions to change network settings');
INSERT INTO pomsgid (id, msgid) VALUES (55, '*');
INSERT INTO pomsgid (id, msgid) VALUES (56, '<span weight="bold" size="larger">Active Connection Information</span>');
INSERT INTO pomsgid (id, msgid) VALUES (57, 'Add to Keyring');
INSERT INTO pomsgid (id, msgid) VALUES (58, 'Broadcast Address:');
INSERT INTO pomsgid (id, msgid) VALUES (59, 'Connection Information');
INSERT INTO pomsgid (id, msgid) VALUES (60, 'Destination Address:');
INSERT INTO pomsgid (id, msgid) VALUES (61, 'ESSID:');
INSERT INTO pomsgid (id, msgid) VALUES (62, 'Encryption Key:');
INSERT INTO pomsgid (id, msgid) VALUES (63, 'Hardware Address:');
INSERT INTO pomsgid (id, msgid) VALUES (64, 'IP Address:');
INSERT INTO pomsgid (id, msgid) VALUES (65, 'Interface:');
INSERT INTO pomsgid (id, msgid) VALUES (66, 'Show Encryption Key');
INSERT INTO pomsgid (id, msgid) VALUES (67, 'Specify an ESSID');
INSERT INTO pomsgid (id, msgid) VALUES (68, 'Specify the key');
INSERT INTO pomsgid (id, msgid) VALUES (69, 'Subnet Mask:');
INSERT INTO pomsgid (id, msgid) VALUES (70, 'Type:');
INSERT INTO pomsgid (id, msgid) VALUES (71, 'Usage:

%s [options] <device> [<label>]

  Mount <device> to a directory below %s if policy requirements
  are met (see pmount(1) for details). If <label> is given, the mount point
  will be %s/<label>, otherwise it will be %s<device>.
  If the mount point does not exist, it will be created.

');
INSERT INTO pomsgid (id, msgid) VALUES (72, '%s --lock <device> <pid>
  Prevent further pmounts of <device> until it is unlocked again. <pid>
  specifies the process id the lock holds for. This allows to lock a device
  by several independent processes and avoids indefinite locks of crashed
  processes (nonexistant pids are cleaned before attempting a mount).

');
INSERT INTO pomsgid (id, msgid) VALUES (73, '%s --unlock <device> <pid>
  Remove the lock on <device> for process <pid> again.

');
INSERT INTO pomsgid (id, msgid) VALUES (74, 'Options:
  -a, --async : mount <device> with the ''async'' option (default: ''sync'')
  --noatime   : mount <device> with the ''noatime'' option (default: ''atime'')
  -e, --exec  : mount <device> with the ''exec'' option (default: ''noexec'')
  -t <fs>     : mount as file system type <fs> (default: autodetected)
  -c <charset>: use given I/O character set (default: ''utf8'' if called
                in an UTF-8 locale, otherwise mount default)
  -d, --debug : enable debug output (very verbose)
  -h, --help  : print help message and exit successfuly');
INSERT INTO pomsgid (id, msgid) VALUES (75, 'Error: make_mountpoint_name: invalid device %s (must be in /dev/)
');
INSERT INTO pomsgid (id, msgid) VALUES (76, 'Error: label must not be empty
');
INSERT INTO pomsgid (id, msgid) VALUES (77, 'Error: label too long
');
INSERT INTO pomsgid (id, msgid) VALUES (78, 'Error: ''/'' must not occur in label name
');
INSERT INTO pomsgid (id, msgid) VALUES (79, 'Error: device name too long
');
INSERT INTO pomsgid (id, msgid) VALUES (80, 'Error: could not drop all uid privileges');
INSERT INTO pomsgid (id, msgid) VALUES (81, 'Error: could not execute mount');
INSERT INTO pomsgid (id, msgid) VALUES (82, 'Internal error: mount_attempt: given file system name is NULL
');
INSERT INTO pomsgid (id, msgid) VALUES (83, 'Error: invalid file system name ''%s''
');
INSERT INTO pomsgid (id, msgid) VALUES (84, 'Error: invalid charset name ''%s''
');
INSERT INTO pomsgid (id, msgid) VALUES (85, 'Error: could not raise to full root uid privileges');
INSERT INTO pomsgid (id, msgid) VALUES (86, 'Error: could not wait for executed mount process');
INSERT INTO pomsgid (id, msgid) VALUES (87, 'Error: cannot lock for pid %u, this process does not exist
');
INSERT INTO pomsgid (id, msgid) VALUES (88, 'Error: could not create pid lock file %s: %s
');
INSERT INTO pomsgid (id, msgid) VALUES (89, 'Error: could not remove pid lock file %s: %s
');
INSERT INTO pomsgid (id, msgid) VALUES (90, 'Error: do_unlock: could not remove lock directory');
INSERT INTO pomsgid (id, msgid) VALUES (91, 'Error: this program needs to be installed suid root
');
INSERT INTO pomsgid (id, msgid) VALUES (92, 'Internal error: getopt_long() returned unknown value
');
INSERT INTO pomsgid (id, msgid) VALUES (93, 'Warning: device %s is already handled by /etc/fstab, supplied label is ignored
');
INSERT INTO pomsgid (id, msgid) VALUES (94, 'Error: could not determine real path of the device');
INSERT INTO pomsgid (id, msgid) VALUES (95, 'Error: invalid device %s (must be in /dev/)
');
INSERT INTO pomsgid (id, msgid) VALUES (96, 'Error: could not delete mount point');
INSERT INTO pomsgid (id, msgid) VALUES (97, 'Internal error: mode %i not handled.
');
INSERT INTO pomsgid (id, msgid) VALUES (98, 'pmount-hal - execute pmount with additional information from hal

Usage: pmount-hal <hal UDI> [pmount options]

This command mounts the device described by the given UDI using pmount. The
file system type, the volume storage policy and the desired label will be
read out from hal and passed to pmount.');
INSERT INTO pomsgid (id, msgid) VALUES (99, 'Error: could not execute pmount
');
INSERT INTO pomsgid (id, msgid) VALUES (100, 'Error: could not connect to hal
');
INSERT INTO pomsgid (id, msgid) VALUES (101, 'Error: given UDI does not exist
');
INSERT INTO pomsgid (id, msgid) VALUES (102, 'Error: given UDI is not a mountable volume
');
INSERT INTO pomsgid (id, msgid) VALUES (103, 'Error: could not get status of device');
INSERT INTO pomsgid (id, msgid) VALUES (104, 'Error: could not get sysfs directory
');
INSERT INTO pomsgid (id, msgid) VALUES (105, 'Error: could not open <sysfs dir>/block/');
INSERT INTO pomsgid (id, msgid) VALUES (106, 'Error: could not open <sysfs dir>/block/<device>/');
INSERT INTO pomsgid (id, msgid) VALUES (107, 'Error: device %s does not exist
');
INSERT INTO pomsgid (id, msgid) VALUES (108, 'Error: %s is not a block device
');
INSERT INTO pomsgid (id, msgid) VALUES (109, 'Error: could not open fstab-type file');
INSERT INTO pomsgid (id, msgid) VALUES (110, 'Error: device %s is already mounted to %s
');
INSERT INTO pomsgid (id, msgid) VALUES (111, 'Error: device %s is not mounted
');
INSERT INTO pomsgid (id, msgid) VALUES (112, 'Error: device %s was not mounted by you
');
INSERT INTO pomsgid (id, msgid) VALUES (113, 'Error: device %s is not removable
');
INSERT INTO pomsgid (id, msgid) VALUES (114, 'Error: device %s is locked
');
INSERT INTO pomsgid (id, msgid) VALUES (115, 'Error: directory %s already contains a mounted file system
');
INSERT INTO pomsgid (id, msgid) VALUES (116, 'Error: directory %s does not contain a mounted file system
');
INSERT INTO pomsgid (id, msgid) VALUES (117, 'Usage:

%s [options] <device>
  Umount <device> from a directory below %s if policy requirements
  are met (see pumount(1) for details). The mount point directory is removed
  afterwards.

Options:
  -l, --lazy : umount lazily, see umount(8)
  -d, --debug : enable debug output (very verbose)
  -h, --help  : print help message and exit successfuly
');
INSERT INTO pomsgid (id, msgid) VALUES (118, 'Internal error: could not determine mount point
');
INSERT INTO pomsgid (id, msgid) VALUES (119, 'Error: mount point %s is not below %s
');
INSERT INTO pomsgid (id, msgid) VALUES (120, 'Error: could not execute umount');
INSERT INTO pomsgid (id, msgid) VALUES (121, 'Error: could not wait for executed umount process');
INSERT INTO pomsgid (id, msgid) VALUES (122, 'Error: umount failed
');
INSERT INTO pomsgid (id, msgid) VALUES (123, 'Error: out of memory
');
INSERT INTO pomsgid (id, msgid) VALUES (124, 'Error: could not create directory');
INSERT INTO pomsgid (id, msgid) VALUES (125, 'Error: could not create stamp file in directory');
INSERT INTO pomsgid (id, msgid) VALUES (126, 'Error: %s is not a directory
');
INSERT INTO pomsgid (id, msgid) VALUES (127, 'Error: could not open directory');
INSERT INTO pomsgid (id, msgid) VALUES (128, 'Error: directory %s is not empty
');
INSERT INTO pomsgid (id, msgid) VALUES (129, 'Error: ''%s'' is not a valid number
');
INSERT INTO pomsgid (id, msgid) VALUES (130, 'Internal error: could not change to effective uid root');
INSERT INTO pomsgid (id, msgid) VALUES (131, 'Internal error: could not change effective user uid to real user id');
INSERT INTO pomsgid (id, msgid) VALUES (132, 'Internal error: could not change to effective gid root');
INSERT INTO pomsgid (id, msgid) VALUES (133, 'Internal error: could not change effective group id to real group id');
INSERT INTO pomsgid (id, msgid) VALUES (134, '/etc/mozilla/prefs.js is available for customizing preferences.');
INSERT INTO pomsgid (id, msgid) VALUES (135, 'Debian mozilla will load /etc/mozilla/prefs.js after loading some default preference scripts.');
INSERT INTO pomsgid (id, msgid) VALUES (136, 'You can edit this file for system-wide settings. (i.e.: font settings)');
INSERT INTO pomsgid (id, msgid) VALUES (137, 'auto, esddsp, artsdsp, none');
INSERT INTO pomsgid (id, msgid) VALUES (138, 'Please choose your sound daemon''s dsp wrapper.');
INSERT INTO pomsgid (id, msgid) VALUES (139, 'Sometimes mozilla hangs since plugins (e.g. flashplugin) lock /dev/dsp. You can use dsp wrapper to resolve it. ''auto'' will decide which dsp wrappers should be used according to the sound daemon running. When no sound daemon is detected, mozilla won''t use any wrapper. This setting will be saved into /etc/mozilla/mozillarc and can be overriden with your ~/.mozillarc.');
INSERT INTO pomsgid (id, msgid) VALUES (140, 'Enable automatic Language/Region selection?');
INSERT INTO pomsgid (id, msgid) VALUES (141, 'This setting provides an automatic language/region pack selection in Mozilla using the locale settings. It may help a sysadmin faced with hundreds of non-english-speaking novices.');
INSERT INTO pomsgid (id, msgid) VALUES (142, 'Please set your LC_MESSAGE or LC_ALL variable in order this setting works correctly.');
INSERT INTO pomsgid (id, msgid) VALUES (143, 'xprint seems not to be installed');
INSERT INTO pomsgid (id, msgid) VALUES (144, 'Mozilla has dropped postscript support. This means that Xprint is required for printing. Please install xprt-xprintorg package.');
INSERT INTO pomsgid (id, msgid) VALUES (145, 'This is not a bug, Don''t submit bug reports for this. (wishlist to reenable postscript has been submitted already, Bug#256072)');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'pomsgid'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'potranslation'::pg_catalog.regclass;

INSERT INTO potranslation (id, translation) VALUES (1, 'libreta de direcciones de Evolution');
INSERT INTO potranslation (id, translation) VALUES (2, 'carpeta de libretas de direcciones actual');
INSERT INTO potranslation (id, translation) VALUES (3, 'tiene');
INSERT INTO potranslation (id, translation) VALUES (4, ' tarjetas');
INSERT INTO potranslation (id, translation) VALUES (5, 'La ubicación y jerarquía de las carpetas de contactos de Evolution ha cambiado desde Evolution 1.x.

Tenga paciencia mientras Evolution migra sus carpetas...');
INSERT INTO potranslation (id, translation) VALUES (6, '%d contacto');
INSERT INTO potranslation (id, translation) VALUES (7, '%d contactos');
INSERT INTO potranslation (id, translation) VALUES (8, 'Abrir %d contacto abrirá %d ventanas nuevas también.
¿Quiere realmente mostrar este contacto?');
INSERT INTO potranslation (id, translation) VALUES (9, 'Abrir %d contactos abrirá %d ventanas nuevas también.
¿Quiere realmente mostrar todos estos contactos?');
INSERT INTO potranslation (id, translation) VALUES (10, '%d foo');
INSERT INTO potranslation (id, translation) VALUES (11, 'Contraseña de EncFS: ');
INSERT INTO potranslation (id, translation) VALUES (12, '_Añadir grupo');
INSERT INTO potranslation (id, translation) VALUES (13, 'Upotreba:

%s [opcije] <uređaj> [<etiketa>]

  Montiraj <device> u direktorij ispod %s ako su policy zahtjevi
  zadovoljeni (vidi pmount(1) za detalje). Ako <label> je zadan, točka montiranja
  će biti %s/<label>, inače će biti %s<device>.
  Ako ne postoji točka montiranja, biti će kreirana.

');
INSERT INTO potranslation (id, translation) VALUES (14, '%s --lock <device> <pid>
  Spriječi daljnje pmounts <device> sve dok nije ponovno otključan. <pid>
  specificira id procesa za koji drži brava. To dozvoljava da se zaključa uređaj
  sa strane nekoliko nezavisnih procesa i izbjegava neodređena zaključavanja srušenih
  procesa (nepostojeći pid-ovi su očišćeni prije pokušaja montiranja).

');
INSERT INTO potranslation (id, translation) VALUES (15, '%s --unlock <device> <pid>
  Odstrani bravu na <device> za ponovno procesiranje <pid>.

');
INSERT INTO potranslation (id, translation) VALUES (16, 'Opcije:
  -a, --async : montiraj <device> sa ''async'' opcijom (predodređeno: ''sync'')
  --noatime : montiraj <device> sa ''noatime'' opcijom (predodređeno: ''atime'')
  -e, --exec : montiraj <device> sa ''exec'' opcijom (predodređeno: ''noexec'')
  -t <fs> : montiraj kao datotečni sustav <fs> vrste (predodređeno: samodetektirano)
  -c <charset>: upotrebi dani I/O skup znakova (predodređeno: ''utf8'' ako je pozvano
                u jednoj UTF-8 lokali, inače montiraj predodređeno)
  -d, --debug : aktiviraj debug izlaz (jako riječito)
  -h, --help : ispiši pomoćnu poruku i uspješno izađi');
INSERT INTO potranslation (id, translation) VALUES (17, 'Greška: make_mountpoint_name: nevažeči uređaj %s (mora biti u /dev/)
');
INSERT INTO potranslation (id, translation) VALUES (18, 'Greška: etiketa ne smije biti prazna
');
INSERT INTO potranslation (id, translation) VALUES (19, 'Greška: etiketa je preduga
');
INSERT INTO potranslation (id, translation) VALUES (20, 'Greška: ''/'' ne smije se nalaziti u imenu etikete
');
INSERT INTO potranslation (id, translation) VALUES (21, 'Greška: ime uređaja je predugo
');
INSERT INTO potranslation (id, translation) VALUES (22, 'Greška: ne mogu otpustiti sve uid privilegije');
INSERT INTO potranslation (id, translation) VALUES (23, 'Greška: ne mogu izvršiti mount');
INSERT INTO potranslation (id, translation) VALUES (24, 'Unutarnja greška: mount_attempt: dato ime datotečnog sustava je NULL
');
INSERT INTO potranslation (id, translation) VALUES (25, 'Greška: nevažeće ime datotečnog sustava ''%s''
');
INSERT INTO potranslation (id, translation) VALUES (26, 'Greška: nevažeće ime charseta ''%s''
');
INSERT INTO potranslation (id, translation) VALUES (27, 'Greška: ne mogu se dignuti na pune root uid privilegije');
INSERT INTO potranslation (id, translation) VALUES (28, 'Greška: ne mogu čekati za izvršeni proces montiranja');
INSERT INTO potranslation (id, translation) VALUES (29, 'Greška: ne mogu zaključati za pid %u, taj proces ne postoji
');
INSERT INTO potranslation (id, translation) VALUES (30, 'Greška: ne mogu kreirati pid zaključanu datoteku %s: %s
');
INSERT INTO potranslation (id, translation) VALUES (31, 'Greška: ne mogu maknuti pid zaključanu datoteku %s: %s
');
INSERT INTO potranslation (id, translation) VALUES (32, 'Greška: do_unlock: ne mogu maknuti zaključani direktorij');
INSERT INTO potranslation (id, translation) VALUES (33, 'Greška: ovaj program mora biti instaliran kao suid root
');
INSERT INTO potranslation (id, translation) VALUES (34, 'Unutarnja greška: getopt_long() vratio nepoznatu vrijednost
');
INSERT INTO potranslation (id, translation) VALUES (35, 'Upozorenje: uređaj %s je već zbrinut sa strane /etc/fstab, dana etiketa je zanemarena
');
INSERT INTO potranslation (id, translation) VALUES (36, 'Greška: ne mogu ustanoviti pravi put uređaja');
INSERT INTO potranslation (id, translation) VALUES (37, 'Greška: nevažeći uređaj %s (mora biti u /dev/)
');
INSERT INTO potranslation (id, translation) VALUES (38, 'Greška: ne mogu izbrisati točku montiranja');
INSERT INTO potranslation (id, translation) VALUES (39, 'Unutarnja greška: mod %i nije obrađen.
');
INSERT INTO potranslation (id, translation) VALUES (40, 'pmount-hal - izvrši pmount sa dodatnim informacijama iz hal-a

Upotreba: pmount-hal <hal UDI> [pmount opcije]

Ova naredba montira uređaj opisan sa datim UDI-jem koristeči pmount.
Tip datotečnog sustava, volumen policyja spremanja i željena etiketa biti će
čitani iz hal-a i proslijeđeni pmountu.');
INSERT INTO potranslation (id, translation) VALUES (41, 'Greška: ne mogu izvršiti pmount
');
INSERT INTO potranslation (id, translation) VALUES (42, 'Greška: ne mogu se spojiti na hal
');
INSERT INTO potranslation (id, translation) VALUES (43, 'Greška: dani UDI ne postoji
');
INSERT INTO potranslation (id, translation) VALUES (44, 'Greška: dani UDI nije montabilni volumen
');
INSERT INTO potranslation (id, translation) VALUES (45, 'Greška: ne mogu dobiti stanje uređaja');
INSERT INTO potranslation (id, translation) VALUES (46, 'Greška: ne mogu dobiti sysfs direktorij
');
INSERT INTO potranslation (id, translation) VALUES (47, 'Greška: ne mogu otvoriti <sysfs dir>/block/');
INSERT INTO potranslation (id, translation) VALUES (48, 'Greška: ne mogu otvoriti <sysfs dir>/block/<device>/');
INSERT INTO potranslation (id, translation) VALUES (49, 'Greška: uređaj %s ne postoji
');
INSERT INTO potranslation (id, translation) VALUES (50, 'Greška: %s nije blok uređaj
');
INSERT INTO potranslation (id, translation) VALUES (51, 'Greška: ne mogu otvoriti fstab-type datoteku');
INSERT INTO potranslation (id, translation) VALUES (52, 'Greška: uređaj %s je već montiran na %s
');
INSERT INTO potranslation (id, translation) VALUES (53, 'Greška: uređaj %s nije montiran
');
INSERT INTO potranslation (id, translation) VALUES (54, 'Greška: uređaj %s nije montiran za vas
');
INSERT INTO potranslation (id, translation) VALUES (55, 'Greška: uređaj %s nije odstranjiv
');
INSERT INTO potranslation (id, translation) VALUES (56, 'Greška: uređaj %s je zaključan
');
INSERT INTO potranslation (id, translation) VALUES (57, 'Greška: direktorij %s već sadrži montirani datotečni sustav
');
INSERT INTO potranslation (id, translation) VALUES (58, 'Greška: direktorij %s ne sadrži montirani datotečni sustav
');
INSERT INTO potranslation (id, translation) VALUES (59, 'Upotreba:

%s [options] <device>
  Umount <device> iz direktorija ispod %s ako su zahtjevi policyja
  zadovoljeni (vidi pumount(1) za detalje). Točka montiranja direktorija je odstranjena 
  kasnije.

Opcije:
  -l, --lazy : umount lijeno, vidi umount (8)
  -d, --debug : aktiviraj debug izlaz (jako opširno)
  -h, --help : ispiši poruku pomoći i uspješno izađi
');
INSERT INTO potranslation (id, translation) VALUES (60, 'Unutarnja greška: ne mogu ustanoviti točku montiranja
');
INSERT INTO potranslation (id, translation) VALUES (61, 'Greška: točka montiranja %s nije ispod %s
');
INSERT INTO potranslation (id, translation) VALUES (62, 'Greška: ne mogu izvršiti umount');
INSERT INTO potranslation (id, translation) VALUES (63, 'Greška: nisam mogla pričekati za izvršeni umount proces');
INSERT INTO potranslation (id, translation) VALUES (64, 'Greška: neuspjelo umount
');
INSERT INTO potranslation (id, translation) VALUES (65, 'Greška: izvan memorije
');
INSERT INTO potranslation (id, translation) VALUES (66, 'Greška: Nisam mogla kreirati direktorij');
INSERT INTO potranslation (id, translation) VALUES (67, 'Greška: nisam mogla kreirati žig datoteku u direktoriju');
INSERT INTO potranslation (id, translation) VALUES (68, 'Greška: %s nije direktorij
');
INSERT INTO potranslation (id, translation) VALUES (69, 'Greška: nisam mogla otvoriti direktorij');
INSERT INTO potranslation (id, translation) VALUES (70, 'Greška: direktorij %s nije prazan
');
INSERT INTO potranslation (id, translation) VALUES (71, 'Greška: ''%s'' nije ispravan broj
');
INSERT INTO potranslation (id, translation) VALUES (72, 'Unutarnja greška: nisam mogla promjeniti u efektivni uid root');
INSERT INTO potranslation (id, translation) VALUES (73, 'Unutarnja greška: nisam mogla promjeniti efektivni korisnički uid u realni korisnićki id');
INSERT INTO potranslation (id, translation) VALUES (74, 'Unutarnja greška: nisam mogla promjeniti u efektivni gid root');
INSERT INTO potranslation (id, translation) VALUES (75, 'Unutarnja greška: nisam mogla promjeniti efektivnu grupu u realni id grupe');
INSERT INTO potranslation (id, translation) VALUES (76, 'Ús:

%s [opcions] <dispositiu> [<etiqueta>]

  Monta <dispositiu> al directori sota %s si es compleixen
  els requeriments (vegeu pmount(1) per més detalls). Si es dóna <etiqueta>, el punt de muntatge
  serà %s/<etiqueta>, en cas contrari, serà %s<dispositiu>.
  Si el punt de muntatge no existeix, es crearà.

');
INSERT INTO potranslation (id, translation) VALUES (77, '%s --lock <dispositiu> <pid>
  Prevén més pmounts del <dispositiu> fins que no es desbloqui altra vegada. <pid>
  especifica l''identificador del procés al qual actua el blocatge. Això permet bloquejar un dispositiu
  per diversos processos independents i evita bloquejos indefinits de processos
  fallits (pids no existents es netegen abans d''intentar montar-los).

');
INSERT INTO potranslation (id, translation) VALUES (78, '%s --unlock <dispositiu> <pid>
  Remou el blocatge al <dispositiu> per processar <pid> altra vegada.

');
INSERT INTO potranslation (id, translation) VALUES (79, 'Opcions:
  -a, --async : monta <dispositiu> amb l''opció ''async'' (per defecte: ''sync'')
  --noatime   : monta <dispositiu> amb l''opció ''noatime'' (per defecte: ''atime'')
  -e, --exec  : monta <dispositiu> amb l''opció ''exec'' (per defecte: ''noexec'')
  -t <fs>     : monta com a tipus de sistema de fitxers <fs> (per defecte: autodetectat)
  -c <charset>: usa el joc de caràcters I/O donat (per defecte: ''utf8'' si es crida
                des d''una locale UTF-8, si no es monta per defecte)
  -d, --debug : habilita la sortida en mode depuració (molt detalladament)
  -h, --help  : imprimeix el missatge d''ajuda i surt exitosament');
INSERT INTO potranslation (id, translation) VALUES (80, 'Error: make_mountpoint_name: dispositiu %s invàlid (ha d''estar a /dev/)
');
INSERT INTO potranslation (id, translation) VALUES (81, 'Error: l''etiqueta no pot estar buida
');
INSERT INTO potranslation (id, translation) VALUES (82, 'Error: etiqueta massa llarga
');
INSERT INTO potranslation (id, translation) VALUES (83, 'Error: ''/'' no ha d''estar al nom de l''etiqueta
');
INSERT INTO potranslation (id, translation) VALUES (84, 'Error: nom de dispositiu massa llarg
');
INSERT INTO potranslation (id, translation) VALUES (85, 'Error: no es poden eliminar tots els privilegis uid');
INSERT INTO potranslation (id, translation) VALUES (86, 'Error: no es pot executar mount');
INSERT INTO potranslation (id, translation) VALUES (87, 'error intern: mount_attempt: el sistema de fitxers donat és NULL
');
INSERT INTO potranslation (id, translation) VALUES (88, 'Error: el nom %s de sistema de fitxers és invàlid
');
INSERT INTO potranslation (id, translation) VALUES (89, 'Error: el nom %s del joc de caràcters és invàlid
');
INSERT INTO potranslation (id, translation) VALUES (90, 'Error: no s''han pogut donar tots els privilegis uid de super-usuari');
INSERT INTO potranslation (id, translation) VALUES (91, 'Error: no s''ha pogut esperar per processos de muntatge executats');
INSERT INTO potranslation (id, translation) VALUES (92, 'Error: no s''ha pogut blocar el pid  %u. Aquest procés no existeix
');
INSERT INTO potranslation (id, translation) VALUES (93, 'Error: no s''ha pogut crear un blocatge del pid del fitxer %s: %s
');
INSERT INTO potranslation (id, translation) VALUES (94, 'Error: no s''ha pogut remoure el blocatge del pid del fitxer %s: %s
');
INSERT INTO potranslation (id, translation) VALUES (95, 'Error: do_unlock: no s''ha pogut remoure el blocatge del directori');
INSERT INTO potranslation (id, translation) VALUES (96, 'Error: aquest programa necessita ser instal·lar amb suid de super-usuari
');
INSERT INTO potranslation (id, translation) VALUES (97, 'error intern: getopt_long() ha retornat un valor desconegut
');
INSERT INTO potranslation (id, translation) VALUES (98, 'Avís: el dispositiu %s ja és gestionat per /etc/fstab, s''ignorarà l''etiqueta donada
');
INSERT INTO potranslation (id, translation) VALUES (99, 'Error: no s''ha pogut determinar el camí real del dispositiu');
INSERT INTO potranslation (id, translation) VALUES (100, 'Error: dispositiu %s invàlid (ha d''estar a /dev/)
');
INSERT INTO potranslation (id, translation) VALUES (101, 'Error: no s''ha pogut eliminar el punt de muntatge');
INSERT INTO potranslation (id, translation) VALUES (102, 'error intern: el mode %i no s''ha gestionat.
');
INSERT INTO potranslation (id, translation) VALUES (103, 'pmount-hal - executa pmount amb informació addicional de hal

Ús: pmount-hal <UDI de hal> [opcions de pmount]

Aquesta comanda monta el dispositiu descrit per l''UDI donat utilitzant
pmount. El tipus de sistema de fitxers, la política d''emmagatzematge del
volum i l''etiqueta desitjada es llegiran de hal i es passaran a pmount.');
INSERT INTO potranslation (id, translation) VALUES (104, 'Error: no s''ha pogut executar pmount
');
INSERT INTO potranslation (id, translation) VALUES (105, 'Error, no es pot obrir el directori');
INSERT INTO potranslation (id, translation) VALUES (106, 'Error: l''UDI donat no existeix
');
INSERT INTO potranslation (id, translation) VALUES (107, 'Error: l''UDI donat no és un volum montable
');
INSERT INTO potranslation (id, translation) VALUES (108, 'Error: no s''ha pogut aconseguir l''estat del dispositiu');
INSERT INTO potranslation (id, translation) VALUES (109, 'Error: no s''ha pogut aconseguir el directori sysfs
');
INSERT INTO potranslation (id, translation) VALUES (110, 'Error: no s''ha pogut obrir <sysfs dir>/block/');
INSERT INTO potranslation (id, translation) VALUES (111, 'Error: no s''ha pogut obrir <sysfs dir>/block/<dispsitiu>/');
INSERT INTO potranslation (id, translation) VALUES (112, 'Error: el dispositiu %s no existeix
');
INSERT INTO potranslation (id, translation) VALUES (113, 'Error: %s no és un dispositiu de blocs
');
INSERT INTO potranslation (id, translation) VALUES (114, 'Error: no s''ha pogut obrir el fitxer de tipus fstab');
INSERT INTO potranslation (id, translation) VALUES (115, 'Error: el dispositiu %s ja està montat a %s
');
INSERT INTO potranslation (id, translation) VALUES (116, 'Error: el dispositiu %s no està montat
');
INSERT INTO potranslation (id, translation) VALUES (117, 'Error: el dispositiu %s no ha estat montat per tu
');
INSERT INTO potranslation (id, translation) VALUES (118, 'Error: el dispositiu %s no es pot remoure
');
INSERT INTO potranslation (id, translation) VALUES (119, 'Error: el dispositiu %s està blocat
');
INSERT INTO potranslation (id, translation) VALUES (120, 'Error: el directori %s ja conté un sistema de fitxers montat
');
INSERT INTO potranslation (id, translation) VALUES (121, 'Error: el directori %s no conté un sistema de fitxers montat
');
INSERT INTO potranslation (id, translation) VALUES (122, 'Ús:

%s [opcions] <dispositiu>
  Umount <dispositiu> des d''un directori sota %s si es compleixen els
  requeriments (vegeu pumount(1) per més detalls). El directori del punt de montatge
  s''elimina després

Opcions:
  -l, --lazy : umount mandrosament, vegeu umount(8)
  -d, --debug : habilita la sortida de depuració (molt detalladament)
  -h, --help : imprimeix el missatge d''ajuda i surt exitosament
');
INSERT INTO potranslation (id, translation) VALUES (123, 'Error intern: no s''ha pogut determinar el punt de montatge
');
INSERT INTO potranslation (id, translation) VALUES (124, 'Error: el punt de montatge %s no és a sota %s
');
INSERT INTO potranslation (id, translation) VALUES (125, 'Error: no s''ha pogut executar umount');
INSERT INTO potranslation (id, translation) VALUES (126, 'Error no s''ha pogut esperar els processos d''umount executats');
INSERT INTO potranslation (id, translation) VALUES (127, 'Error: ha fallat umount
');
INSERT INTO potranslation (id, translation) VALUES (128, 'Error: fora de memòria
');
INSERT INTO potranslation (id, translation) VALUES (129, 'Error: no es pot crear el directori');
INSERT INTO potranslation (id, translation) VALUES (130, 'Error: no es pot crear fitxer de marca al directori');
INSERT INTO potranslation (id, translation) VALUES (131, 'Error: %s no és un directori
');
INSERT INTO potranslation (id, translation) VALUES (132, 'Error: el directori %s no és buit
');
INSERT INTO potranslation (id, translation) VALUES (133, 'Error: ''%s'' no és un número vàlid
');
INSERT INTO potranslation (id, translation) VALUES (134, 'Error intern: no s''ha pogut canviar a uid de superusuari efectiva');
INSERT INTO potranslation (id, translation) VALUES (135, 'Error intern: no s''ha pogut canviar uid d''usuari efectiva a identificació d''usuari real');
INSERT INTO potranslation (id, translation) VALUES (136, 'Error intern: no s''ha pogut canviar a gid superusuari efectiu');
INSERT INTO potranslation (id, translation) VALUES (137, 'Error intern: no s''ha pogut canviar l''identificació de grup efectiva a una identificació real de grup');
INSERT INTO potranslation (id, translation) VALUES (138, 'Bruk:

%s [valg] <enhet> [<etikett>]

  Monter <enhet> til en katalog under %s hvis krav er tilfredsstilt
  (se pmount(1) for mer). Hvis <etikett> er oppgitt, vil
  monteringspunktet bli %s/<etikett>, ellers vil det bli
  %s/<enhet>. Hvis monteringspunktet ikke finnes, vil det 
  bli opprettet.

');
INSERT INTO potranslation (id, translation) VALUES (139, '%s --lock <enhet> <pid>
  Forhindrer videre pmount-monteringer av <enhet> helt til den
  blir låst opp igjen. <pid> er hvilken prosess id låsen holdes
  for. Dette gjør det mulig å låse en enhet av flere uavhengige
  prosesser, og unngår uendelig låsing av krasjede prosesser
  (pids som ikke finnes blir ryddet før forsøk på en montering).
');
INSERT INTO potranslation (id, translation) VALUES (140, '%s --unlock <enhet> <pid>
  Fjerner låsen på <enhet> for prosess <pid>.

');
INSERT INTO potranslation (id, translation) VALUES (141, 'Valg:
  -a, --async : monterer <enhet> med «async»-valget (standard: «sync»)
  --noatime : monterer <enhet> med «noatime»-valget (standard: «atime»)
  -e, --exec : monterer <enhet> med «exec»-valget (standard: «noexec»)
  -t <fs> : monterer som filsystemtype <fs> (standard: velger automatisk)
  -c <tegnsett> : bruk gitt I/O-tegnsett (standard: utf8 i
                 UTF-8-locale, ellers monteringsstandard)
  -d, --debug : skriv debuginformasjon (veldig mye)
  -h, --help : skriv hjelpemelding og avslutt med suksess');
INSERT INTO potranslation (id, translation) VALUES (142, 'Feil: make_mountpoint_name: ugyldig enhet %s (må finnes i /dev/)
');
INSERT INTO potranslation (id, translation) VALUES (143, 'Feil: etiketten kan ikke være blank
');
INSERT INTO potranslation (id, translation) VALUES (144, 'Feil: Etiketten er for lang
');
INSERT INTO potranslation (id, translation) VALUES (145, 'Feil: Etiketter kan ikke inneholde «/»
');
INSERT INTO potranslation (id, translation) VALUES (146, 'Feil: Navnet på enheten er for langt
');
INSERT INTO potranslation (id, translation) VALUES (147, 'Feil: Kunne ikke fjerne alle uid-rettigheter');
INSERT INTO potranslation (id, translation) VALUES (148, 'Feil: Kunne ikke kjøre mount');
INSERT INTO potranslation (id, translation) VALUES (149, 'Intern feil: mount_attempt: Filsystemnavnet er NULL
');
INSERT INTO potranslation (id, translation) VALUES (150, 'Feil: Ugyldig filsystemnavn «%s»
');
INSERT INTO potranslation (id, translation) VALUES (151, 'Feil: Ugyldig tegnsettnavn «%s»
');
INSERT INTO potranslation (id, translation) VALUES (152, 'Feil: Kunne ikke øke til fullstendige root-uid-rettigheter');
INSERT INTO potranslation (id, translation) VALUES (153, 'Feil: Kunne ikke vente på startet mounting');
INSERT INTO potranslation (id, translation) VALUES (154, 'Feil: Kan ikke låse for %u, siden denne prosessen ikke finnes
');
INSERT INTO potranslation (id, translation) VALUES (155, 'Feil: Kunne ikke opprette pid-låsfil %s: %s
');
INSERT INTO potranslation (id, translation) VALUES (156, 'Feil: Kunne ikke fjerne pid-låsfil %s: %s
');
INSERT INTO potranslation (id, translation) VALUES (157, 'Feil: du_unlock: Kunne ikke fjerne låskatalog');
INSERT INTO potranslation (id, translation) VALUES (158, 'Feil: Dette programmet må være installert suid root
');
INSERT INTO potranslation (id, translation) VALUES (159, 'Intern feil: getopt_long() returnerte ukjent verdi
');
INSERT INTO potranslation (id, translation) VALUES (160, 'Advarsel: Enheten «%s» håndteres allerede i /etc/fstab, ny etikett blir ignorert
');
INSERT INTO potranslation (id, translation) VALUES (161, 'Feil: Kunne ikke bestemme den ordentlige stien for denne enheten');
INSERT INTO potranslation (id, translation) VALUES (162, 'Feil: Ugyldig enhet %s (må være i /dev/)
');
INSERT INTO potranslation (id, translation) VALUES (163, 'Feil: Kunne ikke slette monteringspunkt');
INSERT INTO potranslation (id, translation) VALUES (164, 'Intern feil: modus %i er blir ikke håndtert.
');
INSERT INTO potranslation (id, translation) VALUES (165, 'pmount-hal - kjør pmount med tilleggsinformasjon fra hal

Bruk: pmount-hal <hal UDI> [pmount-valg]

Denne kommandoen monterer enheten beskrevet av den oppgitte UDI-en ved bruk av «pmount». Filsystemtypen, volumlagringspolitikk og ønsket etikett vil bli lest ut fra «hal» og gitt til «pmount».');
INSERT INTO potranslation (id, translation) VALUES (166, 'Feil: Kunne ikke kjøre pmount
');
INSERT INTO potranslation (id, translation) VALUES (167, 'Feil: Kunne ikke koble til hal
');
INSERT INTO potranslation (id, translation) VALUES (168, 'Feil: Oppgitt UDI finnes ikke
');
INSERT INTO potranslation (id, translation) VALUES (169, 'Feil: Oppgitt UDI er ikke en monterbar enhet
');
INSERT INTO potranslation (id, translation) VALUES (170, 'Feil: Kunne ikke få status fra enhet');
INSERT INTO potranslation (id, translation) VALUES (171, 'Feil: Kunne ikke hente sysfs-katalog
');
INSERT INTO potranslation (id, translation) VALUES (172, 'Feil: Kunne ikke åpne <sysfs-katalog>/block/');
INSERT INTO potranslation (id, translation) VALUES (173, 'Feil: Kunne ikke åpne <sysfs-kat>/block/<enhet>/');
INSERT INTO potranslation (id, translation) VALUES (174, 'Feil: Enhet %s finnes ikke
');
INSERT INTO potranslation (id, translation) VALUES (175, 'Feil: %s er ikke en blokkenhet
');
INSERT INTO potranslation (id, translation) VALUES (176, 'Feil: Kunne ikke åpne fstab-fil');
INSERT INTO potranslation (id, translation) VALUES (177, 'Feil: Enheten «%s» er allerede montert på «%s»
');
INSERT INTO potranslation (id, translation) VALUES (178, 'Feil: Enheten «%s» er ikke montert
');
INSERT INTO potranslation (id, translation) VALUES (179, 'Feil: Enheten %s ble ikke montert av deg
');
INSERT INTO potranslation (id, translation) VALUES (180, 'Feil: Enheten «%s» kan ikke fjernes
');
INSERT INTO potranslation (id, translation) VALUES (181, 'Feil: Enheten «%s» er låst
');
INSERT INTO potranslation (id, translation) VALUES (182, 'Feil: Katalogen «%s» inneholder allerede et montert filsystem
');
INSERT INTO potranslation (id, translation) VALUES (183, 'Feil: Katalogen «%s» inneholder ikke et montert filsystem
');
INSERT INTO potranslation (id, translation) VALUES (184, 'Bruk

%s [valg] <enhet>
  Avmonter <enhet> fra en katalog under %s hvis krav er
  tilfredsstilt (se pumount(1) for mer). Monteringspunktkatalogen
  blir fjernet etterpå.

Valg:
  -l, --lazy : lat umount, se umount(8)
  -d, --debug :  skriv debuginformasjon (veldig mye)
  -h, --help : skriv hjelpemelding og avslutt med suksess
');
INSERT INTO potranslation (id, translation) VALUES (185, 'Intern feil: Kunne ikke bestemme monteringspunkt
');
INSERT INTO potranslation (id, translation) VALUES (186, 'Feil: Monteringspunktet «%s» er ikke under «%s»
');
INSERT INTO potranslation (id, translation) VALUES (187, 'Feil: Kunne ikke kjøre umount');
INSERT INTO potranslation (id, translation) VALUES (188, 'Feil: Kunne ikke vente på startet avmonteringsprosess');
INSERT INTO potranslation (id, translation) VALUES (189, 'Feil: Avmontering feilet
');
INSERT INTO potranslation (id, translation) VALUES (190, 'Feil: Ikke mer minne
');
INSERT INTO potranslation (id, translation) VALUES (191, 'Feil: Kunne ikke opprette katalog');
INSERT INTO potranslation (id, translation) VALUES (192, 'Feil: Kunne ikke opprette stempelfil i katalog');
INSERT INTO potranslation (id, translation) VALUES (193, 'Feil. «%s» er ikke en katalog
');
INSERT INTO potranslation (id, translation) VALUES (194, 'Feil: Kunne ikke åpne katalog');
INSERT INTO potranslation (id, translation) VALUES (195, 'Feil: Katalogen «%s» er ikke tom
');
INSERT INTO potranslation (id, translation) VALUES (196, 'Feil: «%s» er ikke et gyldig tall
');
INSERT INTO potranslation (id, translation) VALUES (197, 'Intern feil: Kunne ikke endre til effektiv uid root');
INSERT INTO potranslation (id, translation) VALUES (198, 'Intern feil: kunne ikke endre effektiv bruker-uid til ekte bruker-id');
INSERT INTO potranslation (id, translation) VALUES (199, 'Intern feil: Kunne ikke endre til effektiv gid root');
INSERT INTO potranslation (id, translation) VALUES (200, 'Intern feil: Kunne ikke endre effektiv gruppe-id til ekte grouppe-id');
INSERT INTO potranslation (id, translation) VALUES (612, 'Debiano mozilla įkels /etc/mozilla/prefs.js parinktis po to, kai bus įkeltos kai kurios pagal nutylėjimą numatytos parinktys.');
INSERT INTO potranslation (id, translation) VALUES (614, 'auto, esddsp, artsdsp, joks');
INSERT INTO potranslation (id, translation) VALUES (201, 'Použití:

%s [volby]<zařízení>[<jméno>]

  Připojí <zařízení> do adresáře na %s jestliže má oprávnění
  (podívej do pmount(1) na podrobnosti). Jestliže je <jméno>
  zadáno,   připojovací bod bude %s/<jméno>, jinak to bude%s
  <zařízení>. Jestliže připojovací bod neexistuje, 
  bude vytvořen.
');
INSERT INTO potranslation (id, translation) VALUES (202, '%s --lock <zařízení><pid>
  Zabrání příštím pmounts <zařízení> dokud není znovu odemčeno.
  <pid> specifikuje id uzamykajícího procesu. To umožňuje zamknout
  zařízení několika nezávislými procesy a zabrání nekonečnému
  uzamčení havarovanými procesy (neexistující pid jsou smazány
  před mount)
');
INSERT INTO potranslation (id, translation) VALUES (203, '%s --unlock <device> <pid>
  Odstranit znovu zámek na <device> pro proces <pid>.

');
INSERT INTO potranslation (id, translation) VALUES (204, 'Volby:
  -a, --async : připojit <zařízení> s volbou ''async'' (výchozí je:''sync'')
  --noatime : připojit <zařízení> s volbou ''noatime'' (výchozí je:''atime'')
  -e, --exec : připojit <zařízení> s volbou ''exec'' (výchozí je: ''noexec'')
  -t <fs> : připojit jako souborový systém <fs> (výchozí: autodetected)
  -c <charset>: použít danou znakovou sadu (výchozí: ''utf8'' jestliže je
                v nějakém lokálním UTF-8 , jinak výchozí pro mount)
  -d, --debug : povolit ladící výstupy (mnoho hlášek)
  -h, --help : vypíše nápovědu a ukončí se ');
INSERT INTO potranslation (id, translation) VALUES (205, 'Chyba: make_mount_name: neplatné zařízení %s (musí být v /dev/)
');
INSERT INTO potranslation (id, translation) VALUES (206, 'Chyba: jméno nesmí být prázdné
');
INSERT INTO potranslation (id, translation) VALUES (207, 'Chyba: Příliš dlouhé jméno
');
INSERT INTO potranslation (id, translation) VALUES (208, 'Chyba:''/'' se nesmí vyskytovat ve jméně
');
INSERT INTO potranslation (id, translation) VALUES (209, 'Chyba: příliš dlouhé jméno zařízení
');
INSERT INTO potranslation (id, translation) VALUES (210, 'Chyba: nelze zapsat všechna uid oprávnění');
INSERT INTO potranslation (id, translation) VALUES (211, 'Chyba: nelze spustit mount');
INSERT INTO potranslation (id, translation) VALUES (212, 'Vnitřní chyba: mount_attempmt: předané jméno souboru je NULL
');
INSERT INTO potranslation (id, translation) VALUES (213, 'Chyba: špatné jméno souborového systému ''%s''
');
INSERT INTO potranslation (id, translation) VALUES (214, 'Chyba: špatné jméno znakové sady ''%s''
');
INSERT INTO potranslation (id, translation) VALUES (215, 'Chyba: nelze získat plná práva superuživatele');
INSERT INTO potranslation (id, translation) VALUES (216, 'Chyba: nelze čekat na spuštěný proces připojení');
INSERT INTO potranslation (id, translation) VALUES (217, 'Chyba: nelze zamknout pro pid %u, tento proces neexistuje
');
INSERT INTO potranslation (id, translation) VALUES (218, 'Chyba: nelze vytvořit pid zamykací soubor %s:%s
');
INSERT INTO potranslation (id, translation) VALUES (219, 'Chyba: nelze odstranit pid zamykací soubor %s: %s
');
INSERT INTO potranslation (id, translation) VALUES (220, 'Chyba: do_unlock: nelze odstranit uzamčení adresáře');
INSERT INTO potranslation (id, translation) VALUES (221, 'Chyba: tento program je potřeba instalovat jako root
');
INSERT INTO potranslation (id, translation) VALUES (222, 'Vnitřní chyba: getopt_long() vrátil neznámou hodnotu
');
INSERT INTO potranslation (id, translation) VALUES (223, 'Varování: zařízení %s je již řízeno s /etc/fstab, dodané jméno bude ignorováno
');
INSERT INTO potranslation (id, translation) VALUES (224, 'Chyba: nelze určit opravdovou cestu k zařízení');
INSERT INTO potranslation (id, translation) VALUES (225, 'Chyba: neplatné zařízení %s (musí být v /dev/)
');
INSERT INTO potranslation (id, translation) VALUES (226, 'Chyba: nelze smazat bod připojení');
INSERT INTO potranslation (id, translation) VALUES (227, 'Vnitřní chyba: mód %i není obsluhován.
');
INSERT INTO potranslation (id, translation) VALUES (228, 'pmount-hal - spusit pmount s přídavnými informacemi z halu

Užití: pmount-hal <hal UDI> [pmount volby]

Tento příkaz připojí zařízení popsané daným UDI používající pmount. Systém souborů, chování diskové jednotky and požadovaný název budou
přečteny z halu a zaslány pmountu.');
INSERT INTO potranslation (id, translation) VALUES (229, 'Chyba: nelze spusit pmount
');
INSERT INTO potranslation (id, translation) VALUES (230, 'Chyba: nelze se připojit na hal
');
INSERT INTO potranslation (id, translation) VALUES (231, 'Chyba: dané UDI neexistuje
');
INSERT INTO potranslation (id, translation) VALUES (232, 'Chyba: dané UDI neni připojitelné zařízení
');
INSERT INTO potranslation (id, translation) VALUES (233, 'Chyba: nelze zjistit stav zařízení');
INSERT INTO potranslation (id, translation) VALUES (234, 'Chyba: nelze získat sysfs adresář
');
INSERT INTO potranslation (id, translation) VALUES (235, 'Chyba: nelze otevřít <sysfs adresář>/block/');
INSERT INTO potranslation (id, translation) VALUES (236, 'Chyba: nelze otevřít <sysfs adresář>/block/<device>/');
INSERT INTO potranslation (id, translation) VALUES (237, 'Chyba: zařízení %s neexistuje
');
INSERT INTO potranslation (id, translation) VALUES (238, 'Chyba: %s není blokové zařízení
');
INSERT INTO potranslation (id, translation) VALUES (239, 'Chyba: nelze otevřít soubor fstab-type');
INSERT INTO potranslation (id, translation) VALUES (240, 'Chyba: zařízení %s je jíž připojeno na %s
');
INSERT INTO potranslation (id, translation) VALUES (241, 'Chyba: zařízení %s není připojeno
');
INSERT INTO potranslation (id, translation) VALUES (242, 'Chyba: zařízení %s nepřipojils ty
');
INSERT INTO potranslation (id, translation) VALUES (243, 'Chyba: zařízení %s není vyjímatelné
');
INSERT INTO potranslation (id, translation) VALUES (244, 'Chyba: zařízení %s je zamčeno
');
INSERT INTO potranslation (id, translation) VALUES (245, 'Chyba: adresář %s již obsahuje připojený souborový systém
');
INSERT INTO potranslation (id, translation) VALUES (246, 'Chyba: adresář %s neobsahuje připojený souborový systém
');
INSERT INTO potranslation (id, translation) VALUES (247, 'Použití:

%s [parametry] <zařízení>
  Odpojenit <zařízení> z adresáře pod %s jestliže 
  jsou nastavená požadovná práva (podrobnosti viz pumount(1)). 
  Adresář připojovacího bodu je poté odstraněn.

Parametry:
  -l, --lazy : odpojit líně, viz umount(8)
  -d, --debug : povolit ladící výstupy (velmi ukecané)
  -h, --help : vytiskne nápovědu a ukončí se
');
INSERT INTO potranslation (id, translation) VALUES (248, 'Vnitřní chyba: nelze určit bod připojení
');
INSERT INTO potranslation (id, translation) VALUES (249, 'Chyba: připojovací bod %s není pod %s
');
INSERT INTO potranslation (id, translation) VALUES (250, 'Chyba: nelze spustit umount');
INSERT INTO potranslation (id, translation) VALUES (251, 'Chyba: nelze čekat na spuštěný proces umount ');
INSERT INTO potranslation (id, translation) VALUES (252, 'Chyba: umount selhal
');
INSERT INTO potranslation (id, translation) VALUES (253, 'Chyba: nedostatek paměti
');
INSERT INTO potranslation (id, translation) VALUES (254, 'Chyba: nelze vytvořit adresář');
INSERT INTO potranslation (id, translation) VALUES (255, 'Chyba: nelze vytvořit soubor razítka v adresáři');
INSERT INTO potranslation (id, translation) VALUES (256, 'Chyba: %s není adresář
');
INSERT INTO potranslation (id, translation) VALUES (257, 'Chyba: nelze otevřít adresář');
INSERT INTO potranslation (id, translation) VALUES (258, 'Chyba: adresář %s není prázdný
');
INSERT INTO potranslation (id, translation) VALUES (259, 'Chyba: ''%s'' není platné číslo
');
INSERT INTO potranslation (id, translation) VALUES (260, 'Vnitřní chyba: nelze změnit úspěšně na uid roota');
INSERT INTO potranslation (id, translation) VALUES (261, 'Vnitřní chyba: nelze změnit skutečné uživatelské id na pravé uživatelské id');
INSERT INTO potranslation (id, translation) VALUES (262, 'Vnitřní chyba: nelze změnit na skutečné gid roota');
INSERT INTO potranslation (id, translation) VALUES (263, 'Vnitřní chyba: nelze změnit id skutečné skupiny na id pravé skupiny');
INSERT INTO potranslation (id, translation) VALUES (264, 'Uso:

%s [opciones] <dispositivo> [<etiqueta>]

  Monta el <dispositivo> en un directorio bajo %s si se cumplen los
  requisitos de seguridad (ver detalles en pmount(1)). Si se pone
  <etiqueta>, el punto de montaje será %s/<etiqueta>, si no, será
  %s<dispositivo>. Si el punto de montaje no existe, se creará.
');
INSERT INTO potranslation (id, translation) VALUES (613, 'Jūs galite keisti šį failą, nustatymams sistemos mastu (pvz. šriftų nustatymams)');
INSERT INTO potranslation (id, translation) VALUES (265, '%s --lock <dispositivo> <pid>↵
  Previene posteriores montajes del <dispositivo> hasta que se desbloquee.
  <pid> especifica el id del proceso que pone el bloqueo. Esto permite
  bloquear un dispositivo a varios procesos independendientes evitando
  bloqueos indefinidos por procesos caídos (los pids inexistentes se
  limpian antes de intentar un montaje).
');
INSERT INTO potranslation (id, translation) VALUES (266, '%s --unlock <dispositivo> <pid>
  Quita el bloqueo del proceso <pid> al <dispositivo>.
');
INSERT INTO potranslation (id, translation) VALUES (267, 'Opciones:
  -a, --async : montar <dispositivo> con la opción ''async'' (por defecto: ''sync'')
  --noatime   : montar <dispositivo> con la opción ''noatime'' (por defecto: ''atime'')
  -e, --exec  : montar <dispositivo> con la opción ''exec'' (por defecto: ''noexec'')
  -t <fs>     : montar como sistema de ficheros tipo <fs> (por defecto: autodetectado)
  -c <charset>: usar el juego de caracteres E/S dado (por defecto: ''utf8'' si se llama
                en un local UTF-8, si no, el defecto de montaje)
  -d, --debug : habilita salida de depuración (muy verbosa)
  -h, --help  : escribir mensaje de ayuda y salir');
INSERT INTO potranslation (id, translation) VALUES (268, 'Error: make_mountpoint_name: el dispositivo %s no es válido (ha de estar en /dev/)
');
INSERT INTO potranslation (id, translation) VALUES (269, 'Error: la etiqueta no puede estar vacia
');
INSERT INTO potranslation (id, translation) VALUES (270, 'Error: etiqueta es demasiado larga
');
INSERT INTO potranslation (id, translation) VALUES (271, 'Error: no se puede poner ''/'' en el nombre de la etiqueta
');
INSERT INTO potranslation (id, translation) VALUES (272, 'Error: el nombre de dispositivo es demasiado largo
');
INSERT INTO potranslation (id, translation) VALUES (273, 'Error: no se han podido soltar todos los privilegios de uid');
INSERT INTO potranslation (id, translation) VALUES (274, 'Error: no se ha podido ejecutar el montaje');
INSERT INTO potranslation (id, translation) VALUES (275, 'Error interno: mount_attempt: el nombre del sistema de archivos dado es NULO
');
INSERT INTO potranslation (id, translation) VALUES (276, 'Error: el nombre del sistema de ficheros ''%s'' no es válido
');
INSERT INTO potranslation (id, translation) VALUES (277, 'Error: el nombre del juego de caracteres ''%s'' no es válido
');
INSERT INTO potranslation (id, translation) VALUES (278, 'Error: no se han podido alcanzar privilegios de uid root completos');
INSERT INTO potranslation (id, translation) VALUES (279, 'Error: no se ha podido esperar a que se ejecutara el proceso de montaje');
INSERT INTO potranslation (id, translation) VALUES (280, 'Error: no se puede bloquear para el pid %u, este proceso no existe
');
INSERT INTO potranslation (id, translation) VALUES (281, 'Error: no se ha podido crear el fichero de bloqueo del pid %s: %s
');
INSERT INTO potranslation (id, translation) VALUES (282, 'Error: no se ha podido eliminar el fichero de bloqueo del pid %s: %s
');
INSERT INTO potranslation (id, translation) VALUES (283, 'Error: do_unlock: no se ha podido eliminar el directorio de bloqueo');
INSERT INTO potranslation (id, translation) VALUES (284, 'Error este programa necesita ser instalado como super usuario (root)
');
INSERT INTO potranslation (id, translation) VALUES (285, 'Error interno: getopt_long() ha devuelto un valor desconocido
');
INSERT INTO potranslation (id, translation) VALUES (286, 'Aviso: el dispositivo %s ya se gestiona en /etc/fstab, la etiqueta proporcionada será ignorada
');
INSERT INTO potranslation (id, translation) VALUES (287, 'Error: no se ha podido determinar la ruta real del dispositivo');
INSERT INTO potranslation (id, translation) VALUES (288, 'Error: el dispositivo %s no vale (ha de estar en /dev/)
');
INSERT INTO potranslation (id, translation) VALUES (289, 'Error: no se ha podido borrar el punto de montaje');
INSERT INTO potranslation (id, translation) VALUES (290, 'Error interno: %i es un modo no gestionado.
');
INSERT INTO potranslation (id, translation) VALUES (291, 'pmount-hal - ejecutar pmount con información adicional de hal

Uso: pmount-hal <UDI hal> [opciones de pmount]

Esta orden monta el dispositivo descrito por el UDI dado usando pmount. El
tipo de sistema de ficheros, la política de almacenamiento del volumen y la etiqueta deseada se 
leerán de hal y se pasarán a pmount.');
INSERT INTO potranslation (id, translation) VALUES (292, 'Error: no se pudo ejecutar pmount
');
INSERT INTO potranslation (id, translation) VALUES (293, 'Error: no se ha podido abrir el directorio
');
INSERT INTO potranslation (id, translation) VALUES (294, 'Error: el UDI introducido no existe
');
INSERT INTO potranslation (id, translation) VALUES (295, 'Error: el UDI introducido no es un volúmen montable
');
INSERT INTO potranslation (id, translation) VALUES (296, 'Error: no se ha podido hallar el estado del dispositivo');
INSERT INTO potranslation (id, translation) VALUES (297, 'Error: no se ha podido hallar el directorio sysfs
');
INSERT INTO potranslation (id, translation) VALUES (298, 'Error: no se ha podido abrir <sysfs dir>/bloque/');
INSERT INTO potranslation (id, translation) VALUES (299, 'Error: no se ha podido abrir <sysfs dir>/bloque/<dispositivo>/');
INSERT INTO potranslation (id, translation) VALUES (300, 'Error: el dispositivo %s no existe
');
INSERT INTO potranslation (id, translation) VALUES (301, 'Error: %s no es dispositivo de bloques
');
INSERT INTO potranslation (id, translation) VALUES (302, 'Error: un fichero de tipo fstab no se ha podido abrir');
INSERT INTO potranslation (id, translation) VALUES (303, 'Error: el dispositivo %s ya está montado en %s
');
INSERT INTO potranslation (id, translation) VALUES (304, 'Error: el dispositivo %s no está montado
');
INSERT INTO potranslation (id, translation) VALUES (305, 'Error: el dispositivo %s no lo ha montado usted
');
INSERT INTO potranslation (id, translation) VALUES (306, 'Error: el dispositivo %s no es enchufable
');
INSERT INTO potranslation (id, translation) VALUES (307, 'Error: el dispositivo %s está bloqueado
');
INSERT INTO potranslation (id, translation) VALUES (308, 'Error: el directorio %s ya tiene montado un sistema de ficheros
');
INSERT INTO potranslation (id, translation) VALUES (309, 'Error: el directorio %s no tiene montado ningún sistema de ficheros
');
INSERT INTO potranslation (id, translation) VALUES (310, 'Uso:

%s [opciones] <dispositivo>
  Desmontar <dispositivo> de directorio bajo %s si se cumplen los requisitos
  de seguridad (ver detalles en pumount(1)). Después se elimina el directorio
  del punto de montaje.

Opciones:
  -l, --lazy : desmontaje laxo, ver umount(8)
  -d, --debug : permitir salida de depuración (muy verbosa)
  -h, --help : escribir mensaje de ayuda y salir bien
');
INSERT INTO potranslation (id, translation) VALUES (311, 'Error interno: no se ha podido determinar el punto de montaje
');
INSERT INTO potranslation (id, translation) VALUES (312, 'Error: el punto de montaje %s no está bajo %s
');
INSERT INTO potranslation (id, translation) VALUES (313, 'Error: no se ha podido ejecutar el desmontaje');
INSERT INTO potranslation (id, translation) VALUES (314, 'Error: no se ha podido esperar a que se ejecutara el proceso de desmontaje');
INSERT INTO potranslation (id, translation) VALUES (315, 'Error: desmontaje fallido
');
INSERT INTO potranslation (id, translation) VALUES (316, 'Error: memoria agotada
');
INSERT INTO potranslation (id, translation) VALUES (317, 'Error: no se ha podido crear el directorio');
INSERT INTO potranslation (id, translation) VALUES (318, 'Error: no se ha podido crear el fichero de fecha en el directorio');
INSERT INTO potranslation (id, translation) VALUES (319, 'Error: %s no es un directorio
');
INSERT INTO potranslation (id, translation) VALUES (320, 'Error: no se ha podido abrir el directorio');
INSERT INTO potranslation (id, translation) VALUES (321, 'Error: el directorio %s no está vacío
');
INSERT INTO potranslation (id, translation) VALUES (322, 'Error: ''%s'' no es un número válido
');
INSERT INTO potranslation (id, translation) VALUES (323, 'Error interno: no se ha podido cambiar a un uid efectivo de root');
INSERT INTO potranslation (id, translation) VALUES (324, 'Error interno: no se ha podido cambiar del uid del usuario efectivo al id del usuario real');
INSERT INTO potranslation (id, translation) VALUES (325, 'Error interno: no se ha podido cambiar a un gid efectivo de root');
INSERT INTO potranslation (id, translation) VALUES (326, 'Error interno: no se ha podido cambiar del id de grupo efectivo al id de grupo real');
INSERT INTO potranslation (id, translation) VALUES (615, 'Pasirinkite Jūsų garso įrenginio demono dsp aplanką (wrapper).');
INSERT INTO potranslation (id, translation) VALUES (327, 'Aufruf:

%s [Optionen] <Gerät> [<Label>]

  Bindet <Gerät> unter ein Verzeichnis in %s ein wenn die 
  Richtlinien dies erlauben (siehe pmount(1) für Details).
  Wenn <Label> gegeben ist, wird als Bindungsverzeichnis
  %s<Label> verwendet, ansonsten %s<Gerät>.
  Wenn dieses Verzeichnis nicht existiert, wird es erstellt.

');
INSERT INTO potranslation (id, translation) VALUES (328, '%s --lock <Gerät> <pid>
  Sperrt weitere pmount-Aufrufe für <Gerät> bis es wieder entsperrt
  wird. <pid> gibt die ID des Prozesses an, der die Sperre hält.  Dies
  ermöglicht das Sperren eines Gerätes von mehreren unabhängigen
  Prozessen und vermeidet unendliche Sperren von abgestürzten
  Prozessen (Sperren von nichtexistierenden Prozessen werden gelöscht
  bevor eine Einbindung versucht wird).

');
INSERT INTO potranslation (id, translation) VALUES (329, '%s --unlock <Gerät> <pid>
  Hebt die Sperre auf <Gerät> durch den Prozess <pid> wieder auf.

');
INSERT INTO potranslation (id, translation) VALUES (330, 'Optionen:
  -a, --async : Binde <Gerät> mit der Option ''async'' ein (Default: ''sync'')
  --noatime   : Binde <Gerät> mit der Option ''noatime'' ein (Default: ''atime'')
  -e, --exec  : Binde <Gerät> mit der Option ''exec'' ein (Default: ''noexec'')
  -t <fs>     : Verwende Dateisystem <fs> (Default: automatisch)
  -c <charset>: Verwende angegebenen Zeichensatz (Default: ''utf8'' in
                einer UTF-8 Umgebung, ansonsten mount-Default)
  -d, --debug : Debug-Ausgaben aktivieren (gibt sehr viel aus)
  -h, --help  : Hilfetext anzeigen und erfolgreich beenden');
INSERT INTO potranslation (id, translation) VALUES (331, 'Fehler: make_mountpoint_name: Ungültiges Gerät %s (muss in /dev/ sein)
');
INSERT INTO potranslation (id, translation) VALUES (332, 'Fehler: Label darf nicht leer sein
');
INSERT INTO potranslation (id, translation) VALUES (333, 'Fehler: Label ist zu lang
');
INSERT INTO potranslation (id, translation) VALUES (334, 'Fehler: Label darf nicht das Zeichen ''/'' enthalten
');
INSERT INTO potranslation (id, translation) VALUES (335, 'Fehler: Gerätname zu lang
');
INSERT INTO potranslation (id, translation) VALUES (336, 'Fehler: konnte nicht alle User-ID Privilegien aufgeben');
INSERT INTO potranslation (id, translation) VALUES (337, 'Fehler: konnte mount nicht ausführen');
INSERT INTO potranslation (id, translation) VALUES (338, 'Interner Fehler: mount_attempt: gegebener Dateisystem-Name ist NULL
');
INSERT INTO potranslation (id, translation) VALUES (339, 'Fehler: Ungültiges Dateisystem ''%s''
');
INSERT INTO potranslation (id, translation) VALUES (340, 'Fehler: ungültiger Zeichensatzname ''%s''
');
INSERT INTO potranslation (id, translation) VALUES (341, 'Fehler: konnte nicht zu vollen root-UID-Privilegien wechseln');
INSERT INTO potranslation (id, translation) VALUES (342, 'Fehler: konnte nicht auf ausgeführten mount-Prozess warten');
INSERT INTO potranslation (id, translation) VALUES (343, 'Fehler: kann nicht für PID %u sperren, dieser Prozess existiert nicht
');
INSERT INTO potranslation (id, translation) VALUES (344, 'Fehler: konnte PID-Lock-Datei %s nicht anlegen: %s
');
INSERT INTO potranslation (id, translation) VALUES (345, 'Fehler: konnte PID-Lock-Datei %s nicht löschen: %s
');
INSERT INTO potranslation (id, translation) VALUES (346, 'Fehler: do_unlock: konnte Lock-Verzeichnis nicht entfernen');
INSERT INTO potranslation (id, translation) VALUES (347, 'Fehler: Dieses programm muss als setuid root installiert sein
');
INSERT INTO potranslation (id, translation) VALUES (348, 'Interner Fehler: getopt_long() lieferte unbekannten Wert zurück
');
INSERT INTO potranslation (id, translation) VALUES (349, 'Warnung: Gerät %s wird schon in /etc/fstab verwaltet, angegebenes Label wird ignoriert
');
INSERT INTO potranslation (id, translation) VALUES (350, 'Error: konnte echten Pfad des Gerätes nicht bestimmen');
INSERT INTO potranslation (id, translation) VALUES (351, 'Fehler: ungültiges Gerät %s (muss in /dev/ sein)
');
INSERT INTO potranslation (id, translation) VALUES (352, 'Fehler: konnte Mount-Verzeichnis nicht löschen');
INSERT INTO potranslation (id, translation) VALUES (353, 'Interner Fehler: Modus %i nicht behandelt.
');
INSERT INTO potranslation (id, translation) VALUES (354, 'pmount-hal - führt pmount mit zusätzlichen Informationen von HAL aus

Aufruf: pmount-hal <hal UDI> [zusätzliche pmount-Optionen]

Dieser Befehl bindet das durch den hal-UDI spezifierte Gerät mit 
pmount ein. Der Dateisystem-Typ, verschiedene Mount-Optionen und 
der bevorzugte Name werden von hal gelesen und pmount als Optionen 
überreicht.');
INSERT INTO potranslation (id, translation) VALUES (355, 'Fehler: konnte pmount nicht ausführen
');
INSERT INTO potranslation (id, translation) VALUES (356, 'Fehler: konnte nicht zu hal verbinden
');
INSERT INTO potranslation (id, translation) VALUES (357, 'Fehler: angegebene UDI existiert nicht
');
INSERT INTO potranslation (id, translation) VALUES (358, 'Fehler: angegebene UDI ist kein einbindbares Gerät
');
INSERT INTO potranslation (id, translation) VALUES (359, 'Fehler: Konnte Status des Gerätes nicht bestimmen');
INSERT INTO potranslation (id, translation) VALUES (360, 'Fehler: konnte sysfs-Verzeichnis nicht erfragen
');
INSERT INTO potranslation (id, translation) VALUES (361, 'Fehler: konnte Verzeichnis <sysfs>/block/ nicht öffnen');
INSERT INTO potranslation (id, translation) VALUES (362, 'Fehler: konnte Verzeichnis <sysfs>/block/<Gerät> nicht öffnen');
INSERT INTO potranslation (id, translation) VALUES (363, 'Fehler: Verzeichnis %s existiert nicht
');
INSERT INTO potranslation (id, translation) VALUES (364, 'Fehler: %s ist kein Block-Gerät
');
INSERT INTO potranslation (id, translation) VALUES (365, 'Fehler: konnte fstab-artige Datei nicht öffnen');
INSERT INTO potranslation (id, translation) VALUES (366, 'Fehler: Gerät %s ist schon in %s eingebunden
');
INSERT INTO potranslation (id, translation) VALUES (367, 'Fehler: Gerät %s ist nicht eingebunden
');
INSERT INTO potranslation (id, translation) VALUES (368, 'Fehler: Gerät %s wurde nicht von Ihnen eingebunden
');
INSERT INTO potranslation (id, translation) VALUES (369, 'Fehler: Gerät %s ist kein Wechseldatenträger
');
INSERT INTO potranslation (id, translation) VALUES (370, 'Fehler: Gerät %s ist gesperrt
');
INSERT INTO potranslation (id, translation) VALUES (371, 'Fehler: Verzeichnis %s enthält schon ein eingebundenes Dateisystem
');
INSERT INTO potranslation (id, translation) VALUES (372, 'Fehler: Verzeichnis %s enthält kein eingebundenes Dateisystem
');
INSERT INTO potranslation (id, translation) VALUES (373, 'Aufruf:

%s [Optionen] <Gerät>
  Löse Bindung von <Gerät> von einem Verzeichnis unter %s wenn die
  Richtlinien dies erlauben (siehe pumount(1) für Details). Das
  Bindungsverzeichnis wird danach gelöscht.

Optionen:
  -l, --lazy : "lazy" unmount, siehe umount(8)
  -d, --debug : Debug-Ausgaben aktivieren (gibt sehr viel aus)
  -h, --help  : Hilfetext anzeigen und erfolgreich beenden
');
INSERT INTO potranslation (id, translation) VALUES (374, 'Interner Fehler: Konnte Bindungsverzeichnis nicht bestimmen
');
INSERT INTO potranslation (id, translation) VALUES (375, 'Fehler: Bindungsverzeichnis %s ist nicht unter %s
');
INSERT INTO potranslation (id, translation) VALUES (376, 'Fehler: Konnte unmount nicht ausführen');
INSERT INTO potranslation (id, translation) VALUES (377, 'Fehler: Konnte nicht auf ausgeführten umount-Prozess warten');
INSERT INTO potranslation (id, translation) VALUES (378, 'Fehler: umount fehlgeschlagen
');
INSERT INTO potranslation (id, translation) VALUES (379, 'Fehler: Speicher voll
');
INSERT INTO potranslation (id, translation) VALUES (380, 'Fehler: konnte Verzeichnis nicht anlegen');
INSERT INTO potranslation (id, translation) VALUES (381, 'Fehler: konnte Markierungs-Datei in Verzeichnis nicht anlegen');
INSERT INTO potranslation (id, translation) VALUES (382, 'Fehler: %s ist kein Verzeichnis
');
INSERT INTO potranslation (id, translation) VALUES (383, 'Fehler: konnte Verzeichnis nicht öffnen');
INSERT INTO potranslation (id, translation) VALUES (384, 'Fehler: Verzeichnis %s ist nicht leer
');
INSERT INTO potranslation (id, translation) VALUES (385, 'Fehler: ''%s'' ist keine gültige Zahl
');
INSERT INTO potranslation (id, translation) VALUES (386, 'Interner Fehler: konnte nicht zur effektiven UID von root wechseln');
INSERT INTO potranslation (id, translation) VALUES (387, 'Interner Fehler: konnte effektive Benutzer-UID nicht zu realer Benutzer-UID wechseln');
INSERT INTO potranslation (id, translation) VALUES (388, 'Interner Fehler: konnte nicht zur effektiven GID von root wechseln');
INSERT INTO potranslation (id, translation) VALUES (389, 'Interner Fehler: konnte effektive Benutzer-GID nicht zu realer Benutzer-GID wechseln');
INSERT INTO potranslation (id, translation) VALUES (390, 'Usage:

%s [options] <périphérique> [<label>]

  Monte le <périphérique> sur un répertoire sous %s si les contraintes
  sont satisfaites (voir pmount(1)). Si <label> est précisé, le point
  de montage sera %s/<label>, autrement ce sera %s<périphérique>.
  Si le point de montage n''existe pas, il sera créé.

');
INSERT INTO potranslation (id, translation) VALUES (391, '%s --lock <périphérique> <pid>
  Empèche tout p-montage du <périphérique> jusqu''à ce qu''il
  soit déverrouillé. <pid> indique le numéro de processus pour
  lequel le verrou est pris. Ceci permet de verrouiller un
  périphérique pour plusieurs processus indépendants et évite
  de créer des verrouillage indéfinis pour des processus qui
  ont échoué (les pids inexistants sont nettoyés avant de
  tenter un montage).

');
INSERT INTO potranslation (id, translation) VALUES (392, '%s --unlock <périphérique> <pid>
  Retire le verrou sur le <périphérique> pour le processus <pid>.
');
INSERT INTO potranslation (id, translation) VALUES (393, 'Options:
  -a, --async : monte le <périphérique> avec l''option ''async'' (par défaut: ''sync'')
  -noatime : monte le <périphérique> avec l''option ''noatime'' (par défaut: ''atime'')
  -e, --exec : monte le <périphérique> avec l''option ''exec'' (par défaut: ''noexec'')
  -t <fs> : monte le système de fichier de type <fs> (par défaut: autodétecté)
  -c <charset>: utilise le jeu de caractères <charset> pour les Entrées/Sorties
                (par défaut: ''utf8'' si la locale est une locale UTF-8, autrement celui par défaut de mount)
  -d, --debug : active l''affichage de débogage (très verbeux)
  -h, --help : affiche ce message d''aide et terminer avec succès');
INSERT INTO potranslation (id, translation) VALUES (394, 'Erreur : make_mountpoint_name: périphérique invalide %s (il doit être dans /dev/)
');
INSERT INTO potranslation (id, translation) VALUES (395, 'Erreur : l''étiquette ne peut pas être vide
');
INSERT INTO potranslation (id, translation) VALUES (396, 'Erreur : label trop long
');
INSERT INTO potranslation (id, translation) VALUES (397, 'Erreur : ''/'' ne doit pas apparaitre dans un nom de label
');
INSERT INTO potranslation (id, translation) VALUES (398, 'Erreur : nom du périphérique trop long
');
INSERT INTO potranslation (id, translation) VALUES (399, 'Erreur : impossible de révoquer tous les privilèges');
INSERT INTO potranslation (id, translation) VALUES (400, 'Erreur : impossible d''exécuter mount');
INSERT INTO potranslation (id, translation) VALUES (401, 'Erreur interne : mount_attempt : le nom du système de fichiers est NULL
');
INSERT INTO potranslation (id, translation) VALUES (402, 'Erreur : nom de système de fichiers invalide ''%s''
');
INSERT INTO potranslation (id, translation) VALUES (403, 'Erreur : nom de jeu de caractères invalide ''%s''
');
INSERT INTO potranslation (id, translation) VALUES (404, 'Erreur : impossible d''obtenir les privilèges complets de l''uid root');
INSERT INTO potranslation (id, translation) VALUES (405, 'Erreur : impossible d''attendre pour exécuter les processus de montage');
INSERT INTO potranslation (id, translation) VALUES (406, 'Erreur : ne peut pas verrouiller pour le pid %u, ce processus n''existe pas
');
INSERT INTO potranslation (id, translation) VALUES (407, 'Erreur : ne peut créer le fichier de verrou de pid  %s: %s
');
INSERT INTO potranslation (id, translation) VALUES (408, 'Erreur : ne peut ôter le fichier de verrou pid %s:%s
');
INSERT INTO potranslation (id, translation) VALUES (409, 'Erreur : do_unlock: ne peut ôter le verrou du répertoire');
INSERT INTO potranslation (id, translation) VALUES (410, 'Erreur : ce programme a besoin d''être installé en suid root
');
INSERT INTO potranslation (id, translation) VALUES (411, 'Erreur interne : getopt_long() a retourné une valeur inconnue
');
INSERT INTO potranslation (id, translation) VALUES (412, 'Avertissement : le périphérique %s est déjà pris en charge par /etc/fstab, l''étiquette fournie est ignorée
');
INSERT INTO potranslation (id, translation) VALUES (413, 'Erreur : n''a pas pu déterminer le véritable chemin d''accès à ce périphérique');
INSERT INTO potranslation (id, translation) VALUES (414, 'Erreur : périphérique invalide %s (doit être dans /dev/)
');
INSERT INTO potranslation (id, translation) VALUES (415, 'Erreur : n''a pas pu détruire le point de montage');
INSERT INTO potranslation (id, translation) VALUES (416, 'Erreur interne : le mode %i n''est pas pris en charge.
');
INSERT INTO potranslation (id, translation) VALUES (417, 'pmount-hal - execute pmount avec les informations supplémentaires provenant du hal

Usage: pmount-hal <hal UDI> [options pmount]

Cette commande monte le périphérique décrit par l''UDI fourni en utilisant pmount. Le
type du système de fichiers, les contraintes de stockage du volume et l''étiquette désirée
seront extraites du hal et passés à pmount.');
INSERT INTO potranslation (id, translation) VALUES (418, 'Erreur: impossible d''exécuter pmount
');
INSERT INTO potranslation (id, translation) VALUES (419, 'Erreur : impossible de se connecter à hal
');
INSERT INTO potranslation (id, translation) VALUES (420, 'Erreur : l''UDI fourni n''existe pas
');
INSERT INTO potranslation (id, translation) VALUES (421, 'Erreur : L''UDI fourni n''est pas un volume montable
');
INSERT INTO potranslation (id, translation) VALUES (422, 'Erreur : n''a pas pu obtenir l''état du périphérique');
INSERT INTO potranslation (id, translation) VALUES (423, 'Erreur : n''a pas trouver le répertoire sysfs
');
INSERT INTO potranslation (id, translation) VALUES (424, 'Erreur : n''a pas pu ouvrir <sysfs dir>/block/');
INSERT INTO potranslation (id, translation) VALUES (425, 'Erreur : n''a pas pu ouvrir <sysfs dir>/block/<device>/');
INSERT INTO potranslation (id, translation) VALUES (426, 'Erreur : le périphérique %s n''existe pas
');
INSERT INTO potranslation (id, translation) VALUES (427, 'Erreur : %s n''est pas un périphérique de bloc
');
INSERT INTO potranslation (id, translation) VALUES (428, 'Erreur : n''a pas  pu ouvrir le fichier fstab-type');
INSERT INTO potranslation (id, translation) VALUES (429, 'Erreur : le périphérique %s est déja monté sur %s
');
INSERT INTO potranslation (id, translation) VALUES (430, 'Erreur : le périphérique %s n''est pas monté
');
INSERT INTO potranslation (id, translation) VALUES (431, 'Erreur : le périphérique %s n''a pas été monté par vous
');
INSERT INTO potranslation (id, translation) VALUES (432, 'Erreur : le périphérique %s n''est pas amovible');
INSERT INTO potranslation (id, translation) VALUES (433, 'Erreur : le périphérique %s est vérrouillé
');
INSERT INTO potranslation (id, translation) VALUES (434, 'Erreur : le répertoire %s contient déja un système de fichiers
');
INSERT INTO potranslation (id, translation) VALUES (435, 'Erreur : le répertoire %s ne contient pas de systême de fichiers monté
');
INSERT INTO potranslation (id, translation) VALUES (436, 'Utilisation :

%s [options] <périphérique>
  Démonte le <périphérique> du répertoire suivant %s si les droits sont
  satisfaient ( voir pumount(1) pour les détails). Le répertoire du
  point de montage est supprimé après l''opération.

Options:↵
  -l, --lazy : démontage paresseux, voir umount(8)
  -d, --debug : autorise l''affichage des messages de debug (très verbeux)
  -h, --help : affiche ce message d''aide et termine avec succès
');
INSERT INTO potranslation (id, translation) VALUES (437, 'Erreur interne : n''a pas pu déterminer le point de montage
');
INSERT INTO potranslation (id, translation) VALUES (438, 'Erreur : le point de montage %s n''est pas sous %s
');
INSERT INTO potranslation (id, translation) VALUES (439, 'Erreur : n''a pas pu exécuter umount');
INSERT INTO potranslation (id, translation) VALUES (440, 'Erreur : n''a pas pu attendre pour exécuter le processus de démontage');
INSERT INTO potranslation (id, translation) VALUES (441, 'Erreur : échec de umount
');
INSERT INTO potranslation (id, translation) VALUES (442, 'Erreur : plus de mémoire disponible
');
INSERT INTO potranslation (id, translation) VALUES (443, 'Erreur : n''a pas pu créer de répertoire');
INSERT INTO potranslation (id, translation) VALUES (444, 'Erreur : n''a pas pu créer un fichier estampillé dans le répertoire');
INSERT INTO potranslation (id, translation) VALUES (445, 'Erreur : %s n''est pas un répertoire
');
INSERT INTO potranslation (id, translation) VALUES (446, 'Erreur : ne peut pas ouvrir le répertoire');
INSERT INTO potranslation (id, translation) VALUES (447, 'Erreur : le répertoire %s n''est pas vide
');
INSERT INTO potranslation (id, translation) VALUES (448, 'Erreur : ''%s'' n''est pas un nombre valide
');
INSERT INTO potranslation (id, translation) VALUES (449, 'Erreur interne : n''a pas pu changer pour l''uid effectif de root ');
INSERT INTO potranslation (id, translation) VALUES (450, 'Erreur interne : n''a pas pu changer de l''uid effectif pour le véritable id de l''utilisateur');
INSERT INTO potranslation (id, translation) VALUES (451, 'Erreur interne : n''a pas pu changer pour le gid effectif de root');
INSERT INTO potranslation (id, translation) VALUES (452, 'Erreur interne : n''a pas pu changer de l''id effectif de groupe pour le véritable id du groupe');
INSERT INTO potranslation (id, translation) VALUES (453, 'Utilizzo:

%s [opzioni] <dispositivo> [<etichetta>]

  Monta il <dispositivo> in una directory sotto %s se i requisiti 
  sono rispettati (vedere pmount(1) per dettagli). Se è data <etichetta>,
  il punto di mount sarà %s/<etichetta>, altrimenti %s<dispositivo>.
  Se il punto di mount non esiste verrà creato.



  

');
INSERT INTO potranslation (id, translation) VALUES (454, '%s --lock <dispositivo> <pid>
  Impedisce ulteriori pmount di <dispositivo> finché questo non è sbloccato
  di nuovo. <pid> specifica l''id del processo che detiene il lock. Questo
  permette a diversi processi indipendenti di fare il lock ad un dispositivo
  ed evita lock illimitati da parte di processi andati in crash (id di processi
  non esistenti sono ripuliti prima di tentare un mount).
');
INSERT INTO potranslation (id, translation) VALUES (455, '%s --unlock <dispsitivo> <pid>
  Rimuove il lock sul <dispositivo> per il processo <pid>.

');
INSERT INTO potranslation (id, translation) VALUES (456, 'Opzioni:
  --a, --async: monta <dispositivo> con l''opzione ''async'' (predefinito: ''sync)
  --noatime: monta <dispositivo> con l''opzione ''noatime'' (predefinito: ''atime'')
  -e, --exec: monta <dispositivo> con l''opzione ''exec'' (predefinito: ''noexec'')
  -t <fs>: monta come un file system di tipo <fs> (predefinito: rilevato
           automaticamente)
  -c <charset>: usa il set di caratteri di I/O fornito (predefinito: ''utf8'' se
                invocato in una locale UTF-8, altrimenti il predefinito di mount)
  -d, --debug: abilita l''output di debug (molto prolisso)
  -h, --help: stampa il messaggio di aiuto ed esce con successo');
INSERT INTO potranslation (id, translation) VALUES (457, 'Errore: make_mountpoint_name: dispositivo %s non valido (deve essere in /dev/)
');
INSERT INTO potranslation (id, translation) VALUES (458, 'Errore: l''etichetta non deve essere vuota
');
INSERT INTO potranslation (id, translation) VALUES (459, 'Errore: etichetta troppo lunga
');
INSERT INTO potranslation (id, translation) VALUES (460, 'Errore: ''/'' non deve comparire nell''etichetta
');
INSERT INTO potranslation (id, translation) VALUES (461, 'Errore: nome del dispositivo troppo lungo
');
INSERT INTO potranslation (id, translation) VALUES (462, 'Errore: impossibile eseguire mount');
INSERT INTO potranslation (id, translation) VALUES (463, 'Errore interno: mount_attempt: il tipo di file system dato è NULL
');
INSERT INTO potranslation (id, translation) VALUES (464, 'Errore: file system ''%s'' non valido
');
INSERT INTO potranslation (id, translation) VALUES (465, 'Errore: set di caratteri ''%s'' non valido
');
INSERT INTO potranslation (id, translation) VALUES (466, 'Errore: impossibile fare il lock per il pid %u, il processo non esiste
');
INSERT INTO potranslation (id, translation) VALUES (467, 'Errore: questo programma deve essere installato con i permessi di root
');
INSERT INTO potranslation (id, translation) VALUES (468, 'Errore interno: getopt_long() ha restituito un valore sconosciuto
');
INSERT INTO potranslation (id, translation) VALUES (469, 'Attenzione: il dispositivo %s è già gestito da /etc/fstab,
l''etichetta fornita verrà ignorata
');
INSERT INTO potranslation (id, translation) VALUES (470, 'Errore: impossibile determinare il percorso effettivo del dispositivo');
INSERT INTO potranslation (id, translation) VALUES (471, 'Errore: dispositivo %s non valido (deve trovarsi in /dev)
');
INSERT INTO potranslation (id, translation) VALUES (472, 'Errore: impossibile cancellare il punto di mount');
INSERT INTO potranslation (id, translation) VALUES (473, 'pmount-hal - esegue pmount con informazioni aggiuntive provenienti da hal

Utilizzo: pmount-hal <hal UDI> [opzioni di pmount]

Questo comando monta il dispositivo descritto dallo UDI fornito utilizzando
pmount. Il tipo di file system, la politica di memorizzazione del volume e
l''etichetta richiesta saranno estratti da hal e passati a pmount.');
INSERT INTO potranslation (id, translation) VALUES (474, 'Errore: impossibile eseguire pmount
');
INSERT INTO potranslation (id, translation) VALUES (475, 'Errore: impossibile eseguire la connessione ad hal
');
INSERT INTO potranslation (id, translation) VALUES (476, 'Errore: lo UDI fornito non esiste
');
INSERT INTO potranslation (id, translation) VALUES (477, 'Errore: lo UDI fornito non è un volume montabile
');
INSERT INTO potranslation (id, translation) VALUES (478, 'Errore: impossibile ottenere lo stato del dispositivo');
INSERT INTO potranslation (id, translation) VALUES (479, 'Errore: impossibile ottenere la directory sysfs
');
INSERT INTO potranslation (id, translation) VALUES (480, 'Errore: impossibile aprire <sysfs dir>/blobk/');
INSERT INTO potranslation (id, translation) VALUES (481, 'Errore: impossibile aprire <sysfs dir>/block/<dispositivo>/');
INSERT INTO potranslation (id, translation) VALUES (482, 'Errore: il dispositivo %s non esiste
');
INSERT INTO potranslation (id, translation) VALUES (483, 'Errore: %s non è un dispositivo a blocchi
');
INSERT INTO potranslation (id, translation) VALUES (484, 'Errore: il dispositivo %s è già montato in %s
');
INSERT INTO potranslation (id, translation) VALUES (485, 'Errore: il dispositivo %s non è montato
');
INSERT INTO potranslation (id, translation) VALUES (486, 'Errore: il dispositivo %s è stato montato da un altro utente
');
INSERT INTO potranslation (id, translation) VALUES (487, 'Errore: il dispositivo %s non è rimovibile
');
INSERT INTO potranslation (id, translation) VALUES (488, 'Errore: il dispositivo %s è in stato di lock
');
INSERT INTO potranslation (id, translation) VALUES (489, 'Errore: la directory %s contiene già un file system montato
');
INSERT INTO potranslation (id, translation) VALUES (490, 'Errore: la directory %s non contiene un file system montato
');
INSERT INTO potranslation (id, translation) VALUES (491, 'Utilizzo:

%s [opzioni] <dispositivo>
  Smonta il <dispositivo> da una directory sotto %s se i requisiti
  sono rispettati (vedere pumount(1) per i dettagli). La directory del
  punto di mount è rimossa successivamente.

Opzioni:
  -l, --lazy: smonta "pigramente", vedere umount(8)
  -d, --debug: abilita l''output di debug (molto prolisso)
  -h, --help: stampa il messaggio di aiuto ed esce con successo
');
INSERT INTO potranslation (id, translation) VALUES (492, 'Errore interno: impossibile determinare il punto di mount
');
INSERT INTO potranslation (id, translation) VALUES (493, 'Errore: il punto di mount %s non si trova sotto %s
');
INSERT INTO potranslation (id, translation) VALUES (494, 'Errore: impossibile eseguire umount');
INSERT INTO potranslation (id, translation) VALUES (495, 'Errore: umount fallito
');
INSERT INTO potranslation (id, translation) VALUES (496, 'Errore: memoria esaurita
');
INSERT INTO potranslation (id, translation) VALUES (497, 'Errore: impossibile creare la directory');
INSERT INTO potranslation (id, translation) VALUES (498, 'Errore: %s non è una directory
');
INSERT INTO potranslation (id, translation) VALUES (499, 'Errore: impossibile aprire la directory');
INSERT INTO potranslation (id, translation) VALUES (500, 'Errore: la directory %s non è vuota
');
INSERT INTO potranslation (id, translation) VALUES (501, 'Errore: ''%s'' non è un numero valido
');
INSERT INTO potranslation (id, translation) VALUES (502, 'Error: el nombre del juego de caracteres ''%s'' no es válido

');
INSERT INTO potranslation (id, translation) VALUES (503, 'Error interno: getopt_long() retornó un valor desconocido
');
INSERT INTO potranslation (id, translation) VALUES (504, 'ADVERTENCIA: el dispositivo %s está actualmente manejado por /etc/fstab, la etiqueta proporcionada se ha ignorado
');
INSERT INTO potranslation (id, translation) VALUES (505, 'Error: no es posible determinar la ubicación real del dispositivo');
INSERT INTO potranslation (id, translation) VALUES (506, 'Error: el dispositivo %s es invalido (debe estar en /dev/)
');
INSERT INTO potranslation (id, translation) VALUES (507, 'Error: no es posible borrar el punto de montaje');
INSERT INTO potranslation (id, translation) VALUES (508, 'Error interno: %i del modo, no manejado.
');
INSERT INTO potranslation (id, translation) VALUES (509, 'Error: no se pudo concectar con hal
');
INSERT INTO potranslation (id, translation) VALUES (510, 'Error: no es posible alcanzar el estado del dispositivo');
INSERT INTO potranslation (id, translation) VALUES (511, 'Error: no es posible alcanzar el directorio sysfs
');
INSERT INTO potranslation (id, translation) VALUES (512, 'Error: no se puede abrir <sysfs dir>/block/');
INSERT INTO potranslation (id, translation) VALUES (513, 'Error no se puede abrir <sysfs dir>/block/<device>/');
INSERT INTO potranslation (id, translation) VALUES (514, 'Error: no existe el dispositivo %s
');
INSERT INTO potranslation (id, translation) VALUES (515, 'Error: %s noes un dispositivo bloqueado
');
INSERT INTO potranslation (id, translation) VALUES (516, 'Error: no es posible abrir el archivo fstab-type');
INSERT INTO potranslation (id, translation) VALUES (517, 'Error: el dispositivo %s ya está montado como %s
');
INSERT INTO potranslation (id, translation) VALUES (518, 'Error: el dispositivo %s no fue montado por usted
');
INSERT INTO potranslation (id, translation) VALUES (519, 'Error: el dispositivo %s no es removible
');
INSERT INTO potranslation (id, translation) VALUES (520, 'Error: el directorio %s todavía tiene montado un sistema de archivos
');
INSERT INTO potranslation (id, translation) VALUES (521, 'Error: el directorio %s no tiene sistemas de archivos montados
');
INSERT INTO potranslation (id, translation) VALUES (522, 'Uso:

%s [opciones] <dispositivo>
  Desmonta <dispositivo> desde un directorio inferior a %s si se ajusta
  a los requerimientos de las politicas (ver pumount(1) para detalles).
  Luego, se remueve el directorio del punto de montaje.

Opciones:
  -l, --lazy: desmonta lentamente, ver umount(8)
  -d, --debug: activa la depuración (MUY PROLIJA)
  -h, --help: muestra esta pantalla y sale
');
INSERT INTO potranslation (id, translation) VALUES (523, 'Error interno: no esposible determinar el punto de montaje
');
INSERT INTO potranslation (id, translation) VALUES (524, 'Error: el punto de montaje %s no está debajo de %s
');
INSERT INTO potranslation (id, translation) VALUES (525, 'Error: no es posible ejecutar umount');
INSERT INTO potranslation (id, translation) VALUES (526, 'Error: no es posible esperar por el proceso umount ejecutado');
INSERT INTO potranslation (id, translation) VALUES (527, 'Error: umount fallido
');
INSERT INTO potranslation (id, translation) VALUES (528, 'Error: sin memoria
');
INSERT INTO potranslation (id, translation) VALUES (529, 'Error: no es posible crear el directorio');
INSERT INTO potranslation (id, translation) VALUES (530, 'Error:  no es posible crear el ''archivo stamp'' en el directorio');
INSERT INTO potranslation (id, translation) VALUES (531, 'Error: no es posible abrir el directorio');
INSERT INTO potranslation (id, translation) VALUES (532, 'Error interno: no es posible cambiar a root uid');
INSERT INTO potranslation (id, translation) VALUES (533, 'Error interno: no es posible cambiar desde el uid de usuario a id real de usuario');
INSERT INTO potranslation (id, translation) VALUES (534, 'Error interno: no es posible cambiar a root gid');
INSERT INTO potranslation (id, translation) VALUES (535, 'Error interno: no es posible cambiar desde gid al gid real');
INSERT INTO potranslation (id, translation) VALUES (536, 'Les paramètres globaux peuvent être modifiés dans /etc/mozilla/prefs.js');
INSERT INTO potranslation (id, translation) VALUES (537, 'La version de Mozilla dans Debian charge le fichier /etc/mozilla/prefs.js après d''autres scripts de configuration.');
INSERT INTO potranslation (id, translation) VALUES (538, 'Vous pouvez modifier dans ce fichier les paramètres globaux (p. ex. les paramètres concernant les polices).');
INSERT INTO potranslation (id, translation) VALUES (539, 'Automatique, esddsp (pour GNOME), artsdsp (pour KDE), Aucun');
INSERT INTO potranslation (id, translation) VALUES (540, 'Module d''encapsulation du serveur de son :');
INSERT INTO potranslation (id, translation) VALUES (541, 'Il arrive que Mozilla soit bloqué parce que certains greffons (« plugins ») -- p. ex. Flash -- verrouillent le périphérique audio /dev/dsp. Il est possible d''encapsuler l''accès au périphérique /dev/dsp pour résoudre ce problème.  « Automatique » sélectionne un module d''encapsulation du dsp en fonction du serveur de son en cours d''exécution. Si aucun gestionnaire de son n''est détecté, Mozilla n''utilisera aucun module d''encapsulation. Ce choix sera sauvegardé dans /etc/mozilla/mozillarc et pourra être modifié dans votre fichier ~/.mozillarc.');
INSERT INTO potranslation (id, translation) VALUES (542, 'Faut-il activer la sélection automatique de la langue/région ?');
INSERT INTO potranslation (id, translation) VALUES (543, 'Ce réglage permet de choisir automatiquement les extensions de langue et de région en fonction des paramètres régionaux de l''utilisateur. Il facilitera la tâche d''un administrateur système qui travaille pour de nombreux utilisateurs peu expérimentés qui ne parlent pas l''anglais.');
INSERT INTO potranslation (id, translation) VALUES (544, 'Pour que la configuration automatique fonctionne, il faut que les variables d''environnement LC_MESSAGES ou LC_ALL soient correctement définies.');
INSERT INTO potranslation (id, translation) VALUES (545, 'Arquivo /etc/mozilla/prefs.ja disponível para preferências personalizadas.');
INSERT INTO potranslation (id, translation) VALUES (546, 'O pacote Debian do Mozilla irá carregar o arquivo /etc/mozilla/prefs.js após carregar alguns scripts de prefrências padrão.');
INSERT INTO potranslation (id, translation) VALUES (547, 'Você pode editar esse arquivo para definir configurações válidas para todos os usuários do sistema. (por exemplo, configurações de fontes)');
INSERT INTO potranslation (id, translation) VALUES (548, 'auto, esddsp, artsdsp, nenhum');
INSERT INTO potranslation (id, translation) VALUES (549, 'Por favor, escolha o wrapper de seu servidor de som.');
INSERT INTO potranslation (id, translation) VALUES (550, 'Algumas vezes o Mozilla pode travar devido a alguns plugins (por exemplo, o plugin de Flash) tentarem travar o acesso ao dispositivo de som /dev/dsp. Você pode usar um wrapper dsp para resolver esse problema. A opção ''auto'' irá decidir qual wrapper dsp deverá ser usado de acordo com o daemon de som em execução. Quando nenhum daemon de som for detectado, o Mozilla não utilizará nenhum wrapper. Esta configuração será gravada no arquivo /etc/mozilla/mozillarc e poderá ser sobreescrita caso esteja definida em seu arquivo ~/.mozillarc.');
INSERT INTO potranslation (id, translation) VALUES (551, 'Habilitar seleção automática de Idioma/Região ?');
INSERT INTO potranslation (id, translation) VALUES (552, 'Esta configuração fornece uma seleção automática de idioma/região no Mozilla utilizando as configurações de locale. A mesma pode auxiliar um administrador de sistema que precisar lidar com centenas de novatos que não falam inglês.');
INSERT INTO potranslation (id, translation) VALUES (553, 'Por favor, defina suas variáveis de ambiente LC_MESSAGE e LC_ALL para que esta configuração funcione corretamente.');
INSERT INTO potranslation (id, translation) VALUES (554, '設定のカスタマイズに /etc/mozilla/prefs.js が利用できます。');
INSERT INTO potranslation (id, translation) VALUES (555, 'Debian の mozilla は デフォルトの設定スクリプトのあとに /etc/mozilla/prefs.js を読み込みます。');
INSERT INTO potranslation (id, translation) VALUES (556, 'このファイルにより、システムワイドの設定ができます。(例えばフォントなど)');
INSERT INTO potranslation (id, translation) VALUES (557, '自動, esddsp, artsdsp, 無し');
INSERT INTO potranslation (id, translation) VALUES (558, 'サウンドデーモンラッパーを選択してください:');
INSERT INTO potranslation (id, translation) VALUES (559, 'ときどき、mozilla はプラグイン(例えば flashplugin)のせいで /dev/dsp を開けずハングアップしてしまいます。dsp ラッパーを使うことでこの問題を回避できます。 ''auto'' は、使用しているサウンドデーモンを検出し、自動的に dsp ラッパーを選択します。 もしサウンドデーモンが動いていなければ、mozilla はどのラッパーも使いません。 この設定は /etc/mozilla/mozillarc に保存され、これはユーザの ~/.mozillarc によりオーバーライドできます。');
INSERT INTO potranslation (id, translation) VALUES (560, '言語/地域 自動選択機能を利用しますか?');
INSERT INTO potranslation (id, translation) VALUES (561, 'この設定により、Mozillaの言語/地域パックを自動的に選択することができます。これは、非英語圏の初心者に有用な設定です。');
INSERT INTO potranslation (id, translation) VALUES (562, 'この機能が正しく動作するために。LC_MESSAGE か LC_ALL 環境変数を設定しておいてください。');
INSERT INTO potranslation (id, translation) VALUES (563, 'Dispone de /etc/mozilla/prefs.js para personalizaciones.');
INSERT INTO potranslation (id, translation) VALUES (564, 'Mozilla en Debian carga el fichero /etc/mozilla/prefs.js después de ciertos scripts de configuración.');
INSERT INTO potranslation (id, translation) VALUES (565, 'Puede editar este fichero para realizar configuraciones generales, tales como la elección de fuentes.');
INSERT INTO potranslation (id, translation) VALUES (566, 'automático, esddsp, artsdsp, ninguno');
INSERT INTO potranslation (id, translation) VALUES (567, 'Por favor, elija el demonio de sonido para acceder al dsp.');
INSERT INTO potranslation (id, translation) VALUES (568, 'En ocasiones mozilla se cuelga cuando los plugins (por ejemplo el de Flash) bloquean /dev/dsp. Puede utilizar un demonio que haga de wrapper para acceder al dsp. «automático» decidirá cuál utilizar de acuerdo al demonio de sonido que se esté ejecutando. Si no se detecta ninguno, mozilla no usará ninguno. Este valor se guardará en /etc/mozilla/mozillarc y se puede sobreescribir con ~/.mozillarc.');
INSERT INTO potranslation (id, translation) VALUES (569, '/etc/mozilla/prefs.js is beschikbaar om instellingen te wijzigen.');
INSERT INTO potranslation (id, translation) VALUES (570, 'Debian mozilla zal /etc/mozilla/prefs.js inladen na enkele standaard voorkeurscripts te hebben ingeladen.');
INSERT INTO potranslation (id, translation) VALUES (571, 'U kunt dit bestand wijzigen voor systeemwijde instellingen (vb: fontinstellingen)');
INSERT INTO potranslation (id, translation) VALUES (572, 'automatisch, esddsp, artsdsp, geen');
INSERT INTO potranslation (id, translation) VALUES (573, 'Kies uw dsp-inwikkelaar van de geluidsachtergronddienst.');
INSERT INTO potranslation (id, translation) VALUES (574, 'Soms hangt mozilla omdat plugins (vb flashplugin) /dev/dsp vergrendelen. U kunt dsp-inwikkelaars gebruiken om dit op te lossen. ''automatisch'' zal beslissen welke dsp-inwikkelaars gebruikt moeten worden afhankelijk van de uitvoerende geluidsachtergronddienst. Wanneer er geen geluidsachtergronddienst wordt gedetecteerd, zal mozilla geen inwikkelaar gebruiken. Deze instelling zal worden bewaard in /etc/mozilla/mozillarc en kan overschreven worden door uw ~/.mozillarc.');
INSERT INTO potranslation (id, translation) VALUES (575, 'Automatische taal/regio-selectie inschakelen?');
INSERT INTO potranslation (id, translation) VALUES (576, 'Deze optie zorgt voor een automatische taal/regio-selectie in Mozilla gebruikmakend van de locale-instellingen. Het kan een systeembeheerder helpen die geconfronteerd wordt met honderden niet-Engels sprekende beginnelingen.');
INSERT INTO potranslation (id, translation) VALUES (577, 'Zet uw LC_MESSAGE- of LC_ALL-variabele om dit correct te laten werken.');
INSERT INTO potranslation (id, translation) VALUES (578, 'Pro přizpůsobení nastavení můžete použít /etc/mozilla/prefs.js.');
INSERT INTO potranslation (id, translation) VALUES (579, 'Mozilla v Debianu používá kromě dalších skriptů i soubor /etc/mozilla/prefs.js.');
INSERT INTO potranslation (id, translation) VALUES (580, 'V tomto souboru můžete nastavit vlastnosti pro všechny uživatele v systému (např. vhodná písma).');
INSERT INTO potranslation (id, translation) VALUES (581, 'auto, esddsp, artsdsp, žádný');
INSERT INTO potranslation (id, translation) VALUES (582, 'Vyberte program spravující zvukové zařízení dsp.');
INSERT INTO potranslation (id, translation) VALUES (583, 'Občas se může mozilla zaseknout, protože některé moduly (např. flash) zamknou /dev/dsp. Předejít tomu můžete použitím speciálního programu pro správu dsp. Volba ''auto'' se rozhodne podle toho, který správce dsp právě běží. Pokud žádný program nerozpozná, žádný se nepoužije. Toto nastavení se uloží do /etc/mozilla/mozillarc a můžete jej přepsat ve svém ~/.mozillarc.');
INSERT INTO potranslation (id, translation) VALUES (584, 'Povolit automatický výběr Jazyka/Země?');
INSERT INTO potranslation (id, translation) VALUES (585, 'Pokud odpovíte kladně, v Mozille se bude automaticky vybírat vhodný jazyk/země. To může velmi pomoci administrátorovi se spoustou neanglicky mluvících nováčků.');
INSERT INTO potranslation (id, translation) VALUES (586, 'Aby toto nastavení pracovalo správně, musíte mít správně nastavené proměnné LC_MESSAGE nebo LC_ALL.');
INSERT INTO potranslation (id, translation) VALUES (587, '/etc/mozilla/prefs.js kan bruges til at opsætte præferencer.');
INSERT INTO potranslation (id, translation) VALUES (588, 'Debians Mozilla vil læse /etc/mozilla/prefs.js efter standard præference-skriptsne er blevet læst.');
INSERT INTO potranslation (id, translation) VALUES (589, 'Du kan redigere i denne fil for system-globale indstillinger (f.eks. skrifttype indstillinger).');
INSERT INTO potranslation (id, translation) VALUES (590, 'auto, esddsp, artsdsp, ingen');
INSERT INTO potranslation (id, translation) VALUES (591, 'Vælg den lyd dæmon som skal bruges med mozilla.');
INSERT INTO potranslation (id, translation) VALUES (592, 'Nogle gange hænger mozilla fordi plugins (f.eks. flash) låser /dev/dsp.  Du kan bruge en lyd dæmon til at løse det. ''auto'' vil automatisk bestemme hvilken der skal bruges udfra en allerede kørende lyd dæmon Når ingen lyd dæmon er fundet, vil mozilla ikke bruge nogen. Denne indstilling vil blive gemt i /etc/mozilla/mozillarc og kan blive overskrevet af din ~/.mozillarc.');
INSERT INTO potranslation (id, translation) VALUES (593, 'Aktivér automatisk sprog/regionsvalg?');
INSERT INTO potranslation (id, translation) VALUES (594, 'Denne indstilling giver mulighed for automatisk sprog/regions valg i Mozilla ved hjælp af locale-indstillinger. Det kan være en stor hjælp for system administratorer der har hundredvis af ikke-engelsktalende nybegyndere.');
INSERT INTO potranslation (id, translation) VALUES (595, 'For at dette skal virke, skal LC_MESSAGE eller LC_ALL miljøvariablerne være sat korrekt.');
INSERT INTO potranslation (id, translation) VALUES (596, 'Tiedosto /etc/mozilla/prefs.js on asetuksien mukauttamista varten.');
INSERT INTO potranslation (id, translation) VALUES (597, 'Debianin mozilla lataa tiedoston /etc/mozilla/prefs.js oletusasetukset 
sisältävän skriptin jälkeen.');
INSERT INTO potranslation (id, translation) VALUES (598, 'Voit muokata tätä tiedostoa muuttaaksesi koko järjestelmää koskevia asetuksia. 
(esim. kirjasinasetukset)');
INSERT INTO potranslation (id, translation) VALUES (599, 'auto, esddsp, artsdsp, ei mikään');
INSERT INTO potranslation (id, translation) VALUES (600, 'Valitse äänenhallinnan taustaprosessin dsp-kääre.');
INSERT INTO potranslation (id, translation) VALUES (601, 'Joskus mozilla voi jumiutua, jos liitännäiset (esim. flashplugin) lukitsevat 
/dev/dsp:n. Ongelman voi välttää käyttämällä dsp-käärettä. "auto" valitsee 
käynnissä olevan äänenhallinnan taustaohjelman mukaisesti oikeat kääreet. Jos 
äänenhallinnan tataustaohjelmaa ei havaita, mozilla ei käytä mitään käärettä. 
Tämä asetus tallennetaan tiedostoon /etc/mozilla/mozillarc ja sen voi tarvittaessa
syrjäyttää käyttäjän omassa asetustiedostossa (~/.mozillarc).');
INSERT INTO potranslation (id, translation) VALUES (602, 'Salli automaattinen kielen/alueen valinta?');
INSERT INTO potranslation (id, translation) VALUES (603, 'Tämä asetus mahdollistaa automaattisen kielen/alueen valinnan
lokaaliasetuksiin perustuen. Asetus voi olla hyödyllinen
ylläpitäjille, joiden piirissä on satoja muuta kuin englannin kieltä
puhuvia käyttäjiä.');
INSERT INTO potranslation (id, translation) VALUES (604, 'Aseta muuttujat LC_MESSAGE ja LC_ALL, jotta automaattinen tunnistus toimisi.');
INSERT INTO potranslation (id, translation) VALUES (605, 'xprint ei näy olevan asennettu');
INSERT INTO potranslation (id, translation) VALUES (606, 'Mozillasta on poistettu tuki postscriptille. Tästä johtuen Xprint täytyy 
olla asennettuna, jotta tulostaminen toimisi. Ole hyvä ja asenna xprt-xptintorg 
-paketti.');
INSERT INTO potranslation (id, translation) VALUES (607, 'Tämä ei ole ohjelmavirhe. Älä lähetä vikailmoitusta tästä. (Toivomuslista 
postscriptin uudelleentukemiseksi on jo lähetetty, Vika#256072.)');
INSERT INTO potranslation (id, translation) VALUES (608, '/etc/mozilla/prefs.js está dispoñible para actualiza-las preferencias.');
INSERT INTO potranslation (id, translation) VALUES (609, 'O mozilla de Debian ha cargar /etc/mozilla/prefs.js despois de cargar algúns scripts de preferencia por defecto.');
INSERT INTO potranslation (id, translation) VALUES (610, 'Pode editar este ficheiro para configuracións globais do sistema (é dicir, configuración dos tipos de letra)');
INSERT INTO potranslation (id, translation) VALUES (611, 'Failas /etc/mozilla/prefs.js skirtas parinkčių individualizavimui.');
INSERT INTO potranslation (id, translation) VALUES (616, 'Kartais mozilla stringa, kuomet jos priedas (pvz. flashplugin) blokuoja /dev/dsp. Šiai problemai spręsti galite naudoti dsp aplanką (wrapper). ''auto'' nuspręs, kurį dsp aplanką naudoti, priklausomai nuo veikiančio garso demono. Jei nebus aptiktas joks garso demonas, mozilla nenaudos jokio aplanko. Šie nustatymai bus išsaugoti faile etc/mozilla/mozillarc, bet Jūsų ~/.mozillarc gali būti viršesnis.');
INSERT INTO potranslation (id, translation) VALUES (617, 'Ar leisti automatinį kalbos/regiono parinkimą?');
INSERT INTO potranslation (id, translation) VALUES (618, 'Šis nustatymas leidžia automatiškai pasirinkti Mozill''os kalbos/regiono paketą, panaudojant locale nustatymus. Tai gali padėti sistemos administratoriui, susiduriančiam su šimtais ne anglų kalba kalbančių naujokų.');
INSERT INTO potranslation (id, translation) VALUES (619, 'Tam kad šis nustatymas veiktų, teisingai nustatykite savo LC_MESSAGE arba LC_ALL kintamuosius.');
INSERT INTO potranslation (id, translation) VALUES (620, 'Il file /etc/mozilla/prefs.js è disponibile per la personalizzazione delle preferenze.');
INSERT INTO potranslation (id, translation) VALUES (621, 'Debian Mozilla caricherà il file /etc/mozilla/prefs.js dopo aver caricato alcuni script di configurazione predefiniti.');
INSERT INTO potranslation (id, translation) VALUES (622, 'Si può editare questo file per impostazioni globali di sistema. (Ad esempio le impostazioni per i caratteri)');
INSERT INTO potranslation (id, translation) VALUES (623, 'auto, esddsp, artsdsp, nessuno');
INSERT INTO potranslation (id, translation) VALUES (624, 'Scegliere il modulo di incapsulazione dsp del demone di gestione del suono.');
INSERT INTO potranslation (id, translation) VALUES (625, 'Qualche volta Mozilla si blocca quando alcuni plugin (ad esempio il plugin Flash) mettono un lock alla periferica /dev/dsp. Si può incapsulare l''accesso alla periferica /dev/dsp per risolvere il problema. Scegliendo ''auto'' verrà selezionato un modulo di incapsulazione dsp in funzione del demone di gestione del suono in esecuzione. Quando nessun gestore di suoni viene trovato, Mozilla non userà alcun modulo di incapsulazione. Questa scelta sarà salvata nel file /etc/mozilla/mozillarc e potrà essere sovrascritta dal file ~/.mozillarc.');
INSERT INTO potranslation (id, translation) VALUES (626, 'Abilitare la selezione automatica Lingua/Regione?');
INSERT INTO potranslation (id, translation) VALUES (627, 'Questa impostazione consente una selezione automatica di lingua/regione utilizzando le preferenze locali. Puo` aiutare un sistemista che abbia a che fare con centinaia di nuovi utenti non a conoscenza della lingua inglese.');
INSERT INTO potranslation (id, translation) VALUES (628, 'Settare la variabile LC_MESSAGE o LC_ALL per consentire a questa impostazione di funzionare correttamente.');
INSERT INTO potranslation (id, translation) VALUES (629, 'Yapılandırma tercihlerini kişiselleştirmek için /etc/mozilla/prefs.js mevcuttur.');
INSERT INTO potranslation (id, translation) VALUES (630, 'Debian mozilla ön tanımlı tercih betiklerini yükledikten sonra /etc/mozilla/prefs.js dosyasını yükleyecektir.');
INSERT INTO potranslation (id, translation) VALUES (631, 'Sistem genelinde ayarlar için bu dosyayı düzenleyebilirsiniz. (ör. yazıtipi tanımları)');
INSERT INTO potranslation (id, translation) VALUES (632, 'otomatik, esddsp, artsdsp, yok');
INSERT INTO potranslation (id, translation) VALUES (633, 'Lütfen ses servisinin kullanacağı ses sistemini (dsp wrapper) seçin.');
INSERT INTO potranslation (id, translation) VALUES (634, 'Bazen mozilla, eklentilerin (ör. flashplugin) /dev/dsp''yi kilitlemesi yüzünden askıda kalır. Bu sorunu çözmek için ses sistemini (dsp wrapper) kullanabilirsiniz. ''otomatik'' seçeneği, çalışan ses servisine göre hangi ses sistemlerinin (dsp wrapper) kullanılması gerektiğine karar verecekir. Hiç bir ses servisi bulunamaz ise, mozilla herhangi bir sistem kullanmayacaktır. Bu ayar /etc/mozilla/mozillarc dosyasına kaydedilecektir. Fakat size ait ~/.mozillarc dosyasındaki ayarlar daha önceliklidir.');
INSERT INTO potranslation (id, translation) VALUES (635, '/etc/mozilla/prefs.js ist für die Anpassungen von Einstellungen verfügbar.');
INSERT INTO potranslation (id, translation) VALUES (636, 'Debians Mozilla wird die Datei /etc/mozilla/prefs.js nach dem Laden von einigen Standard-Einstellungsskripten laden.');
INSERT INTO potranslation (id, translation) VALUES (637, 'Sie können diese Datei bearbeiten, um systemweite Einstellungen vorzunehmen (z.B. Schriften-Einstellungen).');
INSERT INTO potranslation (id, translation) VALUES (638, 'automatisch, esddsp, artsdsp, kein');
INSERT INTO potranslation (id, translation) VALUES (639, 'Bitte wählen Sie die DSP-Hülle Ihres Sound-Daemons aus.');
INSERT INTO potranslation (id, translation) VALUES (640, 'Manchmal hängt Mozilla, da Erweiterungen (bspw. flashplugin) einen /dev/dsp sperren. Sie können das durch die Benutzung einer DSP-Hülle beheben. ''automatisch'' wird anhand des laufenden Sound-Daemons entscheiden, welche DSP-Hülle verwendet werden sollte. Falls kein Sound-Daemon erkannt wird, verwendet Mozilla keine Hülle. Diese Einstellung wird in /etc/mozilla/mozillarc abgespeichert und kann in Ihrer ~/.mozillarc überschrieben werden.');
INSERT INTO potranslation (id, translation) VALUES (641, 'Automatische Sprach-/Regionenauswahl aktivieren?');
INSERT INTO potranslation (id, translation) VALUES (642, 'Diese Einstellung ermöglicht eine automatische Auswahl der Sprach-/Regionenpakete in Mozilla mittels der »locale«-Einstellungen. Dies mag Systemadministratoren helfen, die sich Hunderten von nicht Englisch sprechenden Neulingen gegenüber sehen.');
INSERT INTO potranslation (id, translation) VALUES (643, 'Bitte setzen Sie Ihre »LC_MESSAGE«- oder »LC_ALL«-Variable entsprechend, so dass diese Einstellung korrekt funktioniert.');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'potranslation'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = '"language"'::pg_catalog.regclass;

INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (478, 'en_DK', 'English (Denmark)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (466, 'ti_ER', 'Tigrinya (Eritrea)', NULL, NULL, NULL, false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (467, 'ti_ET', 'Tigrinya (Ethiopia)', NULL, NULL, NULL, false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (468, 'gez_ER', 'Geez (Eritrea)', NULL, NULL, NULL, false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (469, 'gez_ET', 'Geez (Ethiopia)', NULL, NULL, NULL, false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (470, 'de_AT', 'German (Austria)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (471, 'de_BE', 'German (Belgium)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (472, 'de_CH', 'German (Switzerland)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (473, 'de_DE', 'German (Germany)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (474, 'de_LU', 'German (Luxembourg)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (476, 'en_BW', 'English (Botswana)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (480, 'en_HK', 'English (Hong Kong)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (481, 'en_IE', 'English (Ireland)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (482, 'en_IN', 'English (India)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (483, 'en_NZ', 'English (New Zealand)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (484, 'en_PH', 'English (Philippines)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (485, 'en_SG', 'English (Singapore)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (486, 'en_US', 'English (United States)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (487, 'en_ZA', 'English (South Africa)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (488, 'en_ZW', 'English (Zimbabwe)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (490, 'zh_HK', 'Chinese (Hong Kong)', NULL, 1, '0', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (491, 'zh_SG', 'Chinese (Singapore)', NULL, 1, '0', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (493, 'eu_ES', 'Basque (Spain)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (494, 'eu_FR', 'Basque (France)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (495, 'es_AR', 'Spanish (Argentina)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (496, 'es_BO', 'Spanish (Bolivia)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (497, 'es_CL', 'Spanish (Chile)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (498, 'es_CO', 'Spanish (Colombia)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (499, 'es_CR', 'Spanish (Costa Rica)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (500, 'es_DO', 'Spanish (Dominican Republic)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (501, 'es_EC', 'Spanish (Ecuador)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (502, 'es_ES', 'Spanish (Spain)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (503, 'es_GT', 'Spanish (Guatemala)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (504, 'es_HN', 'Spanish (Honduras)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (505, 'es_MX', 'Spanish (Mexico)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (506, 'es_NI', 'Spanish (Nicaragua)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (507, 'es_PA', 'Spanish (Panama)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (508, 'es_PE', 'Spanish (Peru)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (509, 'es_PR', 'Spanish (Puerto Rico)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (510, 'es_PY', 'Spanish (Paraguay)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (511, 'es_SV', 'Spanish (El Salvador)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (512, 'es_US', 'Spanish (United States)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (513, 'es_UY', 'Spanish (Uruguay)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (514, 'es_VE', 'Spanish (Venezuela)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (515, 'ru_RU', 'Russian (Russian Federation)', NULL, 3, 'n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (516, 'ru_UA', 'Russian (Ukraine)', NULL, 3, 'n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (517, 'bn_BD', 'Bengali (Bangladesh)', NULL, NULL, NULL, false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (518, 'bn_IN', 'Bengali (India)', NULL, NULL, NULL, false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (519, 'om_ET', 'Oromo (Ethiopia)', NULL, NULL, NULL, false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (520, 'om_KE', 'Oromo (Kenya)', NULL, NULL, NULL, false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (522, 'pt_PT', 'Portuguese (Portugal)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (523, 'aa_DJ', 'Afar (Djibouti)', NULL, NULL, NULL, false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (524, 'aa_ER', 'Afar (Eritrea)', NULL, NULL, NULL, false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (525, 'aa_ET', 'Afar (Ethiopia)', NULL, NULL, NULL, false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (526, 'it_CH', 'Italian (Switzerland)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (527, 'it_IT', 'Italian (Italy)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (546, 'nl_BE', 'Dutch (Belgium)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (547, 'nl_NL', 'Dutch (Netherlands)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (548, 'fr_BE', 'French (Belgium)', NULL, 2, 'n > 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (549, 'fr_CA', 'French (Canada)', NULL, 2, 'n > 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (550, 'fr_CH', 'French (Switzerland)', NULL, 2, 'n > 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (551, 'fr_FR', 'French (France)', NULL, 2, 'n > 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (552, 'fr_LU', 'French (Luxembourg)', NULL, 2, 'n > 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (553, 'sv_FI', 'Swedish (Finland)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (554, 'sv_SE', 'Swedish (Sweden)', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (555, 'so_DJ', 'Somali (Djibouti)', NULL, NULL, NULL, false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (556, 'so_ET', 'Somali (Ethiopia)', NULL, NULL, NULL, false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (557, 'so_KE', 'Somali (Kenya)', NULL, NULL, NULL, false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (558, 'so_SO', 'Somali (Somalia)', NULL, NULL, NULL, false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (528, 'ar_AE', 'Arabic (United Arab Emirates)', NULL, 3, 'n==1 ? 0 : n==2 ? 1 : 2', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (529, 'ar_BH', 'Arabic (Bahrain)', NULL, 3, 'n==1 ? 0 : n==2 ? 1 : 2', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (530, 'ar_DZ', 'Arabic (Algeria)', NULL, 3, 'n==1 ? 0 : n==2 ? 1 : 2', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (531, 'ar_EG', 'Arabic (Egypt)', NULL, 3, 'n==1 ? 0 : n==2 ? 1 : 2', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (532, 'ar_IN', 'Arabic (India)', NULL, 3, 'n==1 ? 0 : n==2 ? 1 : 2', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (533, 'ar_IQ', 'Arabic (Iraq)', NULL, 3, 'n==1 ? 0 : n==2 ? 1 : 2', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (534, 'ar_JO', 'Arabic (Jordan)', NULL, 3, 'n==1 ? 0 : n==2 ? 1 : 2', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (535, 'ar_KW', 'Arabic (Kuwait)', NULL, 3, 'n==1 ? 0 : n==2 ? 1 : 2', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (536, 'ar_LB', 'Arabic (Lebanon)', NULL, 3, 'n==1 ? 0 : n==2 ? 1 : 2', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (537, 'ar_LY', 'Arabic (Libyan Arab Jamahiriya)', NULL, 3, 'n==1 ? 0 : n==2 ? 1 : 2', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (538, 'ar_MA', 'Arabic (Morocco)', NULL, 3, 'n==1 ? 0 : n==2 ? 1 : 2', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (539, 'ar_OM', 'Arabic (Oman)', NULL, 3, 'n==1 ? 0 : n==2 ? 1 : 2', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (540, 'ar_QA', 'Arabic (Qatar)', NULL, 3, 'n==1 ? 0 : n==2 ? 1 : 2', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (541, 'ar_SA', 'Arabic (Saudi Arabia)', NULL, 3, 'n==1 ? 0 : n==2 ? 1 : 2', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (542, 'ar_SD', 'Arabic (Sudan)', NULL, 3, 'n==1 ? 0 : n==2 ? 1 : 2', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (543, 'ar_SY', 'Arabic (Syrian Arab Republic)', NULL, 3, 'n==1 ? 0 : n==2 ? 1 : 2', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (544, 'ar_TN', 'Arabic (Tunisia)', NULL, 3, 'n==1 ? 0 : n==2 ? 1 : 2', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (545, 'ar_YE', 'Arabic (Yemen)', NULL, 3, 'n==1 ? 0 : n==2 ? 1 : 2', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (1, 'aa', 'Afar', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (135, 'fy', 'Frisian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (398, 'syr', 'Syriac', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (2, 'ab', 'Abkhazian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (3, 'ace', 'Achinese', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (4, 'ach', 'Acoli', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (5, 'ada', 'Adangme', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (6, 'ady', 'Adyghe; Adygei', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (7, 'afa', 'Afro-Asiatic (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (8, 'afh', 'Afrihili', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (9, 'af', 'Afrikaans', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (10, 'aka', 'Akan', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (11, 'ak', 'Akkadian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (12, 'sq', 'Albanian', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (13, 'ale', 'Aleut', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (14, 'alg', 'Algonquian languages', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (15, 'am', 'Amharic', NULL, 2, 'n > 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (16, 'ang', 'English, Old (ca.450-1100)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (17, 'apa', 'Apache languages', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (19, 'arc', 'Aramaic', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (20, 'an', 'Aragonese', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (21, 'hy', 'Armenian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (22, 'arn', 'Araucanian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (23, 'arp', 'Arapaho', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (24, 'art', 'Artificial (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (25, 'arw', 'Arawak', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (26, 'as', 'Assamese', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (27, 'ast', 'Asturian; Bable', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (28, 'ath', 'Athapascan language', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (29, 'aus', 'Australian languages', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (30, 'av', 'Avaric', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (31, 'ae', 'Avestan', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (32, 'awa', 'Awadhi', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (33, 'ay', 'Aymara', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (34, 'az', 'Azerbaijani', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (35, 'bad', 'Banda', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (36, 'bai', 'Bamileke languages', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (37, 'ba', 'Bashkir', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (38, 'bal', 'Baluchi', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (39, 'bm', 'Bambara', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (40, 'ban', 'Balinese', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (41, 'eu', 'Basque', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (42, 'bas', 'Basa', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (43, 'bat', 'Baltic (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (44, 'bej', 'Beja', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (45, 'be', 'Belarusian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (46, 'bem', 'Bemba', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (47, 'bn', 'Bengali', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (48, 'ber', 'Berber (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (49, 'bho', 'Bhojpuri', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (50, 'bh', 'Bihari', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (51, 'bik', 'Bikol', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (52, 'bin', 'Bini', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (53, 'bi', 'Bislama', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (54, 'bla', 'Siksika', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (55, 'bnt', 'Bantu (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (56, 'bs', 'Bosnian', NULL, 3, 'n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (57, 'bra', 'Braj', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (58, 'br', 'Breton', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (59, 'btk', 'Batak (Indonesia)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (60, 'bua', 'Buriat', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (61, 'bug', 'Buginese', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (63, 'my', 'Burmese', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (64, 'byn', 'Blin; Bilin', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (65, 'cad', 'Caddo', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (66, 'cai', 'Central American Indian (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (67, 'car', 'Carib', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (68, 'ca', 'Catalan', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (69, 'cau', 'Caucasian (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (70, 'ceb', 'Cebuano', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (71, 'cel', 'Celtic (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (72, 'ch', 'Chamorro', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (73, 'chb', 'Chibcha', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (74, 'ce', 'Chechen', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (75, 'chg', 'Chagatai', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (76, 'zh', 'Chinese', NULL, 1, '0', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (77, 'chk', 'Chukese', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (78, 'chm', 'Mari', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (79, 'chn', 'Chinook jargon', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (80, 'cho', 'Choctaw', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (81, 'chp', 'Chipewyan', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (82, 'chr', 'Cherokee', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (83, 'chu', 'Church Slavic', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (84, 'cv', 'Chuvash', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (85, 'chy', 'Cheyenne', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (86, 'cmc', 'Chamic languages', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (87, 'cop', 'Coptic', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (88, 'kw', 'Cornish', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (89, 'co', 'Corsican', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (90, 'cpe', 'English-based (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (91, 'cpf', 'French-based (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (92, 'cpp', 'Portuguese-based (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (93, 'cr', 'Cree', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (94, 'crh', 'Crimean Turkish; Crimean Tatar', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (95, 'crp', 'Creoles and pidgins (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (96, 'csb', 'Kashubian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (97, 'cus', 'Cushitic (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (98, 'cs', 'Czech', NULL, 3, 'n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (99, 'dak', 'Dakota', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (100, 'da', 'Danish', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (101, 'dar', 'Dargwa', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (102, 'del', 'Delaware', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (103, 'den', 'Slave (Athapascan)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (104, 'dgr', 'Dogrib', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (105, 'din', 'Dinka', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (106, 'dv', 'Divehi', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (107, 'doi', 'Dogri', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (108, 'dra', 'Dravidian (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (109, 'dsb', 'Lower Sorbian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (110, 'dua', 'Duala', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (111, 'dum', 'Dutch, Middle (ca. 1050-1350)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (112, 'nl', 'Dutch', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (113, 'dyu', 'Dyula', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (114, 'dz', 'Dzongkha', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (115, 'efi', 'Efik', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (116, 'egy', 'Egyptian (Ancient)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (117, 'eka', 'Ekajuk', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (118, 'elx', 'Elamite', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (119, 'en', 'English', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (120, 'enm', 'English, Middle (1100-1500)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (121, 'eo', 'Esperanto', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (122, 'et', 'Estonian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (123, 'ee', 'Ewe', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (124, 'ewo', 'Ewondo', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (125, 'fan', 'Fang', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (126, 'fo', 'Faroese', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (127, 'fat', 'Fanti', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (128, 'fj', 'Fijian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (129, 'fi', 'Finnish', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (130, 'fiu', 'Finno-Ugrian (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (131, 'fon', 'Fon', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (132, 'fr', 'French', NULL, 2, 'n > 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (133, 'frm', 'French, Middle (ca.1400-1600)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (134, 'fro', 'French, Old (842-ca.1400)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (136, 'ff', 'Fulah', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (137, 'fur', 'Friulian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (138, 'gaa', 'Ga', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (139, 'gay', 'Gayo', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (140, 'gba', 'Gbaya', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (141, 'gem', 'Germanic (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (142, 'ka', 'Georgian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (143, 'de', 'German', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (144, 'gez', 'Geez', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (145, 'gil', 'Gilbertese', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (147, 'ga', 'Irish', NULL, 3, 'n==1 ? 0 : n==2 ? 1 : 2', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (149, 'gv', 'Manx', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (150, 'gmh', 'German, Middle High (ca.1050-1500)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (151, 'goh', 'German, Old High (ca.750-1050)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (152, 'gon', 'Gondi', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (153, 'gor', 'Gorontalo', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (154, 'got', 'Gothic', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (155, 'grb', 'Grebo', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (156, 'grc', 'Greek, Ancient (to 1453)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (157, 'el', 'Greek, Modern (1453-)', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (158, 'gn', 'Guarani', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (159, 'gu', 'Gujarati', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (160, 'gwi', 'Gwichin', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (161, 'hai', 'Haida', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (162, 'ht', 'Haitian; Haitian Creole', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (163, 'ha', 'Hausa', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (164, 'haw', 'Hawaiian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (165, 'he', 'Hebrew', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (166, 'hz', 'Herero', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (167, 'hil', 'Hiligaynon', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (168, 'him', 'Himachali', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (169, 'hi', 'Hindi', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (170, 'hit', 'Hittite', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (171, 'hmn', 'Hmong', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (172, 'ho', 'Hiri', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (173, 'hsb', 'Upper Sorbian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (174, 'hu', 'Hungarian', NULL, 1, '0', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (175, 'hup', 'Hupa', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (176, 'iba', 'Iban', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (177, 'ig', 'Igbo', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (179, 'io', 'Ido', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (180, 'ii', 'Sichuan Yi', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (181, 'ijo', 'Ijo', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (182, 'iu', 'Inuktitut', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (183, 'ie', 'Interlingue', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (184, 'ilo', 'Iloko', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (185, 'ia', 'Interlingua', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (186, 'inc', 'Indic (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (187, 'id', 'Indonesian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (188, 'ine', 'Indo-European (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (189, 'inh', 'Ingush', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (190, 'ik', 'Inupiaq', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (191, 'ira', 'Iranian (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (192, 'iro', 'Iroquoian languages', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (193, 'it', 'Italian', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (194, 'jv', 'Javanese', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (195, 'jbo', 'Lojban', NULL, 1, '0', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (196, 'ja', 'Japanese', NULL, 1, '0', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (197, 'jpr', 'Judeo-Persian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (198, 'jrb', 'Judeo-Arabic', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (199, 'kaa', 'Kara-Kalpak', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (200, 'kab', 'Kabyle', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (201, 'kac', 'Kachin', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (202, 'kl', 'Greenlandic (Kalaallisut)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (203, 'kam', 'Kamba', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (204, 'kn', 'Kannada', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (205, 'kar', 'Karen', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (206, 'ks', 'Kashmiri', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (207, 'kr', 'Kanuri', NULL, 1, '0', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (208, 'kaw', 'Kawi', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (209, 'kk', 'Kazakh', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (210, 'kbd', 'Kabardian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (211, 'kha', 'Khazi', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (212, 'khi', 'Khoisan (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (213, 'km', 'Khmer', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (214, 'kho', 'Khotanese', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (215, 'ki', 'Kikuyu', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (216, 'rw', 'Kinyarwanda', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (217, 'ky', 'Kirghiz', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (218, 'kmb', 'Kimbundu', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (219, 'kok', 'Konkani', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (220, 'kv', 'Komi', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (221, 'kg', 'Kongo', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (222, 'ko', 'Korean', NULL, 1, '0', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (223, 'kos', 'Kosraean', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (224, 'kpe', 'Kpelle', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (225, 'krc', 'Karachay-Balkar', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (226, 'kro', 'Kru', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (227, 'kru', 'Kurukh', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (228, 'kj', 'Kuanyama', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (229, 'kum', 'Kumyk', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (231, 'kut', 'Kutenai', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (232, 'lad', 'Ladino', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (233, 'lah', 'Lahnda', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (234, 'lam', 'Lamba', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (235, 'lo', 'Lao', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (236, 'la', 'Latin', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (237, 'lv', 'Latvian', NULL, 3, 'n%10==1 && n%100!=11 ? 0 : n != 0 ? 1 : 2', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (238, 'lez', 'Lezghian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (239, 'li', 'Limburgian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (240, 'ln', 'Lingala', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (241, 'lt', 'Lithuanian', NULL, 3, 'n%10==1 && n%100!=11 ? 0 : n%10>=2 && (n%100<10 || n%100>=20) ? 1 : 2', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (242, 'lol', 'Mongo', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (243, 'loz', 'Lozi', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (244, 'lb', 'Luxembourgish', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (245, 'lua', 'Luba-Lulua', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (246, 'lu', 'Luba-Katanga', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (247, 'lg', 'Ganda', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (248, 'lui', 'Luiseno', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (249, 'lun', 'Lunda', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (250, 'luo', 'Luo (Kenya and Tanzania)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (251, 'lus', 'Lushai', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (253, 'mad', 'Madurese', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (254, 'mag', 'Magahi', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (255, 'mh', 'Marshallese', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (256, 'mai', 'Maithili', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (257, 'mak', 'Makasar', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (258, 'ml', 'Malayalam', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (259, 'man', 'Mandingo', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (260, 'mi', 'Maori', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (261, 'map', 'Austronesian (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (262, 'mr', 'Marathi', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (263, 'mas', 'Masai', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (264, 'ms', 'Malay', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (265, 'mdf', 'Moksha', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (266, 'mdr', 'Mandar', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (267, 'men', 'Mende', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (268, 'mga', 'Irish, Middle (900-1200)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (269, 'mic', 'Micmac', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (270, 'min', 'Minangkabau', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (271, 'mis', 'Miscellaneous languages', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (272, 'mkh', 'Mon-Khmer (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (273, 'mg', 'Malagasy', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (274, 'mt', 'Maltese', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (275, 'mnc', 'Manchu', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (276, 'mno', 'Manobo languages', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (277, 'moh', 'Mohawk', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (278, 'mo', 'Moldavian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (279, 'mn', 'Mongolian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (280, 'mos', 'Mossi', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (281, 'mul', 'Multiple languages', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (282, 'mun', 'Munda languages', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (283, 'mus', 'Creek', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (284, 'mwr', 'Marwari', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (285, 'myn', 'Mayan languages', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (286, 'myv', 'Erzya', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (287, 'nah', 'Nahuatl', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (288, 'nai', 'North American Indian (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (289, 'nap', 'Neapolitan', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (290, 'na', 'Nauru', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (291, 'nv', 'Navaho', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (292, 'nr', 'Ndebele, South', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (293, 'nd', 'Ndebele, North', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (294, 'ng', 'Ndonga', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (295, 'nds', 'German, Low', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (296, 'ne', 'Nepali', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (297, 'new', 'Newari', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (298, 'nia', 'Nias', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (299, 'nic', 'Niger-Kordofanian (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (300, 'niu', 'Niuean', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (301, 'nn', 'Norwegian Nynorsk', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (302, 'nb', 'Norwegian Bokmål', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (303, 'nog', 'Nogai', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (304, 'non', 'Norse, Old', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (306, 'nso', 'Sotho, Northern', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (307, 'nub', 'Nubian languages', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (308, 'nwc', 'Classical Newari; Old Newari', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (309, 'ny', 'Chewa; Chichewa; Nyanja', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (310, 'nym', 'Nyankole', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (311, 'nyo', 'Nyoro', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (312, 'nzi', 'Nzima', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (313, 'oc', 'Occitan (post 1500)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (314, 'oj', 'Ojibwa', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (315, 'or', 'Oriya', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (316, 'om', 'Oromo', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (317, 'osa', 'Osage', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (318, 'os', 'Ossetian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (319, 'ota', 'Turkish, Ottoman (1500-1928)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (320, 'oto', 'Otomian languages', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (321, 'paa', 'Papuan (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (322, 'pag', 'Pangasinan', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (323, 'pal', 'Pahlavi', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (324, 'pam', 'Pampanga', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (326, 'pap', 'Papiamento', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (327, 'pau', 'Palauan', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (328, 'peo', 'Persian, Old (ca.600-400 B.C.)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (329, 'fa', 'Persian', NULL, 1, '0', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (330, 'phi', 'Philippine (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (331, 'phn', 'Phoenician', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (332, 'pi', 'Pali', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (333, 'pl', 'Polish', NULL, 3, 'n==1 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (334, 'pt', 'Portuguese', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (335, 'pon', 'Pohnpeian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (336, 'pra', 'Prakrit languages', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (337, 'pro', 'Provençal, Old (to 1500)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (338, 'ps', 'Pushto', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (340, 'raj', 'Rajasthani', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (341, 'rap', 'Rapanui', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (342, 'rar', 'Rarotongan', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (343, 'roa', 'Romance (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (344, 'rm', 'Raeto-Romance', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (345, 'rom', 'Romany', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (346, 'ro', 'Romanian', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (347, 'rn', 'Rundi', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (348, 'ru', 'Russian', NULL, 3, 'n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (349, 'sad', 'Sandawe', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (350, 'sg', 'Sango', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (351, 'sah', 'Yakut', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (352, 'sai', 'South American Indian (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (353, 'sal', 'Salishan languages', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (354, 'sam', 'Samaritan Aramaic', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (355, 'sa', 'Sanskrit', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (356, 'sas', 'Sasak', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (357, 'sat', 'Santali', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (358, 'sr', 'Serbian', NULL, 3, 'n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (359, 'sco', 'Scots', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (305, 'no', 'Norwegian', NULL, 2, 'n != 1', false);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (360, 'hr', 'Croatian', NULL, 3, 'n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (361, 'sel', 'Selkup', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (362, 'sem', 'Semitic (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (363, 'sga', 'Irish, Old (to 900)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (364, 'sgn', 'Sign languages', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (365, 'shn', 'Shan', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (366, 'sid', 'Sidamo', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (367, 'si', 'Sinhalese', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (368, 'sio', 'Siouan languages', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (369, 'sit', 'Sino-Tibetan (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (370, 'sla', 'Slavic (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (371, 'sk', 'Slovak', NULL, 3, 'n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (373, 'sma', 'Southern Sami', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (374, 'se', 'Northern Sami', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (375, 'smi', 'Sami languages (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (376, 'smj', 'Lule Sami', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (377, 'smn', 'Inari Sami', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (378, 'sm', 'Samoan', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (379, 'sms', 'Skolt Sami', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (380, 'sn', 'Shona', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (381, 'sd', 'Sindhi', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (382, 'snk', 'Soninke', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (383, 'sog', 'Sogdian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (384, 'so', 'Somali', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (385, 'son', 'Songhai', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (386, 'st', 'Sotho, Southern', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (387, 'es', 'Spanish', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (388, 'sc', 'Sardinian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (389, 'srr', 'Serer', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (390, 'ssa', 'Nilo-Saharan (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (391, 'ss', 'Swati', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (392, 'suk', 'Sukuma', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (393, 'su', 'Sundanese', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (394, 'sus', 'Susu', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (395, 'sux', 'Sumerian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (396, 'sw', 'Swahili', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (397, 'sv', 'Swedish', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (399, 'ty', 'Tahitian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (400, 'tai', 'Tai (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (401, 'ta', 'Tamil', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (402, 'ts', 'Tsonga', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (403, 'tt', 'Tatar', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (404, 'te', 'Telugu', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (405, 'tem', 'Timne', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (406, 'ter', 'Tereno', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (407, 'tet', 'Tetum', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (408, 'tg', 'Tajik', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (409, 'tl', 'Tagalog', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (410, 'th', 'Thai', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (412, 'tig', 'Tigre', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (413, 'ti', 'Tigrinya', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (414, 'tiv', 'Tiv', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (415, 'tlh', 'Klingon; tlhIngan-Hol', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (416, 'tkl', 'Tokelau', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (417, 'tli', 'Tlinglit', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (418, 'tmh', 'Tamashek', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (419, 'tog', 'Tonga (Nyasa)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (420, 'to', 'Tonga (Tonga Islands)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (421, 'tpi', 'Tok Pisin', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (422, 'tsi', 'Tsimshian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (423, 'tn', 'Tswana', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (424, 'tk', 'Turkmen', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (425, 'tum', 'Tumbuka', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (426, 'tup', 'Tupi languages', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (427, 'tr', 'Turkish', NULL, 1, '0', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (428, 'tut', 'Altaic (Other)', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (429, 'tvl', 'Tuvalu', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (430, 'tw', 'Twi', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (431, 'tyv', 'Tuvinian', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (432, 'udm', 'Udmurt', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (433, 'uga', 'Ugaritic', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (434, 'ug', 'Uighur', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (435, 'uk', 'Ukrainian', NULL, 3, 'n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (436, 'umb', 'Umbundu', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (437, 'und', 'Undetermined', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (438, 'urd', 'Urdu', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (439, 'uz', 'Uzbek', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (440, 'vai', 'Vai', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (441, 've', 'Venda', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (442, 'vi', 'Vietnamese', NULL, 1, '0', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (443, 'vo', 'Volapuk', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (444, 'vot', 'Votic', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (445, 'wak', 'Wakashan languages', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (446, 'wal', 'Walamo', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (447, 'war', 'Waray', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (448, 'was', 'Washo', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (449, 'cy', 'Welsh', NULL, 4, 'n==1 ? 0 : n==2 ? 1 : (n != 8 || n != 11) ? 2 : 3', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (450, 'wen', 'Sorbian languages', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (451, 'wa', 'Walloon', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (452, 'wo', 'Wolof', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (453, 'xal', 'Kalmyk', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (454, 'xh', 'Xhosa', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (455, 'yao', 'Yao', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (456, 'yap', 'Yapese', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (457, 'yi', 'Yiddish', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (458, 'yo', 'Yoruba', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (459, 'ypk', 'Yupik languages', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (460, 'zap', 'Zapotec', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (461, 'zen', 'Zenaga', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (462, 'za', 'Chuang; Zhuang', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (463, 'znd', 'Zande', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (464, 'zu', 'Zulu', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (465, 'zun', 'Zuni', NULL, NULL, NULL, true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (146, 'gd', 'Gaelic; Scottish', NULL, 3, 'n < 2 ? 0 : n == 2 ? 1 : 2', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (178, 'is', 'Icelandic', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (325, 'pa', 'Panjabi', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (372, 'sl', 'Slovenian', NULL, 4, 'n%100==1 ? 0 : n%100==2 ? 1 : n%100==3 || n%100==4 ? 2 : 3', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (411, 'bo', 'Tibetan', NULL, 1, '0', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (62, 'bg', 'Bulgarian', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (148, 'gl', 'Galician', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (230, 'ku', 'Kurdish', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (339, 'qu', 'Quechua', NULL, 2, '(n % 10 == 1 && n % 100 != 11) ? 0 : 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (252, 'mk', 'Macedonian', NULL, 2, '(n % 10 == 1 && n % 100 != 11) ? 0 : 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (18, 'ar', 'Arabic', NULL, 3, 'n==1 ? 0 : n==2 ? 1 : 2', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (475, 'en_AU', 'English (Australia)', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (477, 'en_CA', 'English (Canada)', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (479, 'en_GB', 'English (United Kingdom)', NULL, 2, 'n != 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (489, 'zh_CN', 'Chinese (China)', NULL, 1, '0', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (521, 'pt_BR', 'Portuguese (Brazil)', NULL, 2, 'n > 1', true);
INSERT INTO "language" (id, code, englishname, nativename, pluralforms, pluralexpression, visible) VALUES (492, 'zh_TW', 'Chinese (Taiwan)', NULL, 1, '0', true);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = '"language"'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'country'::pg_catalog.regclass;

INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (1, 'AF', 'AFG', 'Afghanistan', 'The Transitional Islamic State of Afghanistan', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (2, 'AX', 'ALA', 'Åland Islands', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (3, 'AL', 'ALB', 'Albania', 'Republic of Albania', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (4, 'DZ', 'DZA', 'Algeria', 'People''s Democratic Republic of Algeria', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (5, 'AS', 'ASM', 'American Samoa', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (6, 'AD', 'AND', 'Andorra', 'Principality of Andorra', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (7, 'AO', 'AGO', 'Angola', 'Republic of Angola', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (8, 'AI', 'AIA', 'Anguilla', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (9, 'AQ', 'ATA', 'Antarctica', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (10, 'AG', 'ATG', 'Antigua and Barbuda', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (11, 'AR', 'ARG', 'Argentina', 'Argentine Republic', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (12, 'AM', 'ARM', 'Armenia', 'Republic of Armenia', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (13, 'AW', 'ABW', 'Aruba', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (14, 'AU', 'AUS', 'Australia', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (15, 'AT', 'AUT', 'Austria', 'Republic of Austria', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (16, 'AZ', 'AZE', 'Azerbaijan', 'Republic of Azerbaijan', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (17, 'BS', 'BHS', 'Bahamas', 'Commonwealth of the Bahamas', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (18, 'BH', 'BHR', 'Bahrain', 'State of Bahrain', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (19, 'BD', 'BGD', 'Bangladesh', 'People''s Republic of Bangladesh', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (20, 'BB', 'BRB', 'Barbados', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (21, 'BY', 'BLR', 'Belarus', 'Republic of Belarus', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (22, 'BE', 'BEL', 'Belgium', 'Kingdom of Belgium', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (23, 'BZ', 'BLZ', 'Belize', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (24, 'BJ', 'BEN', 'Benin', 'Republic of Benin', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (25, 'BM', 'BMU', 'Bermuda', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (26, 'BT', 'BTN', 'Bhutan', 'Kingdom of Bhutan', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (27, 'BO', 'BOL', 'Bolivia', 'Republic of Bolivia', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (28, 'BA', 'BIH', 'Bosnia and Herzegovina', 'Republic of Bosnia and Herzegovina', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (29, 'BW', 'BWA', 'Botswana', 'Republic of Botswana', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (30, 'BV', 'BVT', 'Bouvet Island', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (31, 'BR', 'BRA', 'Brazil', 'Federative Republic of Brazil', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (32, 'IO', 'IOT', 'British Indian Ocean Territory', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (33, 'BN', 'BRN', 'Brunei Darussalam', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (34, 'BG', 'BGR', 'Bulgaria', 'Republic of Bulgaria', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (35, 'BF', 'BFA', 'Burkina Faso', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (36, 'BI', 'BDI', 'Burundi', 'Republic of Burundi', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (37, 'KH', 'KHM', 'Cambodia', 'Kingdom of Cambodia', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (38, 'CM', 'CMR', 'Cameroon', 'Republic of Cameroon', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (39, 'CA', 'CAN', 'Canada', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (40, 'CV', 'CPV', 'Cape Verde', 'Republic of Cape Verde', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (41, 'KY', 'CYM', 'Cayman Islands', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (42, 'CF', 'CAF', 'Central African Republic', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (43, 'TD', 'TCD', 'Chad', 'Republic of Chad', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (44, 'CL', 'CHL', 'Chile', 'Republic of Chile', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (45, 'CN', 'CHN', 'China', 'People''s Republic of China', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (46, 'CX', 'CXR', 'Christmas Island', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (47, 'CC', 'CCK', 'Cocos (Keeling) Islands', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (48, 'CO', 'COL', 'Colombia', 'Republic of Colombia', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (49, 'KM', 'COM', 'Comoros', 'Union of the Comoros', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (50, 'CG', 'COG', 'Congo', 'Republic of the Congo', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (51, 'CD', 'ZAR', 'Congo, The Democratic Republic of the', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (52, 'CK', 'COK', 'Cook Islands', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (53, 'CR', 'CRI', 'Costa Rica', 'Republic of Costa Rica', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (54, 'CI', 'CIV', 'Côte d''Ivoire', 'Republic of Cote d''Ivoire', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (55, 'HR', 'HRV', 'Croatia', 'Republic of Croatia', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (56, 'CU', 'CUB', 'Cuba', 'Republic of Cuba', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (57, 'CY', 'CYP', 'Cyprus', 'Republic of Cyprus', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (58, 'CZ', 'CZE', 'Czech Republic', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (59, 'DK', 'DNK', 'Denmark', 'Kingdom of Denmark', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (60, 'DJ', 'DJI', 'Djibouti', 'Republic of Djibouti', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (61, 'DM', 'DMA', 'Dominica', 'Commonwealth of Dominica', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (62, 'DO', 'DOM', 'Dominican Republic', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (63, 'TL', 'TLS', 'Timor-Leste', 'Democratic Republic of Timor-Leste', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (64, 'EC', 'ECU', 'Ecuador', 'Republic of Ecuador', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (65, 'EG', 'EGY', 'Egypt', 'Arab Republic of Egypt', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (66, 'SV', 'SLV', 'El Salvador', 'Republic of El Salvador', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (67, 'GQ', 'GNQ', 'Equatorial Guinea', 'Republic of Equatorial Guinea', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (68, 'ER', 'ERI', 'Eritrea', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (69, 'EE', 'EST', 'Estonia', 'Republic of Estonia', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (70, 'ET', 'ETH', 'Ethiopia', 'Federal Democratic Republic of Ethiopia', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (71, 'FK', 'FLK', 'Falkland Islands (Malvinas)', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (72, 'FO', 'FRO', 'Faroe Islands', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (73, 'FJ', 'FJI', 'Fiji', 'Republic of the Fiji Islands', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (74, 'FI', 'FIN', 'Finland', 'Republic of Finland', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (75, 'FR', 'FRA', 'France', 'French Republic', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (76, 'GF', 'GUF', 'French Guiana', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (77, 'PF', 'PYF', 'French Polynesia', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (78, 'TF', 'ATF', 'French Southern Territories', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (79, 'GA', 'GAB', 'Gabon', 'Gabonese Republic', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (80, 'GM', 'GMB', 'Gambia', 'Republic of the Gambia', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (81, 'GE', 'GEO', 'Georgia', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (82, 'DE', 'DEU', 'Germany', 'Federal Republic of Germany', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (83, 'GH', 'GHA', 'Ghana', 'Republic of Ghana', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (84, 'GI', 'GIB', 'Gibraltar', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (85, 'GR', 'GRC', 'Greece', 'Hellenic Republic', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (86, 'GL', 'GRL', 'Greenland', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (87, 'GD', 'GRD', 'Grenada', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (88, 'GP', 'GLP', 'Guadeloupe', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (89, 'GU', 'GUM', 'Guam', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (90, 'GT', 'GTM', 'Guatemala', 'Republic of Guatemala', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (91, 'GN', 'GIN', 'Guinea', 'Republic of Guinea', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (92, 'GW', 'GNB', 'Guinea-Bissau', 'Republic of Guinea-Bissau', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (93, 'GY', 'GUY', 'Guyana', 'Republic of Guyana', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (94, 'HT', 'HTI', 'Haiti', 'Republic of Haiti', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (95, 'HM', 'HMD', 'Heard Island and McDonald Islands', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (96, 'VA', 'VAT', 'Holy See (Vatican City State)', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (97, 'HN', 'HND', 'Honduras', 'Republic of Honduras', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (98, 'HK', 'HKG', 'Hong Kong', 'Hong Kong Special Administrative Region of China', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (99, 'HU', 'HUN', 'Hungary', 'Republic of Hungary', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (100, 'IS', 'ISL', 'Iceland', 'Republic of Iceland', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (101, 'IN', 'IND', 'India', 'Republic of India', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (102, 'ID', 'IDN', 'Indonesia', 'Republic of Indonesia', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (103, 'IR', 'IRN', 'Iran, Islamic Republic of', 'Islamic Republic of Iran', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (104, 'IQ', 'IRQ', 'Iraq', 'Republic of Iraq', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (105, 'IE', 'IRL', 'Ireland', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (106, 'IL', 'ISR', 'Israel', 'State of Israel', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (107, 'IT', 'ITA', 'Italy', 'Italian Republic', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (108, 'JM', 'JAM', 'Jamaica', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (109, 'JP', 'JPN', 'Japan', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (110, 'JO', 'JOR', 'Jordan', 'Hashemite Kingdom of Jordan', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (111, 'KZ', 'KAZ', 'Kazakhstan', 'Republic of Kazakhstan', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (112, 'KE', 'KEN', 'Kenya', 'Republic of Kenya', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (113, 'KI', 'KIR', 'Kiribati', 'Republic of Kiribati', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (114, 'KP', 'PRK', 'Korea, Democratic People''s Republic of', 'Democratic People''s Republic of Korea', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (115, 'KR', 'KOR', 'Korea, Republic of', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (116, 'KW', 'KWT', 'Kuwait', 'State of Kuwait', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (117, 'KG', 'KGZ', 'Kyrgyzstan', 'Kyrgyz Republic', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (118, 'LA', 'LAO', 'Lao People''s Democratic Republic', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (119, 'LV', 'LVA', 'Latvia', 'Republic of Latvia', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (120, 'LB', 'LBN', 'Lebanon', 'Lebanese Republic', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (121, 'LS', 'LSO', 'Lesotho', 'Kingdom of Lesotho', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (122, 'LR', 'LBR', 'Liberia', 'Republic of Liberia', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (123, 'LY', 'LBY', 'Libyan Arab Jamahiriya', 'Socialist People''s Libyan Arab Jamahiriya', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (124, 'LI', 'LIE', 'Liechtenstein', 'Principality of Liechtenstein', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (125, 'LT', 'LTU', 'Lithuania', 'Republic of Lithuania', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (126, 'LU', 'LUX', 'Luxembourg', 'Grand Duchy of Luxembourg', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (127, 'MO', 'MAC', 'Macao', 'Macao Special Administrative Region of China', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (128, 'MK', 'MKD', 'Macedonia, Republic of', 'The Former Yugoslav Republic of Macedonia', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (129, 'MG', 'MDG', 'Madagascar', 'Republic of Madagascar', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (130, 'MW', 'MWI', 'Malawi', 'Republic of Malawi', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (131, 'MY', 'MYS', 'Malaysia', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (132, 'MV', 'MDV', 'Maldives', 'Republic of Maldives', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (133, 'ML', 'MLI', 'Mali', 'Republic of Mali', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (134, 'MT', 'MLT', 'Malta', 'Republic of Malta', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (135, 'MH', 'MHL', 'Marshall Islands', 'Republic of the Marshall Islands', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (136, 'MQ', 'MTQ', 'Martinique', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (137, 'MR', 'MRT', 'Mauritania', 'Islamic Republic of Mauritania', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (138, 'MU', 'MUS', 'Mauritius', 'Republic of Mauritius', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (139, 'YT', 'MYT', 'Mayotte', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (140, 'MX', 'MEX', 'Mexico', 'United Mexican States', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (141, 'FM', 'FSM', 'Micronesia, Federated States of', 'Federated States of Micronesia', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (142, 'MD', 'MDA', 'Moldova, Republic of', 'Republic of Moldova', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (143, 'MC', 'MCO', 'Monaco', 'Principality of Monaco', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (144, 'MN', 'MNG', 'Mongolia', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (145, 'MS', 'MSR', 'Montserrat', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (146, 'MA', 'MAR', 'Morocco', 'Kingdom of Morocco', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (147, 'MZ', 'MOZ', 'Mozambique', 'Republic of Mozambique', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (148, 'MM', 'MMR', 'Myanmar', 'Union of Myanmar', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (149, 'NA', 'NAM', 'Namibia', 'Republic of Namibia', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (150, 'NR', 'NRU', 'Nauru', 'Republic of Nauru', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (151, 'NP', 'NPL', 'Nepal', 'Kingdom of Nepal', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (152, 'NL', 'NLD', 'Netherlands', 'Kingdom of the Netherlands', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (153, 'AN', 'ANT', 'Netherlands Antilles', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (154, 'NC', 'NCL', 'New Caledonia', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (155, 'NZ', 'NZL', 'New Zealand', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (156, 'NI', 'NIC', 'Nicaragua', 'Republic of Nicaragua', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (157, 'NE', 'NER', 'Niger', 'Republic of the Niger', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (158, 'NG', 'NGA', 'Nigeria', 'Federal Republic of Nigeria', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (159, 'NU', 'NIU', 'Niue', 'Republic of Niue', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (160, 'NF', 'NFK', 'Norfolk Island', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (161, 'MP', 'MNP', 'Northern Mariana Islands', 'Commonwealth of the Northern Mariana Islands', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (162, 'NO', 'NOR', 'Norway', 'Kingdom of Norway', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (163, 'OM', 'OMN', 'Oman', 'Sultanate of Oman', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (164, 'PK', 'PAK', 'Pakistan', 'Islamic Republic of Pakistan', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (165, 'PW', 'PLW', 'Palau', 'Republic of Palau', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (166, 'PS', 'PSE', 'Palestinian Territory, Occupied', 'Occupied Palestinian Territory', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (167, 'PA', 'PAN', 'Panama', 'Republic of Panama', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (168, 'PG', 'PNG', 'Papua New Guinea', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (169, 'PY', 'PRY', 'Paraguay', 'Republic of Paraguay', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (170, 'PE', 'PER', 'Peru', 'Republic of Peru', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (171, 'PH', 'PHL', 'Philippines', 'Republic of the Philippines', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (172, 'PN', 'PCN', 'Pitcairn', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (173, 'PL', 'POL', 'Poland', 'Republic of Poland', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (174, 'PT', 'PRT', 'Portugal', 'Portuguese Republic', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (175, 'PR', 'PRI', 'Puerto Rico', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (176, 'QA', 'QAT', 'Qatar', 'State of Qatar', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (177, 'RE', 'REU', 'Reunion', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (178, 'RO', 'ROU', 'Romania', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (179, 'RU', 'RUS', 'Russian Federation', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (180, 'RW', 'RWA', 'Rwanda', 'Rwandese Republic', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (181, 'SH', 'SHN', 'Saint Helena', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (182, 'KN', 'KNA', 'Saint Kitts and Nevis', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (183, 'LC', 'LCA', 'Saint Lucia', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (184, 'PM', 'SPM', 'Saint Pierre and Miquelon', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (185, 'VC', 'VCT', 'Saint Vincent and the Grenadines', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (186, 'WS', 'WSM', 'Samoa', 'Independent State of Samoa', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (187, 'SM', 'SMR', 'San Marino', 'Republic of San Marino', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (188, 'ST', 'STP', 'Sao Tome and Principe', 'Democratic Republic of Sao Tome and Principe', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (189, 'SA', 'SAU', 'Saudi Arabia', 'Kingdom of Saudi Arabia', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (190, 'SN', 'SEN', 'Senegal', 'Republic of Senegal', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (191, 'SC', 'SYC', 'Seychelles', 'Republic of Seychelles', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (192, 'SL', 'SLE', 'Sierra Leone', 'Republic of Sierra Leone', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (193, 'SG', 'SGP', 'Singapore', 'Republic of Singapore', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (194, 'SK', 'SVK', 'Slovakia', 'Slovak Republic', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (195, 'SI', 'SVN', 'Slovenia', 'Republic of Slovenia', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (196, 'SB', 'SLB', 'Solomon Islands', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (197, 'SO', 'SOM', 'Somalia', 'Somali Republic', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (198, 'ZA', 'ZAF', 'South Africa', 'Republic of South Africa', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (199, 'GS', 'SGS', 'South Georgia and the South Sandwich Islands', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (200, 'ES', 'ESP', 'Spain', 'Kingdom of Spain', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (201, 'LK', 'LKA', 'Sri Lanka', 'Democratic Socialist Republic of Sri Lanka', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (202, 'SD', 'SDN', 'Sudan', 'Republic of the Sudan', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (203, 'SR', 'SUR', 'Suriname', 'Republic of Suriname', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (204, 'SJ', 'SJM', 'Svalbard and Jan Mayen', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (205, 'SZ', 'SWZ', 'Swaziland', 'Kingdom of Swaziland', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (206, 'SE', 'SWE', 'Sweden', 'Kingdom of Sweden', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (207, 'CH', 'CHE', 'Switzerland', 'Swiss Confederation', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (208, 'SY', 'SYR', 'Syrian Arab Republic', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (210, 'TJ', 'TJK', 'Tajikistan', 'Republic of Tajikistan', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (211, 'TZ', 'TZA', 'Tanzania, United Republic of', 'United Republic of Tanzania', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (212, 'TH', 'THA', 'Thailand', 'Kingdom of Thailand', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (213, 'TG', 'TGO', 'Togo', 'Togolese Republic', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (214, 'TK', 'TKL', 'Tokelau', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (215, 'TO', 'TON', 'Tonga', 'Kingdom of Tonga', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (216, 'TT', 'TTO', 'Trinidad and Tobago', 'Republic of Trinidad and Tobago', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (217, 'TN', 'TUN', 'Tunisia', 'Republic of Tunisia', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (218, 'TR', 'TUR', 'Turkey', 'Republic of Turkey', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (219, 'TM', 'TKM', 'Turkmenistan', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (220, 'TC', 'TCA', 'Turks and Caicos Islands', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (221, 'TV', 'TUV', 'Tuvalu', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (222, 'UG', 'UGA', 'Uganda', 'Republic of Uganda', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (223, 'UA', 'UKR', 'Ukraine', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (224, 'AE', 'ARE', 'United Arab Emirates', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (225, 'GB', 'GBR', 'United Kingdom', 'United Kingdom of Great Britain and Northern Ireland', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (226, 'US', 'USA', 'United States', 'United States of America', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (227, 'UM', 'UMI', 'United States Minor Outlying Islands', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (228, 'UY', 'URY', 'Uruguay', 'Eastern Republic of Uruguay', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (229, 'UZ', 'UZB', 'Uzbekistan', 'Republic of Uzbekistan', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (230, 'VU', 'VUT', 'Vanuatu', 'Republic of Vanuatu', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (231, 'VE', 'VEN', 'Venezuela', 'Bolivarian Republic of Venezuela', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (232, 'VN', 'VNM', 'Viet Nam', 'Socialist Republic of Viet Nam', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (233, 'VG', 'VGB', 'Virgin Islands, British', 'British Virgin Islands', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (234, 'VI', 'VIR', 'Virgin Islands, U.S.', 'Virgin Islands of the United States', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (235, 'WF', 'WLF', 'Wallis and Futuna', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (236, 'EH', 'ESH', 'Western Sahara', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (237, 'YE', 'YEM', 'Yemen', 'Republic of Yemen', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (238, 'ZM', 'ZMB', 'Zambia', 'Republic of Zambia', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (239, 'ZW', 'ZWE', 'Zimbabwe', 'Republic of Zimbabwe', NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (240, 'CS', 'SCG', 'Serbia and Montenegro', NULL, NULL);
INSERT INTO country (id, iso3166code2, iso3166code3, name, title, description) VALUES (209, 'TW', 'TWN', 'Taiwan', 'Taiwan', NULL);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'country'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'spokenin'::pg_catalog.regclass;

INSERT INTO spokenin ("language", country, id) VALUES (149, 225, 1);
INSERT INTO spokenin ("language", country, id) VALUES (159, 101, 2);
INSERT INTO spokenin ("language", country, id) VALUES (146, 225, 3);
INSERT INTO spokenin ("language", country, id) VALUES (147, 105, 4);
INSERT INTO spokenin ("language", country, id) VALUES (148, 200, 5);
INSERT INTO spokenin ("language", country, id) VALUES (247, 222, 6);
INSERT INTO spokenin ("language", country, id) VALUES (235, 118, 7);
INSERT INTO spokenin ("language", country, id) VALUES (403, 179, 8);
INSERT INTO spokenin ("language", country, id) VALUES (427, 218, 9);
INSERT INTO spokenin ("language", country, id) VALUES (64, 68, 10);
INSERT INTO spokenin ("language", country, id) VALUES (241, 125, 11);
INSERT INTO spokenin ("language", country, id) VALUES (410, 212, 12);
INSERT INTO spokenin ("language", country, id) VALUES (413, 68, 13);
INSERT INTO spokenin ("language", country, id) VALUES (466, 68, 14);
INSERT INTO spokenin ("language", country, id) VALUES (413, 70, 15);
INSERT INTO spokenin ("language", country, id) VALUES (467, 70, 16);
INSERT INTO spokenin ("language", country, id) VALUES (408, 210, 17);
INSERT INTO spokenin ("language", country, id) VALUES (404, 101, 18);
INSERT INTO spokenin ("language", country, id) VALUES (401, 101, 19);
INSERT INTO spokenin ("language", country, id) VALUES (457, 226, 20);
INSERT INTO spokenin ("language", country, id) VALUES (144, 68, 21);
INSERT INTO spokenin ("language", country, id) VALUES (468, 68, 22);
INSERT INTO spokenin ("language", country, id) VALUES (144, 70, 23);
INSERT INTO spokenin ("language", country, id) VALUES (469, 70, 24);
INSERT INTO spokenin ("language", country, id) VALUES (143, 15, 25);
INSERT INTO spokenin ("language", country, id) VALUES (470, 15, 26);
INSERT INTO spokenin ("language", country, id) VALUES (143, 22, 27);
INSERT INTO spokenin ("language", country, id) VALUES (471, 22, 28);
INSERT INTO spokenin ("language", country, id) VALUES (143, 207, 29);
INSERT INTO spokenin ("language", country, id) VALUES (472, 207, 30);
INSERT INTO spokenin ("language", country, id) VALUES (143, 82, 31);
INSERT INTO spokenin ("language", country, id) VALUES (473, 82, 32);
INSERT INTO spokenin ("language", country, id) VALUES (143, 126, 33);
INSERT INTO spokenin ("language", country, id) VALUES (474, 126, 34);
INSERT INTO spokenin ("language", country, id) VALUES (100, 59, 35);
INSERT INTO spokenin ("language", country, id) VALUES (204, 101, 36);
INSERT INTO spokenin ("language", country, id) VALUES (157, 85, 37);
INSERT INTO spokenin ("language", country, id) VALUES (119, 14, 38);
INSERT INTO spokenin ("language", country, id) VALUES (475, 14, 39);
INSERT INTO spokenin ("language", country, id) VALUES (119, 29, 40);
INSERT INTO spokenin ("language", country, id) VALUES (476, 29, 41);
INSERT INTO spokenin ("language", country, id) VALUES (119, 39, 42);
INSERT INTO spokenin ("language", country, id) VALUES (477, 39, 43);
INSERT INTO spokenin ("language", country, id) VALUES (119, 59, 44);
INSERT INTO spokenin ("language", country, id) VALUES (478, 59, 45);
INSERT INTO spokenin ("language", country, id) VALUES (119, 225, 46);
INSERT INTO spokenin ("language", country, id) VALUES (479, 225, 47);
INSERT INTO spokenin ("language", country, id) VALUES (119, 98, 48);
INSERT INTO spokenin ("language", country, id) VALUES (480, 98, 49);
INSERT INTO spokenin ("language", country, id) VALUES (119, 105, 50);
INSERT INTO spokenin ("language", country, id) VALUES (481, 105, 51);
INSERT INTO spokenin ("language", country, id) VALUES (119, 101, 52);
INSERT INTO spokenin ("language", country, id) VALUES (482, 101, 53);
INSERT INTO spokenin ("language", country, id) VALUES (119, 155, 54);
INSERT INTO spokenin ("language", country, id) VALUES (483, 155, 55);
INSERT INTO spokenin ("language", country, id) VALUES (119, 171, 56);
INSERT INTO spokenin ("language", country, id) VALUES (484, 171, 57);
INSERT INTO spokenin ("language", country, id) VALUES (119, 193, 58);
INSERT INTO spokenin ("language", country, id) VALUES (485, 193, 59);
INSERT INTO spokenin ("language", country, id) VALUES (119, 226, 60);
INSERT INTO spokenin ("language", country, id) VALUES (486, 226, 61);
INSERT INTO spokenin ("language", country, id) VALUES (119, 198, 62);
INSERT INTO spokenin ("language", country, id) VALUES (487, 198, 63);
INSERT INTO spokenin ("language", country, id) VALUES (119, 239, 64);
INSERT INTO spokenin ("language", country, id) VALUES (488, 239, 65);
INSERT INTO spokenin ("language", country, id) VALUES (76, 45, 66);
INSERT INTO spokenin ("language", country, id) VALUES (489, 45, 67);
INSERT INTO spokenin ("language", country, id) VALUES (76, 98, 68);
INSERT INTO spokenin ("language", country, id) VALUES (490, 98, 69);
INSERT INTO spokenin ("language", country, id) VALUES (76, 193, 70);
INSERT INTO spokenin ("language", country, id) VALUES (491, 193, 71);
INSERT INTO spokenin ("language", country, id) VALUES (76, 209, 72);
INSERT INTO spokenin ("language", country, id) VALUES (492, 209, 73);
INSERT INTO spokenin ("language", country, id) VALUES (41, 200, 74);
INSERT INTO spokenin ("language", country, id) VALUES (493, 200, 75);
INSERT INTO spokenin ("language", country, id) VALUES (41, 75, 76);
INSERT INTO spokenin ("language", country, id) VALUES (494, 75, 77);
INSERT INTO spokenin ("language", country, id) VALUES (122, 69, 78);
INSERT INTO spokenin ("language", country, id) VALUES (387, 11, 79);
INSERT INTO spokenin ("language", country, id) VALUES (495, 11, 80);
INSERT INTO spokenin ("language", country, id) VALUES (387, 27, 81);
INSERT INTO spokenin ("language", country, id) VALUES (496, 27, 82);
INSERT INTO spokenin ("language", country, id) VALUES (387, 44, 83);
INSERT INTO spokenin ("language", country, id) VALUES (497, 44, 84);
INSERT INTO spokenin ("language", country, id) VALUES (387, 48, 85);
INSERT INTO spokenin ("language", country, id) VALUES (498, 48, 86);
INSERT INTO spokenin ("language", country, id) VALUES (387, 53, 87);
INSERT INTO spokenin ("language", country, id) VALUES (499, 53, 88);
INSERT INTO spokenin ("language", country, id) VALUES (387, 62, 89);
INSERT INTO spokenin ("language", country, id) VALUES (500, 62, 90);
INSERT INTO spokenin ("language", country, id) VALUES (387, 64, 91);
INSERT INTO spokenin ("language", country, id) VALUES (501, 64, 92);
INSERT INTO spokenin ("language", country, id) VALUES (387, 200, 93);
INSERT INTO spokenin ("language", country, id) VALUES (502, 200, 94);
INSERT INTO spokenin ("language", country, id) VALUES (387, 90, 95);
INSERT INTO spokenin ("language", country, id) VALUES (503, 90, 96);
INSERT INTO spokenin ("language", country, id) VALUES (387, 97, 97);
INSERT INTO spokenin ("language", country, id) VALUES (504, 97, 98);
INSERT INTO spokenin ("language", country, id) VALUES (387, 140, 99);
INSERT INTO spokenin ("language", country, id) VALUES (505, 140, 100);
INSERT INTO spokenin ("language", country, id) VALUES (387, 156, 101);
INSERT INTO spokenin ("language", country, id) VALUES (506, 156, 102);
INSERT INTO spokenin ("language", country, id) VALUES (387, 167, 103);
INSERT INTO spokenin ("language", country, id) VALUES (507, 167, 104);
INSERT INTO spokenin ("language", country, id) VALUES (387, 170, 105);
INSERT INTO spokenin ("language", country, id) VALUES (508, 170, 106);
INSERT INTO spokenin ("language", country, id) VALUES (387, 175, 107);
INSERT INTO spokenin ("language", country, id) VALUES (509, 175, 108);
INSERT INTO spokenin ("language", country, id) VALUES (387, 169, 109);
INSERT INTO spokenin ("language", country, id) VALUES (510, 169, 110);
INSERT INTO spokenin ("language", country, id) VALUES (387, 66, 111);
INSERT INTO spokenin ("language", country, id) VALUES (511, 66, 112);
INSERT INTO spokenin ("language", country, id) VALUES (387, 226, 113);
INSERT INTO spokenin ("language", country, id) VALUES (512, 226, 114);
INSERT INTO spokenin ("language", country, id) VALUES (387, 228, 115);
INSERT INTO spokenin ("language", country, id) VALUES (513, 228, 116);
INSERT INTO spokenin ("language", country, id) VALUES (387, 231, 117);
INSERT INTO spokenin ("language", country, id) VALUES (514, 231, 118);
INSERT INTO spokenin ("language", country, id) VALUES (348, 179, 119);
INSERT INTO spokenin ("language", country, id) VALUES (515, 179, 120);
INSERT INTO spokenin ("language", country, id) VALUES (348, 223, 121);
INSERT INTO spokenin ("language", country, id) VALUES (516, 223, 122);
INSERT INTO spokenin ("language", country, id) VALUES (202, 86, 123);
INSERT INTO spokenin ("language", country, id) VALUES (346, 178, 124);
INSERT INTO spokenin ("language", country, id) VALUES (45, 21, 125);
INSERT INTO spokenin ("language", country, id) VALUES (62, 34, 126);
INSERT INTO spokenin ("language", country, id) VALUES (435, 223, 127);
INSERT INTO spokenin ("language", country, id) VALUES (451, 22, 128);
INSERT INTO spokenin ("language", country, id) VALUES (47, 19, 129);
INSERT INTO spokenin ("language", country, id) VALUES (517, 19, 130);
INSERT INTO spokenin ("language", country, id) VALUES (47, 101, 131);
INSERT INTO spokenin ("language", country, id) VALUES (518, 101, 132);
INSERT INTO spokenin ("language", country, id) VALUES (58, 75, 133);
INSERT INTO spokenin ("language", country, id) VALUES (56, 28, 134);
INSERT INTO spokenin ("language", country, id) VALUES (196, 109, 135);
INSERT INTO spokenin ("language", country, id) VALUES (316, 70, 136);
INSERT INTO spokenin ("language", country, id) VALUES (519, 70, 137);
INSERT INTO spokenin ("language", country, id) VALUES (316, 112, 138);
INSERT INTO spokenin ("language", country, id) VALUES (520, 112, 139);
INSERT INTO spokenin ("language", country, id) VALUES (313, 75, 140);
INSERT INTO spokenin ("language", country, id) VALUES (454, 198, 141);
INSERT INTO spokenin ("language", country, id) VALUES (68, 200, 142);
INSERT INTO spokenin ("language", country, id) VALUES (449, 225, 143);
INSERT INTO spokenin ("language", country, id) VALUES (98, 58, 144);
INSERT INTO spokenin ("language", country, id) VALUES (237, 119, 145);
INSERT INTO spokenin ("language", country, id) VALUES (334, 31, 146);
INSERT INTO spokenin ("language", country, id) VALUES (521, 31, 147);
INSERT INTO spokenin ("language", country, id) VALUES (334, 174, 148);
INSERT INTO spokenin ("language", country, id) VALUES (522, 174, 149);
INSERT INTO spokenin ("language", country, id) VALUES (409, 171, 150);
INSERT INTO spokenin ("language", country, id) VALUES (325, 101, 151);
INSERT INTO spokenin ("language", country, id) VALUES (333, 173, 152);
INSERT INTO spokenin ("language", country, id) VALUES (360, 55, 153);
INSERT INTO spokenin ("language", country, id) VALUES (174, 99, 154);
INSERT INTO spokenin ("language", country, id) VALUES (169, 101, 155);
INSERT INTO spokenin ("language", country, id) VALUES (165, 106, 156);
INSERT INTO spokenin ("language", country, id) VALUES (439, 229, 157);
INSERT INTO spokenin ("language", country, id) VALUES (258, 101, 158);
INSERT INTO spokenin ("language", country, id) VALUES (279, 144, 159);
INSERT INTO spokenin ("language", country, id) VALUES (260, 155, 160);
INSERT INTO spokenin ("language", country, id) VALUES (252, 128, 161);
INSERT INTO spokenin ("language", country, id) VALUES (274, 134, 162);
INSERT INTO spokenin ("language", country, id) VALUES (264, 131, 163);
INSERT INTO spokenin ("language", country, id) VALUES (262, 101, 164);
INSERT INTO spokenin ("language", country, id) VALUES (1, 60, 165);
INSERT INTO spokenin ("language", country, id) VALUES (523, 60, 166);
INSERT INTO spokenin ("language", country, id) VALUES (1, 68, 167);
INSERT INTO spokenin ("language", country, id) VALUES (524, 68, 168);
INSERT INTO spokenin ("language", country, id) VALUES (1, 70, 169);
INSERT INTO spokenin ("language", country, id) VALUES (525, 70, 170);
INSERT INTO spokenin ("language", country, id) VALUES (9, 198, 171);
INSERT INTO spokenin ("language", country, id) VALUES (442, 232, 172);
INSERT INTO spokenin ("language", country, id) VALUES (178, 100, 173);
INSERT INTO spokenin ("language", country, id) VALUES (15, 70, 174);
INSERT INTO spokenin ("language", country, id) VALUES (193, 207, 175);
INSERT INTO spokenin ("language", country, id) VALUES (526, 207, 176);
INSERT INTO spokenin ("language", country, id) VALUES (193, 107, 177);
INSERT INTO spokenin ("language", country, id) VALUES (527, 107, 178);
INSERT INTO spokenin ("language", country, id) VALUES (20, 200, 179);
INSERT INTO spokenin ("language", country, id) VALUES (18, 224, 180);
INSERT INTO spokenin ("language", country, id) VALUES (528, 224, 181);
INSERT INTO spokenin ("language", country, id) VALUES (18, 18, 182);
INSERT INTO spokenin ("language", country, id) VALUES (529, 18, 183);
INSERT INTO spokenin ("language", country, id) VALUES (18, 4, 184);
INSERT INTO spokenin ("language", country, id) VALUES (530, 4, 185);
INSERT INTO spokenin ("language", country, id) VALUES (18, 65, 186);
INSERT INTO spokenin ("language", country, id) VALUES (531, 65, 187);
INSERT INTO spokenin ("language", country, id) VALUES (18, 101, 188);
INSERT INTO spokenin ("language", country, id) VALUES (532, 101, 189);
INSERT INTO spokenin ("language", country, id) VALUES (18, 104, 190);
INSERT INTO spokenin ("language", country, id) VALUES (533, 104, 191);
INSERT INTO spokenin ("language", country, id) VALUES (18, 110, 192);
INSERT INTO spokenin ("language", country, id) VALUES (534, 110, 193);
INSERT INTO spokenin ("language", country, id) VALUES (18, 116, 194);
INSERT INTO spokenin ("language", country, id) VALUES (535, 116, 195);
INSERT INTO spokenin ("language", country, id) VALUES (18, 120, 196);
INSERT INTO spokenin ("language", country, id) VALUES (536, 120, 197);
INSERT INTO spokenin ("language", country, id) VALUES (18, 123, 198);
INSERT INTO spokenin ("language", country, id) VALUES (537, 123, 199);
INSERT INTO spokenin ("language", country, id) VALUES (18, 146, 200);
INSERT INTO spokenin ("language", country, id) VALUES (538, 146, 201);
INSERT INTO spokenin ("language", country, id) VALUES (18, 163, 202);
INSERT INTO spokenin ("language", country, id) VALUES (539, 163, 203);
INSERT INTO spokenin ("language", country, id) VALUES (18, 176, 204);
INSERT INTO spokenin ("language", country, id) VALUES (540, 176, 205);
INSERT INTO spokenin ("language", country, id) VALUES (18, 189, 206);
INSERT INTO spokenin ("language", country, id) VALUES (541, 189, 207);
INSERT INTO spokenin ("language", country, id) VALUES (18, 202, 208);
INSERT INTO spokenin ("language", country, id) VALUES (542, 202, 209);
INSERT INTO spokenin ("language", country, id) VALUES (18, 208, 210);
INSERT INTO spokenin ("language", country, id) VALUES (543, 208, 211);
INSERT INTO spokenin ("language", country, id) VALUES (18, 217, 212);
INSERT INTO spokenin ("language", country, id) VALUES (544, 217, 213);
INSERT INTO spokenin ("language", country, id) VALUES (18, 237, 214);
INSERT INTO spokenin ("language", country, id) VALUES (545, 237, 215);
INSERT INTO spokenin ("language", country, id) VALUES (464, 198, 216);
INSERT INTO spokenin ("language", country, id) VALUES (34, 16, 217);
INSERT INTO spokenin ("language", country, id) VALUES (187, 102, 218);
INSERT INTO spokenin ("language", country, id) VALUES (112, 22, 219);
INSERT INTO spokenin ("language", country, id) VALUES (546, 22, 220);
INSERT INTO spokenin ("language", country, id) VALUES (112, 152, 221);
INSERT INTO spokenin ("language", country, id) VALUES (547, 152, 222);
INSERT INTO spokenin ("language", country, id) VALUES (301, 162, 223);
INSERT INTO spokenin ("language", country, id) VALUES (305, 162, 224);
INSERT INTO spokenin ("language", country, id) VALUES (302, 162, 225);
INSERT INTO spokenin ("language", country, id) VALUES (296, 151, 226);
INSERT INTO spokenin ("language", country, id) VALUES (366, 70, 227);
INSERT INTO spokenin ("language", country, id) VALUES (88, 225, 228);
INSERT INTO spokenin ("language", country, id) VALUES (412, 68, 229);
INSERT INTO spokenin ("language", country, id) VALUES (132, 22, 230);
INSERT INTO spokenin ("language", country, id) VALUES (548, 22, 231);
INSERT INTO spokenin ("language", country, id) VALUES (132, 39, 232);
INSERT INTO spokenin ("language", country, id) VALUES (549, 39, 233);
INSERT INTO spokenin ("language", country, id) VALUES (132, 207, 234);
INSERT INTO spokenin ("language", country, id) VALUES (550, 207, 235);
INSERT INTO spokenin ("language", country, id) VALUES (132, 75, 236);
INSERT INTO spokenin ("language", country, id) VALUES (551, 75, 237);
INSERT INTO spokenin ("language", country, id) VALUES (132, 126, 238);
INSERT INTO spokenin ("language", country, id) VALUES (552, 126, 239);
INSERT INTO spokenin ("language", country, id) VALUES (329, 103, 240);
INSERT INTO spokenin ("language", country, id) VALUES (129, 74, 241);
INSERT INTO spokenin ("language", country, id) VALUES (126, 72, 242);
INSERT INTO spokenin ("language", country, id) VALUES (142, 81, 243);
INSERT INTO spokenin ("language", country, id) VALUES (12, 3, 244);
INSERT INTO spokenin ("language", country, id) VALUES (222, 115, 245);
INSERT INTO spokenin ("language", country, id) VALUES (397, 74, 246);
INSERT INTO spokenin ("language", country, id) VALUES (553, 74, 247);
INSERT INTO spokenin ("language", country, id) VALUES (397, 206, 248);
INSERT INTO spokenin ("language", country, id) VALUES (554, 206, 249);
INSERT INTO spokenin ("language", country, id) VALUES (386, 198, 250);
INSERT INTO spokenin ("language", country, id) VALUES (371, 194, 251);
INSERT INTO spokenin ("language", country, id) VALUES (384, 60, 252);
INSERT INTO spokenin ("language", country, id) VALUES (555, 60, 253);
INSERT INTO spokenin ("language", country, id) VALUES (384, 70, 254);
INSERT INTO spokenin ("language", country, id) VALUES (556, 70, 255);
INSERT INTO spokenin ("language", country, id) VALUES (384, 112, 256);
INSERT INTO spokenin ("language", country, id) VALUES (557, 112, 257);
INSERT INTO spokenin ("language", country, id) VALUES (384, 197, 258);
INSERT INTO spokenin ("language", country, id) VALUES (558, 197, 259);
INSERT INTO spokenin ("language", country, id) VALUES (372, 195, 260);
INSERT INTO spokenin ("language", country, id) VALUES (374, 162, 261);
INSERT INTO spokenin ("language", country, id) VALUES (135, 152, 335);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'spokenin'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'license'::pg_catalog.regclass;

INSERT INTO license (id, legalese) VALUES (1, 'GPL-2');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'license'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'potemplate'::pg_catalog.regclass;

INSERT INTO potemplate (id, priority, title, description, copyright, license, datecreated, "path", iscurrent, messagecount, "owner", rawimporter, daterawimport, rawimportstatus, sourcepackagename, distrorelease, sourcepackageversion, header, potemplatename, productrelease, binarypackagename, languagepack, filename, rawfile) VALUES (2, NULL, 'Template for pmount in hoary', NULL, NULL, NULL, '2005-03-24 19:59:31.439579', 'po', true, 63, 30, 30, '2005-05-06 20:07:24.255804', 3, 14, 3, '0.7.2-0ubuntu1', 'Project-Id-Version: PACKAGE VERSION
Report-Msgid-Bugs-To: martin.pitt@canonical.com
POT-Creation-Date: 2005-04-04 17:43+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: LANGUAGE <LL@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=CHARSET
Content-Transfer-Encoding: 8bit
', 2, NULL, 13, true, 'template.pot', 6);
INSERT INTO potemplate (id, priority, title, description, copyright, license, datecreated, "path", iscurrent, messagecount, "owner", rawimporter, daterawimport, rawimportstatus, sourcepackagename, distrorelease, sourcepackageversion, header, potemplatename, productrelease, binarypackagename, languagepack, filename, rawfile) VALUES (4, NULL, 'Template for evolution in hoary', NULL, NULL, NULL, '2005-05-06 20:39:27.778946', 'po', true, 22, 30, 13, '2005-05-06 20:40:52.942183', 3, 9, 3, NULL, 'Project-Id-Version: PACKAGE VERSION
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2005-04-07 14:10+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: LANGUAGE <LL@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ASCII
Content-Transfer-Encoding: 8bit
', 1, NULL, NULL, true, 'evolution-2.2.pot', 8);
INSERT INTO potemplate (id, priority, title, description, copyright, license, datecreated, "path", iscurrent, messagecount, "owner", rawimporter, daterawimport, rawimportstatus, sourcepackagename, distrorelease, sourcepackageversion, header, potemplatename, productrelease, binarypackagename, languagepack, filename, rawfile) VALUES (1, NULL, 'Template for evolution''s branch 2.1.6', 'Template for evolution in hoary', NULL, NULL, '2005-03-18 18:20:12.273149', 'po', true, 22, 30, 13, '2005-04-07 13:12:39.892924', 3, NULL, NULL, NULL, 'Project-Id-Version: PACKAGE VERSION
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2005-04-07 14:10+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: LANGUAGE <LL@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ASCII
Content-Transfer-Encoding: 8bit
', 1, 6, NULL, false, NULL, 7);
INSERT INTO potemplate (id, priority, title, description, copyright, license, datecreated, "path", iscurrent, messagecount, "owner", rawimporter, daterawimport, rawimportstatus, sourcepackagename, distrorelease, sourcepackageversion, header, potemplatename, productrelease, binarypackagename, languagepack, filename, rawfile) VALUES (5, NULL, 'pkgconf-mozilla for mozilla in hoary', NULL, NULL, NULL, '2005-05-06 21:10:17.367605', 'debian/po', true, 9, 30, 30, '2005-05-06 21:10:39.821363', 3, 16, 3, '2:1.7.6-1ubuntu2', 'Project-Id-Version: PACKAGE VERSION
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2004-07-11 16:16+0900
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: LANGUAGE <LL@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=CHARSET
Content-Transfer-Encoding: 8bit
', 4, NULL, NULL, false, 'templates.pot', 9);
INSERT INTO potemplate (id, priority, title, description, copyright, license, datecreated, "path", iscurrent, messagecount, "owner", rawimporter, daterawimport, rawimportstatus, sourcepackagename, distrorelease, sourcepackageversion, header, potemplatename, productrelease, binarypackagename, languagepack, filename, rawfile) VALUES (3, NULL, 'Template for netapplet in hoary', NULL, NULL, NULL, '2005-05-06 20:06:59.867977', 'po', true, 43, 30, 30, '2005-05-06 20:06:59.867977', 3, 10, 3, '0.99.4-2ubuntu1', 'Project-Id-Version: PACKAGE VERSION
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2004-08-24 16:09-0400
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: LANGUAGE <LL@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=CHARSET
Content-Transfer-Encoding: 8bit
', 3, NULL, NULL, true, 'netapplet.pot', 5);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'potemplate'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'pofile'::pg_catalog.regclass;

INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (11, 2, 387, 'Rosetta Spanish translation of pmount', NULL, ' Spanish translation for mount removable devices as normal user
 Copyright (c) (c) 2005 Canonical Ltd, and Rosetta Contributors 2005
 This file is distributed under the same license as the mount removable devices as normal user package.
 FIRST AUTHOR <EMAIL@ADDRESS>, 2005.

', 'Project-Id-Version: mount removable devices as normal user
Report-Msgid-Bugs-To: martin.pitt@canonical.com
POT-Creation-Date: 2005-04-04 17:31+0200
PO-Revision-Date: 2005-02-21 17:57+0000
Last-Translator: Aloriel <jorge.gonzalez.gonzalez@hispalinux.es>
Language-Team: Spanish <es@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rosetta-Version: 0.1
Plural-Forms: nplurals=2; plural=n != 1
X-Generator: Rosetta (http://launchpad.ubuntu.com/rosetta/)
', true, NULL, NULL, 54, 0, 0, NULL, 31, 2, NULL, NULL, 30, '2005-05-06 20:07:24.255804', 3, 18);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (20, 5, 241, 'Rosetta Lithuanian translation of mozilla', NULL, ' Lithuanian translation of mozilla.
 This file is distributed under the same license as the mozilla package.
 Kęstutis Biliūnas <kebil@kaunas.init.lt>, 2004.

', 'Project-Id-Version: mozilla
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2004-07-11 16:16+0900
PO-Revision-Date: 2004-10-24 14:14+0300
Last-Translator: Kęstutis Biliūnas <kebil@kaunas.init.lt>
Language-Team: Lithuanian <komp_lt@konferencijos.lt>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: KBabel 1.3.1
plural-forms: nplurals=3; plural=n%10==1 && n%100!=11 ? 0 : n%10>=2 && (n%100<10 || n%100>=20) ? 1 : 2
', true, NULL, NULL, 9, 0, 0, NULL, 31, 3, NULL, NULL, 30, '2005-05-06 21:10:39.821363', 3, 28);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (24, 5, 196, 'Rosetta Japanese translation of mozilla', NULL, '
    Translators, if you are not familiar with the PO format, gettext
    documentation is worth reading, especially sections dedicated to
    this format, e.g. by running:
         info -n ''(gettext)PO Files''
         info -n ''(gettext)Header Entry''

    Some information specific to po-debconf are available at
            /usr/share/doc/po-debconf/README-trans
         or http://www.debian.org/intl/l10n/po-debconf/README-trans

    Developers do not need to manually edit POT or PO files.

', 'Project-Id-Version: PACKAGE VERSION
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2004-07-11 16:16+0900
PO-Revision-Date: 2004-07-20 02:46+0900
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: LANGUAGE <LL@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=EUC-JP
Content-Transfer-Encoding: 8bit
plural-forms: nplurals=1; plural=0
', true, NULL, NULL, 9, 0, 0, NULL, 31, 1, NULL, NULL, 30, '2005-05-06 21:10:39.821363', 3, 21);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (12, 4, 387, 'Rosetta Spanish translation of evolution', NULL, ' traducción de es.po al Spanish
 translation of es.po to Spanish
 translation of evolution.HEAD to Spanish
 Copyright © 2000-2002 Free Software Foundation, Inc.
 This file is distributed under the same license as the evolution package.
 Carlos Perelló Marín <carlos@gnome-db.org>, 2000-2001.
 Héctor García Álvarez <hector@scouts-es.org>, 2000-2002.
 Ismael Olea <Ismael@olea.org>, 2001, (revisiones) 2003.
 Eneko Lacunza <enlar@iname.com>, 2001-2002.
 Héctor García Álvarez <hector@scouts-es.org>, 2002.
 Pablo Gonzalo del Campo <pablodc@bigfoot.com>,2003 (revisión).
 Francisco Javier F. Serrador <serrador@cvs.gnome.org>, 2003, 2004.


', 'Project-Id-Version: es
POT-Creation-Date: 2004-08-17 11:10+0200
PO-Revision-Date: 2005-04-07 13:22+0000
Last-Translator: Carlos Perelló Marín <carlos@canonical.com>
Language-Team: Spanish <traductores@es.gnome.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Report-Msgid-Bugs-To: serrador@hispalinux.es
X-Generator: Rosetta (http://launchpad.ubuntu.com/rosetta/)
Plural-Forms: nplurals=2; plural=(n != 1);
', true, NULL, NULL, 7, 0, 0, NULL, 31, 2, NULL, NULL, 13, '2005-05-06 21:05:21.272603', 3, 32);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (3, 2, 502, 'Rosetta Spanish (Spain) translation of pmount', NULL, ' Spanish (Spain) translation for mount removable devices as normal user
 Copyright (c) (c) 2005 Canonical Ltd, and Rosetta Contributors 2005
 This file is distributed under the same license as the mount removable devices as normal user package.
 FIRST AUTHOR <EMAIL@ADDRESS>, 2005.
', 'Project-Id-Version: mount removable devices as normal user
Report-Msgid-Bugs-To: martin.pitt@canonical.com
POT-Creation-Date: 2005-04-04 17:31+0200
PO-Revision-Date: 2005-03-15 21:19+0000
Last-Translator: Daniel Aguayo <danner@mixmail.com>
Language-Team: Spanish (Spain) <es_ES@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rosetta-Version: 0.1
Plural-Forms: nplurals=2; plural=n != 1
X-Generator: Rosetta (http://launchpad.ubuntu.com/rosetta/)
', true, NULL, NULL, 63, 0, 0, NULL, 31, 2, NULL, NULL, 30, '2005-05-06 20:07:24.255804', 3, 14);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (4, 2, 143, 'Rosetta German translation of pmount', NULL, ' German translations for PACKAGE package
 German messages for PACKAGE.
 Copyright (C) 2004 Martin Pitt
 This file is distributed under the same license as the PACKAGE package.
 Martin Pitt <martin.pitt@canonical.com>, 2004.

', 'Project-Id-Version: pmount 0.5
Report-Msgid-Bugs-To: martin.pitt@canonical.com
POT-Creation-Date: 2005-04-04 17:31+0200
PO-Revision-Date: 2004-12-29 17:56+0100
Last-Translator: Martin Pitt <martin.pitt@canonical.com>
Language-Team: German <de@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
', true, NULL, NULL, 63, 0, 0, NULL, 31, 2, NULL, NULL, 30, '2005-05-06 20:07:24.255804', 3, 15);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (21, 5, 98, 'Rosetta Czech translation of mozilla', NULL, '
    Translators, if you are not familiar with the PO format, gettext
    documentation is worth reading, especially sections dedicated to
    this format, e.g. by running:
         info -n ''(gettext)PO Files''
         info -n ''(gettext)Header Entry''

    Some information specific to po-debconf are available at
            /usr/share/doc/po-debconf/README-trans
         or http://www.debian.org/intl/l10n/po-debconf/README-trans

    Developers do not need to manually edit POT or PO files.

', 'Project-Id-Version: mozilla
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2004-07-11 16:16+0900
PO-Revision-Date: 2004-07-22 17:49+0200
Last-Translator: Miroslav Kure <kurem@debian.cz>
Language-Team: Czech <provoz@debian.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
plural-forms: nplurals=3; plural=n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2
', true, NULL, NULL, 9, 0, 0, NULL, 31, 3, NULL, NULL, 30, '2005-05-06 21:10:39.821363', 3, 24);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (1, 1, 387, 'Spanish translation for evolution in hoary', 'Spanish translation for evolution in hoary', ' traducción de es.po al Spanish
 translation of es.po to Spanish
 translation of evolution.HEAD to Spanish
 Copyright © 2000-2002 Free Software Foundation, Inc.
 This file is distributed under the same license as the evolution package.
 Carlos Perelló Marín <carlos@gnome-db.org>, 2000-2001.
 Héctor García Álvarez <hector@scouts-es.org>, 2000-2002.
 Ismael Olea <Ismael@olea.org>, 2001, (revisiones) 2003.
 Eneko Lacunza <enlar@iname.com>, 2001-2002.
 Héctor García Álvarez <hector@scouts-es.org>, 2002.
 Pablo Gonzalo del Campo <pablodc@bigfoot.com>,2003 (revisión).
 Francisco Javier F. Serrador <serrador@cvs.gnome.org>, 2003, 2004.


', 'Project-Id-Version: es
POT-Creation-Date: 2004-08-17 11:10+0200
PO-Revision-Date: 2005-04-07 13:22+0000
Last-Translator: Carlos Perelló Marín <carlos@canonical.com>
Language-Team: Spanish <traductores@es.gnome.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Report-Msgid-Bugs-To: serrador@hispalinux.es
X-Generator: Rosetta (http://launchpad.ubuntu.com/rosetta/)
Plural-Forms: nplurals=2; plural=(n != 1);
', true, NULL, NULL, 7, 0, 0, NULL, 12, 2, NULL, NULL, 13, '2005-04-07 13:18:57.59704', 2, 33);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (22, 5, 129, 'Rosetta Finnish translation of mozilla', NULL, '  translation of fi.po to Finnish
  mozilla translation

    Translators, if you are not familiar with the PO format, gettext
    documentation is worth reading, especially sections dedicated to
    this format, e.g. by running:
         info -n ''(gettext)PO Files''
         info -n ''(gettext)Header Entry''

    Some information specific to po-debconf are available at
            /usr/share/doc/po-debconf/README-trans
         or http://www.debian.org/intl/l10n/po-debconf/README-trans

    Developers do not need to manually edit POT or PO files.

 Matti Pöllä <mpo@iki.fi>, 2004.
', 'Project-Id-Version: mozilla
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2004-07-11 16:16+0900
PO-Revision-Date: 2004-08-15 22:41+0300
Last-Translator: Matti Pöllä <mpo@iki.fi>
Language-Team: Finnish <debian-l10n-finnish@lists.debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
plural-forms: nplurals=2; plural=n != 1
', true, NULL, NULL, 9, 0, 0, NULL, 31, 2, NULL, NULL, 30, '2005-05-06 21:10:39.821363', 3, 26);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (13, 5, 132, 'Rosetta French translation of mozilla', NULL, '
    Translators, if you are not familiar with the PO format, gettext
    documentation is worth reading, especially sections dedicated to
    this format, e.g. by running:
         info -n ''(gettext)PO Files''
         info -n ''(gettext)Header Entry''

    Some information specific to po-debconf are available at
            /usr/share/doc/po-debconf/README-trans
         or http://www.debian.org/intl/l10n/po-debconf/README-trans

    Developers do not need to manually edit POT or PO files.

', 'Project-Id-Version: mozilla 2:1.7.4-1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2004-07-11 16:16+0900
PO-Revision-Date: 2004-08-02 00:08+0200
Last-Translator: Denis Barbier <barbier@linuxfr.org>
Language-Team: French <debian-l10n-french@lists.debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit
plural-forms: nplurals=2; plural=n > 1
', true, NULL, NULL, 9, 0, 0, NULL, 31, 2, NULL, NULL, 30, '2005-05-06 21:10:39.821363', 3, 19);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (19, 5, 100, 'Rosetta Danish translation of mozilla', NULL, '
    Translators, if you are not familiar with the PO format, gettext
    documentation is worth reading, especially sections dedicated to
    this format, e.g. by running:
         info -n ''(gettext)PO Files''
         info -n ''(gettext)Header Entry''

    Some information specific to po-debconf are available at
            /usr/share/doc/po-debconf/README-trans
         or http://www.debian.org/intl/l10n/po-debconf/README-trans

    Developers do not need to manually edit POT or PO files.

', 'Project-Id-Version: mozilla 2:1.7.1-4
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2004-07-11 16:16+0900
PO-Revision-Date: 2004-07-31 22:49+0200
Last-Translator: Morten Brix Pedersen <morten@wtf.dk>
Language-Team: debian-l10n-danish <debian-l10n-danish@lists.debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
plural-forms: nplurals=2; plural=n != 1
', true, NULL, NULL, 9, 0, 0, NULL, 31, 2, NULL, NULL, 30, '2005-05-06 21:10:39.821363', 3, 25);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (18, 5, 193, 'Rosetta Italian translation of mozilla', NULL, ' Italian translation of debconf for mozilla.
 This file is distributed under the same license as the mozilla package.
 Copyright 2004 by Valentina Commissari <ayor@quaqua.net>.
', 'Project-Id-Version: mozilla 1.7.3-5
POT-Creation-Date: 2004-07-11 16:16+0900
PO-Revision-Date: 2004-11-01 13:30+0100
Last-Translator: Valentina Commissari <tsukimi@quaqua.net>
Language-Team: Italian <debian-l10n-italian@lists.debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
X-Poedit-Language: Italian
X-Poedit-Country: ITALY
plural-forms: nplurals=2; plural=n != 1
', true, NULL, NULL, 9, 0, 0, NULL, 31, 2, NULL, NULL, 30, '2005-05-06 21:10:39.821363', 3, 29);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (15, 5, 521, 'Rosetta Portuguese (Brazil) translation of mozilla', NULL, '
    Translators, if you are not familiar with the PO format, gettext
    documentation is worth reading, especially sections dedicated to
    this format, e.g. by running:
         info -n ''(gettext)PO Files''
         info -n ''(gettext)Header Entry''

    Some information specific to po-debconf are available at
            /usr/share/doc/po-debconf/README-trans
         or http://www.debian.org/intl/l10n/po-debconf/README-trans

    Developers do not need to manually edit POT or PO files.

', 'Project-Id-Version: mozilla
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2004-07-11 16:16+0900
PO-Revision-Date: 2004-07-25 16:17-0300
Last-Translator: André Luís Lopes <andrelop@debian.org>
Language-Team: Debian-BR Porject <debian-l10n-portuguese@lists.debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
plural-forms: nplurals=2; plural=n > 1
', true, NULL, NULL, 9, 0, 0, NULL, 31, 2, NULL, NULL, 30, '2005-05-06 21:10:39.821363', 3, 20);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (10, 2, 302, 'Rosetta Bokmål, Norwegian translation of pmount', NULL, ' Bokmål, Norwegian translation for pmount
 Copyright (c) (c) 2005 Canonical Ltd, and Rosetta Contributors 2005
 This file is distributed under the same license as the pmount package.
 FIRST AUTHOR <EMAIL@ADDRESS>, 2005.

', 'Project-Id-Version: pmount
Report-Msgid-Bugs-To: martin.pitt@canonical.com
POT-Creation-Date: 2005-04-04 17:31+0200
PO-Revision-Date: 2005-03-31 10:35+0000
Last-Translator: Sigurd Gartmann <sigurd-ubuntu@brogar.org>
Language-Team: Bokmål, Norwegian <nb@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rosetta-Version: 0.1
Plural-Forms: nplurals=2; plural=n != 1
X-Generator: Rosetta (http://launchpad.ubuntu.com/rosetta/)
', true, NULL, NULL, 63, 0, 0, NULL, 31, 2, NULL, NULL, 30, '2005-05-06 20:07:24.255804', 3, 12);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (9, 2, 98, 'Rosetta Czech translation of pmount', NULL, ' Czech translation for mount removable devices as normal user
 Copyright (c) (c) 2005 Canonical Ltd, and Rosetta Contributors 2005
 This file is distributed under the same license as the mount removable devices as normal user package.
 FIRST AUTHOR <EMAIL@ADDRESS>, 2005.

', 'Project-Id-Version: mount removable devices as normal user
Report-Msgid-Bugs-To: martin.pitt@canonical.com
POT-Creation-Date: 2005-04-04 17:31+0200
PO-Revision-Date: 2005-02-10 15:15+0000
Last-Translator: Vlastimil Skacel <skacel@svtech.cz>
Language-Team: Czech <cs@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rosetta-Version: 0.1
Plural-Forms: nplurals=3; plural=n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2
X-Generator: Rosetta (http://launchpad.ubuntu.com/rosetta/)
', true, NULL, NULL, 56, 0, 0, NULL, 31, 3, NULL, NULL, 30, '2005-05-06 20:07:24.255804', 3, 13);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (17, 5, 427, 'Rosetta Turkish translation of mozilla', NULL, ' Turkish translation of mozilla.
 This file is distributed under the same license as the mozilla package.
 Mehmet Türker <mturker@innova.com.tr>, 2004.

', 'Project-Id-Version: mozilla
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2004-07-11 16:16+0900
PO-Revision-Date: 2004-04-25 14:47+0300
Last-Translator: Mehmet Türker <EMAIL>
Language-Team: Turkish <debian-l10n-turkish@lists.debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms:  nplurals=1; plural=0;
', true, NULL, NULL, 6, 0, 0, NULL, 31, 1, NULL, NULL, 30, '2005-05-06 21:10:39.821363', 3, 30);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (25, 5, 387, 'Rosetta Spanish translation of mozilla', NULL, '
    Translators, if you are not familiar with the PO format, gettext
    documentation is worth reading, especially sections dedicated to
    this format, e.g. by running:
         info -n ''(gettext)PO Files''
         info -n ''(gettext)Header Entry''

    Some information specific to po-debconf are available at
            /usr/share/doc/po-debconf/README-trans
         or http://www.debian.org/intl/l10n/po-debconf/README-trans

    Developers do not need to manually edit POT or PO files.

 Carlos Valdivia Yagüe <valyag@dat.etsit.upm.es>, 2003

', 'Project-Id-Version: mozilla-browser 1.4-4
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2004-07-11 16:16+0900
PO-Revision-Date: 2003-09-20 20:00+0200
Last-Translator: Carlos Valdivia Yagüe <valyag@dat.etsit.upm.es>
Language-Team: Debian L10n Spanish <debian-l10n-spanish@lists.debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit
plural-forms: nplurals=2; plural=n != 1
', true, NULL, NULL, 6, 0, 0, NULL, 31, 2, NULL, NULL, 30, '2005-05-06 21:10:39.821363', 3, 22);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (16, 5, 143, 'Rosetta German translation of mozilla', NULL, '
    Translators, if you are not familiar with the PO format, gettext
    documentation is worth reading, especially sections dedicated to
    this format, e.g. by running:
         info -n ''(gettext)PO Files''
         info -n ''(gettext)Header Entry''

    Some information specific to po-debconf are available at
            /usr/share/doc/po-debconf/README-trans
         or http://www.debian.org/intl/l10n/po-debconf/README-trans

    Developers do not need to manually edit POT or PO files.

', 'Project-Id-Version: PACKAGE VERSION
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2004-07-11 16:16+0900
PO-Revision-Date: 2004-07-24 15:24+0200
Last-Translator: Helge Kreutzmann <kreutzm@itp.uni-hannover.de>
Language-Team: de <debian-l10n-german@lists.debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit
plural-forms: nplurals=2; plural=n != 1
', true, NULL, NULL, 9, 0, 0, NULL, 31, 2, NULL, NULL, 30, '2005-05-06 21:10:39.821363', 3, 31);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (5, 2, 68, 'Rosetta Catalan translation of pmount', NULL, ' Catalan translation for mount removable devices as normal user
 Copyright (c) (c) 2005 Canonical Ltd, and Rosetta Contributors 2005
 This file is distributed under the same license as the mount removable devices as normal user package.
 FIRST AUTHOR <EMAIL@ADDRESS>, 2005.
', 'Project-Id-Version: mount removable devices as normal user
Report-Msgid-Bugs-To: martin.pitt@canonical.com
POT-Creation-Date: 2005-04-04 17:31+0200
PO-Revision-Date: 2005-02-12 01:18+0000
Last-Translator: Jordi Vilalta <jvprat@wanadoo.es>
Language-Team: Catalan <ca@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rosetta-Version: 0.1
Plural-Forms: nplurals=2; plural=n != 1
X-Generator: Rosetta (http://launchpad.ubuntu.com/rosetta/)
', true, NULL, NULL, 62, 0, 0, NULL, 31, 2, NULL, NULL, 30, '2005-05-06 20:07:24.255804', 3, 11);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (7, 2, 360, 'Rosetta Croatian translation of pmount', NULL, ' Croatian translation for pmount
 Copyright (c) (c) 2005 Canonical Ltd, and Rosetta Contributors 2005
 This file is distributed under the same license as the pmount package.
 FIRST AUTHOR <EMAIL@ADDRESS>, 2005.

', 'Project-Id-Version: pmount
Report-Msgid-Bugs-To: martin.pitt@canonical.com
POT-Creation-Date: 2005-04-04 17:31+0200
PO-Revision-Date: 2005-03-16 14:51+0000
Last-Translator: Edgar Bursic <edgar@monteparadiso.hr>
Language-Team: Croatian <hr@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rosetta-Version: 0.1
Plural-Forms: nplurals=3; plural=n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2
X-Generator: Rosetta (http://launchpad.ubuntu.com/rosetta/)
', true, NULL, NULL, 63, 0, 0, NULL, 31, 3, NULL, NULL, 30, '2005-05-06 20:07:24.255804', 3, 10);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (6, 2, 132, 'Rosetta French translation of pmount', NULL, ' French translation for mount removable devices as normal user
 Copyright (c) (c) 2005 Canonical Ltd, and Rosetta Contributors 2005
 This file is distributed under the same license as the mount removable devices as normal user package.
 FIRST AUTHOR <EMAIL@ADDRESS>, 2005.

', 'Project-Id-Version: mount removable devices as normal user
Report-Msgid-Bugs-To: martin.pitt@canonical.com
POT-Creation-Date: 2005-04-04 17:31+0200
PO-Revision-Date: 2005-04-02 22:34+0000
Last-Translator: Nicolas Velin <nsv@fr.st>
Language-Team: French <fr@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rosetta-Version: 0.1
Plural-Forms: nplurals=2; plural=n > 1
X-Generator: Rosetta (http://launchpad.ubuntu.com/rosetta/)
', true, NULL, NULL, 57, 0, 0, NULL, 31, 2, NULL, NULL, 30, '2005-05-06 20:07:24.255804', 3, 16);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (23, 5, 148, 'Rosetta Gallegan translation of mozilla', NULL, '
    Translators, if you are not familiar with the PO format, gettext
    documentation is worth reading, especially sections dedicated to
    this format, e.g. by running:
         info -n ''(gettext)PO Files''
         info -n ''(gettext)Header Entry''

    Some information specific to po-debconf are available at
            /usr/share/doc/po-debconf/README-trans
         or http://www.debian.org/intl/l10n/po-debconf/README-trans

    Developers do not need to manually edit POT or PO files.

', 'Project-Id-Version: PACKAGE VERSION
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2004-07-11 16:16+0900
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: LANGUAGE <LL@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit
plural-forms: nplurals=1; plural=0
', true, NULL, NULL, 3, 0, 0, NULL, 31, 1, NULL, NULL, 30, '2005-05-06 21:10:39.821363', 3, 27);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (8, 2, 527, 'Rosetta Italian (Italy) translation of pmount', NULL, ' Italian (Italy) translation for pmount
 Copyright (c) (c) 2005 Canonical Ltd, and Rosetta Contributors 2005
 This file is distributed under the same license as the pmount package.
 FIRST AUTHOR <EMAIL@ADDRESS>, 2005.

', 'Project-Id-Version: pmount
Report-Msgid-Bugs-To: martin.pitt@canonical.com
POT-Creation-Date: 2005-04-04 17:31+0200
PO-Revision-Date: 2005-03-16 23:54+0000
Last-Translator: Francesco Accattapà <callipeo@libero.it>
Language-Team: Italian (Italy) <it_IT@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rosetta-Version: 0.1
Plural-Forms: nplurals=2; plural=n != 1
X-Generator: Rosetta (http://launchpad.ubuntu.com/rosetta/)
', true, NULL, NULL, 49, 0, 0, NULL, 31, 2, NULL, NULL, 30, '2005-05-06 20:07:24.255804', 3, 17);
INSERT INTO pofile (id, potemplate, "language", title, description, topcomment, header, fuzzyheader, lasttranslator, license, currentcount, updatescount, rosettacount, lastparsed, "owner", pluralforms, variant, filename, rawimporter, daterawimport, rawimportstatus, rawfile) VALUES (14, 5, 112, 'Rosetta Dutch translation of mozilla', NULL, '
    Translators, if you are not familiar with the PO format, gettext
    documentation is worth reading, especially sections dedicated to
    this format, e.g. by running:
         info -n ''(gettext)PO Files''
         info -n ''(gettext)Header Entry''

    Some information specific to po-debconf are available at
            /usr/share/doc/po-debconf/README-trans
         or http://www.debian.org/intl/l10n/po-debconf/README-trans

    Developers do not need to manually edit POT or PO files.

', 'Project-Id-Version: mozilla 2:1.6-3
POT-Creation-Date: 2004-07-11 16:16+0900
PO-Revision-Date: 2004-09-09 11:37+0100
Last-Translator: Luk Claes <luk.claes@ugent.be>
Language-Team: Debian l10n Dutch <debian-l10n-dutch@lists.debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
plural-forms: nplurals=2; plural=n != 1
', true, NULL, NULL, 9, 0, 0, NULL, 31, 2, NULL, NULL, 30, '2005-05-06 21:10:39.821363', 3, 23);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'pofile'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'pomsgset'::pg_catalog.regclass;

INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (1, 1, 1, true, false, false, '', 1);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (2, 2, 1, true, false, false, '', 2);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (3, 3, 1, true, false, true, '', 3);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (4, 4, 1, false, false, false, '', 4);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (10, 10, 1, false, false, false, '', 10);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (11, 11, 1, false, false, false, '', 11);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (5, 5, 1, true, false, false, '', 5);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (12, 12, 1, false, false, false, '', 12);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (6, 6, 1, false, false, false, '', 6);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (13, 13, 1, false, false, false, '', 13);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (7, 7, 1, false, false, false, '', 7);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (8, 8, 1, false, false, false, '', 8);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (9, 9, 1, false, false, false, '', 9);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (14, 14, 1, true, false, false, ' This is an example of commenttext for a multiline msgset', 14);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (15, 15, 1, true, false, false, '', 15);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (16, 16, 1, true, false, false, '', 16);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (17, 17, 1, false, false, true, '', 17);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (21, 21, 1, false, false, false, '', 21);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (18, 18, 1, true, false, false, ' start po-group: common
 start po-group: common', 18);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (19, 19, 1, false, false, false, '', 19);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (20, 20, 1, false, false, false, '', 20);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (22, 22, 1, true, true, false, '', 23);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (23, 1, 7, true, false, false, '', 67);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (590, 1, 12, true, false, false, '', 130);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (24, 2, 7, true, false, false, '', 68);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (591, 2, 12, true, false, false, '', 131);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (25, 3, 7, true, false, false, '', 69);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (26, 4, 7, true, false, false, '', 70);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (593, 4, 12, false, false, false, '', 133);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (27, 5, 7, true, false, false, '', 71);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (592, 3, 12, true, false, true, '', 132);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (28, 6, 7, true, false, false, '', 72);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (29, 7, 7, true, false, false, '', 73);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (30, 8, 7, true, false, false, '', 74);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (31, 9, 7, true, false, false, '', 75);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (32, 10, 7, true, false, false, '', 76);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (594, 5, 12, true, false, false, '', 134);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (596, 7, 12, false, false, false, '', 136);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (33, 11, 7, true, false, false, '', 77);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (602, 13, 12, false, false, false, '', 142);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (34, 12, 7, true, false, false, '', 78);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (600, 11, 12, false, false, false, '', 140);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (599, 10, 12, false, false, false, '', 139);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (601, 12, 12, false, false, false, '', 141);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (35, 13, 7, true, false, false, '', 79);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (598, 9, 12, false, false, false, '', 138);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (597, 8, 12, false, false, false, '', 137);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (36, 14, 7, true, false, false, '', 80);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (37, 15, 7, true, false, false, '', 81);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (595, 6, 12, false, false, false, '', 135);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (38, 16, 7, true, false, false, '', 82);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (603, 14, 12, true, false, false, ' This is an example of commenttext for a multiline msgset', 143);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (39, 17, 7, true, false, false, '', 83);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (40, 18, 7, true, false, false, '', 84);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (604, 15, 12, true, false, false, '', 144);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (41, 19, 7, true, false, false, '', 85);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (605, 16, 12, true, false, false, '', 145);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (42, 20, 7, true, false, false, '', 86);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (43, 21, 7, true, false, false, '', 87);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (606, 17, 12, false, false, true, '', 146);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (44, 22, 7, true, false, false, '', 88);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (45, 23, 7, true, false, false, '', 89);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (46, 24, 7, true, false, false, '', 90);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (607, 18, 12, true, false, false, ' start po-group: common
 start po-group: common', 147);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (47, 25, 7, true, false, false, '', 91);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (609, 20, 12, false, false, false, '', 149);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (608, 19, 12, false, false, false, '', 148);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (48, 26, 7, true, false, false, '', 92);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (610, 21, 12, false, false, false, '', 150);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (611, 22, 12, true, true, false, '', 161);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (49, 27, 7, true, false, false, '', 93);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (50, 28, 7, true, false, false, '', 94);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (51, 29, 7, true, false, false, '', 95);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (612, 1, 13, true, false, false, '', 152);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (52, 30, 7, true, false, false, '', 96);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (613, 2, 13, true, false, false, '', 153);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (53, 31, 7, true, false, false, '', 97);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (54, 32, 7, true, false, false, '', 98);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (614, 3, 13, true, false, false, '', 154);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (55, 33, 7, true, false, false, '', 99);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (56, 34, 7, true, false, false, '', 100);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (615, 4, 13, true, false, false, '', 155);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (57, 35, 7, true, false, false, '', 101);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (616, 5, 13, true, false, false, '', 156);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (58, 36, 7, true, false, false, '', 102);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (59, 37, 7, true, false, false, '', 103);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (60, 38, 7, true, false, false, '', 104);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (617, 6, 13, true, false, false, '', 157);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (61, 39, 7, true, false, false, '', 105);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (618, 7, 13, true, false, false, '', 158);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (62, 40, 7, true, false, false, '', 106);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (63, 41, 7, true, false, false, '', 107);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (619, 8, 13, true, false, false, '', 159);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (620, 9, 13, true, false, false, '', 160);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (64, 42, 7, true, false, false, '', 108);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (65, 43, 7, true, false, false, '', 109);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (621, 1, 15, true, false, false, '', 152);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (66, 44, 7, true, false, false, '', 110);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (67, 45, 7, true, false, false, '', 111);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (622, 2, 15, true, false, false, '', 153);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (68, 46, 7, true, false, false, '', 112);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (69, 47, 7, true, false, false, '', 113);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (623, 3, 15, true, false, false, '', 154);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (70, 48, 7, true, false, false, '', 114);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (624, 4, 15, true, false, false, '', 155);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (71, 49, 7, true, false, false, '', 115);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (625, 5, 15, true, false, false, '', 156);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (72, 50, 7, true, false, false, '', 116);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (73, 51, 7, true, false, false, '', 117);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (626, 6, 15, true, false, false, '', 157);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (74, 52, 7, true, false, false, '', 118);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (627, 7, 15, true, false, false, '', 158);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (75, 53, 7, true, false, false, '', 119);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (76, 54, 7, true, false, false, '', 120);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (628, 8, 15, true, false, false, '', 159);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (77, 55, 7, true, false, false, '', 121);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (629, 9, 15, true, false, false, '', 160);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (78, 56, 7, true, false, false, '', 122);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (79, 57, 7, true, false, false, '', 123);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (630, 1, 24, true, false, false, '', 152);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (80, 58, 7, true, false, false, '', 124);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (631, 2, 24, true, false, false, '', 153);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (81, 59, 7, true, false, false, '', 125);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (82, 60, 7, true, false, false, '', 126);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (632, 3, 24, true, false, false, '', 154);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (83, 61, 7, true, false, false, '', 127);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (633, 4, 24, true, false, false, '', 155);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (84, 62, 7, true, false, false, '', 128);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (85, 63, 7, true, false, false, '', 129);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (634, 5, 24, true, false, false, '', 156);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (86, 1, 5, true, false, false, '', 67);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (87, 2, 5, true, false, false, '', 68);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (635, 6, 24, true, false, false, '', 157);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (88, 3, 5, true, false, false, '', 69);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (636, 7, 24, true, false, false, '', 158);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (89, 4, 5, true, false, false, '', 70);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (90, 5, 5, true, false, false, '', 71);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (637, 8, 24, true, false, false, '', 159);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (638, 9, 24, true, false, false, '', 160);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (91, 6, 5, true, false, false, '', 72);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (92, 7, 5, true, false, false, '', 73);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (639, 1, 25, true, false, false, '', 152);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (93, 8, 5, true, false, false, '', 74);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (94, 9, 5, true, false, false, '', 75);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (640, 2, 25, true, false, false, '', 153);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (95, 10, 5, true, false, false, '', 76);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (641, 3, 25, true, false, false, '', 154);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (96, 11, 5, true, false, false, '', 77);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (642, 4, 25, true, false, false, '', 155);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (97, 12, 5, true, false, false, '', 78);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (98, 13, 5, true, false, false, '', 79);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (99, 14, 5, true, false, false, '', 80);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (643, 5, 25, true, false, false, '', 156);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (100, 15, 5, true, false, false, '', 81);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (101, 16, 5, true, false, false, '', 82);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (647, 9, 25, false, false, false, '', 160);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (644, 6, 25, true, false, false, '', 157);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (645, 7, 25, false, false, false, '', 158);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (102, 17, 5, true, false, false, '', 83);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (646, 8, 25, false, false, false, '', 159);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (103, 18, 5, true, false, false, '', 84);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (104, 19, 5, true, false, false, '', 85);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (648, 1, 14, true, false, false, '', 152);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (105, 20, 5, true, false, false, '', 86);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (106, 21, 5, true, false, false, '', 87);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (649, 2, 14, true, false, false, '', 153);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (107, 22, 5, true, false, false, '', 88);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (650, 3, 14, true, false, false, '', 154);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (108, 23, 5, true, false, false, '', 89);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (109, 24, 5, true, false, false, '', 90);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (651, 4, 14, true, false, false, '', 155);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (110, 25, 5, true, false, false, '', 91);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (652, 5, 14, true, false, false, '', 156);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (111, 26, 5, true, false, false, '', 92);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (653, 6, 14, true, false, false, '', 157);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (112, 27, 5, true, false, false, '', 93);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (113, 28, 5, true, false, false, '', 94);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (654, 7, 14, true, false, false, '', 158);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (114, 29, 5, true, false, false, '', 95);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (655, 8, 14, true, false, false, '', 159);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (115, 30, 5, true, false, true, '', 96);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (116, 31, 5, true, false, false, '', 97);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (656, 9, 14, true, false, false, '', 160);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (117, 32, 5, true, false, false, '', 98);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (118, 33, 5, true, false, false, '', 99);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (657, 1, 21, true, false, false, '', 152);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (119, 34, 5, true, false, false, '', 100);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (658, 2, 21, true, false, false, '', 153);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (120, 35, 5, true, false, false, '', 101);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (121, 36, 5, true, false, false, '', 102);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (659, 3, 21, true, false, false, '', 154);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (122, 37, 5, true, false, false, '', 103);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (660, 4, 21, true, false, false, '', 155);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (123, 38, 5, true, false, false, '', 104);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (124, 39, 5, true, false, false, '', 105);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (661, 5, 21, true, false, false, '', 156);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (125, 40, 5, true, false, false, '', 106);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (662, 6, 21, true, false, false, '', 157);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (126, 41, 5, true, false, false, '', 107);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (127, 42, 5, true, false, false, '', 108);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (663, 7, 21, true, false, false, '', 158);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (128, 43, 5, true, false, false, '', 109);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (664, 8, 21, true, false, false, '', 159);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (129, 44, 5, true, false, false, '', 110);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (665, 9, 21, true, false, false, '', 160);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (130, 45, 5, true, false, false, '', 111);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (131, 46, 5, true, false, false, '', 112);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (132, 47, 5, true, false, false, '', 113);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (666, 1, 19, true, false, false, '', 152);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (133, 48, 5, true, false, false, '', 114);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (667, 2, 19, true, false, false, '', 153);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (134, 49, 5, true, false, false, '', 115);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (668, 3, 19, true, false, false, '', 154);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (135, 50, 5, true, false, false, '', 116);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (136, 51, 5, true, false, false, '', 117);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (669, 4, 19, true, false, false, '', 155);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (137, 52, 5, true, false, false, '', 118);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (670, 5, 19, true, false, false, '', 156);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (138, 53, 5, true, false, false, '', 119);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (671, 6, 19, true, false, false, '', 157);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (139, 54, 5, true, false, false, '', 120);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (140, 55, 5, true, false, false, '', 121);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (672, 7, 19, true, false, false, '', 158);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (141, 56, 5, true, false, false, '', 122);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (142, 57, 5, true, false, false, '', 123);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (673, 8, 19, true, false, false, '', 159);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (143, 58, 5, true, false, false, '', 124);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (674, 9, 19, true, false, false, '', 160);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (144, 59, 5, true, false, false, '', 125);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (145, 60, 5, true, false, false, '', 126);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (675, 1, 22, true, false, false, '', 152);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (146, 61, 5, true, false, false, '', 127);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (676, 2, 22, true, false, false, '', 153);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (147, 62, 5, true, false, false, '', 128);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (148, 63, 5, true, false, false, '', 129);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (677, 3, 22, true, false, false, '', 154);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (149, 1, 10, true, false, false, '', 67);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (678, 4, 22, true, false, false, '', 155);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (150, 2, 10, true, false, false, '', 68);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (151, 3, 10, true, false, false, '', 69);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (679, 5, 22, true, false, false, '', 156);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (152, 4, 10, true, false, false, '', 70);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (153, 5, 10, true, false, false, '', 71);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (680, 6, 22, true, false, false, '', 157);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (681, 7, 22, true, false, false, '', 158);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (154, 6, 10, true, false, false, '', 72);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (155, 7, 10, true, false, false, '', 73);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (156, 8, 10, true, false, false, '', 74);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (682, 8, 22, true, false, false, '', 159);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (683, 9, 22, true, false, false, '', 160);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (157, 9, 10, true, false, false, '', 75);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (158, 10, 10, true, false, false, '', 76);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (159, 11, 10, true, false, false, '', 77);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (684, 10, 22, true, true, false, '', 162);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (160, 12, 10, true, false, false, '', 78);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (685, 11, 22, true, true, false, '', 163);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (161, 13, 10, true, false, false, '', 79);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (686, 12, 22, true, true, false, '', 164);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (162, 14, 10, true, false, false, '', 80);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (163, 15, 10, true, false, false, '', 81);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (687, 1, 23, true, false, false, '', 152);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (164, 16, 10, true, false, false, '', 82);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (688, 2, 23, true, false, false, '', 153);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (165, 17, 10, true, false, false, '', 83);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (166, 18, 10, true, false, false, '', 84);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (167, 19, 10, true, false, false, '', 85);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (168, 20, 10, true, false, false, '', 86);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (693, 7, 23, false, false, false, '', 158);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (169, 21, 10, true, false, false, '', 87);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (692, 6, 23, false, false, false, '', 157);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (689, 3, 23, true, false, false, '', 154);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (690, 4, 23, false, false, false, '', 155);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (170, 22, 10, true, false, false, '', 88);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (694, 8, 23, false, false, false, '', 159);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (171, 23, 10, true, false, false, '', 89);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (691, 5, 23, false, false, false, '', 156);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (695, 9, 23, false, false, false, '', 160);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (172, 24, 10, true, false, false, '', 90);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (173, 25, 10, true, false, false, '', 91);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (174, 26, 10, true, false, false, '', 92);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (696, 1, 20, true, false, false, '', 152);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (697, 2, 20, true, false, false, '', 153);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (175, 27, 10, true, false, false, '', 93);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (176, 28, 10, true, false, false, '', 94);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (698, 3, 20, true, false, false, '', 154);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (177, 29, 10, true, false, false, '', 95);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (178, 30, 10, true, false, false, '', 96);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (699, 4, 20, true, false, false, '', 155);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (179, 31, 10, true, false, false, '', 97);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (700, 5, 20, true, false, false, '', 156);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (180, 32, 10, true, false, false, '', 98);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (181, 33, 10, true, false, false, '', 99);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (701, 6, 20, true, false, false, '', 157);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (182, 34, 10, true, false, false, '', 100);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (702, 7, 20, true, false, false, '', 158);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (183, 35, 10, true, false, false, '', 101);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (184, 36, 10, true, false, false, '', 102);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (703, 8, 20, true, false, false, '', 159);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (704, 9, 20, true, false, false, '', 160);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (185, 37, 10, true, false, false, '', 103);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (186, 38, 10, true, false, false, '', 104);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (187, 39, 10, true, false, false, '', 105);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (705, 1, 18, true, false, false, '', 152);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (188, 40, 10, true, false, false, '', 106);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (706, 2, 18, true, false, false, '', 153);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (189, 41, 10, true, false, false, '', 107);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (707, 3, 18, true, false, false, '', 154);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (190, 42, 10, true, false, false, '', 108);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (191, 43, 10, true, false, false, '', 109);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (192, 44, 10, true, false, false, '', 110);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (708, 4, 18, true, false, false, '', 155);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (193, 45, 10, true, false, false, '', 111);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (709, 5, 18, true, false, false, '', 156);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (194, 46, 10, true, false, false, '', 112);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (195, 47, 10, true, false, false, '', 113);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (710, 6, 18, true, false, false, '', 157);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (196, 48, 10, true, false, false, '', 114);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (711, 7, 18, true, false, false, '', 158);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (197, 49, 10, true, false, false, '', 115);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (712, 8, 18, true, false, false, '', 159);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (198, 50, 10, true, false, false, '', 116);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (713, 9, 18, true, false, false, '', 160);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (199, 51, 10, true, false, false, '', 117);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (200, 52, 10, true, false, false, '', 118);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (714, 1, 17, true, false, false, '', 152);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (201, 53, 10, true, false, false, '', 119);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (202, 54, 10, true, false, false, '', 120);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (715, 2, 17, true, false, false, '', 153);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (203, 55, 10, true, false, false, '', 121);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (716, 3, 17, true, false, false, '', 154);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (204, 56, 10, true, false, false, '', 122);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (205, 57, 10, true, false, false, '', 123);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (717, 4, 17, true, false, false, '', 155);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (206, 58, 10, true, false, false, '', 124);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (718, 5, 17, true, false, false, '', 156);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (207, 59, 10, true, false, false, '', 125);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (208, 60, 10, true, false, false, '', 126);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (209, 61, 10, true, false, false, '', 127);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (721, 8, 17, false, false, false, '', 159);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (720, 7, 17, false, false, false, '', 158);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (719, 6, 17, true, false, false, '', 157);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (210, 62, 10, true, false, false, '', 128);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (211, 63, 10, true, false, false, '', 129);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (722, 9, 17, false, false, false, '', 160);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (212, 1, 9, true, false, false, '', 67);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (723, 1, 16, true, false, false, '', 152);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (213, 2, 9, true, false, false, '', 68);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (214, 3, 9, true, false, false, '', 69);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (724, 2, 16, true, false, false, '', 153);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (215, 4, 9, true, false, true, '', 70);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (725, 3, 16, true, false, false, '', 154);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (216, 5, 9, true, false, false, '', 71);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (726, 4, 16, true, false, false, '', 155);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (217, 6, 9, true, false, false, '', 72);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (218, 7, 9, true, false, false, '', 73);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (727, 5, 16, true, false, false, '', 156);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (219, 8, 9, true, false, false, '', 74);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (220, 9, 9, true, false, false, '', 75);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (728, 6, 16, true, false, false, '', 157);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (221, 10, 9, true, false, false, '', 76);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (222, 11, 9, true, false, true, '', 77);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (729, 7, 16, true, false, false, '', 158);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (730, 8, 16, true, false, false, '', 159);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (223, 12, 9, true, false, false, '', 78);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (224, 13, 9, true, false, false, '', 79);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (731, 9, 16, true, false, false, '', 160);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (225, 14, 9, true, false, false, '', 80);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (226, 15, 9, true, false, false, '', 81);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (227, 16, 9, true, false, false, '', 82);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (228, 17, 9, true, false, false, '', 83);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (229, 18, 9, true, false, false, '', 84);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (230, 19, 9, true, false, false, '', 85);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (231, 20, 9, true, false, false, '', 86);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (232, 21, 9, true, false, false, '', 87);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (233, 22, 9, true, false, false, '', 88);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (234, 23, 9, true, false, false, '', 89);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (235, 24, 9, true, false, false, '', 90);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (236, 25, 9, true, false, false, '', 91);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (237, 26, 9, true, false, false, '', 92);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (238, 27, 9, true, false, false, '', 93);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (239, 28, 9, true, false, true, '', 94);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (240, 29, 9, true, false, false, '', 95);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (241, 30, 9, true, false, false, '', 96);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (242, 31, 9, true, false, false, '', 97);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (243, 32, 9, true, false, false, '', 98);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (244, 33, 9, true, false, false, '', 99);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (245, 34, 9, true, false, false, '', 100);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (246, 35, 9, true, false, false, '', 101);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (247, 36, 9, true, false, false, '', 102);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (248, 37, 9, true, false, false, '', 103);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (249, 38, 9, true, false, false, '', 104);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (250, 39, 9, true, false, false, '', 105);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (251, 40, 9, true, false, false, '', 106);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (252, 41, 9, true, false, false, '', 107);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (253, 42, 9, true, false, false, '', 108);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (254, 43, 9, true, false, false, '', 109);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (255, 44, 9, true, false, false, '', 110);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (256, 45, 9, true, false, false, '', 111);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (257, 46, 9, true, false, false, '', 112);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (258, 47, 9, true, false, false, '', 113);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (259, 48, 9, true, false, false, '', 114);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (260, 49, 9, true, false, false, '', 115);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (261, 50, 9, true, false, false, '', 116);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (262, 51, 9, true, false, false, '', 117);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (263, 52, 9, true, false, false, '', 118);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (264, 53, 9, true, false, false, '', 119);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (265, 54, 9, true, false, false, '', 120);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (266, 55, 9, true, false, false, '', 121);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (267, 56, 9, true, false, false, '', 122);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (268, 57, 9, true, false, false, '', 123);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (269, 58, 9, true, false, false, '', 124);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (270, 59, 9, true, false, false, '', 125);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (271, 60, 9, true, false, true, '', 126);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (272, 61, 9, true, false, true, '', 127);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (273, 62, 9, true, false, true, '', 128);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (274, 63, 9, true, false, true, '', 129);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (275, 1, 3, true, false, false, '', 67);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (276, 2, 3, true, false, false, '', 68);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (277, 3, 3, true, false, false, '', 69);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (278, 4, 3, true, false, false, '', 70);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (279, 5, 3, true, false, false, '', 71);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (280, 6, 3, true, false, false, '', 72);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (281, 7, 3, true, false, false, '', 73);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (282, 8, 3, true, false, false, '', 74);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (283, 9, 3, true, false, false, '', 75);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (284, 10, 3, true, false, false, '', 76);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (285, 11, 3, true, false, false, '', 77);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (286, 12, 3, true, false, false, '', 78);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (287, 13, 3, true, false, false, '', 79);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (288, 14, 3, true, false, false, '', 80);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (289, 15, 3, true, false, false, '', 81);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (290, 16, 3, true, false, false, '', 82);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (291, 17, 3, true, false, false, '', 83);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (292, 18, 3, true, false, false, '', 84);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (293, 19, 3, true, false, false, '', 85);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (294, 20, 3, true, false, false, '', 86);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (295, 21, 3, true, false, false, '', 87);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (296, 22, 3, true, false, false, '', 88);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (297, 23, 3, true, false, false, '', 89);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (298, 24, 3, true, false, false, '', 90);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (299, 25, 3, true, false, false, '', 91);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (300, 26, 3, true, false, false, '', 92);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (301, 27, 3, true, false, false, '', 93);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (302, 28, 3, true, false, false, '', 94);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (303, 29, 3, true, false, false, '', 95);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (304, 30, 3, true, false, false, '', 96);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (305, 31, 3, true, false, false, '', 97);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (306, 32, 3, true, false, false, '', 98);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (307, 33, 3, true, false, false, '', 99);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (308, 34, 3, true, false, false, '', 100);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (309, 35, 3, true, false, false, '', 101);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (310, 36, 3, true, false, false, '', 102);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (311, 37, 3, true, false, false, '', 103);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (312, 38, 3, true, false, false, '', 104);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (313, 39, 3, true, false, false, '', 105);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (314, 40, 3, true, false, false, '', 106);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (315, 41, 3, true, false, false, '', 107);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (316, 42, 3, true, false, false, '', 108);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (317, 43, 3, true, false, false, '', 109);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (318, 44, 3, true, false, false, '', 110);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (319, 45, 3, true, false, false, '', 111);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (320, 46, 3, true, false, false, '', 112);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (321, 47, 3, true, false, false, '', 113);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (322, 48, 3, true, false, false, '', 114);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (323, 49, 3, true, false, false, '', 115);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (324, 50, 3, true, false, false, '', 116);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (325, 51, 3, true, false, false, '', 117);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (326, 52, 3, true, false, false, '', 118);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (327, 53, 3, true, false, false, '', 119);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (328, 54, 3, true, false, false, '', 120);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (329, 55, 3, true, false, false, '', 121);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (330, 56, 3, true, false, false, '', 122);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (331, 57, 3, true, false, false, '', 123);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (332, 58, 3, true, false, false, '', 124);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (333, 59, 3, true, false, false, '', 125);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (334, 60, 3, true, false, false, '', 126);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (335, 61, 3, true, false, false, '', 127);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (336, 62, 3, true, false, false, '', 128);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (337, 63, 3, true, false, false, '', 129);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (338, 1, 4, true, false, false, '', 67);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (339, 2, 4, true, false, false, '', 68);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (340, 3, 4, true, false, false, '', 69);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (341, 4, 4, true, false, false, '', 70);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (342, 5, 4, true, false, false, '', 71);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (343, 6, 4, true, false, false, '', 72);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (344, 7, 4, true, false, false, '', 73);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (345, 8, 4, true, false, false, '', 74);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (346, 9, 4, true, false, false, '', 75);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (347, 10, 4, true, false, false, '', 76);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (348, 11, 4, true, false, false, '', 77);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (349, 12, 4, true, false, false, '', 78);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (350, 13, 4, true, false, false, '', 79);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (351, 14, 4, true, false, false, '', 80);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (352, 15, 4, true, false, false, '', 81);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (353, 16, 4, true, false, false, '', 82);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (354, 17, 4, true, false, false, '', 83);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (355, 18, 4, true, false, false, '', 84);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (356, 19, 4, true, false, false, '', 85);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (357, 20, 4, true, false, false, '', 86);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (358, 21, 4, true, false, false, '', 87);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (359, 22, 4, true, false, false, '', 88);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (360, 23, 4, true, false, false, '', 89);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (361, 24, 4, true, false, false, '', 90);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (362, 25, 4, true, false, false, '', 91);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (363, 26, 4, true, false, false, '', 92);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (364, 27, 4, true, false, false, '', 93);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (365, 28, 4, true, false, false, '', 94);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (366, 29, 4, true, false, false, '', 95);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (367, 30, 4, true, false, false, '', 96);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (368, 31, 4, true, false, false, '', 97);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (369, 32, 4, true, false, false, '', 98);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (370, 33, 4, true, false, false, '', 99);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (371, 34, 4, true, false, false, '', 100);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (372, 35, 4, true, false, false, '', 101);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (373, 36, 4, true, false, false, '', 102);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (374, 37, 4, true, false, false, '', 103);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (375, 38, 4, true, false, false, '', 104);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (376, 39, 4, true, false, false, '', 105);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (377, 40, 4, true, false, false, '', 106);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (378, 41, 4, true, false, false, '', 107);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (379, 42, 4, true, false, false, '', 108);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (380, 43, 4, true, false, false, '', 109);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (381, 44, 4, true, false, false, '', 110);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (382, 45, 4, true, false, false, '', 111);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (383, 46, 4, true, false, false, '', 112);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (384, 47, 4, true, false, false, '', 113);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (385, 48, 4, true, false, false, '', 114);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (386, 49, 4, true, false, false, '', 115);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (387, 50, 4, true, false, false, '', 116);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (388, 51, 4, true, false, false, '', 117);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (389, 52, 4, true, false, false, '', 118);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (390, 53, 4, true, false, false, '', 119);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (391, 54, 4, true, false, false, '', 120);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (392, 55, 4, true, false, false, '', 121);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (393, 56, 4, true, false, false, '', 122);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (394, 57, 4, true, false, false, '', 123);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (395, 58, 4, true, false, false, '', 124);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (396, 59, 4, true, false, false, '', 125);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (397, 60, 4, true, false, false, '', 126);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (398, 61, 4, true, false, false, '', 127);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (399, 62, 4, true, false, false, '', 128);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (400, 63, 4, true, false, false, '', 129);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (401, 1, 6, true, false, false, '', 67);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (402, 2, 6, true, false, false, '', 68);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (403, 3, 6, true, false, false, '', 69);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (404, 4, 6, true, false, false, '', 70);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (405, 5, 6, true, false, false, '', 71);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (406, 6, 6, true, false, false, '', 72);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (407, 7, 6, true, false, false, '', 73);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (408, 8, 6, true, false, false, '', 74);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (409, 9, 6, true, false, false, '', 75);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (410, 10, 6, true, false, false, '', 76);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (411, 11, 6, true, false, false, '', 77);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (412, 12, 6, true, false, false, '', 78);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (413, 13, 6, true, false, false, '', 79);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (414, 14, 6, true, false, false, '', 80);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (415, 15, 6, true, false, false, '', 81);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (416, 16, 6, true, false, false, '', 82);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (417, 17, 6, true, false, false, '', 83);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (418, 18, 6, true, false, false, '', 84);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (419, 19, 6, true, false, false, '', 85);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (420, 20, 6, true, false, false, '', 86);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (421, 21, 6, true, false, false, '', 87);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (422, 22, 6, true, false, false, '', 88);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (423, 23, 6, true, false, false, '', 89);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (424, 24, 6, true, false, false, '', 90);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (425, 25, 6, true, false, false, '', 91);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (426, 26, 6, true, false, false, '', 92);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (427, 27, 6, true, false, false, '', 93);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (428, 28, 6, true, false, false, '', 94);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (429, 29, 6, true, false, false, '', 95);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (430, 30, 6, true, false, false, '', 96);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (431, 31, 6, true, false, false, '', 97);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (432, 32, 6, true, false, false, '', 98);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (433, 33, 6, true, false, false, '', 99);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (434, 34, 6, true, false, false, '', 100);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (435, 35, 6, true, false, false, '', 101);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (436, 36, 6, true, false, false, '', 102);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (437, 37, 6, true, false, false, '', 103);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (438, 38, 6, true, false, false, '', 104);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (439, 39, 6, true, false, false, '', 105);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (440, 40, 6, true, false, false, '', 106);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (441, 41, 6, true, false, false, '', 107);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (442, 42, 6, true, false, false, '', 108);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (443, 43, 6, true, false, true, '', 109);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (444, 44, 6, true, false, false, '', 110);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (445, 45, 6, true, false, false, '', 111);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (446, 46, 6, true, false, false, '', 112);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (447, 47, 6, true, false, false, '', 113);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (448, 48, 6, true, false, false, '', 114);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (449, 49, 6, true, false, false, '', 115);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (450, 50, 6, true, false, false, '', 116);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (451, 51, 6, true, false, false, '', 117);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (452, 52, 6, true, false, false, '', 118);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (453, 53, 6, true, false, false, '', 119);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (454, 54, 6, true, false, false, '', 120);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (455, 55, 6, true, false, true, '', 121);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (456, 56, 6, true, false, false, '', 122);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (457, 57, 6, true, false, false, '', 123);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (458, 58, 6, true, false, false, '', 124);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (459, 59, 6, true, false, false, '', 125);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (460, 60, 6, true, false, true, '', 126);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (461, 61, 6, true, false, true, '', 127);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (462, 62, 6, true, false, true, '', 128);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (463, 63, 6, true, false, true, '', 129);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (464, 1, 8, true, false, false, '', 67);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (465, 2, 8, true, false, false, '', 68);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (466, 3, 8, true, false, false, '', 69);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (467, 4, 8, true, false, false, '', 70);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (468, 5, 8, true, false, false, '', 71);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (469, 6, 8, true, false, false, '', 72);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (470, 7, 8, true, false, false, '', 73);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (471, 8, 8, true, false, false, '', 74);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (473, 10, 8, false, false, false, '', 76);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (472, 9, 8, true, false, false, '', 75);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (474, 11, 8, true, false, false, '', 77);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (475, 12, 8, true, false, false, '', 78);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (476, 13, 8, true, false, false, '', 79);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (479, 16, 8, false, false, false, '', 82);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (477, 14, 8, true, false, false, '', 80);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (478, 15, 8, false, false, false, '', 81);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (483, 20, 8, false, false, false, '', 86);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (482, 19, 8, false, false, false, '', 85);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (481, 18, 8, false, false, false, '', 84);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (480, 17, 8, true, false, false, '', 83);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (484, 21, 8, true, false, false, '', 87);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (485, 22, 8, true, false, false, '', 88);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (486, 23, 8, true, false, false, '', 89);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (487, 24, 8, true, false, false, '', 90);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (488, 25, 8, true, false, false, '', 91);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (490, 27, 8, false, false, false, '', 93);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (489, 26, 8, true, false, false, '', 92);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (491, 28, 8, true, false, false, '', 94);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (492, 29, 8, true, false, false, '', 95);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (493, 30, 8, true, false, false, '', 96);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (494, 31, 8, true, false, false, '', 97);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (495, 32, 8, true, false, false, '', 98);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (496, 33, 8, true, false, false, '', 99);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (497, 34, 8, true, false, false, '', 100);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (498, 35, 8, true, false, false, '', 101);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (499, 36, 8, true, false, false, '', 102);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (500, 37, 8, true, false, false, '', 103);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (502, 39, 8, false, false, false, '', 105);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (501, 38, 8, true, false, false, '', 104);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (503, 40, 8, true, false, false, '', 106);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (504, 41, 8, true, false, false, '', 107);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (505, 42, 8, true, false, false, '', 108);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (506, 43, 8, true, false, false, '', 109);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (507, 44, 8, true, false, false, '', 110);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (508, 45, 8, true, false, false, '', 111);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (509, 46, 8, true, false, false, '', 112);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (510, 47, 8, true, false, false, '', 113);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (511, 48, 8, true, false, false, '', 114);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (512, 49, 8, true, false, false, '', 115);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (514, 51, 8, false, false, false, '', 117);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (513, 50, 8, true, false, false, '', 116);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (515, 52, 8, true, false, false, '', 118);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (516, 53, 8, true, false, false, '', 119);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (518, 55, 8, false, false, false, '', 121);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (517, 54, 8, true, false, false, '', 120);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (519, 56, 8, true, false, false, '', 122);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (520, 57, 8, true, false, false, '', 123);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (521, 58, 8, true, false, false, '', 124);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (524, 61, 8, false, false, false, '', 127);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (522, 59, 8, true, false, false, '', 125);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (523, 60, 8, false, false, false, '', 126);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (525, 62, 8, false, false, false, '', 128);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (526, 63, 8, false, false, false, '', 129);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (527, 1, 11, true, false, false, '', 67);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (528, 2, 11, true, false, false, '', 68);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (529, 3, 11, true, false, false, '', 69);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (530, 4, 11, true, false, false, '', 70);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (531, 5, 11, true, false, false, '', 71);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (532, 6, 11, true, false, false, '', 72);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (533, 7, 11, true, false, false, '', 73);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (534, 8, 11, true, false, false, '', 74);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (535, 9, 11, true, false, false, '', 75);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (536, 10, 11, true, false, true, '', 76);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (537, 11, 11, true, false, false, '', 77);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (538, 12, 11, true, false, false, '', 78);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (539, 13, 11, true, false, false, '', 79);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (540, 14, 11, true, false, false, '', 80);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (541, 15, 11, true, false, true, '', 81);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (542, 16, 11, true, false, false, '', 82);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (543, 17, 11, true, false, false, '', 83);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (544, 18, 11, true, false, false, '', 84);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (545, 19, 11, true, false, false, '', 85);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (546, 20, 11, true, false, false, '', 86);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (547, 21, 11, true, false, false, '', 87);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (548, 22, 11, true, false, false, '', 88);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (549, 23, 11, true, false, false, '', 89);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (550, 24, 11, true, false, false, '', 90);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (551, 25, 11, true, false, false, '', 91);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (552, 26, 11, true, false, false, '', 92);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (554, 28, 11, false, false, false, '', 94);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (553, 27, 11, true, false, true, '', 93);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (555, 29, 11, true, false, false, '', 95);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (556, 30, 11, true, false, false, '', 96);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (557, 31, 11, true, false, false, '', 97);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (558, 32, 11, true, false, false, '', 98);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (559, 33, 11, true, false, false, '', 99);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (560, 34, 11, true, false, false, '', 100);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (561, 35, 11, true, false, false, '', 101);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (562, 36, 11, true, false, false, '', 102);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (563, 37, 11, true, false, false, '', 103);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (564, 38, 11, true, false, false, '', 104);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (565, 39, 11, true, false, false, '', 105);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (566, 40, 11, true, false, false, '', 106);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (567, 41, 11, true, false, false, '', 107);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (568, 42, 11, true, false, false, '', 108);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (569, 43, 11, true, false, false, '', 109);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (570, 44, 11, true, false, false, '', 110);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (571, 45, 11, true, false, false, '', 111);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (572, 46, 11, true, false, false, '', 112);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (573, 47, 11, true, false, false, '', 113);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (574, 48, 11, true, false, false, '', 114);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (575, 49, 11, true, false, false, '', 115);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (576, 50, 11, true, false, false, '', 116);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (577, 51, 11, true, false, false, '', 117);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (578, 52, 11, true, false, false, '', 118);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (579, 53, 11, true, false, false, '', 119);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (580, 54, 11, true, false, false, '', 120);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (581, 55, 11, true, false, true, '', 121);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (582, 56, 11, true, false, false, '', 122);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (583, 57, 11, true, false, false, '', 123);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (584, 58, 11, true, false, false, '', 124);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (585, 59, 11, true, false, false, '', 125);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (586, 60, 11, true, false, true, '', 126);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (587, 61, 11, true, false, true, '', 127);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (588, 62, 11, true, false, true, '', 128);
INSERT INTO pomsgset (id, "sequence", pofile, iscomplete, obsolete, fuzzy, commenttext, potmsgset) VALUES (589, 63, 11, true, false, true, '', 129);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'pomsgset'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'pomsgidsighting'::pg_catalog.regclass;

INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (1, 1, 1, '2005-03-18 18:31:17.54732', '2005-03-18 18:31:17.54732', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (2, 2, 2, '2005-03-18 18:31:17.54732', '2005-03-18 18:31:17.54732', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (3, 3, 3, '2005-03-18 18:31:17.54732', '2005-03-18 18:31:17.54732', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (4, 4, 4, '2005-03-18 18:31:17.54732', '2005-03-18 18:31:17.54732', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (5, 5, 5, '2005-03-18 18:31:17.54732', '2005-03-18 18:31:17.54732', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (6, 6, 6, '2005-03-18 18:31:17.54732', '2005-03-18 18:31:17.54732', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (7, 7, 7, '2005-03-18 18:31:17.54732', '2005-03-18 18:31:17.54732', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (8, 8, 8, '2005-03-18 18:31:17.54732', '2005-03-18 18:31:17.54732', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (9, 9, 9, '2005-03-18 18:31:17.54732', '2005-03-18 18:31:17.54732', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (10, 10, 10, '2005-03-18 18:31:17.54732', '2005-03-18 18:31:17.54732', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (11, 11, 11, '2005-03-18 18:31:17.54732', '2005-03-18 18:31:17.54732', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (12, 12, 12, '2005-03-18 18:31:17.54732', '2005-03-18 18:31:17.54732', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (13, 13, 13, '2005-03-18 18:31:17.54732', '2005-03-18 18:31:17.54732', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (14, 14, 14, '2005-03-18 18:31:17.54732', '2005-03-18 18:31:17.54732', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (15, 15, 15, '2005-03-18 18:31:17.54732', '2005-03-18 18:31:17.54732', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (17, 16, 17, '2005-03-18 18:31:17.54732', '2005-03-18 18:31:17.54732', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (19, 17, 19, '2005-03-18 18:31:17.54732', '2005-03-18 18:31:17.54732', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (21, 18, 21, '2005-03-18 18:31:17.54732', '2005-03-18 18:31:17.54732', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (22, 19, 22, '2005-03-18 18:31:17.54732', '2005-03-18 18:31:17.54732', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (23, 20, 23, '2005-03-18 18:31:17.54732', '2005-03-18 18:31:17.54732', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (24, 21, 24, '2005-03-18 18:31:17.54732', '2005-03-18 18:31:17.54732', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (26, 22, 26, '2005-04-07 13:16:19.484578', '2005-04-07 13:16:19.484578', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (16, 15, 16, '2005-03-18 18:31:17.54732', '2005-04-07 13:19:17.601068', true, 1);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (18, 16, 18, '2005-03-18 18:31:17.54732', '2005-04-07 13:19:17.601068', true, 1);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (20, 17, 20, '2005-03-18 18:31:17.54732', '2005-04-07 13:19:17.601068', true, 1);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (27, 23, 27, '2005-04-07 13:19:17.601068', '2005-04-07 13:19:17.601068', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (25, 21, 25, '2005-03-18 18:31:17.54732', '2005-04-07 13:19:17.601068', true, 1);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (28, 24, 28, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (29, 25, 29, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (30, 26, 30, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (31, 27, 31, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (32, 28, 32, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (33, 29, 33, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (34, 30, 34, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (35, 31, 35, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (36, 32, 36, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (37, 33, 37, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (38, 34, 38, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (39, 35, 39, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (40, 36, 40, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (41, 37, 41, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (42, 38, 42, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (43, 39, 43, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (44, 40, 44, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (45, 41, 45, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (46, 42, 46, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (47, 43, 47, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (48, 44, 48, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (49, 45, 49, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (50, 46, 50, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (51, 47, 51, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (52, 48, 52, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (53, 49, 53, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (54, 50, 54, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (55, 51, 55, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (56, 52, 56, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (57, 53, 57, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (58, 54, 58, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (59, 55, 59, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (60, 56, 60, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (61, 57, 61, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (62, 58, 62, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (63, 59, 63, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (64, 60, 64, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (65, 61, 65, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (66, 62, 66, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (67, 63, 67, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (68, 64, 68, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (69, 65, 69, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (70, 66, 70, '2005-05-06 20:09:20.041475', '2005-05-06 20:09:20.041475', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (71, 67, 71, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (72, 68, 72, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (73, 69, 73, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (74, 70, 74, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (75, 71, 75, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (76, 72, 76, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (77, 73, 77, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (78, 74, 78, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (79, 75, 79, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (80, 76, 80, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (81, 77, 81, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (82, 78, 82, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (83, 79, 83, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (84, 80, 84, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (85, 81, 85, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (86, 82, 86, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (87, 83, 87, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (88, 84, 88, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (89, 85, 89, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (90, 86, 90, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (91, 87, 91, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (92, 88, 92, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (93, 89, 93, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (94, 90, 94, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (95, 91, 95, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (96, 92, 96, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (97, 93, 97, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (98, 94, 98, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (99, 95, 99, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (100, 96, 100, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (101, 97, 101, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (102, 98, 102, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (103, 99, 103, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (104, 100, 104, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (105, 101, 105, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (106, 102, 106, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (107, 103, 107, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (108, 104, 108, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (109, 105, 109, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (110, 106, 110, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (111, 107, 111, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (112, 108, 112, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (113, 109, 113, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (114, 110, 114, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (115, 111, 115, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (116, 112, 116, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (117, 113, 117, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (118, 114, 118, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (119, 115, 119, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (120, 116, 120, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (121, 117, 121, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (122, 118, 122, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (123, 119, 123, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (124, 120, 124, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (125, 121, 125, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (126, 122, 126, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (127, 123, 127, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (128, 124, 128, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (129, 125, 129, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (130, 126, 130, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (131, 127, 131, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (132, 128, 132, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (133, 129, 133, '2005-05-06 20:09:23.775993', '2005-05-06 20:09:23.775993', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (134, 130, 1, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (135, 131, 2, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (136, 132, 3, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (137, 133, 4, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (138, 134, 5, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (139, 135, 6, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (140, 136, 7, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (141, 137, 8, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (142, 138, 9, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (143, 139, 10, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (144, 140, 11, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (145, 141, 12, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (146, 142, 13, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (147, 143, 14, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (148, 144, 15, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (150, 145, 17, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (152, 146, 19, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (154, 147, 21, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (155, 148, 22, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (156, 149, 23, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (157, 150, 24, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (159, 151, 26, '2005-05-06 20:50:49.06624', '2005-05-06 20:50:49.06624', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (160, 152, 134, '2005-05-06 21:12:12.222741', '2005-05-06 21:12:12.222741', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (161, 153, 135, '2005-05-06 21:12:12.222741', '2005-05-06 21:12:12.222741', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (162, 154, 136, '2005-05-06 21:12:12.222741', '2005-05-06 21:12:12.222741', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (163, 155, 137, '2005-05-06 21:12:12.222741', '2005-05-06 21:12:12.222741', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (164, 156, 138, '2005-05-06 21:12:12.222741', '2005-05-06 21:12:12.222741', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (165, 157, 139, '2005-05-06 21:12:12.222741', '2005-05-06 21:12:12.222741', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (166, 158, 140, '2005-05-06 21:12:12.222741', '2005-05-06 21:12:12.222741', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (167, 159, 141, '2005-05-06 21:12:12.222741', '2005-05-06 21:12:12.222741', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (168, 160, 142, '2005-05-06 21:12:12.222741', '2005-05-06 21:12:12.222741', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (149, 144, 16, '2005-05-06 20:50:49.06624', '2005-05-06 21:12:13.908028', true, 1);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (151, 145, 18, '2005-05-06 20:50:49.06624', '2005-05-06 21:12:13.908028', true, 1);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (153, 146, 20, '2005-05-06 20:50:49.06624', '2005-05-06 21:12:13.908028', true, 1);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (169, 161, 27, '2005-05-06 21:12:13.908028', '2005-05-06 21:12:13.908028', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (158, 150, 25, '2005-05-06 20:50:49.06624', '2005-05-06 21:12:13.908028', true, 1);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (170, 162, 143, '2005-05-06 21:12:33.238579', '2005-05-06 21:12:33.238579', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (171, 163, 144, '2005-05-06 21:12:33.238579', '2005-05-06 21:12:33.238579', true, 0);
INSERT INTO pomsgidsighting (id, potmsgset, pomsgid, datefirstseen, datelastseen, inlastrevision, pluralform) VALUES (172, 164, 145, '2005-05-06 21:12:33.238579', '2005-05-06 21:12:33.238579', true, 0);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'pomsgidsighting'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'potranslationsighting'::pg_catalog.regclass;

INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (1, 1, 1, NULL, '2005-04-07 13:19:17.601068', '2005-04-07 13:19:17.601068', true, 0, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (2, 2, 2, NULL, '2005-04-07 13:19:17.601068', '2005-04-07 13:19:17.601068', true, 0, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (3, 3, 3, NULL, '2005-04-07 13:19:17.601068', '2005-04-07 13:19:17.601068', true, 0, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (4, 5, 4, NULL, '2005-04-07 13:19:17.601068', '2005-04-07 13:19:17.601068', true, 0, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (5, 14, 5, NULL, '2005-04-07 13:19:17.601068', '2005-04-07 13:19:17.601068', true, 0, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (6, 15, 6, NULL, '2005-04-07 13:19:17.601068', '2005-04-07 13:19:17.601068', true, 0, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (7, 15, 7, NULL, '2005-04-07 13:19:17.601068', '2005-04-07 13:19:17.601068', true, 1, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (8, 16, 8, NULL, '2005-04-07 13:19:17.601068', '2005-04-07 13:19:17.601068', true, 0, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (9, 16, 9, NULL, '2005-04-07 13:19:17.601068', '2005-04-07 13:19:17.601068', true, 1, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (10, 17, 10, NULL, '2005-04-07 13:19:17.601068', '2005-04-07 13:19:17.601068', true, 0, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (11, 18, 11, NULL, '2005-04-07 13:19:17.601068', '2005-04-07 13:19:17.601068', true, 0, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (12, 22, 12, NULL, '2005-04-07 13:19:17.601068', '2005-04-07 13:19:17.601068', true, 0, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (13, 23, 13, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (14, 24, 14, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (15, 25, 15, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (16, 26, 16, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (17, 27, 17, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (18, 28, 18, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (19, 29, 19, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (20, 30, 20, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (21, 31, 21, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (22, 32, 22, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (23, 33, 23, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (24, 34, 24, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (25, 35, 25, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (26, 36, 26, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (27, 37, 27, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (28, 38, 28, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (29, 39, 29, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (30, 40, 30, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (31, 41, 31, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (32, 42, 32, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (33, 43, 33, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (34, 44, 34, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (35, 45, 35, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (36, 46, 36, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (37, 47, 37, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (38, 48, 38, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (39, 49, 39, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (40, 50, 40, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (41, 51, 41, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (42, 52, 42, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (43, 53, 43, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (44, 54, 44, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (45, 55, 45, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (46, 56, 46, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (47, 57, 47, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (48, 58, 48, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (49, 59, 49, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (50, 60, 50, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (51, 61, 51, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (52, 62, 52, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (53, 63, 53, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (54, 64, 54, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (55, 65, 55, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (56, 66, 56, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (57, 67, 57, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (58, 68, 58, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (59, 69, 59, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (60, 70, 60, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (61, 71, 61, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (62, 72, 62, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (63, 73, 63, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (64, 74, 64, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (65, 75, 65, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (66, 76, 66, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (67, 77, 67, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (68, 78, 68, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (69, 79, 69, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (70, 80, 70, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (71, 81, 71, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (72, 82, 72, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (73, 83, 73, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (74, 84, 74, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (75, 85, 75, NULL, '2005-05-06 20:09:31.825695', '2005-05-06 20:09:31.825695', true, 0, true, 1, 33);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (76, 86, 76, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (77, 87, 77, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (78, 88, 78, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (79, 89, 79, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (80, 90, 80, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (81, 91, 81, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (82, 92, 82, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (83, 93, 83, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (84, 94, 84, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (85, 95, 85, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (86, 96, 86, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (87, 97, 87, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (88, 98, 88, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (89, 99, 89, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (90, 100, 90, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (91, 101, 91, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (92, 102, 92, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (93, 103, 93, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (94, 104, 94, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (95, 105, 95, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (96, 106, 96, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (97, 107, 97, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (98, 108, 98, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (99, 109, 99, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (100, 110, 100, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (101, 111, 101, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (102, 112, 102, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (103, 113, 103, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (104, 114, 104, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (105, 115, 105, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (106, 116, 106, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (107, 117, 107, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (108, 118, 108, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (109, 119, 109, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (110, 120, 110, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (111, 121, 111, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (112, 122, 112, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (113, 123, 113, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (114, 124, 114, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (115, 125, 115, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (116, 126, 116, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (117, 127, 117, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (118, 128, 118, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (119, 129, 119, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (120, 130, 120, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (121, 131, 121, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (122, 132, 122, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (123, 133, 123, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (124, 134, 124, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (125, 135, 125, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (126, 136, 126, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (127, 137, 127, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (128, 138, 128, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (129, 139, 129, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (130, 140, 130, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (131, 141, 131, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (132, 142, 105, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (133, 143, 132, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (134, 144, 133, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (135, 145, 134, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (136, 146, 135, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (137, 147, 136, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (138, 148, 137, NULL, '2005-05-06 20:09:51.386766', '2005-05-06 20:09:51.386766', true, 0, true, 1, 34);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (139, 149, 138, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (140, 150, 139, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (141, 151, 140, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (142, 152, 141, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (143, 153, 142, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (144, 154, 143, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (145, 155, 144, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (146, 156, 145, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (147, 157, 146, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (148, 158, 147, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (149, 159, 148, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (150, 160, 149, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (151, 161, 150, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (152, 162, 151, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (153, 163, 152, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (154, 164, 153, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (155, 165, 154, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (156, 166, 155, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (157, 167, 156, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (158, 168, 157, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (159, 169, 158, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (160, 170, 159, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (161, 171, 160, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (162, 172, 161, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (163, 173, 162, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (164, 174, 163, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (165, 175, 164, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (166, 176, 165, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (167, 177, 166, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (168, 178, 167, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (169, 179, 168, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (170, 180, 169, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (171, 181, 170, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (172, 182, 171, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (173, 183, 172, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (174, 184, 173, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (175, 185, 174, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (176, 186, 175, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (177, 187, 176, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (178, 188, 177, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (179, 189, 178, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (180, 190, 179, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (181, 191, 180, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (182, 192, 181, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (183, 193, 182, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (184, 194, 183, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (185, 195, 184, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (186, 196, 185, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (187, 197, 186, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (188, 198, 187, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (189, 199, 188, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (190, 200, 189, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (191, 201, 190, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (192, 202, 191, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (193, 203, 192, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (194, 204, 193, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (195, 205, 194, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (196, 206, 195, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (197, 207, 196, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (198, 208, 197, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (199, 209, 198, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (200, 210, 199, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (201, 211, 200, NULL, '2005-05-06 20:10:18.431259', '2005-05-06 20:10:18.431259', true, 0, true, 1, 35);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (202, 212, 201, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (203, 213, 202, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (204, 214, 203, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (205, 215, 204, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (206, 216, 205, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (207, 217, 206, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (208, 218, 207, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (209, 219, 208, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (210, 220, 209, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (211, 221, 210, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (212, 222, 211, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (213, 223, 212, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (214, 224, 213, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (215, 225, 214, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (216, 226, 215, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (217, 227, 216, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (218, 228, 217, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (219, 229, 218, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (220, 230, 219, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (221, 231, 220, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (222, 232, 221, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (223, 233, 222, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (224, 234, 223, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (225, 235, 224, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (226, 236, 225, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (227, 237, 226, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (228, 238, 227, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (229, 239, 228, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (230, 240, 229, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (231, 241, 230, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (232, 242, 231, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (233, 243, 232, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (234, 244, 233, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (235, 245, 234, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (236, 246, 235, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (237, 247, 236, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (238, 248, 237, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (239, 249, 238, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (240, 250, 239, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (241, 251, 240, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (242, 252, 241, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (243, 253, 242, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (244, 254, 243, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (245, 255, 244, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (246, 256, 245, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (247, 257, 246, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (248, 258, 247, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (249, 259, 248, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (250, 260, 249, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (251, 261, 250, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (252, 262, 251, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (253, 263, 252, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (254, 264, 253, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (255, 265, 254, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (256, 266, 255, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (257, 267, 256, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (258, 268, 257, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (259, 269, 258, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (260, 270, 259, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (261, 271, 260, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (262, 272, 261, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (263, 273, 262, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (264, 274, 263, NULL, '2005-05-06 20:10:41.732277', '2005-05-06 20:10:41.732277', true, 0, true, 1, 36);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (265, 275, 264, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (266, 276, 265, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (267, 277, 266, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (268, 278, 267, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (269, 279, 268, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (270, 280, 269, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (271, 281, 270, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (272, 282, 271, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (273, 283, 272, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (274, 284, 273, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (275, 285, 274, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (276, 286, 275, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (277, 287, 276, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (278, 288, 277, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (279, 289, 278, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (280, 290, 279, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (281, 291, 280, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (282, 292, 281, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (283, 293, 282, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (284, 294, 283, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (285, 295, 284, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (286, 296, 285, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (287, 297, 286, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (288, 298, 287, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (289, 299, 288, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (290, 300, 289, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (291, 301, 290, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (292, 302, 291, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (293, 303, 292, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (294, 304, 293, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (295, 305, 294, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (296, 306, 295, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (297, 307, 296, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (298, 308, 297, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (299, 309, 298, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (300, 310, 299, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (301, 311, 300, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (302, 312, 301, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (303, 313, 302, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (304, 314, 303, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (305, 315, 304, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (306, 316, 305, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (307, 317, 306, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (308, 318, 307, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (309, 319, 308, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (310, 320, 309, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (311, 321, 310, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (312, 322, 311, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (313, 323, 312, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (314, 324, 313, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (315, 325, 314, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (316, 326, 315, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (317, 327, 316, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (318, 328, 317, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (319, 329, 318, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (320, 330, 319, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (321, 331, 320, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (322, 332, 321, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (323, 333, 322, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (324, 334, 323, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (325, 335, 324, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (326, 336, 325, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (327, 337, 326, NULL, '2005-05-06 20:11:16.591589', '2005-05-06 20:11:16.591589', true, 0, true, 1, 37);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (328, 338, 327, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (329, 339, 328, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (330, 340, 329, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (331, 341, 330, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (332, 342, 331, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (333, 343, 332, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (334, 344, 333, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (335, 345, 334, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (336, 346, 335, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (337, 347, 336, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (338, 348, 337, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (339, 349, 338, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (340, 350, 339, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (341, 351, 340, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (342, 352, 341, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (343, 353, 342, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (344, 354, 343, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (345, 355, 344, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (346, 356, 345, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (347, 357, 346, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (348, 358, 347, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (349, 359, 348, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (350, 360, 349, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (351, 361, 350, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (352, 362, 351, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (353, 363, 352, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (354, 364, 353, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (355, 365, 354, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (356, 366, 355, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (357, 367, 356, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (358, 368, 357, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (359, 369, 358, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (360, 370, 359, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (361, 371, 360, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (362, 372, 361, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (363, 373, 362, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (364, 374, 363, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (365, 375, 364, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (366, 376, 365, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (367, 377, 366, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (368, 378, 367, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (369, 379, 368, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (370, 380, 369, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (371, 381, 370, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (372, 382, 371, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (373, 383, 372, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (374, 384, 373, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (375, 385, 374, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (376, 386, 375, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (377, 387, 376, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (378, 388, 377, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (379, 389, 378, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (380, 390, 379, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (381, 391, 380, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (382, 392, 381, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (383, 393, 382, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (384, 394, 383, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (385, 395, 384, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (386, 396, 385, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (387, 397, 386, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (388, 398, 387, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (389, 399, 388, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (390, 400, 389, NULL, '2005-05-06 20:11:41.773683', '2005-05-06 20:11:41.773683', true, 0, true, 1, 38);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (391, 401, 390, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (392, 402, 391, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (393, 403, 392, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (394, 404, 393, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (395, 405, 394, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (396, 406, 395, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (397, 407, 396, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (398, 408, 397, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (399, 409, 398, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (400, 410, 399, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (401, 411, 400, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (402, 412, 401, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (403, 413, 402, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (404, 414, 403, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (405, 415, 404, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (406, 416, 405, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (407, 417, 406, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (408, 418, 407, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (409, 419, 408, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (410, 420, 409, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (411, 421, 410, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (412, 422, 411, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (413, 423, 412, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (414, 424, 413, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (415, 425, 414, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (416, 426, 415, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (417, 427, 416, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (418, 428, 417, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (419, 429, 418, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (420, 430, 419, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (421, 431, 420, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (422, 432, 421, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (423, 433, 422, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (424, 434, 423, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (425, 435, 424, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (426, 436, 425, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (427, 437, 426, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (428, 438, 427, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (429, 439, 428, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (430, 440, 429, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (431, 441, 430, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (432, 442, 431, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (433, 443, 432, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (434, 444, 433, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (435, 445, 434, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (436, 446, 435, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (437, 447, 436, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (438, 448, 437, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (439, 449, 438, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (440, 450, 439, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (441, 451, 440, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (442, 452, 441, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (443, 453, 442, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (444, 454, 443, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (445, 455, 444, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (446, 456, 445, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (447, 457, 446, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (448, 458, 447, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (449, 459, 448, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (450, 460, 449, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (451, 461, 450, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (452, 462, 451, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (453, 463, 452, NULL, '2005-05-06 20:12:08.283113', '2005-05-06 20:12:08.283113', true, 0, true, 1, 39);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (454, 464, 453, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (455, 465, 454, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (456, 466, 455, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (457, 467, 456, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (458, 468, 457, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (459, 469, 458, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (460, 470, 459, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (461, 471, 460, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (462, 472, 461, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (463, 474, 462, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (464, 475, 463, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (465, 476, 464, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (466, 477, 465, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (467, 480, 466, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (468, 484, 467, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (469, 485, 468, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (470, 486, 469, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (471, 487, 470, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (472, 488, 471, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (473, 489, 472, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (474, 491, 473, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (475, 492, 474, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (476, 493, 475, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (477, 494, 476, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (478, 495, 477, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (479, 496, 478, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (480, 497, 479, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (481, 498, 480, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (482, 499, 481, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (483, 500, 482, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (484, 501, 483, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (485, 503, 484, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (486, 504, 485, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (487, 505, 486, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (488, 506, 487, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (489, 507, 488, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (490, 508, 489, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (491, 509, 490, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (492, 510, 491, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (493, 511, 492, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (494, 512, 493, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (495, 513, 494, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (496, 515, 495, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (497, 516, 496, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (498, 517, 497, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (499, 519, 498, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (500, 520, 499, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (501, 521, 500, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (502, 522, 501, NULL, '2005-05-06 20:12:35.976807', '2005-05-06 20:12:35.976807', true, 0, true, 1, 40);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (503, 527, 264, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (504, 528, 265, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (505, 529, 266, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (506, 530, 267, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (507, 531, 268, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (508, 532, 269, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (509, 533, 270, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (510, 534, 271, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (511, 535, 272, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (512, 536, 273, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (513, 537, 274, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (514, 538, 275, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (515, 539, 276, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (516, 540, 502, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (517, 541, 278, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (518, 542, 279, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (519, 543, 280, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (520, 544, 281, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (521, 545, 282, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (522, 546, 283, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (523, 547, 284, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (524, 548, 503, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (525, 549, 504, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (526, 550, 505, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (527, 551, 506, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (528, 552, 507, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (529, 553, 508, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (530, 555, 292, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (531, 556, 509, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (532, 557, 294, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (533, 558, 295, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (534, 559, 510, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (535, 560, 511, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (536, 561, 512, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (537, 562, 513, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (538, 563, 514, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (539, 564, 515, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (540, 565, 516, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (541, 566, 517, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (542, 567, 304, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (543, 568, 518, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (544, 569, 519, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (545, 570, 307, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (546, 571, 520, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (547, 572, 521, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (548, 573, 522, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (549, 574, 523, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (550, 575, 524, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (551, 576, 525, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (552, 577, 526, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (553, 578, 527, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (554, 579, 528, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (555, 580, 529, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (556, 581, 530, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (557, 582, 319, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (558, 583, 531, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (559, 584, 321, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (560, 585, 322, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (561, 586, 532, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (562, 587, 533, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (563, 588, 534, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (564, 589, 535, NULL, '2005-05-06 20:13:10.405056', '2005-05-06 20:13:10.405056', true, 0, true, 1, 41);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (565, 590, 1, NULL, '2005-05-06 21:12:13.908028', '2005-05-06 21:12:13.908028', true, 0, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (566, 591, 2, NULL, '2005-05-06 21:12:13.908028', '2005-05-06 21:12:13.908028', true, 0, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (567, 592, 3, NULL, '2005-05-06 21:12:13.908028', '2005-05-06 21:12:13.908028', true, 0, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (568, 594, 4, NULL, '2005-05-06 21:12:13.908028', '2005-05-06 21:12:13.908028', true, 0, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (569, 603, 5, NULL, '2005-05-06 21:12:13.908028', '2005-05-06 21:12:13.908028', true, 0, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (570, 604, 6, NULL, '2005-05-06 21:12:13.908028', '2005-05-06 21:12:13.908028', true, 0, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (571, 604, 7, NULL, '2005-05-06 21:12:13.908028', '2005-05-06 21:12:13.908028', true, 1, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (572, 605, 8, NULL, '2005-05-06 21:12:13.908028', '2005-05-06 21:12:13.908028', true, 0, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (573, 605, 9, NULL, '2005-05-06 21:12:13.908028', '2005-05-06 21:12:13.908028', true, 1, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (574, 606, 10, NULL, '2005-05-06 21:12:13.908028', '2005-05-06 21:12:13.908028', true, 0, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (575, 607, 11, NULL, '2005-05-06 21:12:13.908028', '2005-05-06 21:12:13.908028', true, 0, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (576, 611, 12, NULL, '2005-05-06 21:12:13.908028', '2005-05-06 21:12:13.908028', true, 0, true, 1, 13);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (577, 612, 536, NULL, '2005-05-06 21:12:18.833057', '2005-05-06 21:12:18.833057', true, 0, true, 1, 42);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (578, 613, 537, NULL, '2005-05-06 21:12:18.833057', '2005-05-06 21:12:18.833057', true, 0, true, 1, 42);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (579, 614, 538, NULL, '2005-05-06 21:12:18.833057', '2005-05-06 21:12:18.833057', true, 0, true, 1, 42);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (580, 615, 539, NULL, '2005-05-06 21:12:18.833057', '2005-05-06 21:12:18.833057', true, 0, true, 1, 42);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (581, 616, 540, NULL, '2005-05-06 21:12:18.833057', '2005-05-06 21:12:18.833057', true, 0, true, 1, 42);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (582, 617, 541, NULL, '2005-05-06 21:12:18.833057', '2005-05-06 21:12:18.833057', true, 0, true, 1, 42);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (583, 618, 542, NULL, '2005-05-06 21:12:18.833057', '2005-05-06 21:12:18.833057', true, 0, true, 1, 42);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (584, 619, 543, NULL, '2005-05-06 21:12:18.833057', '2005-05-06 21:12:18.833057', true, 0, true, 1, 42);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (585, 620, 544, NULL, '2005-05-06 21:12:18.833057', '2005-05-06 21:12:18.833057', true, 0, true, 1, 42);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (586, 621, 545, NULL, '2005-05-06 21:12:20.874654', '2005-05-06 21:12:20.874654', true, 0, true, 1, 43);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (587, 622, 546, NULL, '2005-05-06 21:12:20.874654', '2005-05-06 21:12:20.874654', true, 0, true, 1, 43);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (588, 623, 547, NULL, '2005-05-06 21:12:20.874654', '2005-05-06 21:12:20.874654', true, 0, true, 1, 43);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (589, 624, 548, NULL, '2005-05-06 21:12:20.874654', '2005-05-06 21:12:20.874654', true, 0, true, 1, 43);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (590, 625, 549, NULL, '2005-05-06 21:12:20.874654', '2005-05-06 21:12:20.874654', true, 0, true, 1, 43);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (591, 626, 550, NULL, '2005-05-06 21:12:20.874654', '2005-05-06 21:12:20.874654', true, 0, true, 1, 43);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (592, 627, 551, NULL, '2005-05-06 21:12:20.874654', '2005-05-06 21:12:20.874654', true, 0, true, 1, 43);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (593, 628, 552, NULL, '2005-05-06 21:12:20.874654', '2005-05-06 21:12:20.874654', true, 0, true, 1, 43);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (594, 629, 553, NULL, '2005-05-06 21:12:20.874654', '2005-05-06 21:12:20.874654', true, 0, true, 1, 43);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (595, 630, 554, NULL, '2005-05-06 21:12:23.441015', '2005-05-06 21:12:23.441015', true, 0, true, 1, 30);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (596, 631, 555, NULL, '2005-05-06 21:12:23.441015', '2005-05-06 21:12:23.441015', true, 0, true, 1, 30);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (597, 632, 556, NULL, '2005-05-06 21:12:23.441015', '2005-05-06 21:12:23.441015', true, 0, true, 1, 30);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (598, 633, 557, NULL, '2005-05-06 21:12:23.441015', '2005-05-06 21:12:23.441015', true, 0, true, 1, 30);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (599, 634, 558, NULL, '2005-05-06 21:12:23.441015', '2005-05-06 21:12:23.441015', true, 0, true, 1, 30);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (600, 635, 559, NULL, '2005-05-06 21:12:23.441015', '2005-05-06 21:12:23.441015', true, 0, true, 1, 30);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (601, 636, 560, NULL, '2005-05-06 21:12:23.441015', '2005-05-06 21:12:23.441015', true, 0, true, 1, 30);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (602, 637, 561, NULL, '2005-05-06 21:12:23.441015', '2005-05-06 21:12:23.441015', true, 0, true, 1, 30);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (603, 638, 562, NULL, '2005-05-06 21:12:23.441015', '2005-05-06 21:12:23.441015', true, 0, true, 1, 30);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (604, 639, 563, NULL, '2005-05-06 21:12:25.930403', '2005-05-06 21:12:25.930403', true, 0, true, 1, 44);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (605, 640, 564, NULL, '2005-05-06 21:12:25.930403', '2005-05-06 21:12:25.930403', true, 0, true, 1, 44);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (606, 641, 565, NULL, '2005-05-06 21:12:25.930403', '2005-05-06 21:12:25.930403', true, 0, true, 1, 44);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (607, 642, 566, NULL, '2005-05-06 21:12:25.930403', '2005-05-06 21:12:25.930403', true, 0, true, 1, 44);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (608, 643, 567, NULL, '2005-05-06 21:12:25.930403', '2005-05-06 21:12:25.930403', true, 0, true, 1, 44);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (609, 644, 568, NULL, '2005-05-06 21:12:25.930403', '2005-05-06 21:12:25.930403', true, 0, true, 1, 44);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (610, 648, 569, NULL, '2005-05-06 21:12:27.602384', '2005-05-06 21:12:27.602384', true, 0, true, 1, 45);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (611, 649, 570, NULL, '2005-05-06 21:12:27.602384', '2005-05-06 21:12:27.602384', true, 0, true, 1, 45);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (612, 650, 571, NULL, '2005-05-06 21:12:27.602384', '2005-05-06 21:12:27.602384', true, 0, true, 1, 45);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (613, 651, 572, NULL, '2005-05-06 21:12:27.602384', '2005-05-06 21:12:27.602384', true, 0, true, 1, 45);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (614, 652, 573, NULL, '2005-05-06 21:12:27.602384', '2005-05-06 21:12:27.602384', true, 0, true, 1, 45);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (615, 653, 574, NULL, '2005-05-06 21:12:27.602384', '2005-05-06 21:12:27.602384', true, 0, true, 1, 45);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (616, 654, 575, NULL, '2005-05-06 21:12:27.602384', '2005-05-06 21:12:27.602384', true, 0, true, 1, 45);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (617, 655, 576, NULL, '2005-05-06 21:12:27.602384', '2005-05-06 21:12:27.602384', true, 0, true, 1, 45);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (618, 656, 577, NULL, '2005-05-06 21:12:27.602384', '2005-05-06 21:12:27.602384', true, 0, true, 1, 45);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (619, 657, 578, NULL, '2005-05-06 21:12:29.45271', '2005-05-06 21:12:29.45271', true, 0, true, 1, 46);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (620, 658, 579, NULL, '2005-05-06 21:12:29.45271', '2005-05-06 21:12:29.45271', true, 0, true, 1, 46);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (621, 659, 580, NULL, '2005-05-06 21:12:29.45271', '2005-05-06 21:12:29.45271', true, 0, true, 1, 46);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (622, 660, 581, NULL, '2005-05-06 21:12:29.45271', '2005-05-06 21:12:29.45271', true, 0, true, 1, 46);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (623, 661, 582, NULL, '2005-05-06 21:12:29.45271', '2005-05-06 21:12:29.45271', true, 0, true, 1, 46);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (624, 662, 583, NULL, '2005-05-06 21:12:29.45271', '2005-05-06 21:12:29.45271', true, 0, true, 1, 46);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (625, 663, 584, NULL, '2005-05-06 21:12:29.45271', '2005-05-06 21:12:29.45271', true, 0, true, 1, 46);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (626, 664, 585, NULL, '2005-05-06 21:12:29.45271', '2005-05-06 21:12:29.45271', true, 0, true, 1, 46);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (627, 665, 586, NULL, '2005-05-06 21:12:29.45271', '2005-05-06 21:12:29.45271', true, 0, true, 1, 46);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (628, 666, 587, NULL, '2005-05-06 21:12:31.382429', '2005-05-06 21:12:31.382429', true, 0, true, 1, 47);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (629, 667, 588, NULL, '2005-05-06 21:12:31.382429', '2005-05-06 21:12:31.382429', true, 0, true, 1, 47);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (630, 668, 589, NULL, '2005-05-06 21:12:31.382429', '2005-05-06 21:12:31.382429', true, 0, true, 1, 47);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (631, 669, 590, NULL, '2005-05-06 21:12:31.382429', '2005-05-06 21:12:31.382429', true, 0, true, 1, 47);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (632, 670, 591, NULL, '2005-05-06 21:12:31.382429', '2005-05-06 21:12:31.382429', true, 0, true, 1, 47);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (633, 671, 592, NULL, '2005-05-06 21:12:31.382429', '2005-05-06 21:12:31.382429', true, 0, true, 1, 47);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (634, 672, 593, NULL, '2005-05-06 21:12:31.382429', '2005-05-06 21:12:31.382429', true, 0, true, 1, 47);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (635, 673, 594, NULL, '2005-05-06 21:12:31.382429', '2005-05-06 21:12:31.382429', true, 0, true, 1, 47);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (636, 674, 595, NULL, '2005-05-06 21:12:31.382429', '2005-05-06 21:12:31.382429', true, 0, true, 1, 47);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (637, 675, 596, NULL, '2005-05-06 21:12:33.238579', '2005-05-06 21:12:33.238579', true, 0, true, 1, 48);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (638, 676, 597, NULL, '2005-05-06 21:12:33.238579', '2005-05-06 21:12:33.238579', true, 0, true, 1, 48);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (639, 677, 598, NULL, '2005-05-06 21:12:33.238579', '2005-05-06 21:12:33.238579', true, 0, true, 1, 48);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (640, 678, 599, NULL, '2005-05-06 21:12:33.238579', '2005-05-06 21:12:33.238579', true, 0, true, 1, 48);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (641, 679, 600, NULL, '2005-05-06 21:12:33.238579', '2005-05-06 21:12:33.238579', true, 0, true, 1, 48);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (642, 680, 601, NULL, '2005-05-06 21:12:33.238579', '2005-05-06 21:12:33.238579', true, 0, true, 1, 48);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (643, 681, 602, NULL, '2005-05-06 21:12:33.238579', '2005-05-06 21:12:33.238579', true, 0, true, 1, 48);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (644, 682, 603, NULL, '2005-05-06 21:12:33.238579', '2005-05-06 21:12:33.238579', true, 0, true, 1, 48);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (645, 683, 604, NULL, '2005-05-06 21:12:33.238579', '2005-05-06 21:12:33.238579', true, 0, true, 1, 48);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (646, 684, 605, NULL, '2005-05-06 21:12:33.238579', '2005-05-06 21:12:33.238579', true, 0, true, 1, 48);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (647, 685, 606, NULL, '2005-05-06 21:12:33.238579', '2005-05-06 21:12:33.238579', true, 0, true, 1, 48);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (648, 686, 607, NULL, '2005-05-06 21:12:33.238579', '2005-05-06 21:12:33.238579', true, 0, true, 1, 48);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (649, 687, 608, NULL, '2005-05-06 21:12:35.766036', '2005-05-06 21:12:35.766036', true, 0, true, 1, 30);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (650, 688, 609, NULL, '2005-05-06 21:12:35.766036', '2005-05-06 21:12:35.766036', true, 0, true, 1, 30);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (651, 689, 610, NULL, '2005-05-06 21:12:35.766036', '2005-05-06 21:12:35.766036', true, 0, true, 1, 30);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (652, 696, 611, NULL, '2005-05-06 21:12:37.221421', '2005-05-06 21:12:37.221421', true, 0, true, 1, 49);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (653, 697, 612, NULL, '2005-05-06 21:12:37.221421', '2005-05-06 21:12:37.221421', true, 0, true, 1, 49);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (654, 698, 613, NULL, '2005-05-06 21:12:37.221421', '2005-05-06 21:12:37.221421', true, 0, true, 1, 49);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (655, 699, 614, NULL, '2005-05-06 21:12:37.221421', '2005-05-06 21:12:37.221421', true, 0, true, 1, 49);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (656, 700, 615, NULL, '2005-05-06 21:12:37.221421', '2005-05-06 21:12:37.221421', true, 0, true, 1, 49);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (657, 701, 616, NULL, '2005-05-06 21:12:37.221421', '2005-05-06 21:12:37.221421', true, 0, true, 1, 49);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (658, 702, 617, NULL, '2005-05-06 21:12:37.221421', '2005-05-06 21:12:37.221421', true, 0, true, 1, 49);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (659, 703, 618, NULL, '2005-05-06 21:12:37.221421', '2005-05-06 21:12:37.221421', true, 0, true, 1, 49);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (660, 704, 619, NULL, '2005-05-06 21:12:37.221421', '2005-05-06 21:12:37.221421', true, 0, true, 1, 49);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (661, 705, 620, NULL, '2005-05-06 21:12:39.082421', '2005-05-06 21:12:39.082421', true, 0, true, 1, 50);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (662, 706, 621, NULL, '2005-05-06 21:12:39.082421', '2005-05-06 21:12:39.082421', true, 0, true, 1, 50);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (663, 707, 622, NULL, '2005-05-06 21:12:39.082421', '2005-05-06 21:12:39.082421', true, 0, true, 1, 50);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (664, 708, 623, NULL, '2005-05-06 21:12:39.082421', '2005-05-06 21:12:39.082421', true, 0, true, 1, 50);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (665, 709, 624, NULL, '2005-05-06 21:12:39.082421', '2005-05-06 21:12:39.082421', true, 0, true, 1, 50);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (666, 710, 625, NULL, '2005-05-06 21:12:39.082421', '2005-05-06 21:12:39.082421', true, 0, true, 1, 50);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (667, 711, 626, NULL, '2005-05-06 21:12:39.082421', '2005-05-06 21:12:39.082421', true, 0, true, 1, 50);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (668, 712, 627, NULL, '2005-05-06 21:12:39.082421', '2005-05-06 21:12:39.082421', true, 0, true, 1, 50);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (669, 713, 628, NULL, '2005-05-06 21:12:39.082421', '2005-05-06 21:12:39.082421', true, 0, true, 1, 50);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (670, 714, 629, NULL, '2005-05-06 21:12:40.937835', '2005-05-06 21:12:40.937835', true, 0, true, 1, 30);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (671, 715, 630, NULL, '2005-05-06 21:12:40.937835', '2005-05-06 21:12:40.937835', true, 0, true, 1, 30);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (672, 716, 631, NULL, '2005-05-06 21:12:40.937835', '2005-05-06 21:12:40.937835', true, 0, true, 1, 30);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (673, 717, 632, NULL, '2005-05-06 21:12:40.937835', '2005-05-06 21:12:40.937835', true, 0, true, 1, 30);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (674, 718, 633, NULL, '2005-05-06 21:12:40.937835', '2005-05-06 21:12:40.937835', true, 0, true, 1, 30);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (675, 719, 634, NULL, '2005-05-06 21:12:40.937835', '2005-05-06 21:12:40.937835', true, 0, true, 1, 30);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (676, 723, 635, NULL, '2005-05-06 21:12:42.747648', '2005-05-06 21:12:42.747648', true, 0, true, 1, 51);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (677, 724, 636, NULL, '2005-05-06 21:12:42.747648', '2005-05-06 21:12:42.747648', true, 0, true, 1, 51);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (678, 725, 637, NULL, '2005-05-06 21:12:42.747648', '2005-05-06 21:12:42.747648', true, 0, true, 1, 51);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (679, 726, 638, NULL, '2005-05-06 21:12:42.747648', '2005-05-06 21:12:42.747648', true, 0, true, 1, 51);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (680, 727, 639, NULL, '2005-05-06 21:12:42.747648', '2005-05-06 21:12:42.747648', true, 0, true, 1, 51);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (681, 728, 640, NULL, '2005-05-06 21:12:42.747648', '2005-05-06 21:12:42.747648', true, 0, true, 1, 51);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (682, 729, 641, NULL, '2005-05-06 21:12:42.747648', '2005-05-06 21:12:42.747648', true, 0, true, 1, 51);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (683, 730, 642, NULL, '2005-05-06 21:12:42.747648', '2005-05-06 21:12:42.747648', true, 0, true, 1, 51);
INSERT INTO potranslationsighting (id, pomsgset, potranslation, license, datefirstseen, datelastactive, inlastrevision, pluralform, active, origin, person) VALUES (684, 731, 643, NULL, '2005-05-06 21:12:42.747648', '2005-05-06 21:12:42.747648', true, 0, true, 1, 51);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'potranslationsighting'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'pocomment'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'pocomment'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'translationeffort'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'translationeffort'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'translationeffortpotemplate'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'translationeffortpotemplate'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'posubscription'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'posubscription'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'bug'::pg_catalog.regclass;

INSERT INTO bug (id, datecreated, name, title, description, "owner", duplicateof, communityscore, communitytimestamp, activityscore, activitytimestamp, hits, hitstimestamp, summary, fti, private) VALUES (1, '2004-09-24 20:58:04.553583', NULL, 'Firefox does not support SVG', 'The SVG standard 1.0 is complete, and draft implementations for Firefox exist. One of these implementations needs to be integrated with the base install of Firefox. Ideally, the implementation needs to include support for the manipulation of SVG objects from JavaScript to enable interactive and dynamic SVG drawings.', 12, NULL, 0, '2004-09-24 00:00:00', 0, '2004-09-24 00:00:00', 0, '2004-09-24 00:00:00', 'Firefox needs to support embedded SVG images, now that the standard has been finalised.', '''1.0'':23 ''one'':32 ''svg'':5,11,21,57,66 ''base'':42 ''draw'':67 ''imag'':12 ''need'':7,36,49 ''draft'':27 ''dynam'':65 ''embed'':10 ''enabl'':62 ''exist'':31 ''ideal'':46 ''includ'':51 ''instal'':43 ''integr'':39 ''object'':58 ''complet'':25 ''finalis'':19 ''firefox'':1,6,30,45 ''manipul'':55 ''support'':4,9,52 ''interact'':63 ''standard'':16,22 ''implement'':28,35,48 ''javascript'':60', false);
INSERT INTO bug (id, datecreated, name, title, description, "owner", duplicateof, communityscore, communitytimestamp, activityscore, activitytimestamp, hits, hitstimestamp, summary, fti, private) VALUES (2, '2004-09-24 20:58:04.572546', 'blackhole', 'Blackhole Trash folder', 'The Trash folder seems to have significant problems! At the moment, dragging an item to the trash results in immediate deletion. The item does not appear in the Trash, it is just deleted from my hard disk. There is no undo or ability to recover the deleted file. Help!', 12, NULL, 0, '2004-09-24 00:00:00', 0, '2004-09-24 00:00:00', 0, '2004-09-24 00:00:00', 'Everything put into the folder "Trash" disappears!', '''put'':6 ''abil'':54 ''disk'':48 ''drag'':23 ''file'':59 ''hard'':47 ''help'':60 ''item'':25,34 ''seem'':15 ''undo'':52 ''delet'':32,44,58 ''recov'':56 ''trash'':3,10,13,28,40 ''appear'':37 ''folder'':4,9,14 ''immedi'':31 ''moment'':22 ''result'':29 ''everyth'':5 ''problem'':19 ''blackhol'':1,2 ''signific'':18 ''disappear'':11', false);
INSERT INTO bug (id, datecreated, name, title, description, "owner", duplicateof, communityscore, communitytimestamp, activityscore, activitytimestamp, hits, hitstimestamp, summary, fti, private) VALUES (3, '2004-10-05 00:00:00', NULL, 'Bug Title Test', 'y idu yifdxhfgffxShirtpkdf jlkdsj;lkd lkjd hlkjfds gkfdsg kfd glkfd gifdsytoxdiytxoiufdytoidxf yxoigfyoigfxuyfxoiug yxoiuy oiugf hyoifxugyoixgfuy xoiuyxoiyxoifuy xoShirtpkdf jlkdsj;lkd lkjd hlkjfds gkfdsg kfd glkfd gifdsytoxdiytxoiufdytoidxf yxoigfyoigfxuyfxoiug yxoiuy oiugf hyoifxugyoixgfuy xoiuyxoiyxoifuy xo
Shirtpkdf jlkdsj;lkd lkjd hlkjfds gkfdsg kfd glkfd gifdsytoxdiytxoiufdytoidxf yxoigfyoigfxuyfxoiug yxoiuy oiugf hyoifxugyoixgfuy xoiuyxoiyxoifuy xoShirtpkdf jlkdsj;lkd lkjd hlkjfds gkfdsg kfd glkfd gifdsytoxdiytxoiufdytoidxf yxoigfyoigfxuyfxoiug yxoiuy oiugf hyoifxugyoixgfuy xoiuyxoiyxoifuy xo

Shirtpkdf jlkdsj;lkd lkjd hlkjfds gkfdsg kfd glkfd gifdsytoxdiytxoiufdytoidxf yxoigfyoigfxuyfxoiug yxoiuy oiugf hyoifxugyoixgfuy xoiuyxoiyxoifuy xoShirtpkdf jlkdsj;lkd lkjd hlkjfds gkfdsg kfd glkfd gifdsytoxdiytxoiufdytoidxf yxoigfyoigfxuyfxoiug yxoiuy oiugf hyoifxugyoixgfuy xoiuyxoiyxoifuy xo', 16, NULL, 0, '2004-10-05 00:00:00', 0, '2004-10-05 00:00:00', 0, '2004-10-05 00:00:00', 'Shirtpkdf jlkdsj;lkd lkjd hlkjfds gkfdsg kfd glkfd gifdsytoxdiytxoiufdytoidxf yxoigfyoigfxuyfxoiug yxoiuy oiugf hyoifxugyoixgfuy xoiuyxoiyxoifuy xo', '''y'':19 ''xo'':18,49,78,107 ''bug'':1 ''idu'':20 ''kfd'':10,27,41,56,70,85,99 ''lkd'':6,23,37,52,66,81,95 ''lkjd'':7,24,38,53,67,82,96 ''test'':3 ''titl'':2 ''glkfd'':11,28,42,57,71,86,100 ''oiugf'':15,32,46,61,75,90,104 ''gkfdsg'':9,26,40,55,69,84,98 ''jlkdsj'':5,22,36,51,65,80,94 ''yxoiuy'':14,31,45,60,74,89,103 ''hlkjfds'':8,25,39,54,68,83,97 ''shirtpkdf'':4,50,79 ''xoshirtpkdf'':35,64,93 ''xoiuyxoiyxoifuy'':17,34,48,63,77,92,106 ''hyoifxugyoixgfuy'':16,33,47,62,76,91,105 ''yifdxhfgffxshirtpkdf'':21 ''yxoigfyoigfxuyfxoiug'':13,30,44,59,73,88,102 ''gifdsytoxdiytxoiufdytoidxf'':12,29,43,58,72,87,101', false);
INSERT INTO bug (id, datecreated, name, title, description, "owner", duplicateof, communityscore, communitytimestamp, activityscore, activitytimestamp, hits, hitstimestamp, summary, fti, private) VALUES (4, '2005-01-14 00:00:00', NULL, 'Reflow problems with complex page layouts', NULL, 12, NULL, 0, '2005-01-14 17:20:12.820778', 0, '2005-01-14 17:20:12.820778', 0, '2005-01-14 17:20:12.820778', NULL, '''page'':5 ''layout'':6 ''reflow'':1 ''complex'':4 ''problem'':2', false);
INSERT INTO bug (id, datecreated, name, title, description, "owner", duplicateof, communityscore, communitytimestamp, activityscore, activitytimestamp, hits, hitstimestamp, summary, fti, private) VALUES (5, '2005-01-14 00:00:00', NULL, 'Firefox install instructions should be complete', NULL, 12, NULL, 0, '2005-01-14 17:27:03.702622', 0, '2005-01-14 17:27:03.702622', 0, '2005-01-14 17:27:03.702622', NULL, '''instal'':2 ''complet'':6 ''firefox'':1 ''instruct'':3', false);
INSERT INTO bug (id, datecreated, name, title, description, "owner", duplicateof, communityscore, communitytimestamp, activityscore, activitytimestamp, hits, hitstimestamp, summary, fti, private) VALUES (6, '2005-01-14 00:00:00', NULL, 'Firefox crashes when Save As dialog for a nonexistent window is closed', NULL, 12, NULL, 0, '2005-01-14 17:35:39.548665', 0, '2005-01-14 17:35:39.548665', 0, '2005-01-14 17:35:39.548665', NULL, '''save'':4 ''close'':12 ''crash'':2 ''dialog'':6 ''window'':10 ''firefox'':1 ''nonexist'':9', false);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'bug'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'bugsubscription'::pg_catalog.regclass;

INSERT INTO bugsubscription (id, person, bug, subscription) VALUES (1, 11, 1, 2);
INSERT INTO bugsubscription (id, person, bug, subscription) VALUES (2, 2, 1, 3);
INSERT INTO bugsubscription (id, person, bug, subscription) VALUES (3, 10, 1, 3);
INSERT INTO bugsubscription (id, person, bug, subscription) VALUES (4, 12, 1, 1);
INSERT INTO bugsubscription (id, person, bug, subscription) VALUES (5, 11, 2, 2);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'bugsubscription'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'bugactivity'::pg_catalog.regclass;

INSERT INTO bugactivity (id, bug, datechanged, person, whatchanged, oldvalue, newvalue, message) VALUES (1, 1, '2004-09-24 00:00:00', 1, 'title', 'A silly problem', 'An odd problem', 'Decided problem wasn''t silly after all');
INSERT INTO bugactivity (id, bug, datechanged, person, whatchanged, oldvalue, newvalue, message) VALUES (2, 4, '2005-01-14 00:00:00', 12, 'bug', NULL, NULL, 'added bug');
INSERT INTO bugactivity (id, bug, datechanged, person, whatchanged, oldvalue, newvalue, message) VALUES (3, 5, '2005-01-14 00:00:00', 12, 'bug', NULL, NULL, 'added bug');
INSERT INTO bugactivity (id, bug, datechanged, person, whatchanged, oldvalue, newvalue, message) VALUES (4, 5, '2005-01-14 00:00:00', 12, 'firefox: assignee', NULL, 'name12', 'XXX: not yet implemented');
INSERT INTO bugactivity (id, bug, datechanged, person, whatchanged, oldvalue, newvalue, message) VALUES (5, 6, '2005-01-14 00:00:00', 12, 'bug', NULL, NULL, 'added bug');
INSERT INTO bugactivity (id, bug, datechanged, person, whatchanged, oldvalue, newvalue, message) VALUES (6, 6, '2005-01-14 00:00:00', 12, 'firefox: severity', 'Normal', 'Critical', 'XXX: not yet implemented');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'bugactivity'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'bugexternalref'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'bugexternalref'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'bugtrackertype'::pg_catalog.regclass;

INSERT INTO bugtrackertype (id, name, title, description, homepage, "owner") VALUES (1, 'bugzilla', 'BugZilla', 'Dave Miller''s Labour of Love, the Godfather of Open Source project issue tracking.', 'http://www.bugzilla.org/', 12);
INSERT INTO bugtrackertype (id, name, title, description, homepage, "owner") VALUES (2, 'debbugs', 'Debbugs System', 'Debbugs Bug Tracking System', 'http://bugs.debian.org/', 1);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'bugtrackertype'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'bugtracker'::pg_catalog.regclass;

INSERT INTO bugtracker (id, bugtrackertype, name, title, summary, baseurl, "owner", contactdetails) VALUES (1, 1, 'mozilla.org', 'The Mozilla.org Bug Tracker', 'The Mozilla.org bug tracker is the grand-daddy of bugzillas. This is where Bugzilla was conceived, born and raised. This bugzilla instance covers all Mozilla products such as Firefox, Thunderbird and Bugzilla itself.', 'http://bugzilla.mozilla.org/', 12, 'Carrier pigeon only');
INSERT INTO bugtracker (id, bugtrackertype, name, title, summary, baseurl, "owner", contactdetails) VALUES (2, 1, 'gnome-bugzilla', 'GnomeGBug GTracker', 'This is the Gnome Bugzilla bug tracking system. It covers all the applications in the Gnome Desktop and Gnome Fifth Toe.', 'http://bugzilla.gnome.org/', 16, 'Jeff Waugh, in his pants.');
INSERT INTO bugtracker (id, bugtrackertype, name, title, summary, baseurl, "owner", contactdetails) VALUES (3, 2, 'debbugs', 'Debian Bug tracker', 'Bug tracker for debian project.', 'http://bugs.debian.org', 1, NULL);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'bugtracker'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'bugwatch'::pg_catalog.regclass;

INSERT INTO bugwatch (id, bug, bugtracker, remotebug, remotestatus, lastchanged, lastchecked, datecreated, "owner") VALUES (1, 2, 1, '42', 'FUBAR', '2004-09-24 20:58:04.740841', '2004-09-24 20:58:04.740841', '2004-09-24 20:58:04.740841', 12);
INSERT INTO bugwatch (id, bug, bugtracker, remotebug, remotestatus, lastchanged, lastchecked, datecreated, "owner") VALUES (2, 1, 1, '2000', '', '2004-10-04 00:00:00', '2004-10-04 00:00:00', '2004-10-04 00:00:00', 1);
INSERT INTO bugwatch (id, bug, bugtracker, remotebug, remotestatus, lastchanged, lastchecked, datecreated, "owner") VALUES (3, 1, 1, '123543', '', '2004-10-04 00:00:00', '2004-10-04 00:00:00', '2004-10-04 00:00:00', 1);
INSERT INTO bugwatch (id, bug, bugtracker, remotebug, remotestatus, lastchanged, lastchecked, datecreated, "owner") VALUES (4, 2, 2, '3224', '', '2004-10-05 00:00:00', '2004-10-05 00:00:00', '2004-10-05 00:00:00', 1);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'bugwatch'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'projectbugtracker'::pg_catalog.regclass;

INSERT INTO projectbugtracker (project, bugtracker, id) VALUES (5, 2, 1);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'projectbugtracker'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'buglabel'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'buglabel'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'bugrelationship'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'bugrelationship'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'message'::pg_catalog.regclass;

INSERT INTO message (id, datecreated, title, "owner", parent, distribution, rfc822msgid, fti, raw) VALUES (7, '2005-01-14 17:20:12.820778', 'Reflow problems with complex page layouts', 12, NULL, NULL, '<20050114172012.6687.51124.malonedeb@localhost.localdomain>', '''page'':5 ''layout'':6 ''reflow'':1 ''complex'':4 ''problem'':2', NULL);
INSERT INTO message (id, datecreated, title, "owner", parent, distribution, rfc822msgid, fti, raw) VALUES (8, '2005-01-14 17:27:03.702622', 'Firefox install instructions should be complete', 12, NULL, NULL, '<20050114172703.6687.71983.malonedeb@localhost.localdomain>', '''instal'':2 ''complet'':6 ''firefox'':1 ''instruct'':3', NULL);
INSERT INTO message (id, datecreated, title, "owner", parent, distribution, rfc822msgid, fti, raw) VALUES (9, '2005-01-14 17:35:39.548665', 'Firefox crashes when Save As dialog for a nonexistent window is closed', 12, NULL, NULL, '<20050114173539.6687.81610.malonedeb@localhost.localdomain>', '''save'':4 ''close'':12 ''crash'':2 ''dialog'':6 ''window'':10 ''firefox'':1 ''nonexist'':9', NULL);
INSERT INTO message (id, datecreated, title, "owner", parent, distribution, rfc822msgid, fti, raw) VALUES (1, '2004-09-24 20:58:04.684057', 'PEBCAK', NULL, NULL, NULL, 'foo@example.com-332342--1231', '''pebcak'':1', NULL);
INSERT INTO message (id, datecreated, title, "owner", parent, distribution, rfc822msgid, fti, raw) VALUES (3, '2004-09-24 21:17:17.153792', 'Reproduced on AIX', 12, NULL, NULL, 'sdsdfsfd', '''aix'':3 ''reproduc'':1', NULL);
INSERT INTO message (id, datecreated, title, "owner", parent, distribution, rfc822msgid, fti, raw) VALUES (4, '2004-09-24 21:24:03.922564', 'Re: Reproduced on AIX', 12, NULL, NULL, 'sdfssfdfsd', '''re'':1 ''aix'':4 ''reproduc'':2', NULL);
INSERT INTO message (id, datecreated, title, "owner", parent, distribution, rfc822msgid, fti, raw) VALUES (5, '2004-09-24 21:29:27.407354', 'Fantastic idea, I''d really like to see this', 12, NULL, NULL, 'dxssdfsdgf', '''d'':4 ''see'':8 ''idea'':2 ''like'':6 ''realli'':5 ''fantast'':1', NULL);
INSERT INTO message (id, datecreated, title, "owner", parent, distribution, rfc822msgid, fti, raw) VALUES (6, '2004-09-24 21:35:20.125564', 'Strange bug with duplicate messages.', 12, NULL, NULL, 'sdfsfwew', '''bug'':2 ''duplic'':4 ''messag'':5 ''strang'':1', NULL);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'message'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'bugattachment'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'bugattachment'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'componentselection'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'componentselection'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'sectionselection'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'sectionselection'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'bugproductinfestation'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'bugproductinfestation'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'bugpackageinfestation'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'bugpackageinfestation'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'distroreleasequeue'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'distroreleasequeue'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'distroreleasequeuesource'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'distroreleasequeuesource'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'distroreleasequeuebuild'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'distroreleasequeuebuild'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'personlanguage'::pg_catalog.regclass;

INSERT INTO personlanguage (id, person, "language") VALUES (1, 13, 387);
INSERT INTO personlanguage (id, person, "language") VALUES (4, 14, 449);
INSERT INTO personlanguage (id, person, "language") VALUES (3, 14, 196);
INSERT INTO personlanguage (id, person, "language") VALUES (2, 13, 68);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'personlanguage'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'potmsgset'::pg_catalog.regclass;

INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (22, 26, 22, 1, '', 'modules/aggregator.module:15', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (1, 1, 1, 1, '', 'a11y/addressbook/ea-addressbook-view.c:94
a11y/addressbook/ea-addressbook-view.c:103
a11y/addressbook/ea-minicard-view.c:119', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (2, 2, 2, 1, '', 'a11y/addressbook/ea-minicard-view.c:101', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (3, 3, 3, 1, '', 'a11y/addressbook/ea-minicard-view.c:102', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (4, 4, 4, 1, '', 'a11y/addressbook/ea-minicard-view.c:102', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (9, 9, 9, 1, '', 'addressbook/addressbook-errors.xml.h:2', 'addressbook:ldap-init primary', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (10, 10, 10, 1, '', 'addressbook/addressbook-errors.xml.h:4', 'addressbook:ldap-init secondary', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (11, 11, 11, 1, '', 'addressbook/addressbook-errors.xml.h:6', 'addressbook:ldap-auth primary', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (12, 12, 12, 1, '', 'addressbook/addressbook-errors.xml.h:8', 'addressbook:ldap-auth secondary', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (13, 13, 13, 1, '', 'addressbook/gui/component/addressbook-migrate.c:124
calendar/gui/migration.c:188 mail/em-migrate.c:1201', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (5, 5, 5, 1, '', 'a11y/addressbook/ea-minicard-view.c:104', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (6, 6, 6, 1, '', 'a11y/addressbook/ea-minicard-view.c:104', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (7, 7, 7, 1, '', 'a11y/addressbook/ea-minicard-view.c:105', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (8, 8, 8, 1, '', 'a11y/addressbook/ea-minicard.c:166', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (14, 14, 14, 1, '', 'addressbook/gui/component/addressbook-migrate.c:1123', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (15, 15, 15, 1, '', 'addressbook/gui/widgets/e-addressbook-model.c:151', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (16, 17, 16, 1, '', 'addressbook/gui/widgets/eab-gui-util.c:275', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (17, 19, 17, 1, '', 'addressbook/gui/widgets/foo.c:345', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (20, 23, 20, 1, '', 'encfs/FileUtils.cpp:535', 'xgroup(setup)', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (21, 24, 21, 1, '', 'encfs/encfsctl.cpp:346', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (18, 21, 18, 1, ' start po-group: common', 'encfs/FileUtils.cpp:1044', 'xgroup(common)', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (19, 22, 19, 1, '', 'encfs/main.cpp:340', 'xgroup(usage)', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (23, 27, 0, 1, NULL, '', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (52, 56, 29, 3, '', 'src/netapplet.glade.h:2', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (27, 31, 4, 3, '', 'src/netapplet.c:139', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (62, 66, 39, 3, '', 'src/netapplet.glade.h:12', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (63, 67, 40, 3, '', 'src/netapplet.glade.h:13', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (54, 58, 31, 3, '', 'src/netapplet.glade.h:4', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (44, 48, 21, 3, '', 'src/netapplet.c:1018', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (29, 33, 6, 3, '', 'src/netapplet.c:291 src/netapplet.c:312', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (66, 70, 43, 3, '', 'src/netapplet.glade.h:16', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (38, 42, 15, 3, '', 'src/netapplet.c:768', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (65, 69, 42, 3, '', 'src/netapplet.glade.h:15', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (56, 60, 33, 3, '', 'src/netapplet.glade.h:6', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (37, 41, 14, 3, '', 'src/netapplet.c:747', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (57, 61, 34, 3, '', 'src/netapplet.glade.h:7', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (31, 35, 8, 3, '', 'src/netapplet.c:391', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (49, 53, 26, 3, '', 'src/netapplet.c:1093', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (43, 47, 20, 3, '', 'src/netapplet.c:1015', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (24, 28, 1, 3, '', 'src/netapplet.c:131', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (60, 64, 37, 3, '', 'src/netapplet.glade.h:10', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (32, 36, 9, 3, '', 'src/netapplet.c:410', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (25, 29, 2, 3, '', 'src/netapplet.c:133', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (26, 30, 3, 3, '', 'src/netapplet.c:135', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (51, 55, 28, 3, '', 'src/netapplet.glade.h:1', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (53, 57, 30, 3, '', 'src/netapplet.glade.h:3', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (28, 32, 5, 3, '', 'src/netapplet.c:141', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (34, 38, 11, 3, '', 'src/netapplet.c:479', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (46, 50, 23, 3, '', 'src/netapplet.c:1032', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (55, 59, 32, 3, '', 'src/netapplet.glade.h:5', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (36, 40, 13, 3, '', 'src/netapplet.c:732', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (30, 34, 7, 3, '', 'src/netapplet.c:359', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (64, 68, 41, 3, '', 'src/netapplet.glade.h:14', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (47, 51, 24, 3, '', 'src/netapplet.c:1072', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (35, 39, 12, 3, '', 'src/netapplet.c:496', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (58, 62, 35, 3, '', 'src/netapplet.glade.h:8', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (48, 52, 25, 3, '', 'src/netapplet.c:1082', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (40, 44, 17, 3, '', 'src/netapplet.c:955', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (39, 43, 16, 3, '', 'src/netapplet.c:870', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (45, 49, 22, 3, '', 'src/netapplet.c:1021', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (59, 63, 36, 3, '', 'src/netapplet.glade.h:9', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (50, 54, 27, 3, '', 'src/netapplet.c:1526', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (42, 46, 19, 3, '', 'src/netapplet.c:970', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (33, 37, 10, 3, '', 'src/netapplet.c:427', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (41, 45, 18, 3, '', 'src/netapplet.c:958', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (61, 65, 38, 3, '', 'src/netapplet.glade.h:11', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (67, 71, 1, 2, '', 'pmount.c:50', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (68, 72, 2, 2, '', 'pmount.c:57', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (69, 73, 3, 2, '', 'pmount.c:64', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (70, 74, 4, 2, '', 'pmount.c:67', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (71, 75, 5, 2, '', 'pmount.c:120', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (72, 76, 6, 2, '', 'pmount.c:126', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (73, 77, 7, 2, '', 'pmount.c:130', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (74, 78, 8, 2, '', 'pmount.c:134', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (75, 79, 9, 2, '', 'pmount.c:141', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (76, 80, 10, 2, '', 'pmount.c:171 pumount.c:98', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (77, 81, 11, 2, '', 'pmount.c:176 pmount.c:270', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (78, 82, 12, 2, '', 'pmount.c:212', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (79, 83, 13, 2, '', 'pmount.c:218', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (80, 84, 14, 2, '', 'pmount.c:242', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (81, 85, 15, 2, '', 'pmount.c:258 pumount.c:124', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (82, 86, 16, 2, '', 'pmount.c:274', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (83, 87, 17, 2, '', 'pmount.c:347', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (84, 88, 18, 2, '', 'pmount.c:361', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (85, 89, 19, 2, '', 'pmount.c:401', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (86, 90, 20, 2, '', 'pmount.c:417', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (87, 91, 21, 2, '', 'pmount.c:509 pumount.c:181', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (88, 92, 22, 2, '', 'pmount.c:542 pumount.c:201', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (89, 93, 23, 2, '', 'pmount.c:580', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (90, 94, 24, 2, '', 'pmount.c:589 pumount.c:237', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (91, 95, 25, 2, '', 'pmount.c:595 pumount.c:243', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (92, 96, 26, 2, '', 'pmount.c:635', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (93, 97, 27, 2, '', 'pmount.c:656', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (94, 98, 28, 2, '', 'pmount-hal.c:29', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (95, 99, 29, 2, '', 'pmount-hal.c:140', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (96, 100, 30, 2, '', 'pmount-hal.c:169', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (97, 101, 31, 2, '', 'pmount-hal.c:175', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (98, 102, 32, 2, '', 'pmount-hal.c:182', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (99, 103, 33, 2, '', 'policy.c:79', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (100, 104, 34, 2, '', 'policy.c:90', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (101, 105, 35, 2, '', 'policy.c:97', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (102, 106, 36, 2, '', 'policy.c:128', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (103, 107, 37, 2, '', 'policy.c:228', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (104, 108, 38, 2, '', 'policy.c:233', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (105, 109, 39, 2, '', 'policy.c:251 policy.c:307', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (106, 110, 40, 2, '', 'policy.c:338', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (107, 111, 41, 2, '', 'policy.c:340', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (108, 112, 42, 2, '', 'policy.c:342', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (109, 113, 43, 2, '', 'policy.c:378', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (110, 114, 44, 2, '', 'policy.c:393', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (111, 115, 45, 2, '', 'policy.c:411', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (112, 116, 46, 2, '', 'policy.c:413', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (113, 117, 47, 2, '', 'pumount.c:42', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (114, 118, 48, 2, '', 'pumount.c:72', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (115, 119, 49, 2, '', 'pumount.c:78', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (116, 120, 50, 2, '', 'pumount.c:108 pumount.c:136', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (117, 121, 51, 2, '', 'pumount.c:140', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (118, 122, 52, 2, '', 'pumount.c:148', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (119, 123, 53, 2, '', 'utils.c:51', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (120, 124, 54, 2, '', 'utils.c:107', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (121, 125, 55, 2, '', 'utils.c:122', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (122, 126, 56, 2, '', 'utils.c:129', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (123, 127, 57, 2, '', 'utils.c:149', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (124, 128, 58, 2, '', 'utils.c:158', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (125, 129, 59, 2, '', 'utils.c:210', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (126, 130, 60, 2, '', 'utils.c:252', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (127, 131, 61, 2, '', 'utils.c:261', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (128, 132, 62, 2, '', 'utils.c:270', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (129, 133, 63, 2, '', 'utils.c:279', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (151, 26, 22, 4, '', 'modules/aggregator.module:15', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (130, 1, 1, 4, '', 'a11y/addressbook/ea-addressbook-view.c:94
a11y/addressbook/ea-addressbook-view.c:103
a11y/addressbook/ea-minicard-view.c:119', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (131, 2, 2, 4, '', 'a11y/addressbook/ea-minicard-view.c:101', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (133, 4, 4, 4, '', 'a11y/addressbook/ea-minicard-view.c:102', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (132, 3, 3, 4, '', 'a11y/addressbook/ea-minicard-view.c:102', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (138, 9, 9, 4, '', 'addressbook/addressbook-errors.xml.h:2', 'addressbook:ldap-init primary', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (134, 5, 5, 4, '', 'a11y/addressbook/ea-minicard-view.c:104', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (137, 8, 8, 4, '', 'a11y/addressbook/ea-minicard.c:166', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (141, 12, 12, 4, '', 'addressbook/addressbook-errors.xml.h:8', 'addressbook:ldap-auth secondary', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (142, 13, 13, 4, '', 'addressbook/gui/component/addressbook-migrate.c:124
calendar/gui/migration.c:188 mail/em-migrate.c:1201', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (135, 6, 6, 4, '', 'a11y/addressbook/ea-minicard-view.c:104', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (136, 7, 7, 4, '', 'a11y/addressbook/ea-minicard-view.c:105', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (140, 11, 11, 4, '', 'addressbook/addressbook-errors.xml.h:6', 'addressbook:ldap-auth primary', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (139, 10, 10, 4, '', 'addressbook/addressbook-errors.xml.h:4', 'addressbook:ldap-init secondary', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (143, 14, 14, 4, '', 'addressbook/gui/component/addressbook-migrate.c:1123', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (144, 15, 15, 4, '', 'addressbook/gui/widgets/e-addressbook-model.c:151', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (145, 17, 16, 4, '', 'addressbook/gui/widgets/eab-gui-util.c:275', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (146, 19, 17, 4, '', 'addressbook/gui/widgets/foo.c:345', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (150, 24, 21, 4, '', 'encfs/encfsctl.cpp:346', '', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (149, 23, 20, 4, '', 'encfs/FileUtils.cpp:535', 'xgroup(setup)', 'c-format');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (148, 22, 19, 4, '', 'encfs/main.cpp:340', 'xgroup(usage)', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (147, 21, 18, 4, ' start po-group: common', 'encfs/FileUtils.cpp:1044', 'xgroup(common)', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (161, 27, 0, 4, NULL, '', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (162, 143, 0, 5, NULL, '', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (163, 144, 0, 5, NULL, '', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (164, 145, 0, 5, NULL, '', '', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (152, 134, 1, 5, '', '../mozilla-browser.templates:3', 'Type: note
Description', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (153, 135, 2, 5, '', '../mozilla-browser.templates:3', 'Type: note
Description', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (154, 136, 3, 5, '', '../mozilla-browser.templates:3', 'Type: note
Description', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (155, 137, 4, 5, '', '../mozilla-browser.templates:11', 'Type: select
Choices', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (156, 138, 5, 5, '', '../mozilla-browser.templates:13', 'Type: select
Description', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (157, 139, 6, 5, '', '../mozilla-browser.templates:13', 'Type: select
Description', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (158, 140, 7, 5, '', '../mozilla-browser.templates:24', 'Type: boolean
Description', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (159, 141, 8, 5, '', '../mozilla-browser.templates:24', 'Type: boolean
Description', '');
INSERT INTO potmsgset (id, primemsgid, "sequence", potemplate, commenttext, filereferences, sourcecomment, flagscomment) VALUES (160, 142, 9, 5, '', '../mozilla-browser.templates:24', 'Type: boolean
Description', '');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'potmsgset'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'launchpaddatabaserevision'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'launchpaddatabaserevision'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'bounty'::pg_catalog.regclass;

INSERT INTO bounty (id, name, title, summary, description, usdvalue, difficulty, duration, reviewer, datecreated, "owner", deadline, claimant, dateclaimed) VALUES (1, 'foomatic-widgets', 'Make foomatic have better widgets.', 'Foomatic needs to have way better widgets. The current ones are SO WinXP. Eeewww. Maybe we can get some of that K-Bling that I saw in Kubuntu?', 'The widgets need to be particularly polished, since foomatic is going to be the default foomaster on the desktop for the planet.', 453.44, 65, '7 days', 16, '2005-03-11 09:17:40.585397', 16, NULL, NULL, NULL);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'bounty'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'bugmessage'::pg_catalog.regclass;

INSERT INTO bugmessage (id, bug, message) VALUES (1, 2, 1);
INSERT INTO bugmessage (id, bug, message) VALUES (2, 1, 3);
INSERT INTO bugmessage (id, bug, message) VALUES (3, 1, 4);
INSERT INTO bugmessage (id, bug, message) VALUES (4, 2, 5);
INSERT INTO bugmessage (id, bug, message) VALUES (5, 2, 6);
INSERT INTO bugmessage (id, bug, message) VALUES (6, 4, 7);
INSERT INTO bugmessage (id, bug, message) VALUES (7, 5, 8);
INSERT INTO bugmessage (id, bug, message) VALUES (8, 6, 9);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'bugmessage'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'cveref'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'cveref'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'karma'::pg_catalog.regclass;

INSERT INTO karma (id, karmatype, datecreated, person, points) VALUES (1, 4, '2005-01-14 12:20:12.820778', 12, 10);
INSERT INTO karma (id, karmatype, datecreated, person, points) VALUES (2, 4, '2005-01-14 12:27:03.702622', 12, 10);
INSERT INTO karma (id, karmatype, datecreated, person, points) VALUES (3, 4, '2005-01-14 12:35:39.548665', 12, 10);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'karma'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'sshkey'::pg_catalog.regclass;

INSERT INTO sshkey (id, person, keytype, keytext, "comment") VALUES (1, 12, 2, 'AAAAB3NzaC1kc3MAAAEBAPfhCA15ZaT08brwVXwpJjcZT6QFIipzF1sGy57HY7QPi/W+uljr1VcCHzWdlSmda7YpTCTx0NFYYQIccQRGX6zYL8v1w9FSRCAnxxUJmqEhsUDFYFdVTa9uLCrs3MSbmh7wwFPdRrGrO6X5x7T4dMZQwykSZrOVdpLcCHRgrMZslLomIAjERn6OAQNiGFz7B2tEi/3Soqd52bGJwOtGymRiAXkPSLbH7KfzSCe34ytdh6BD+4SrgSoa+TL3VDV70QAdlOFXD42ZHl3Sc0Tde4LbZeYq2Uf84DOATLZBbOYpRSqTLkM9XngpnvCRVb6dxEQfgODDw783tEuPpySLj2EAAAAVANpUVgivDjt9gFibN/AXfYy1meeBAAABAB6FtnMywmWZg2lr2I3nDfE5U5QbGUQB/ZEP98ZkSkhOcF29VlnGOxyb2/VZbVTLa/btlPF82L4An/c8VKtKZnel7LnAlMoArdgzQNXGVQQVtnaWwM26ydgDzkSSIes3elNZgsfnPRBvaF0ol9Tqju0rNGKjnr3ZOX/NX+42bxpjRnxYj1h56yP2jKKeGfjorI6JK1YfqBAiTxzaDMzSpknnrbztaKJoh7IFqMMOp9ANSFh7H106pEaCv3ebCTJZprtWqNKjb2zum7OQPRz3upA0qx22ocTokjv4itXJ6yj/BvGu9qdOIQFXuB2rsFtLZtS8ATueOly0GzyeiZBx/AEAAAEBAO8jRYjL7tAYnVlO1p6UzPOicAuGCFWfNbBEDRAXoSgLNdj451jStw+eUc9ZVz7tG/XRVZsiavtFHb2cbrcfX1YOd69xi0m+IY6mo3yKt3irQRokDtt376sHoUdHgj2ozySZJgG8IJndtoS+VQQy6NdClA3fNFb96bF865eNaRYoHJO9ZI84lkWQL++MLzIuyFfCs1hSlapyyuHC8kFmF7AQdrVZvbohSbnWs+w53nIW8nAA7z21wAukvE1Pl6AQyG0e7U1sYS8Pc8dtmzJvdtVZWBl02/gqQJ7f06mFvnsN45rR1Uyxnrwl6rbFwqabZDlyD5Ac6Icbvz9SG1gBOiI=', 'andrew@trogdor');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'sshkey'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'bugtask'::pg_catalog.regclass;

INSERT INTO bugtask (id, bug, product, distribution, distrorelease, sourcepackagename, binarypackagename, status, priority, severity, assignee, dateassigned, datecreated, "owner", milestone) VALUES (1, 1, 1, NULL, NULL, NULL, NULL, 10, 30, 20, 5, '2004-10-11 11:07:20.330975', '2004-11-13 03:49:22.910183', 12, NULL);
INSERT INTO bugtask (id, bug, product, distribution, distrorelease, sourcepackagename, binarypackagename, status, priority, severity, assignee, dateassigned, datecreated, "owner", milestone) VALUES (2, 1, 4, NULL, NULL, NULL, NULL, 10, 10, 20, 1, '2004-10-11 11:07:20.330975', '2004-11-13 03:49:22.910878', 12, NULL);
INSERT INTO bugtask (id, bug, product, distribution, distrorelease, sourcepackagename, binarypackagename, status, priority, severity, assignee, dateassigned, datecreated, "owner", milestone) VALUES (3, 2, 1, NULL, NULL, NULL, NULL, 10, 20, 20, NULL, '2004-10-11 11:07:20.330975', '2004-11-13 03:49:22.908491', 12, NULL);
INSERT INTO bugtask (id, bug, product, distribution, distrorelease, sourcepackagename, binarypackagename, status, priority, severity, assignee, dateassigned, datecreated, "owner", milestone) VALUES (4, 1, NULL, 3, NULL, 1, NULL, 20, 40, 20, NULL, '2004-10-11 11:07:20.584746', '2004-11-13 03:49:22.79024', 12, NULL);
INSERT INTO bugtask (id, bug, product, distribution, distrorelease, sourcepackagename, binarypackagename, status, priority, severity, assignee, dateassigned, datecreated, "owner", milestone) VALUES (5, 2, NULL, 3, NULL, 1, NULL, 20, 40, 20, 12, '2004-10-11 11:07:20.584746', '2004-11-13 03:49:22.824591', 12, NULL);
INSERT INTO bugtask (id, bug, product, distribution, distrorelease, sourcepackagename, binarypackagename, status, priority, severity, assignee, dateassigned, datecreated, "owner", milestone) VALUES (6, 3, NULL, 3, NULL, 1, NULL, 10, 20, 30, NULL, '2004-10-11 11:07:20.584746', '2004-11-13 03:49:22.825533', 16, NULL);
INSERT INTO bugtask (id, bug, product, distribution, distrorelease, sourcepackagename, binarypackagename, status, priority, severity, assignee, dateassigned, datecreated, "owner", milestone) VALUES (13, 4, 4, NULL, NULL, NULL, NULL, 10, 30, 30, NULL, '2005-01-14 17:20:12.820778', '2005-01-14 17:20:12.820778', 12, NULL);
INSERT INTO bugtask (id, bug, product, distribution, distrorelease, sourcepackagename, binarypackagename, status, priority, severity, assignee, dateassigned, datecreated, "owner", milestone) VALUES (14, 5, 4, NULL, NULL, NULL, NULL, 10, 30, 30, 12, '2005-01-14 17:27:03.702622', '2005-01-14 17:27:03.702622', 12, NULL);
INSERT INTO bugtask (id, bug, product, distribution, distrorelease, sourcepackagename, binarypackagename, status, priority, severity, assignee, dateassigned, datecreated, "owner", milestone) VALUES (15, 6, 4, NULL, NULL, NULL, NULL, 10, 30, 50, NULL, '2005-01-14 17:35:39.548665', '2005-01-14 17:35:39.548665', 12, NULL);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'bugtask'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'logintoken'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'logintoken'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'milestone'::pg_catalog.regclass;

INSERT INTO milestone (id, product, name, title) VALUES (1, 4, '1.0', 'one dot zero');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'milestone'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'pushmirroraccess'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'pushmirroraccess'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'buildqueue'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'buildqueue'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'signedcodeofconduct'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'signedcodeofconduct'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'bountysubscription'::pg_catalog.regclass;

INSERT INTO bountysubscription (id, bounty, person, subscription) VALUES (1, 1, 9, 1);
INSERT INTO bountysubscription (id, bounty, person, subscription) VALUES (2, 1, 6, 3);
INSERT INTO bountysubscription (id, bounty, person, subscription) VALUES (3, 1, 1, 2);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'bountysubscription'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'productbounty'::pg_catalog.regclass;

INSERT INTO productbounty (id, bounty, product) VALUES (1, 1, 4);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'productbounty'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'distrobounty'::pg_catalog.regclass;

INSERT INTO distrobounty (id, bounty, distribution) VALUES (1, 1, 1);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'distrobounty'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'projectbounty'::pg_catalog.regclass;

INSERT INTO projectbounty (id, bounty, project) VALUES (1, 1, 4);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'projectbounty'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'mirror'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'mirror'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'mirrorcontent'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'mirrorcontent'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'mirrorsourcecontent'::pg_catalog.regclass;



UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'mirrorsourcecontent'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'potemplatename'::pg_catalog.regclass;

INSERT INTO potemplatename (id, name, title, description, translationdomain) VALUES (1, 'evolution-2.2', 'Main translation domain for the Evolution 2.2', 'This is a description about Evolution 2.2 POTemplateName', 'evolution-2.2');
INSERT INTO potemplatename (id, name, title, description, translationdomain) VALUES (3, 'netapplet', 'Main translation domain for netapplet', 'This is the description about netapplet''s POTemplateName', 'netapplet');
INSERT INTO potemplatename (id, name, title, description, translationdomain) VALUES (2, 'pmount', 'Main translation domain for pmount', 'This is the description about pmount''s POTemplateName', 'pmount');
INSERT INTO potemplatename (id, name, title, description, translationdomain) VALUES (4, 'pkgconf-mozilla', 'pkgconf-mozilla', NULL, 'pkgconf-mozilla');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'potemplatename'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'maintainership'::pg_catalog.regclass;

INSERT INTO maintainership (id, distribution, sourcepackagename, maintainer) VALUES (1, 3, 1, 1);
INSERT INTO maintainership (id, distribution, sourcepackagename, maintainer) VALUES (2, 1, 9, 1);
INSERT INTO maintainership (id, distribution, sourcepackagename, maintainer) VALUES (3, 1, 14, 1);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'maintainership'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'messagechunk'::pg_catalog.regclass;

INSERT INTO messagechunk (id, message, "sequence", content, blob, fti) VALUES (3, 9, 1, 'User-Agent:       
Build Identifier: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.6) Gecko/20040207 Firefox/0.8

If a Save As dialog for a nonexistent window exists, when the dialog is closed Firefox will crash.  It''s possible to cause this to happen using the "Open With/Save As" dialog.

Reproducible: Always
Steps to Reproduce:
1. Visit http://www.mozilla.org/products/firefox/
2. Click on "Download Now!"  An "Open With/Save" dialog will appear.
4. Press OK.
5. Switch back to the "Open With/Save" dialog, and press OK again.  There are now two Save As dialogs.  This is bug 58777.
6. Close the second dialog with "Cancel"
7. Close the browser window that started all of this.
8. Close the first dialog with "Cancel".

Actual Results:  
Crash!

Expected Results:  
Not crashed.', NULL, '''1'':55 ''2'':60 ''4'':71 ''5'':74 ''6'':97 ''7'':104 ''8'':114 ''u'':8 ''en'':12 ''ok'':73,84 ''rv'':14 ''us'':13 ''1.6'':15 ''bug'':95 ''two'':89 ''use'':44 ''x11'':7 ''back'':76 ''caus'':40 ''i686'':10 ''open'':46,66,79 ''save'':20,90 ''step'':52 ''user'':2 ''58777'':96 ''agent'':3 ''alway'':51 ''build'':4 ''click'':61 ''close'':32,98,105,115 ''crash'':35,123,127 ''en-us'':11 ''exist'':27 ''first'':117 ''linux'':9 ''press'':72,83 ''start'':110 ''visit'':56 ''actual'':121 ''appear'':70 ''cancel'':103,120 ''dialog'':22,30,49,68,81,92,101,118 ''expect'':124 ''happen'':43 ''result'':122,125 ''second'':100 ''switch'':75 ''window'':26,108 ''browser'':107 ''firefox'':33 ''possibl'':38 ''user-ag'':1 ''download'':63 ''identifi'':5 ''nonexist'':25 ''reproduc'':50,54 ''with/save'':47,67,80 ''firefox/0.8'':17 ''mozilla/5.0'':6 ''gecko/20040207'':16 ''www.mozilla.org'':58 ''/products/firefox/'':59 ''www.mozilla.org/products/firefox/'':57');
INSERT INTO messagechunk (id, message, "sequence", content, blob, fti) VALUES (2, 8, 1, 'All ways of downloading firefox should provide complete install instructions. At present, they are only visible on the Release Notes page.', NULL, '''way'':2 ''note'':20 ''page'':21 ''instal'':9 ''provid'':7 ''releas'':19 ''visibl'':16 ''complet'':8 ''firefox'':5 ''present'':12 ''download'':4 ''instruct'':10');
INSERT INTO messagechunk (id, message, "sequence", content, blob, fti) VALUES (7, 5, 1, 'This would be a real killer feature. If there is already code to make it possible, why aren''t there tons of press announcements about the secuirty possibilities. Imagine - no more embarrassing emails for Mr Gates... everything they delete would actually disappear! I''m sure Redmond will switch over as soon as they hear about this. It''s not a bug, it''s a feature!', NULL, '''m'':44 ''mr'':35 ''bug'':61 ''ton'':21 ''aren'':18 ''code'':12 ''gate'':36 ''hear'':54 ''make'':14 ''real'':5 ''soon'':51 ''sure'':45 ''delet'':39 ''email'':33 ''press'':23 ''would'':2,40 ''actual'':41 ''featur'':7,65 ''imagin'':29 ''killer'':6 ''switch'':48 ''alreadi'':11 ''announc'':24 ''everyth'':37 ''possibl'':16,28 ''redmond'':46 ''secuirti'':27 ''disappear'':42 ''embarrass'':32');
INSERT INTO messagechunk (id, message, "sequence", content, blob, fti) VALUES (8, 6, 1, 'Oddly enough the bug system seems only capable of displaying the first two comments that are made against a bug. I wonder why that is? Lets have a few more decent legth comments in here so we can see what the spacing is like. Also, at some stage, we''ll need a few comments that get displayed in a fixed-width font, so we have a clue about code-in-bug-comments etc.', NULL, '''ll'':50 ''bug'':4,20,73 ''etc'':75 ''fix'':61 ''get'':56 ''let'':26 ''odd'':1 ''see'':39 ''two'':13 ''also'':45 ''clue'':68 ''code'':71 ''font'':63 ''like'':44 ''made'':17 ''need'':51 ''seem'':6 ''first'':12 ''legth'':32 ''space'':42 ''stage'':48 ''width'':62 ''capabl'':8 ''decent'':31 ''enough'':2 ''system'':5 ''wonder'':22 ''comment'':14,33,54,74 ''display'':10,57 ''fixed-width'':60 ''code-in-bug-com'':70');
INSERT INTO messagechunk (id, message, "sequence", content, blob, fti) VALUES (6, 4, 1, 'Sorry, it was SCO unix which appears to have the same bug. For a brief moment I was confused there, since so much code is known to have been copied from SCO into AIX.', NULL, '''aix'':34 ''bug'':12 ''sco'':4,32 ''code'':24 ''copi'':30 ''much'':23 ''sinc'':21 ''unix'':5 ''brief'':15 ''known'':26 ''sorri'':1 ''appear'':7 ''confus'':19 ''moment'':16');
INSERT INTO messagechunk (id, message, "sequence", content, blob, fti) VALUES (1, 7, 1, 'Malone pages that use more complex layouts with portlets and fancy CSS are sometimes not getting properly reflowed after rendering.', NULL, '''css'':12 ''get'':16 ''use'':4 ''page'':2 ''fanci'':11 ''malon'':1 ''layout'':7 ''proper'':17 ''reflow'':18 ''render'':20 ''complex'':6 ''portlet'':9 ''sometim'':14');
INSERT INTO messagechunk (id, message, "sequence", content, blob, fti) VALUES (5, 3, 1, 'We''ve seen something very similar on AIX with Gnome 2.6 when it is compiled with XFT support. It might be that the anti-aliasing is causing loopback devices to degrade, resulting in a loss of transparency at the system cache level and decoherence in the undelete function. This is only known to be a problem when the moon is gibbous.', NULL, '''ve'':2 ''2.6'':11 ''aix'':8 ''xft'':17 ''anti'':25 ''cach'':42 ''caus'':28 ''loss'':36 ''moon'':60 ''seen'':3 ''alias'':26 ''devic'':30 ''gnome'':10 ''known'':53 ''level'':43 ''might'':20 ''compil'':15 ''degrad'':32 ''result'':33 ''someth'':4 ''system'':41 ''decoher'':45 ''gibbous'':62 ''problem'':57 ''similar'':6 ''support'':18 ''undelet'':48 ''function'':49 ''loopback'':29 ''transpar'':38 ''anti-alias'':24');
INSERT INTO messagechunk (id, message, "sequence", content, blob, fti) VALUES (4, 1, 1, 'Problem exists between chair and keyboard', NULL, '''chair'':4 ''exist'':2 ''problem'':1 ''keyboard'':6');


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'messagechunk'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'sourcepackagepublishinghistory'::pg_catalog.regclass;

INSERT INTO sourcepackagepublishinghistory (id, sourcepackagerelease, distrorelease, status, component, section, datecreated, datepublished, datesuperseded, supersededby, datemadepending, scheduleddeletiondate, dateremoved) VALUES (2, 15, 3, 2, 1, 1, '2004-09-27 11:57:13', '2004-09-27 11:57:13', NULL, NULL, NULL, NULL, NULL);
INSERT INTO sourcepackagepublishinghistory (id, sourcepackagerelease, distrorelease, status, component, section, datecreated, datepublished, datesuperseded, supersededby, datemadepending, scheduleddeletiondate, dateremoved) VALUES (1, 14, 1, 2, 1, 1, '2004-09-27 11:57:13', '2004-09-27 11:57:13', NULL, NULL, NULL, NULL, NULL);
INSERT INTO sourcepackagepublishinghistory (id, sourcepackagerelease, distrorelease, status, component, section, datecreated, datepublished, datesuperseded, supersededby, datemadepending, scheduleddeletiondate, dateremoved) VALUES (5, 16, 3, 2, 1, 1, '2004-03-10 16:30:00', '2004-03-10 16:30:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO sourcepackagepublishinghistory (id, sourcepackagerelease, distrorelease, status, component, section, datecreated, datepublished, datesuperseded, supersededby, datemadepending, scheduleddeletiondate, dateremoved) VALUES (4, 17, 1, 2, 1, 1, '2004-03-14 18:00:00', '2004-03-14 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO sourcepackagepublishinghistory (id, sourcepackagerelease, distrorelease, status, component, section, datecreated, datepublished, datesuperseded, supersededby, datemadepending, scheduleddeletiondate, dateremoved) VALUES (8, 20, 3, 2, 1, 1, '2005-04-18 17:34:15.308434', '2005-04-18 17:34:15.308434', NULL, NULL, NULL, NULL, NULL);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'sourcepackagepublishinghistory'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'sourcesourcebackup'::pg_catalog.regclass;

INSERT INTO sourcesourcebackup (id, name, title, description, product, cvsroot, cvsmodule, cvstarfile, cvstarfileurl, cvsbranch, svnrepository, releaseroot, releaseverstyle, releasefileglob, releaseparentbranch, branch, lastsynced, syncinterval, rcstype, hosted, upstreamname, processingapproved, syncingapproved, newarchive, newbranchcategory, newbranchbranch, newbranchversion, packagedistro, packagefiles_collapsed, "owner", currentgpgkey, fileidreference, branchpoint, autotested, datestarted, datefinished, sourcepackagename, distrorelease) VALUES (2, 'evolution-head', 'Evolution CVS HEAD', 'CVS import job for Evolution HEAD', 5, ':pserver:anonymous@anoncvs.gnome.org:/cvs/gnome', 'evolution', NULL, '', 'MAIN', '', '', NULL, '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'gnome@arch.ubuntu.com', 'evolution', 'MAIN', '0', NULL, NULL, 16, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO sourcesourcebackup (id, name, title, description, product, cvsroot, cvsmodule, cvstarfile, cvstarfileurl, cvsbranch, svnrepository, releaseroot, releaseverstyle, releasefileglob, releaseparentbranch, branch, lastsynced, syncinterval, rcstype, hosted, upstreamname, processingapproved, syncingapproved, newarchive, newbranchcategory, newbranchbranch, newbranchversion, packagedistro, packagefiles_collapsed, "owner", currentgpgkey, fileidreference, branchpoint, autotested, datestarted, datefinished, sourcepackagename, distrorelease) VALUES (1, 'evolution', 'evolution-warty', 'Package job for Warty Evolution', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 'evolution', '2005-01-14 17:35:39.548665', NULL, 'evolution@arch.ubuntu.com', NULL, NULL, NULL, 'warty', NULL, 2, NULL, NULL, NULL, 0, NULL, NULL, 9, 3);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'sourcesourcebackup'::pg_catalog.regclass;


UPDATE pg_catalog.pg_class SET reltriggers = 0 WHERE oid = 'packagepublishinghistory'::pg_catalog.regclass;

INSERT INTO packagepublishinghistory (id, binarypackage, distroarchrelease, status, component, section, priority, datecreated, datepublished, datesuperseded, supersededby, datemadepending, scheduleddeletiondate, dateremoved) VALUES (9, 12, 1, 2, 1, 1, 1, '2005-05-05 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO packagepublishinghistory (id, binarypackage, distroarchrelease, status, component, section, priority, datecreated, datepublished, datesuperseded, supersededby, datemadepending, scheduleddeletiondate, dateremoved) VALUES (11, 15, 6, 2, 1, 1, 4, '2005-05-05 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL);


UPDATE pg_catalog.pg_class SET reltriggers = (SELECT pg_catalog.count(*) FROM pg_catalog.pg_trigger where pg_class.oid = tgrelid) WHERE oid = 'packagepublishinghistory'::pg_catalog.regclass;


SELECT pg_catalog.setval('person_id_seq', 51, true);



SELECT pg_catalog.setval('emailaddress_id_seq', 44, true);



SELECT pg_catalog.setval('gpgkey_id_seq', 11, true);



SELECT pg_catalog.setval('archuserid_id_seq', 10, true);



SELECT pg_catalog.setval('wikiname_id_seq', 10, true);



SELECT pg_catalog.setval('jabberid_id_seq', 10, true);



SELECT pg_catalog.setval('ircid_id_seq', 9, true);



SELECT pg_catalog.setval('teammembership_id_seq', 37, true);



SELECT pg_catalog.setval('teamparticipation_id_seq', 79, true);



SELECT pg_catalog.setval('schema_id_seq', 4, true);



SELECT pg_catalog.setval('label_id_seq', 1, true);



SELECT pg_catalog.setval('project_id_seq', 8, true);



SELECT pg_catalog.setval('projectrelationship_id_seq', 1, false);



SELECT pg_catalog.setval('product_id_seq', 12, true);



SELECT pg_catalog.setval('productlabel_id_seq', 1, false);



SELECT pg_catalog.setval('productseries_id_seq', 6, true);



SELECT pg_catalog.setval('productrelease_id_seq', 7, true);



SELECT pg_catalog.setval('productcvsmodule_id_seq', 1, false);



SELECT pg_catalog.setval('productbkbranch_id_seq', 1, false);



SELECT pg_catalog.setval('productsvnmodule_id_seq', 1, false);



SELECT pg_catalog.setval('archarchive_id_seq', 9, true);



SELECT pg_catalog.setval('archarchivelocation_id_seq', 1, false);



SELECT pg_catalog.setval('archnamespace_id_seq', 14, true);



SELECT pg_catalog.setval('branch_id_seq', 14, true);



SELECT pg_catalog.setval('changeset_id_seq', 3, true);



SELECT pg_catalog.setval('changesetfilename_id_seq', 1, false);



SELECT pg_catalog.setval('changesetfile_id_seq', 1, false);



SELECT pg_catalog.setval('changesetfilehash_id_seq', 1, false);



SELECT pg_catalog.setval('productbranchrelationship_id_seq', 1, false);



SELECT pg_catalog.setval('manifest_id_seq', 14, true);



SELECT pg_catalog.setval('manifestentry_id_seq', 6, true);



SELECT pg_catalog.setval('archconfig_id_seq', 1, false);



SELECT pg_catalog.setval('processorfamily_id_seq', 1, true);



SELECT pg_catalog.setval('processor_id_seq', 1, true);



SELECT pg_catalog.setval('builder_id_seq', 1, false);



SELECT pg_catalog.setval('component_id_seq', 3, true);



SELECT pg_catalog.setval('section_id_seq', 1, true);



SELECT pg_catalog.setval('distribution_id_seq', 7, true);



SELECT pg_catalog.setval('distrorelease_id_seq', 9, true);



SELECT pg_catalog.setval('distroarchrelease_id_seq', 6, true);



SELECT pg_catalog.setval('libraryfilecontent_id_seq', 33, true);



SELECT pg_catalog.setval('libraryfilealias_id_seq', 33, true);



SELECT pg_catalog.setval('sourcepackagename_id_seq', 16, true);



SELECT pg_catalog.setval('sourcepackagerelease_id_seq', 20, true);



SELECT pg_catalog.setval('build_id_seq', 7, true);



SELECT pg_catalog.setval('binarypackagename_id_seq', 13, true);



SELECT pg_catalog.setval('binarypackage_id_seq', 15, true);



SELECT pg_catalog.setval('packageselection_id_seq', 1, false);



SELECT pg_catalog.setval('osfile_id_seq', 1, false);



SELECT pg_catalog.setval('pomsgid_id_seq', 145, true);



SELECT pg_catalog.setval('potranslation_id_seq', 643, true);



SELECT pg_catalog.setval('language_id_seq', 558, true);



SELECT pg_catalog.setval('country_id_seq', 240, true);



SELECT pg_catalog.setval('license_id_seq', 1, true);



SELECT pg_catalog.setval('potemplate_id_seq', 5, true);



SELECT pg_catalog.setval('pofile_id_seq', 25, true);



SELECT pg_catalog.setval('pomsgset_id_seq', 731, true);



SELECT pg_catalog.setval('pomsgidsighting_id_seq', 172, true);



SELECT pg_catalog.setval('potranslationsighting_id_seq', 684, true);



SELECT pg_catalog.setval('pocomment_id_seq', 1, false);



SELECT pg_catalog.setval('translationeffort_id_seq', 1, false);



SELECT pg_catalog.setval('posubscription_id_seq', 1, false);



SELECT pg_catalog.setval('bug_id_seq', 6, true);



SELECT pg_catalog.setval('bugsubscription_id_seq', 5, true);



SELECT pg_catalog.setval('bugactivity_id_seq', 6, true);



SELECT pg_catalog.setval('bugexternalref_id_seq', 1, false);



SELECT pg_catalog.setval('bugtrackertype_id_seq', 2, true);



SELECT pg_catalog.setval('bugtracker_id_seq', 3, true);



SELECT pg_catalog.setval('bugwatch_id_seq', 4, true);



SELECT pg_catalog.setval('message_id_seq', 9, true);



SELECT pg_catalog.setval('bugattachment_id_seq', 1, false);



SELECT pg_catalog.setval('projectbugtracker_id_seq', 1, true);



SELECT pg_catalog.setval('distributionrole_id_seq', 7, true);



SELECT pg_catalog.setval('distroreleaserole_id_seq', 9, true);



SELECT pg_catalog.setval('componentselection_id_seq', 1, false);



SELECT pg_catalog.setval('sectionselection_id_seq', 1, false);



SELECT pg_catalog.setval('bugproductinfestation_id_seq', 1, false);



SELECT pg_catalog.setval('bugpackageinfestation_id_seq', 1, false);



SELECT pg_catalog.setval('distroreleasequeue_id_seq', 1, false);



SELECT pg_catalog.setval('distroreleasequeuesource_id_seq', 1, false);



SELECT pg_catalog.setval('distroreleasequeuebuild_id_seq', 1, false);



SELECT pg_catalog.setval('sourcepackagereleasefile_id_seq', 2, true);



SELECT pg_catalog.setval('binarypackagefile_id_seq', 1, false);



SELECT pg_catalog.setval('personlanguage_id_seq', 4, true);



SELECT pg_catalog.setval('potmsgset_id_seq', 164, true);



SELECT pg_catalog.setval('bounty_id_seq', 1, true);



SELECT pg_catalog.setval('bugmessage_id_seq', 8, true);



SELECT pg_catalog.setval('cveref_id_seq', 1, false);



SELECT pg_catalog.setval('karma_id_seq', 3, true);



SELECT pg_catalog.setval('spokenin_id_seq', 335, true);



SELECT pg_catalog.setval('sourcepackagerelationship_id_seq', 1, false);



SELECT pg_catalog.setval('sshkey_id_seq', 1, true);



SELECT pg_catalog.setval('bugtask_id_seq', 15, true);



SELECT pg_catalog.setval('branchlabel_id_seq', 1, false);



SELECT pg_catalog.setval('branchrelationship_id_seq', 1, false);



SELECT pg_catalog.setval('productreleasefile_id_seq', 2, true);



SELECT pg_catalog.setval('logintoken_id_seq', 1, false);



SELECT pg_catalog.setval('milestone_id_seq', 1, true);



SELECT pg_catalog.setval('pushmirroraccess_id_seq', 1, false);



SELECT pg_catalog.setval('buildqueue_id_seq', 1, false);



SELECT pg_catalog.setval('packaging_id_seq', 7, true);



SELECT pg_catalog.setval('signedcodeofconduct_id_seq', 1, false);



SELECT pg_catalog.setval('bountysubscription_id_seq', 3, true);



SELECT pg_catalog.setval('productbounty_id_seq', 1, true);



SELECT pg_catalog.setval('distrobounty_id_seq', 1, true);



SELECT pg_catalog.setval('projectbounty_id_seq', 1, true);



SELECT pg_catalog.setval('mirror_id_seq', 1, false);



SELECT pg_catalog.setval('mirrorcontent_id_seq', 1, false);



SELECT pg_catalog.setval('mirrorsourcecontent_id_seq', 1, false);



SELECT pg_catalog.setval('potemplatename_id_seq', 4, true);



SELECT pg_catalog.setval('maintainership_id_seq', 3, true);



SELECT pg_catalog.setval('messagechunk_id_seq', 8, true);



SELECT pg_catalog.setval('sourcepackagepublishinghistory_id_seq', 8, true);



SELECT pg_catalog.setval('packagepublishinghistory_id_seq', 11, true);


