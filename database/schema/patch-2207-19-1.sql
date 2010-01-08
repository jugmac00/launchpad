SET client_min_messages=ERROR;

CREATE INDEX bugtask__bugwatch__idx
ON BugTask(bugwatch) WHERE bugwatch IS NOT NULL;

CREATE INDEX translationimportqueueentry__productseries__idx
ON TranslationImportQueueEntry(productseries)
WHERE productseries IS NOT NULL;

CREATE INDEX translationimportqueueentry__sourcepackagename__idx
ON TranslationImportQueueEntry(sourcepackagename)
WHERE sourcepackagename IS NOT NULL;

CREATE INDEX translationimportqueueentry__path__idx
ON TranslationImportQueueEntry(path);

CREATE INDEX translationimportqueueentry__pofile__idx
ON TranslationImportQueueEntry(pofile)
WHERE pofile IS NOT NULL;

CREATE INDEX translationimportqueueentry__potemplate__idx
ON TranslationImportQueueEntry(potemplate)
WHERE potemplate IS NOT NULL;


INSERT INTO LaunchpadDatabaseRevision VALUES (2207, 19, 1);
