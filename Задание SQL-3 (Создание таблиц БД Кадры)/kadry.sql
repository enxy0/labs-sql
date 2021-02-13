CREATE DATABASE [�����-test];
GO USE [�����-test];
GO CREATE TABLE [dbo].[����������������] (
        [������] NCHAR (1) NOT NULL,
        [��������������] NVARCHAR (40) NULL,
        CONSTRAINT [PK_����������������] PRIMARY KEY ([������] ASC),
    );
GO CREATE TABLE [dbo].[�����������������] (
        [���] NVARCHAR (1) NOT NULL,
        [��������] NVARCHAR (50) NULL,
        CONSTRAINT [PK_�������������������] PRIMARY KEY ([���] ASC)
    );
GO CREATE TABLE [dbo].[�������������] (
        [��������] NVARCHAR (150) NULL,
        [���] NVARCHAR (1) NULL,
        [�����������] NVARCHAR (7) NULL,
        [�������] NVARCHAR (1) NULL,
        [�����������] NVARCHAR (3) NULL,
        [�����������] NVARCHAR (2) NULL,
        [������������] NVARCHAR (2) NULL,
        [�����������] NVARCHAR (2) NULL,
        [�������] NVARCHAR (7) NOT NULL,
        [������] NVARCHAR (10) NULL,
        [���_������������] NVARCHAR (25) NULL,
        [���_������������] NVARCHAR (10) NULL,
        [���_��������] NVARCHAR (35) NULL,
        [DEL] NVARCHAR (1) NULL,
        CONSTRAINT [FK_�������������_�������������������] FOREIGN KEY ([���]) REFERENCES [dbo].[�����������������] ([���]),
        CONSTRAINT [PK_�������������] PRIMARY KEY ([�������] ASC)
    );
GO CREATE TABLE [dbo].[��������������������] (
        [������������] NVARCHAR (10) NOT NULL,
        [��������] NVARCHAR (60) NULL,
        [����������������] NVARCHAR (4) NULL,
        [�������������] NVARCHAR (50) NULL,
        [������] NCHAR (1) NULL,
        [����] FLOAT (53) NULL,
        CONSTRAINT [FK_��������������������_����������������] FOREIGN KEY ([������]) REFERENCES [dbo].[����������������] ([������]),
        CONSTRAINT [PK_��������������������] PRIMARY KEY ([������������] ASC)
    );
GO CREATE TABLE [dbo].[�������������] (
        [�������������] NVARCHAR (7) NOT NULL,
        [���] NVARCHAR (40) NULL,
        [OTVSL] NVARCHAR (1) NULL,
        [PRND] NVARCHAR (1) NULL,
        CONSTRAINT [PK_�������������] PRIMARY KEY ([�������������] ASC)
    );
GO CREATE TABLE [dbo].[��������] (
        [���_������] FLOAT (53) NULL,
        [���_����������] NVARCHAR (40) NULL,
        [���_�����] NVARCHAR (40) NULL,
        [���_�������] NVARCHAR (40) NULL,
        [���_������] NVARCHAR (40) NULL,
        [���_�����������] NVARCHAR (25) NULL,
        [���_�����] NVARCHAR (40) NULL,
        [���_���] NVARCHAR (8) NULL,
        [���_������] FLOAT (53) NULL,
        [���_��������] FLOAT (53) NULL,
        [����������] FLOAT (53) NULL,
        [��������������] NVARCHAR (40) NULL,
        [���������] NVARCHAR (40) NULL,
        [�����������] NVARCHAR (40) NULL,
        [����������] NVARCHAR (40) NULL,
        [���������������] NVARCHAR (25) NULL,
        [���������] NVARCHAR (40) NULL,
        [�������] NVARCHAR (8) NULL,
        [����������] FLOAT (53) NULL,
        [������������] FLOAT (53) NULL,
        [�������1] NVARCHAR (10) NULL,
        [�������2] NVARCHAR (10) NULL,
        [�������������] NVARCHAR (7) NOT NULL,
        CONSTRAINT [FK_��������_�������������] FOREIGN KEY ([�������������]) REFERENCES [dbo].[�������������] ([�������������]),
        CONSTRAINT [PK_��������] PRIMARY KEY ([�������������] ASC)
    );
GO CREATE TABLE [dbo].[�����������] (
        [�������������] NVARCHAR (7) NOT NULL,
        [�����������] NVARCHAR (5) NULL,
        [��������������] NVARCHAR (2) NULL,
        [������] NVARCHAR (30) NULL,
        [������] NVARCHAR (20) NULL,
        [��������������������] NVARCHAR (15) NULL,
        [��������] NVARCHAR (10) NULL,
        [���������] NVARCHAR (12) NULL,
        CONSTRAINT [FK_�����������_�������������] FOREIGN KEY ([�������������]) REFERENCES [dbo].[�������������] ([�������������]),
        CONSTRAINT [PK_�������] PRIMARY KEY ([�������������] ASC)
    );
