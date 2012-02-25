CREATE PROCEDURE proc_GetSiteMap AS
    SELECT [ID], [Title], [Description], [Url], [Roles], [Parent]
    FROM [SiteMap] ORDER BY [ID]
