CREATE TABLE [dbo].[SiteMap] (
    [ID]          INT           NOT NULL,
    [Title]       VARCHAR (32)  NULL,
    [Description] VARCHAR (512) NULL,
    [Url]         VARCHAR (512) NULL,
    [Roles]       VARCHAR (512) NULL,
    [Parent]      INT           NULL
);

