CREATE TABLE [db_owner].[ItemAttribute] (
    [ItemAttributeID]  INT            IDENTITY (1, 1) NOT NULL,
    [Description]      NVARCHAR (100) NOT NULL,
    [MarkupPercentage] DECIMAL (18)   NOT NULL,
    [MarkupFlatRate]   DATETIME       NOT NULL,
    [ItemID]           INT            NOT NULL
);

