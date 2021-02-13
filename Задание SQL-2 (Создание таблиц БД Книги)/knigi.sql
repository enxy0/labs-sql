CREATE DATABASE [�����-test];
GO USE [�����-test];
GO CREATE TABLE [dbo].[������������] (
        [������] NVARCHAR (50) NULL,
        [��_���] NVARCHAR (3) NOT NULL,
        [������������] NVARCHAR (20) NOT NULL,
        [�����] NVARCHAR (15) NOT NULL,
        [������] NVARCHAR (15) NOT NULL,
        CONSTRAINT [aaaaapublishers_PK] PRIMARY KEY ([��_���] ASC),
    );
GO CREATE TABLE [dbo].[�����] (
        [��_���] NVARCHAR (3) NOT NULL,
        [��������] NVARCHAR (40) NOT NULL UNIQUE,
        [����] NVARCHAR (10) NULL,
        [������������] NVARCHAR (3) NOT NULL,
        [��������] INT NULL CHECK (�������� > 0),
        [����] DECIMAL (5, 2) NULL,
        [�������] INT NULL,
        [���� �������] DATETIME NULL,
        [��������] SMALLINT NOT NULL,
        CONSTRAINT [FK_�����_������������] FOREIGN KEY ([������������]) REFERENCES [dbo].[������������] ([��_���]),
        CONSTRAINT [aaaaatitles_PK] PRIMARY KEY ([��_���] ASC),
        CONSTRAINT sales_chk CHECK (������� >= 0),
        CONSTRAINT title_name_contract_chk CHECK (
            �������� <> ''
            AND �������� >= 0
        ),
        CONSTRAINT revenue_chk CHECK (���� * ������� >= 0.00),
        CONSTRAINT genre_chk CHECK (
            ���� in (
                '���������',
                '�������',
                '���������',
                '�������',
                '����������'
            )
        )
    );
GO CREATE TABLE [dbo].[������] (
        [��_���] NVARCHAR (3) NOT NULL,
        [���] NVARCHAR (15) NOT NULL,
        [�������] NVARCHAR (15) NOT NULL,
        [�������] NVARCHAR (12) NULL UNIQUE,
        [�����] NVARCHAR (40) NULL,
        [�����] NVARCHAR (15) NULL,
        [������] NVARCHAR (25) NULL,
        [������] NVARCHAR (6) NULL,
        CONSTRAINT [aaaaaauthors_PK] PRIMARY KEY ([��_���] ASC),
    );
GO CREATE TABLE [dbo].[��������] (
        [��_���] NVARCHAR (3) NOT NULL,
        [�����] DECIMAL (9, 2) NULL,
        [�������_��������] DECIMAL (5, 2) NULL,
        CONSTRAINT [FK_��������_�����] FOREIGN KEY ([��_���]) REFERENCES [dbo].[�����] ([��_���]),
        CONSTRAINT [aaaaaroyalties_PK] PRIMARY KEY ([��_���] ASC),
    );
GO CREATE TABLE [dbo].[�����-������] (
        [��_���] NVARCHAR (3) NOT NULL,
        [��_���] NVARCHAR (3) NOT NULL,
        [�����_������] SMALLINT NOT NULL,
        [����_������] DECIMAL (5, 2) NOT NULL,
        CONSTRAINT [FK_�����-������_������] FOREIGN KEY ([��_���]) REFERENCES [dbo].[������] ([��_���]),
        CONSTRAINT [FK_�����-������_�����] FOREIGN KEY ([��_���]) REFERENCES [dbo].[�����] ([��_���]),
        CONSTRAINT [aaaaatitle_authors_PK] PRIMARY KEY ([��_���] ASC, [��_���] ASC),
    );