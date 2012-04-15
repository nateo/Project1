USE [CPDM_OverbeyN]
GO
/****** Object:  Table [db_owner].[Items]    Script Date: 04/14/2012 22:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [db_owner].[Items](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[BasePrice] [smallmoney] NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [db_owner].[sp_AddItemToCart]    Script Date: 04/14/2012 22:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		nate
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [db_owner].[sp_AddItemToCart] 
	-- Add the parameters for the stored procedure here
	@OrderID int = 0,
	@ItemAttributeID int = 0,
	@Quantity int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into OrderItems (OrderID, ItemAttributeID, Quantity)
	Values (@OrderID, @ItemAttributeID, @Quantity)
END
GO
/****** Object:  Table [db_owner].[Orders]    Script Date: 04/14/2012 22:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [db_owner].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Paid] [bit] NULL,
	[Delivered] [bit] NULL,
	[Pickup] [bit] NULL,
	[Total] [money] NULL,
	[Tax] [money] NULL,
	[Delivery] [money] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [db_owner].[Customers]    Script Date: 04/14/2012 22:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [db_owner].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Address1] [nvarchar](100) NOT NULL,
	[Address2] [nvarchar](100) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[State] [nvarchar](2) NOT NULL,
	[Zip] [nvarchar](20) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [db_owner].[ItemAttribute]    Script Date: 04/14/2012 22:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [db_owner].[ItemAttribute](
	[ItemAttributeID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[ItemID] [int] NOT NULL,
	[MarkupPercentage] [decimal](18, 2) NULL,
	[MarkupFlatRate] [decimal](18, 2) NULL,
 CONSTRAINT [PK_ItemAttribute] PRIMARY KEY CLUSTERED 
(
	[ItemAttributeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [db_owner].[OrderItems]    Script Date: 04/14/2012 22:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [db_owner].[OrderItems](
	[OrderItemID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ItemAttributeID] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [db_owner].[sp_CreateCustomer]    Script Date: 04/14/2012 22:14:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nathan Overbey
-- Create date: 4/1/2012
-- Description:	
-- =============================================
CREATE PROCEDURE [db_owner].[sp_CreateCustomer] 
	-- Add the parameters for the stored procedure here
	@FirstName nvarchar(50), 
	@LastName nvarchar(50),
	@Address1 nvarchar(100),
	@Address2 nvarchar(100),
	@City nvarchar(100),
	@State nvarchar(2),
	@Zip nvarchar(20),
	@PhoneNumber nvarchar(50),
	@UserID uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Customers (FirstName, LastName, Address1, Address2, City, [State], Zip, PhoneNumber, UserID)
	values(@FirstName, @LastName, @Address1, @Address2, @City, @State, @Zip, @PhoneNumber, @UserID)
END
GO
/****** Object:  StoredProcedure [db_owner].[sp_UpdateCustomer]    Script Date: 04/14/2012 22:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nathan Overbey
-- Create date: 4/1/2012
-- Description:	
-- =============================================
CREATE PROCEDURE [db_owner].[sp_UpdateCustomer] 
	-- Add the parameters for the stored procedure here
	@FirstName nvarchar(50), 
	@LastName nvarchar(50),
	@Address1 nvarchar(100),
	@Address2 nvarchar(100),
	@City nvarchar(100),
	@State nvarchar(2),
	@Zip nvarchar(20),
	@PhoneNumber nvarchar(50),
	@UserID uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Customers 
	set 
		FirstName = @FirstName, 
		LastName = @LastName, 
		Address1 = @Address1, 
		Address2 = @Address2, 
		City = @City, 
		[State] = @State, 
		Zip = @Zip, 
		PhoneNumber = @PhoneNumber,
		UserID = @UserID
	where userID = @UserID
END
GO
/****** Object:  StoredProcedure [db_owner].[sp_GetOrders]    Script Date: 04/14/2012 22:14:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nate
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [db_owner].[sp_GetOrders] 
	-- Add the parameters for the stored procedure here
	@Delivered bit = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT     db_owner.Customers.LastName, db_owner.Customers.Address1, db_owner.Customers.Address2, db_owner.Customers.PhoneNumber, db_owner.Items.Description AS ItemDescription, 
                      db_owner.ItemAttribute.Description AS ItemAttributeDescription, db_owner.Orders.Total, db_owner.OrderItems.Quantity, db_owner.Orders.OrderID
FROM         db_owner.Customers INNER JOIN
                      db_owner.Items INNER JOIN
                      db_owner.ItemAttribute ON db_owner.Items.ItemID = db_owner.ItemAttribute.ItemID INNER JOIN
                      db_owner.OrderItems ON db_owner.ItemAttribute.ItemAttributeID = db_owner.OrderItems.ItemAttributeID INNER JOIN
                      db_owner.Orders ON db_owner.OrderItems.OrderID = db_owner.Orders.OrderID ON db_owner.Customers.CustomerID = db_owner.Orders.CustomerID
where delivered = @Delivered
                      
END
GO
/****** Object:  StoredProcedure [db_owner].[sp_GetOrderCost]    Script Date: 04/14/2012 22:14:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		nate
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [db_owner].[sp_GetOrderCost] 
	-- Add the parameters for the stored procedure here
	@OrderID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT     db_owner.Items.BasePrice, db_owner.OrderItems.Quantity, db_owner.ItemAttribute.MarkupFlatRate, db_owner.ItemAttribute.MarkupPercentage, 
                      db_owner.OrderItems.OrderID, db_owner.Items.Description, db_owner.ItemAttribute.Description AS Expr1
FROM         db_owner.Items INNER JOIN
                      db_owner.ItemAttribute ON db_owner.Items.ItemID = db_owner.ItemAttribute.ItemID INNER JOIN
                      db_owner.OrderItems ON db_owner.ItemAttribute.ItemAttributeID = db_owner.OrderItems.ItemAttributeID CROSS JOIN
                      db_owner.Customers CROSS JOIN
                      dbo.SiteMap
where
	OrderItems.OrderID = @OrderID                      
END
GO
/****** Object:  StoredProcedure [db_owner].[sp_AddItemAttribute]    Script Date: 04/14/2012 22:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nathan Overbey
-- Create date: 4/2/12
-- Description:	
-- =============================================
CREATE PROCEDURE [db_owner].[sp_AddItemAttribute] 
	-- Add the parameters for the stored procedure here
	
	@Description nvarchar(100),
	@MarkupPercentage decimal(18, 2) = null,
	@MarkupFlatRate decimal(18, 2) = null,
	@ItemID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into ItemAttribute ([Description], MarkupPercentage, MarkupFlatRate, ItemID)
	values (@Description, @MarkupPercentage, @MarkupFlatRate, @ItemID)
END
GO
/****** Object:  StoredProcedure [db_owner].[sp_EditItemAttribute]    Script Date: 04/14/2012 22:14:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nathan Overbey
-- Create date: 4/2/12
-- Description:	
-- =============================================
CREATE PROCEDURE [db_owner].[sp_EditItemAttribute] 
	-- Add the parameters for the stored procedure here
	
	@ItemAttributeID int,
	@Description nvarchar(100),
	@MarkupPercentage decimal(18, 2) = null,
	@MarkupFlatRate decimal(18, 2) = null,
	@ItemID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update ItemAttribute 
	set [Description] = @Description, MarkupPercentage = @MarkupPercentage, MarkupFlatRate = @MarkupFlatRate, ItemID = @ItemID
	where ItemAttributeID = @ItemAttributeID
END
GO
/****** Object:  StoredProcedure [db_owner].[sp_DeleteItemAttribute]    Script Date: 04/14/2012 22:14:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nathan Overbey
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [db_owner].[sp_DeleteItemAttribute] 
	-- Add the parameters for the stored procedure here
	@ItemAttributeID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from ItemAttribute where ItemAttributeID = @ItemAttributeID
END
GO
/****** Object:  StoredProcedure [db_owner].[sp_OrderItems]    Script Date: 04/14/2012 22:14:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		nate
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [db_owner].[sp_OrderItems] 
	-- Add the parameters for the stored procedure here
	@OrderID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT     db_owner.Items.Description AS ItemDescription, db_owner.ItemAttribute.Description AS ItemAttributeDescription, db_owner.OrderItems.Quantity
FROM         db_owner.Orders INNER JOIN
                      db_owner.OrderItems ON db_owner.Orders.OrderID = db_owner.OrderItems.OrderID INNER JOIN
                      db_owner.ItemAttribute ON db_owner.OrderItems.ItemAttributeID = db_owner.ItemAttribute.ItemAttributeID INNER JOIN
                      db_owner.Items ON db_owner.ItemAttribute.ItemID = db_owner.Items.ItemID
WHERE     (db_owner.OrderItems.OrderID = @OrderID)

END
GO
/****** Object:  StoredProcedure [db_owner].[proc_GetSiteMap]    Script Date: 04/14/2012 22:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_owner].[proc_GetSiteMap] AS
    SELECT [ID], [Title], [Description], [Url], [Roles], [Parent]
    FROM [SiteMap] ORDER BY [ID]
GO
/****** Object:  StoredProcedure [db_owner].[sp_Checkout]    Script Date: 04/14/2012 22:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		nate
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [db_owner].[sp_Checkout] 
	-- Add the parameters for the stored procedure here
	@OrderID int = 0,
	@Pickup bit = 0,
	@Paid bit = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update orders set Paid = @Paid, Pickup = @Pickup
	where OrderID = @OrderID
END
GO
/****** Object:  StoredProcedure [db_owner].[sp_CreateOrder]    Script Date: 04/14/2012 22:14:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nathan Overbey
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [db_owner].[sp_CreateOrder] 
	-- Add the parameters for the stored procedure here
	@CustomerID int = 0

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into Orders (OrderDate, CustomerID) Values(GetDate(), @CustomerID)
	SELECT SCOPE_IDENTITY()
	
END
GO
/****** Object:  Default [DF_ItemAttribute_MarkupPercentage]    Script Date: 04/14/2012 22:13:15 ******/
ALTER TABLE [db_owner].[ItemAttribute] ADD  CONSTRAINT [DF_ItemAttribute_MarkupPercentage]  DEFAULT ((0)) FOR [MarkupPercentage]
GO
/****** Object:  Default [DF_ItemAttribute_MarkupFlatRate]    Script Date: 04/14/2012 22:13:15 ******/
ALTER TABLE [db_owner].[ItemAttribute] ADD  CONSTRAINT [DF_ItemAttribute_MarkupFlatRate]  DEFAULT ((0)) FOR [MarkupFlatRate]
GO
/****** Object:  Default [DF_OrderItems_Quantity]    Script Date: 04/14/2012 22:13:15 ******/
ALTER TABLE [db_owner].[OrderItems] ADD  CONSTRAINT [DF_OrderItems_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
/****** Object:  Default [DF_Orders_Paid]    Script Date: 04/14/2012 22:13:15 ******/
ALTER TABLE [db_owner].[Orders] ADD  CONSTRAINT [DF_Orders_Paid]  DEFAULT ((0)) FOR [Paid]
GO
/****** Object:  Default [DF_Orders_Delivered]    Script Date: 04/14/2012 22:13:15 ******/
ALTER TABLE [db_owner].[Orders] ADD  CONSTRAINT [DF_Orders_Delivered]  DEFAULT ((0)) FOR [Delivered]
GO
/****** Object:  Default [DF_Orders_Pickup]    Script Date: 04/14/2012 22:13:15 ******/
ALTER TABLE [db_owner].[Orders] ADD  CONSTRAINT [DF_Orders_Pickup]  DEFAULT ((0)) FOR [Pickup]
GO
/****** Object:  ForeignKey [FK_ItemAttribute_Items]    Script Date: 04/14/2012 22:13:15 ******/
ALTER TABLE [db_owner].[ItemAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ItemAttribute_Items] FOREIGN KEY([ItemID])
REFERENCES [db_owner].[Items] ([ItemID])
GO
ALTER TABLE [db_owner].[ItemAttribute] CHECK CONSTRAINT [FK_ItemAttribute_Items]
GO
/****** Object:  ForeignKey [FK_OrderItems_ItemAttribute]    Script Date: 04/14/2012 22:13:15 ******/
ALTER TABLE [db_owner].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_ItemAttribute] FOREIGN KEY([ItemAttributeID])
REFERENCES [db_owner].[ItemAttribute] ([ItemAttributeID])
GO
ALTER TABLE [db_owner].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_ItemAttribute]
GO
/****** Object:  ForeignKey [FK_OrderItems_Orders]    Script Date: 04/14/2012 22:13:15 ******/
ALTER TABLE [db_owner].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY([OrderID])
REFERENCES [db_owner].[Orders] ([OrderID])
GO
ALTER TABLE [db_owner].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders]
GO
