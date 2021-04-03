CREATE DATABASE [KCDB]
GO

USE [KCDB]
GO

CREATE TABLE [dbo].[CLIENTS]
(
[ID_CLIENT] [int] IDENTITY(0,1) NOT NULL, /*����� �������*/
[FIRST_NAME] [varchar](20) NULL, /*��� �������*/
[MIDDLE_NAME] [varchar](160) NULL, /*�������� �������*/
[LAST_NAME] [varchar](160) NULL /*������� �������*/
PRIMARY KEY (ID_CLIENT)
)
CREATE TABLE [dbo].[CLIENTS_ADDFL_DIC]
(
[ID_FIELD] [smallint] IDENTITY(1,1) NOT NULL, /*����� ��������������� ���� ���������� � �������*/
[NAME_FIELD] [varchar](42) NOT NULL /*��� ��������������� ���� � �������*/
PRIMARY KEY (ID_FIELD)
)
CREATE TABLE [dbo].[CLIENTS_ADDFL_STRING]
(
[ID_CLIENT] [int] NOT NULL, /*����� �������*/
[ID_FIELD] [smallint] NOT NULL, /*����� ��������������� ���� ���������� � �������*/
[FIELD] [varchar](255) NOT NULL /*�������� ��������������� ���� ���������� � �������*/
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
Insert into [dbo].[CLIENTS] ([FIRST_NAME],[MIDDLE_NAME],[LAST_NAME]) values ('����','��������','������')
Insert into [dbo].[CLIENTS] ([FIRST_NAME],[MIDDLE_NAME],[LAST_NAME]) values ('�����','��������','�������')
Insert into [dbo].[CLIENTS] ([FIRST_NAME],[MIDDLE_NAME],[LAST_NAME]) values ('������','����������','��������')
Insert into [dbo].[CLIENTS] ([FIRST_NAME],[MIDDLE_NAME],[LAST_NAME]) values ('�������','����������','��������')
Insert into [dbo].[CLIENTS] ([FIRST_NAME],[MIDDLE_NAME],[LAST_NAME]) values ('������','���������','�������')
------------
Insert into [dbo].[CLIENTS_ADDFL_DIC] ([NAME_FIELD]) values ('��� �������')
Insert into [dbo].[CLIENTS_ADDFL_DIC] ([NAME_FIELD]) values ('����� ��������')
Insert into [dbo].[CLIENTS_ADDFL_DIC] ([NAME_FIELD]) values ('����� ��������')
Insert into [dbo].[CLIENTS_ADDFL_DIC] ([NAME_FIELD]) values ('���� ��������')