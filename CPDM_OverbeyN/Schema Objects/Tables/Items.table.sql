CREATE TABLE [db_owner].[Items] (
    [ItemID]      INT            IDENTITY (1, 1) NOT NULL,
    [Description] NVARCHAR (100) NOT NULL,
    [BasePrice]   DECIMAL (18)   NULL,
    [OrderID]     INT            NULL
);