GO CREATE TABLE [dbo].[�������] (
        [�������������] NVARCHAR (7) NULL,
        [���] NVARCHAR (40) NULL,
        [������������] DATETIME NULL,
        CONSTRAINT [FK_�������_�������������] FOREIGN KEY ([�������������]) REFERENCES [dbo].[�������������] ([�������������]),
    );
GO CREATE TABLE [dbo].[�������] (
        [�������������] NVARCHAR (7) NOT NULL,
        [�������������] NVARCHAR (20) NULL,
        [���������������] NVARCHAR (20) NULL,
        [�������������] DATETIME NULL,
        [������������] NVARCHAR (20) NULL,
        [��������������] NVARCHAR (20) NULL,
        [������������] DATETIME NULL,
        CONSTRAINT [FK_�������_�������������] FOREIGN KEY ([�������������]) REFERENCES [dbo].[�������������] ([�������������]),
        CONSTRAINT [PK_�������] PRIMARY KEY ([�������������] ASC)
    );
GO CREATE TABLE [dbo].[����������] (
        [�������������] NVARCHAR (7) NOT NULL,
        [������������] DATETIME NULL,
        [���������] NVARCHAR (1) NULL,
        [�������������] NVARCHAR (48) NULL,
        [���] NVARCHAR (1) NULL,
        [��������������] NVARCHAR (10) NULL,
        [��������] NVARCHAR (1) NULL,
        [�����������] NVARCHAR (11) NULL,
        [����������������] NVARCHAR (48) NULL,
        [�������������] NVARCHAR (48) NULL,
        [�����������������] NVARCHAR (50) NULL,
        [���������] NVARCHAR (40) NULL,
        [�����������] NVARCHAR (14) NULL,
        [����������] DATETIME NULL,
        [���������] DATETIME NULL,
        [���������������] DATETIME NULL,
        [���������������] DATETIME NULL,
        [����������������] NVARCHAR (11) NULL,
        [�������������] NVARCHAR (15) NULL,
        [��������] NVARCHAR (50) NULL,
        [����������] DATETIME NULL,
        [DATAZAP] DATETIME NULL,
        [��������������] DATETIME NULL,
        CONSTRAINT [FK_����������_�������������] FOREIGN KEY ([�������������]) REFERENCES [dbo].[�������������] ([�������������]),
        CONSTRAINT [PK_����������] PRIMARY KEY ([�������������] ASC)
    );
GO CREATE TABLE [dbo].[�����������������] (
        [UR] NVARCHAR (1) NULL,
        [����������������] NVARCHAR (7) NOT NULL,
        [������������] NVARCHAR (10) NOT NULL,
        [������] NVARCHAR (2) NOT NULL,
        [�����] MONEY NULL,
        [���������������] INT NULL,
        [����] INT NULL,
        [���������������������] DATETIME NULL,
        [���������] NCHAR (1) NULL,
        CONSTRAINT [FK_�����������������_�������������] FOREIGN KEY ([����������������]) REFERENCES [dbo].[�������������] ([�������]),
        CONSTRAINT [FK_�����������������_��������������������] FOREIGN KEY ([������������]) REFERENCES [dbo].[��������������������] ([������������]),
        CONSTRAINT [PK_�����������������] PRIMARY KEY (
            [����������������] ASC,
            [������������] ASC,
            [������] ASC
        )
    );
GO CREATE TABLE [dbo].[�������] (
        [�������������] NVARCHAR (7) NOT NULL,
        [����������������] NVARCHAR (7) NULL,
        [������������] NVARCHAR (10) NULL,
        [������] NVARCHAR (2) NULL,
        [������] DATETIME NULL,
        [������������] FLOAT (53) NULL,
        [�������������] NVARCHAR (1) NULL,
        [�����������] NVARCHAR (3) NULL,
        [����������] DATETIME NULL,
        [�����] DATETIME NULL,
        CONSTRAINT [FK_�������_�������������] FOREIGN KEY ([�������������]) REFERENCES [dbo].[�������������] ([�������������]),
        CONSTRAINT [FK_�������_�����������������] FOREIGN KEY ([����������������], [������������], [������]) REFERENCES [dbo].[�����������������] ([����������������], [������������], [������]),
        CONSTRAINT [PK_����������������] PRIMARY KEY ([�������������] ASC)
    );