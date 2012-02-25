CREATE TABLE [db_owner].[Orders] (
    [OrderID]    INT          IDENTITY (1, 1) NOT NULL,
    [OrderDate]  DATETIME     NOT NULL,
    [Total]      DECIMAL (18) NOT NULL,
    [Tax]        DECIMAL (18) NOT NULL,
    [Delivery]   DECIMAL (18) NOT NULL,
    [CustomerID] INT          NOT NULL,
    [ItemID]     INT          NOT NULL,
    [Quanity]    INT          NOT NULL
);

