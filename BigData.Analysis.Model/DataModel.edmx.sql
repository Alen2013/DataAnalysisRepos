
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/16/2018 17:46:35
-- Generated from EDMX file: C:\Users\Administrator\Documents\Visual Studio 2015\Projects\WebApplication1\BigData.Analysis.Model\DataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [BigData];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_RoleUserInfo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserInfoSet] DROP CONSTRAINT [FK_RoleUserInfo];
GO
IF OBJECT_ID(N'[dbo].[FK_MachineOutputBadInfo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BadInfoSet] DROP CONSTRAINT [FK_MachineOutputBadInfo];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[UserInfoSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserInfoSet];
GO
IF OBJECT_ID(N'[dbo].[RoleSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RoleSet];
GO
IF OBJECT_ID(N'[dbo].[MachineOutputSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MachineOutputSet];
GO
IF OBJECT_ID(N'[dbo].[BadInfoSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BadInfoSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserInfoSet'
CREATE TABLE [dbo].[UserInfoSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(32)  NOT NULL,
    [UserPwd] nvarchar(16)  NOT NULL,
    [RoleId] int  NOT NULL,
    [CardId] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'RoleSet'
CREATE TABLE [dbo].[RoleSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RoleName] nvarchar(32)  NOT NULL,
    [ComGroup] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'MachineOutputSet'
CREATE TABLE [dbo].[MachineOutputSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MachineType] nvarchar(15)  NOT NULL,
    [TotalOutput] nvarchar(max)  NOT NULL,
    [Date] nvarchar(max)  NOT NULL,
    [Group] nvarchar(max)  NOT NULL,
    [ProductType] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'BadInfoSet'
CREATE TABLE [dbo].[BadInfoSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [BadClass] nvarchar(max)  NOT NULL,
    [Nums] bigint  NOT NULL,
    [BadExplain] nvarchar(max)  NOT NULL,
    [Analysis] nvarchar(max)  NOT NULL,
    [ReasonClass] nvarchar(max)  NOT NULL,
    [Date] nvarchar(max)  NOT NULL,
    [RepairMan] nvarchar(max)  NOT NULL,
    [MachineOutputId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'UserInfoSet'
ALTER TABLE [dbo].[UserInfoSet]
ADD CONSTRAINT [PK_UserInfoSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RoleSet'
ALTER TABLE [dbo].[RoleSet]
ADD CONSTRAINT [PK_RoleSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MachineOutputSet'
ALTER TABLE [dbo].[MachineOutputSet]
ADD CONSTRAINT [PK_MachineOutputSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BadInfoSet'
ALTER TABLE [dbo].[BadInfoSet]
ADD CONSTRAINT [PK_BadInfoSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [RoleId] in table 'UserInfoSet'
ALTER TABLE [dbo].[UserInfoSet]
ADD CONSTRAINT [FK_RoleUserInfo]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[RoleSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoleUserInfo'
CREATE INDEX [IX_FK_RoleUserInfo]
ON [dbo].[UserInfoSet]
    ([RoleId]);
GO

-- Creating foreign key on [MachineOutputId] in table 'BadInfoSet'
ALTER TABLE [dbo].[BadInfoSet]
ADD CONSTRAINT [FK_MachineOutputBadInfo]
    FOREIGN KEY ([MachineOutputId])
    REFERENCES [dbo].[MachineOutputSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MachineOutputBadInfo'
CREATE INDEX [IX_FK_MachineOutputBadInfo]
ON [dbo].[BadInfoSet]
    ([MachineOutputId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------