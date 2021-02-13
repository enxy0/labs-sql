CREATE DATABASE [Кадры-test];
GO USE [Кадры-test];
GO CREATE TABLE [dbo].[ГруппыДолжностей] (
        [Группа] NCHAR (1) NOT NULL,
        [НазваниеГруппы] NVARCHAR (40) NULL,
        CONSTRAINT [PK_ГруппыДолжностей] PRIMARY KEY ([Группа] ASC),
    );
GO CREATE TABLE [dbo].[ТипыПодразделений] (
        [Тип] NVARCHAR (1) NOT NULL,
        [Название] NVARCHAR (50) NULL,
        CONSTRAINT [PK_ГруппыПодразделений] PRIMARY KEY ([Тип] ASC)
    );
GO CREATE TABLE [dbo].[Подразделения] (
        [НАЗВАНИЕ] NVARCHAR (150) NULL,
        [Тип] NVARCHAR (1) NULL,
        [Обозначение] NVARCHAR (7) NULL,
        [Уровень] NVARCHAR (1) NULL,
        [Вложенность] NVARCHAR (3) NULL,
        [НомерОтдела] NVARCHAR (2) NULL,
        [НомерСектора] NVARCHAR (2) NULL,
        [НомерГруппы] NVARCHAR (2) NULL,
        [КодПодр] NVARCHAR (7) NOT NULL,
        [Приказ] NVARCHAR (10) NULL,
        [ФИО_Руководителя] NVARCHAR (25) NULL,
        [Тел_Руководителя] NVARCHAR (10) NULL,
        [ФИО_Куратора] NVARCHAR (35) NULL,
        [DEL] NVARCHAR (1) NULL,
        CONSTRAINT [FK_Подразделения_ГруппыПодразделений] FOREIGN KEY ([Тип]) REFERENCES [dbo].[ТипыПодразделений] ([Тип]),
        CONSTRAINT [PK_Подразделения] PRIMARY KEY ([КодПодр] ASC)
    );
GO CREATE TABLE [dbo].[СправочникДолжностей] (
        [КодДолжности] NVARCHAR (10) NOT NULL,
        [НАЗВАНИЕ] NVARCHAR (60) NULL,
        [ДиапазонРазрядов] NVARCHAR (4) NULL,
        [Постановление] NVARCHAR (50) NULL,
        [Группа] NCHAR (1) NULL,
        [Ранг] FLOAT (53) NULL,
        CONSTRAINT [FK_СправочникДолжностей_ГруппыДолжностей] FOREIGN KEY ([Группа]) REFERENCES [dbo].[ГруппыДолжностей] ([Группа]),
        CONSTRAINT [PK_СправочникДолжностей] PRIMARY KEY ([КодДолжности] ASC)
    );
GO CREATE TABLE [dbo].[ФиоСотрудники] (
        [НомерКарточки] NVARCHAR (7) NOT NULL,
        [ФИО] NVARCHAR (40) NULL,
        [OTVSL] NVARCHAR (1) NULL,
        [PRND] NVARCHAR (1) NULL,
        CONSTRAINT [PK_ФиоСотрудники] PRIMARY KEY ([НомерКарточки] ASC)
    );
GO CREATE TABLE [dbo].[ФиоАдрес] (
        [Рег_Индекс] FLOAT (53) NULL,
        [Рег_НаселПункт] NVARCHAR (40) NULL,
        [Рег_Район] NVARCHAR (40) NULL,
        [Рег_Область] NVARCHAR (40) NULL,
        [Рег_Страна] NVARCHAR (40) NULL,
        [Рег_РайонГорода] NVARCHAR (25) NULL,
        [Рег_Улица] NVARCHAR (40) NULL,
        [Рег_Дом] NVARCHAR (8) NULL,
        [Рег_Корпус] FLOAT (53) NULL,
        [Рег_Квартира] FLOAT (53) NULL,
        [ФактИндекс] FLOAT (53) NULL,
        [ФактНаселПункт] NVARCHAR (40) NULL,
        [ФактРайон] NVARCHAR (40) NULL,
        [ФактОбласть] NVARCHAR (40) NULL,
        [ФактСтрана] NVARCHAR (40) NULL,
        [ФактРайонГорода] NVARCHAR (25) NULL,
        [ФактУлица] NVARCHAR (40) NULL,
        [ФактДом] NVARCHAR (8) NULL,
        [ФактКорпус] FLOAT (53) NULL,
        [ФактКвартира] FLOAT (53) NULL,
        [Телефон1] NVARCHAR (10) NULL,
        [Телефон2] NVARCHAR (10) NULL,
        [НомерКарточки] NVARCHAR (7) NOT NULL,
        CONSTRAINT [FK_ФиоАдрес_ФиоСотрудники] FOREIGN KEY ([НомерКарточки]) REFERENCES [dbo].[ФиоСотрудники] ([НомерКарточки]),
        CONSTRAINT [PK_ФиоАдрес] PRIMARY KEY ([НомерКарточки] ASC)
    );
GO CREATE TABLE [dbo].[ФиоВоенУчет] (
        [НомерКарточки] NVARCHAR (7) NOT NULL,
        [ГруппаУчета] NVARCHAR (5) NULL,
        [КатегорияУчета] NVARCHAR (2) NULL,
        [Состав] NVARCHAR (30) NULL,
        [Звание] NVARCHAR (20) NULL,
        [УчетнаяСпециальность] NVARCHAR (15) NULL,
        [Годность] NVARCHAR (10) NULL,
        [Военкомат] NVARCHAR (12) NULL,
        CONSTRAINT [FK_ФиоВоенУчет_ФиоСотрудники] FOREIGN KEY ([НомерКарточки]) REFERENCES [dbo].[ФиоСотрудники] ([НомерКарточки]),
        CONSTRAINT [PK_ФиоВоен] PRIMARY KEY ([НомерКарточки] ASC)
    );
