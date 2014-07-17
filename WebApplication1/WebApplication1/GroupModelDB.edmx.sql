
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/17/2014 13:56:35
-- Generated from EDMX file: C:\Users\Steven\Documents\GitHub\EFModelProj\WebApplication1\WebApplication1\GroupModelDB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [GroupModelDB];
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

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [OrderID] int IDENTITY(1,1) NOT NULL,
    [OrderDate] datetime  NOT NULL,
    [RequiredDate] datetime  NOT NULL,
    [CustomerCustomerId] int  NOT NULL
);
GO

-- Creating table 'OrderDetails'
CREATE TABLE [dbo].[OrderDetails] (
    [OrderDetail] int IDENTITY(1,1) NOT NULL,
    [UnitPrice] decimal(18,0)  NOT NULL,
    [Quantity] int  NOT NULL,
    [Order_OrderID] int  NOT NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [CustomerId] int IDENTITY(1,1) NOT NULL,
    [CompanyName] nvarchar(max)  NOT NULL,
    [ContactName] nvarchar(max)  NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Address] int  NOT NULL
);
GO

-- Creating table 'Products1'
CREATE TABLE [dbo].[Products1] (
    [ProductId] int IDENTITY(1,1) NOT NULL,
    [ProductName] nvarchar(max)  NOT NULL,
    [UnitPrice] decimal(18,0)  NOT NULL,
    [ReorderLevel] int  NOT NULL,
    [OrderDetailsOrderDetail] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [OrderID] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([OrderID] ASC);
GO

-- Creating primary key on [OrderDetail] in table 'OrderDetails'
ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT [PK_OrderDetails]
    PRIMARY KEY CLUSTERED ([OrderDetail] ASC);
GO

-- Creating primary key on [CustomerId] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([CustomerId] ASC);
GO

-- Creating primary key on [ProductId] in table 'Products1'
ALTER TABLE [dbo].[Products1]
ADD CONSTRAINT [PK_Products1]
    PRIMARY KEY CLUSTERED ([ProductId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomerCustomerId] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_CustomerOrder]
    FOREIGN KEY ([CustomerCustomerId])
    REFERENCES [dbo].[Customers]
        ([CustomerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerOrder'
CREATE INDEX [IX_FK_CustomerOrder]
ON [dbo].[Orders]
    ([CustomerCustomerId]);
GO

-- Creating foreign key on [Order_OrderID] in table 'OrderDetails'
ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT [FK_OrderDetailsOrder]
    FOREIGN KEY ([Order_OrderID])
    REFERENCES [dbo].[Orders]
        ([OrderID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderDetailsOrder'
CREATE INDEX [IX_FK_OrderDetailsOrder]
ON [dbo].[OrderDetails]
    ([Order_OrderID]);
GO

-- Creating foreign key on [OrderDetailsOrderDetail] in table 'Products1'
ALTER TABLE [dbo].[Products1]
ADD CONSTRAINT [FK_OrderDetailsProduct]
    FOREIGN KEY ([OrderDetailsOrderDetail])
    REFERENCES [dbo].[OrderDetails]
        ([OrderDetail])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderDetailsProduct'
CREATE INDEX [IX_FK_OrderDetailsProduct]
ON [dbo].[Products1]
    ([OrderDetailsOrderDetail]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------