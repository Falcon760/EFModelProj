
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/17/2014 19:49:06
-- Generated from EDMX file: C:\Users\Steven\Documents\GitHub\EFModelProj\WebApplication1\WebApplication1\EFModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [GroupDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [CustomerId] int IDENTITY(1,1) NOT NULL,
    [CompanyName] nvarchar(max)  NOT NULL,
    [ContactName] nvarchar(max)  NOT NULL,
    [ContactTitle] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NULL,
    [City] nvarchar(max)  NULL,
    [ZipCode] int  NULL,
    [Phone] nvarchar(max)  NULL,
    [Fax] nvarchar(max)  NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [OrderId] int IDENTITY(1,1) NOT NULL,
    [OrderDate] datetime  NOT NULL,
    [RequiredDate] datetime  NULL,
    [CustomersCustomerId] int  NOT NULL
);
GO

-- Creating table 'OrderDetails'
CREATE TABLE [dbo].[OrderDetails] (
    [DetailsId] int IDENTITY(1,1) NOT NULL,
    [CustomerPrice] decimal(18,0)  NULL,
    [Quantity] int  NOT NULL,
    [OrdersOrderId] int  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [ProductId] int IDENTITY(1,1) NOT NULL,
    [ProductName] nvarchar(max)  NOT NULL,
    [UnitPrice] float  NOT NULL,
    [ReorderLevel] int  NOT NULL,
    [OrderDetailsDetailsId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CustomerId] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([CustomerId] ASC);
GO

-- Creating primary key on [OrderId] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([OrderId] ASC);
GO

-- Creating primary key on [DetailsId] in table 'OrderDetails'
ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT [PK_OrderDetails]
    PRIMARY KEY CLUSTERED ([DetailsId] ASC);
GO

-- Creating primary key on [ProductId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([ProductId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomersCustomerId] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_CustomersOrders]
    FOREIGN KEY ([CustomersCustomerId])
    REFERENCES [dbo].[Customers]
        ([CustomerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomersOrders'
CREATE INDEX [IX_FK_CustomersOrders]
ON [dbo].[Orders]
    ([CustomersCustomerId]);
GO

-- Creating foreign key on [OrdersOrderId] in table 'OrderDetails'
ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT [FK_OrdersOrderDetails]
    FOREIGN KEY ([OrdersOrderId])
    REFERENCES [dbo].[Orders]
        ([OrderId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrdersOrderDetails'
CREATE INDEX [IX_FK_OrdersOrderDetails]
ON [dbo].[OrderDetails]
    ([OrdersOrderId]);
GO

-- Creating foreign key on [OrderDetailsDetailsId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_OrderDetailsProducts]
    FOREIGN KEY ([OrderDetailsDetailsId])
    REFERENCES [dbo].[OrderDetails]
        ([DetailsId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderDetailsProducts'
CREATE INDEX [IX_FK_OrderDetailsProducts]
ON [dbo].[Products]
    ([OrderDetailsDetailsId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------