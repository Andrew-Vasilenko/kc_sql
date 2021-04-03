CREATE DATABASE [KCDB]
GO

USE [KCDB]
GO

CREATE TABLE [dbo].[CLIENTS]
(
[ID_CLIENT] [int] IDENTITY(0,1) NOT NULL, /*Номер клиента*/
[FIRST_NAME] [varchar](20) NULL, /*Имя клиента*/
[MIDDLE_NAME] [varchar](160) NULL, /*Отчество клиента*/
[LAST_NAME] [varchar](160) NULL /*Фалимия клиента*/
PRIMARY KEY (ID_CLIENT)
)
CREATE TABLE [dbo].[CLIENTS_ADDFL_DIC]
(
[ID_FIELD] [smallint] IDENTITY(1,1) NOT NULL, /*Номер дополнительного поля инофрмации о клиенте*/
[NAME_FIELD] [varchar](42) NOT NULL /*Имя дополнительного поля о клиенте*/
PRIMARY KEY (ID_FIELD)
)
CREATE TABLE [dbo].[CLIENTS_ADDFL_STRING]
(
[ID_CLIENT] [int] NOT NULL, /*Номер клиента*/
[ID_FIELD] [smallint] NOT NULL, /*Номер дополнительного поля инофрмации о клиенте*/
[FIELD] [varchar](255) NOT NULL /*Значение дополнительного поля инофрмации о клиенте*/
)
-----------------
ALTER TABLE [dbo].[CLIENTS_ADDFL_STRING] WITH CHECK ADD CONSTRAINT [FK_CLIENTS_ADDFL_S__ID_CL] FOREIGN KEY([ID_CLIENT])
REFERENCES [dbo].[CLIENTS] ([ID_CLIENT])
GO
-----------------
ALTER TABLE [dbo].[CLIENTS_ADDFL_STRING] WITH CHECK ADD CONSTRAINT [FK_CLIENTS_ADDFL_S__ID_FL] FOREIGN KEY([ID_FIELD])
REFERENCES [dbo].[CLIENTS_ADDFL_DIC] ([ID_FIELD])
GO
------------
Insert into [dbo].[CLIENTS] ([FIRST_NAME],[MIDDLE_NAME],[LAST_NAME]) values ('Иван','Иванович','Иванов')
Insert into [dbo].[CLIENTS] ([FIRST_NAME],[MIDDLE_NAME],[LAST_NAME]) values ('Ольга','Олеговна','Олегова')
Insert into [dbo].[CLIENTS] ([FIRST_NAME],[MIDDLE_NAME],[LAST_NAME]) values ('Тамара','Николаевна','Петренко')
Insert into [dbo].[CLIENTS] ([FIRST_NAME],[MIDDLE_NAME],[LAST_NAME]) values ('Николай','Николаевич','Николаев')
Insert into [dbo].[CLIENTS] ([FIRST_NAME],[MIDDLE_NAME],[LAST_NAME]) values ('Сергей','Сергеевич','Сергеев')
------------
Insert into [dbo].[CLIENTS_ADDFL_DIC] ([NAME_FIELD]) values ('Пол клиента')
Insert into [dbo].[CLIENTS_ADDFL_DIC] ([NAME_FIELD]) values ('Серия паспорта')
Insert into [dbo].[CLIENTS_ADDFL_DIC] ([NAME_FIELD]) values ('Номер паспорта')
Insert into [dbo].[CLIENTS_ADDFL_DIC] ([NAME_FIELD]) values ('Дата рождения')