GO CREATE TABLE [dbo].[ФиоДети] (
        [НомерКарточки] NVARCHAR (7) NULL,
        [ФИО] NVARCHAR (40) NULL,
        [ДатаРождения] DATETIME NULL,
        CONSTRAINT [FK_ФиоДети_ФиоСотрудники] FOREIGN KEY ([НомерКарточки]) REFERENCES [dbo].[ФиоСотрудники] ([НомерКарточки]),
    );
GO CREATE TABLE [dbo].[ФиоНауч] (
        [НомерКарточки] NVARCHAR (7) NOT NULL,
        [УченаяСтепень] NVARCHAR (20) NULL,
        [ДипломУчСтепени] NVARCHAR (20) NULL,
        [ДатаУчСтепени] DATETIME NULL,
        [УченоеЗвание] NVARCHAR (20) NULL,
        [ДипломУчЗвания] NVARCHAR (20) NULL,
        [ДатаУчЗвания] DATETIME NULL,
        CONSTRAINT [FK_ФиоНауч_ФиоСотрудники] FOREIGN KEY ([НомерКарточки]) REFERENCES [dbo].[ФиоСотрудники] ([НомерКарточки]),
        CONSTRAINT [PK_ФиоНауч] PRIMARY KEY ([НомерКарточки] ASC)
    );
GO CREATE TABLE [dbo].[ФиоПаспорт] (
        [НомерКарточки] NVARCHAR (7) NOT NULL,
        [ДатаРождения] DATETIME NULL,
        [Пенсионер] NVARCHAR (1) NULL,
        [МестоРождения] NVARCHAR (48) NULL,
        [Пол] NVARCHAR (1) NULL,
        [Национальность] NVARCHAR (10) NULL,
        [Профсоюз] NVARCHAR (1) NULL,
        [Образование] NVARCHAR (11) NULL,
        [УчебноеЗаведение] NVARCHAR (48) NULL,
        [Специальность] NVARCHAR (48) NULL,
        [СпециальностьОКСО] NVARCHAR (50) NULL,
        [Факультет] NVARCHAR (40) NULL,
        [ДипломНомер] NVARCHAR (14) NULL,
        [ДипломДата] DATETIME NULL,
        [СтажОбщий] DATETIME NULL,
        [СтажНепрерывный] DATETIME NULL,
        [СтажОрганизации] DATETIME NULL,
        [НомерСтрахСвидет] NVARCHAR (11) NULL,
        [НомерПаспорта] NVARCHAR (15) NULL,
        [КемВыдан] NVARCHAR (50) NULL,
        [ДатаВыдачи] DATETIME NULL,
        [DATAZAP] DATETIME NULL,
        [ДатаЗачисления] DATETIME NULL,
        CONSTRAINT [FK_ФиоПаспорт_ФиоСотрудники] FOREIGN KEY ([НомерКарточки]) REFERENCES [dbo].[ФиоСотрудники] ([НомерКарточки]),
        CONSTRAINT [PK_ФиоПаспорт] PRIMARY KEY ([НомерКарточки] ASC)
    );
GO CREATE TABLE [dbo].[ШтатноеРасписание] (
        [UR] NVARCHAR (1) NULL,
        [КодПодразделения] NVARCHAR (7) NOT NULL,
        [КодДолжности] NVARCHAR (10) NOT NULL,
        [Разряд] NVARCHAR (2) NOT NULL,
        [Оклад] MONEY NULL,
        [КоличДолжностей] INT NULL,
        [Ранг] INT NULL,
        [ДатаОткрытияДолжности] DATETIME NULL,
        [КодГруппы] NCHAR (1) NULL,
        CONSTRAINT [FK_ШтатноеРасписание_Подразделения] FOREIGN KEY ([КодПодразделения]) REFERENCES [dbo].[Подразделения] ([КодПодр]),
        CONSTRAINT [FK_ШтатноеРасписание_СправочникДолжностей] FOREIGN KEY ([КодДолжности]) REFERENCES [dbo].[СправочникДолжностей] ([КодДолжности]),
        CONSTRAINT [PK_ШтатноеРасписание] PRIMARY KEY (
            [КодПодразделения] ASC,
            [КодДолжности] ASC,
            [Разряд] ASC
        )
    );
GO CREATE TABLE [dbo].[ФиоШтат] (
        [НомерКарточки] NVARCHAR (7) NOT NULL,
        [КодПОДРАЗДЕЛЕНИЯ] NVARCHAR (7) NULL,
        [КодДОЛЖНОСТИ] NVARCHAR (10) NULL,
        [РАЗРЯД] NVARCHAR (2) NULL,
        [ДатаДо] DATETIME NULL,
        [ЧасовВНеделю] FLOAT (53) NULL,
        [РабочаяНеделя] NVARCHAR (1) NULL,
        [ПриказНомер] NVARCHAR (3) NULL,
        [ПриказДата] DATETIME NULL,
        [ДатаС] DATETIME NULL,
        CONSTRAINT [FK_ФиоШтат_ФиоСотрудники] FOREIGN KEY ([НомерКарточки]) REFERENCES [dbo].[ФиоСотрудники] ([НомерКарточки]),
        CONSTRAINT [FK_ФиоШтат_ШтатноеРасписание] FOREIGN KEY ([КодПОДРАЗДЕЛЕНИЯ], [КодДОЛЖНОСТИ], [РАЗРЯД]) REFERENCES [dbo].[ШтатноеРасписание] ([КодПодразделения], [КодДолжности], [Разряд]),
        CONSTRAINT [PK_ФиоПодразделение] PRIMARY KEY ([НомерКарточки] ASC)
    );