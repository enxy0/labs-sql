CREATE DATABASE [Книги-test];
GO USE [Книги-test];
GO CREATE TABLE [dbo].[издательства] (
        [регион] NVARCHAR (50) NULL,
        [ид_изд] NVARCHAR (3) NOT NULL,
        [издательство] NVARCHAR (20) NOT NULL,
        [город] NVARCHAR (15) NOT NULL,
        [страна] NVARCHAR (15) NOT NULL,
        CONSTRAINT [aaaaapublishers_PK] PRIMARY KEY ([ид_изд] ASC),
    );
GO CREATE TABLE [dbo].[книги] (
        [ид_кни] NVARCHAR (3) NOT NULL,
        [название] NVARCHAR (40) NOT NULL UNIQUE,
        [жанр] NVARCHAR (10) NULL,
        [издательство] NVARCHAR (3) NOT NULL,
        [страницы] INT NULL CHECK (страницы > 0),
        [цена] DECIMAL (5, 2) NULL,
        [продажи] INT NULL,
        [дата издания] DATETIME NULL,
        [контракт] SMALLINT NOT NULL,
        CONSTRAINT [FK_книги_издательства] FOREIGN KEY ([издательство]) REFERENCES [dbo].[издательства] ([ид_изд]),
        CONSTRAINT [aaaaatitles_PK] PRIMARY KEY ([ид_кни] ASC),
        CONSTRAINT sales_chk CHECK (продажи >= 0),
        CONSTRAINT title_name_contract_chk CHECK (
            название <> ''
            AND контракт >= 0
        ),
        CONSTRAINT revenue_chk CHECK (цена * продажи >= 0.00),
        CONSTRAINT genre_chk CHECK (
            жанр in (
                'биография',
                'детские',
                'компьютер',
                'история',
                'психология'
            )
        )
    );
GO CREATE TABLE [dbo].[авторы] (
        [ид_авт] NVARCHAR (3) NOT NULL,
        [имя] NVARCHAR (15) NOT NULL,
        [фамилия] NVARCHAR (15) NOT NULL,
        [телефон] NVARCHAR (12) NULL UNIQUE,
        [адрес] NVARCHAR (40) NULL,
        [город] NVARCHAR (15) NULL,
        [регион] NVARCHAR (25) NULL,
        [индекс] NVARCHAR (6) NULL,
        CONSTRAINT [aaaaaauthors_PK] PRIMARY KEY ([ид_авт] ASC),
    );
GO CREATE TABLE [dbo].[гонорары] (
        [ид_кни] NVARCHAR (3) NOT NULL,
        [аванс] DECIMAL (9, 2) NULL,
        [процент_гонорара] DECIMAL (5, 2) NULL,
        CONSTRAINT [FK_гонорары_книги] FOREIGN KEY ([ид_кни]) REFERENCES [dbo].[книги] ([ид_кни]),
        CONSTRAINT [aaaaaroyalties_PK] PRIMARY KEY ([ид_кни] ASC),
    );
GO CREATE TABLE [dbo].[книги-авторы] (
        [ид_кни] NVARCHAR (3) NOT NULL,
        [ид_авт] NVARCHAR (3) NOT NULL,
        [номер_автора] SMALLINT NOT NULL,
        [доля_автора] DECIMAL (5, 2) NOT NULL,
        CONSTRAINT [FK_книги-авторы_авторы] FOREIGN KEY ([ид_авт]) REFERENCES [dbo].[авторы] ([ид_авт]),
        CONSTRAINT [FK_книги-авторы_книги] FOREIGN KEY ([ид_кни]) REFERENCES [dbo].[книги] ([ид_кни]),
        CONSTRAINT [aaaaatitle_authors_PK] PRIMARY KEY ([ид_кни] ASC, [ид_авт] ASC),
    );