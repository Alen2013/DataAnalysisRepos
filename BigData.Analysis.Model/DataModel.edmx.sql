
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/27/2018 10:08:30
-- Generated from EDMX file: C:\Users\Administrator\Source\Repos\DataAnalysisRepos\BigData.Analysis.Model\DataModel.edmx
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
    [CardId] nvarchar(max)  NOT NULL,
    [Group] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'RoleSet'
CREATE TABLE [dbo].[RoleSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RoleName] nvarchar(32)  NOT NULL,
    [ComGroup] nvarchar(max)  NOT NULL,
    [RoleType] nvarchar(max)  NOT NULL
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

-- Creating table 'User_RoleSet'
CREATE TABLE [dbo].[User_RoleSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserInfoId] int  NOT NULL,
    [RoleId] int  NOT NULL
);
GO

-- Creating table 'ActionInfoSet'
CREATE TABLE [dbo].[ActionInfoSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Url] nvarchar(max)  NOT NULL,
    [ActionName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'User_ActionSet'
CREATE TABLE [dbo].[User_ActionSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [HasPermission] nvarchar(max)  NOT NULL,
    [UserInfoId] int  NOT NULL,
    [ActionInfoId] int  NOT NULL
);
GO

-- Creating table 'ActionInfoRole'
CREATE TABLE [dbo].[ActionInfoRole] (
    [ActionInfo_Id] int  NOT NULL,
    [Role_Id] int  NOT NULL
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

-- Creating primary key on [Id] in table 'User_RoleSet'
ALTER TABLE [dbo].[User_RoleSet]
ADD CONSTRAINT [PK_User_RoleSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ActionInfoSet'
ALTER TABLE [dbo].[ActionInfoSet]
ADD CONSTRAINT [PK_ActionInfoSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'User_ActionSet'
ALTER TABLE [dbo].[User_ActionSet]
ADD CONSTRAINT [PK_User_ActionSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ActionInfo_Id], [Role_Id] in table 'ActionInfoRole'
ALTER TABLE [dbo].[ActionInfoRole]
ADD CONSTRAINT [PK_ActionInfoRole]
    PRIMARY KEY CLUSTERED ([ActionInfo_Id], [Role_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

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

-- Creating foreign key on [UserInfoId] in table 'User_RoleSet'
ALTER TABLE [dbo].[User_RoleSet]
ADD CONSTRAINT [FK_UserInfoUser_Role]
    FOREIGN KEY ([UserInfoId])
    REFERENCES [dbo].[UserInfoSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserInfoUser_Role'
CREATE INDEX [IX_FK_UserInfoUser_Role]
ON [dbo].[User_RoleSet]
    ([UserInfoId]);
GO

-- Creating foreign key on [RoleId] in table 'User_RoleSet'
ALTER TABLE [dbo].[User_RoleSet]
ADD CONSTRAINT [FK_RoleUser_Role]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[RoleSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoleUser_Role'
CREATE INDEX [IX_FK_RoleUser_Role]
ON [dbo].[User_RoleSet]
    ([RoleId]);
GO

-- Creating foreign key on [ActionInfo_Id] in table 'ActionInfoRole'
ALTER TABLE [dbo].[ActionInfoRole]
ADD CONSTRAINT [FK_ActionInfoRole_ActionInfo]
    FOREIGN KEY ([ActionInfo_Id])
    REFERENCES [dbo].[ActionInfoSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Role_Id] in table 'ActionInfoRole'
ALTER TABLE [dbo].[ActionInfoRole]
ADD CONSTRAINT [FK_ActionInfoRole_Role]
    FOREIGN KEY ([Role_Id])
    REFERENCES [dbo].[RoleSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ActionInfoRole_Role'
CREATE INDEX [IX_FK_ActionInfoRole_Role]
ON [dbo].[ActionInfoRole]
    ([Role_Id]);
GO

-- Creating foreign key on [UserInfoId] in table 'User_ActionSet'
ALTER TABLE [dbo].[User_ActionSet]
ADD CONSTRAINT [FK_UserInfoUser_Action]
    FOREIGN KEY ([UserInfoId])
    REFERENCES [dbo].[UserInfoSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserInfoUser_Action'
CREATE INDEX [IX_FK_UserInfoUser_Action]
ON [dbo].[User_ActionSet]
    ([UserInfoId]);
GO

-- Creating foreign key on [ActionInfoId] in table 'User_ActionSet'
ALTER TABLE [dbo].[User_ActionSet]
ADD CONSTRAINT [FK_ActionInfoUser_Action]
    FOREIGN KEY ([ActionInfoId])
    REFERENCES [dbo].[ActionInfoSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ActionInfoUser_Action'
CREATE INDEX [IX_FK_ActionInfoUser_Action]
ON [dbo].[User_ActionSet]
    ([ActionInfoId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------