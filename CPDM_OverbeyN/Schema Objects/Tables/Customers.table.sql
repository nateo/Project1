CREATE TABLE [db_owner].[Customers] (
    [CustomerID]  INT              IDENTITY (1, 1) NOT NULL,
    [FirstName]   NVARCHAR (50)    NOT NULL,
    [LastName]    NVARCHAR (50)    NOT NULL,
    [Address1]    NVARCHAR (100)   NOT NULL,
    [Address2]    NVARCHAR (100)   NOT NULL,
    [City]        NVARCHAR (100)   NOT NULL,
    [State]       NVARCHAR (2)     NOT NULL,
    [Zip]         NVARCHAR (20)    NOT NULL,
    [PhoneNumber] NVARCHAR (50)    NOT NULL,
    [UserID]      UNIQUEIDENTIFIER NOT NULL
);

