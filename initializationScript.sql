--check if the database exists
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'kcDB')
	BEGIN
		CREATE DATABASE [kcDB]
		USE [kcDB]
		CREATE TABLE [dbo].[CLIENTS](
			[ID_CLIENT] [int] IDENTITY(0,1) NOT NULL,		/* ����� ������� */
			[FIRST_NAME] [varchar](20) NULL,				/* ��� ������� */
			[MIDDLE_NAME] [varchar](160) NULL,				/* �������� ������� */
			[LAST_NAME] [varchar](160) NULL					/* ������� ������� */
		)
		CREATE TABLE [dbo].[CLIENTS_ADDFL_DIC](
			[ID_FIELD] [smallint] IDENTITY(1,1) NOT NULL,	/* ����� ��������������� ���� ���������� � ������� */
			[NAME_FIELD] [varchar](42) NOT NULL				/* ��� ��������������� ���� � ������� */
		)
		CREATE TABLE [dbo].[CLIENTS_ADDFL_STRING](
			[ID_CLIENT] [int] NOT NULL,						/* ����� ������� */
			[ID_FIELD] [smallint] NOT NULL,					/* ����� ��������������� ���� ���������� � ������� */
			[FIELD] [varchar](255) NOT NULL					/* �������� ��������������� ���� ���������� � ������� */
		)
		-----------------
		ALTER TABLE [dbo].[CLIENTS_ADDFL_STRING] WITH CHECK ADD CONSTRAINT [FK_CLIENTS_ADDFL_S__ID_OBJ] FOREIGN KEY([ID_OBJECT])
		REFERENCES [dbo].[CLIENTS] ([ID_CLIENT])
		-----------------
		ALTER TABLE [dbo].[CLIENTS_ADDFL_STRING] WITH CHECK ADD CONSTRAINT [FK_CLIENTS_ADDFL_S__ID_FL] FOREIGN KEY([ID_FIELD])
		REFERENCES [dbo].[CLIENTS_ADDFL_DIC] ([ID_FIELD])
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
	END

GO
    USE [kcDB]
	--check if [CLIENTS] table exists
	IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='CLIENTS' and xtype='U')
	BEGIN
		CREATE TABLE [dbo].[CLIENTS](
			[ID_CLIENT] [int] IDENTITY(0,1) NOT NULL,		/* ����� ������� */
			[FIRST_NAME] [varchar](20) NULL,				/* ��� ������� */
			[MIDDLE_NAME] [varchar](160) NULL,				/* �������� ������� */
			[LAST_NAME] [varchar](160) NULL					/* ������� ������� */
		)
		Insert into [dbo].[CLIENTS] ([FIRST_NAME],[MIDDLE_NAME],[LAST_NAME]) values ('����','��������','������')
		Insert into [dbo].[CLIENTS] ([FIRST_NAME],[MIDDLE_NAME],[LAST_NAME]) values ('�����','��������','�������')
		Insert into [dbo].[CLIENTS] ([FIRST_NAME],[MIDDLE_NAME],[LAST_NAME]) values ('������','����������','��������')
		Insert into [dbo].[CLIENTS] ([FIRST_NAME],[MIDDLE_NAME],[LAST_NAME]) values ('�������','����������','��������')
		Insert into [dbo].[CLIENTS] ([FIRST_NAME],[MIDDLE_NAME],[LAST_NAME]) values ('������','���������','�������')
	END
	--check if [CLIENTS_ADDFL_DIC] table exists
	IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='CLIENTS_ADDFL_DIC' and xtype='U')
	BEGIN
		CREATE TABLE [dbo].[CLIENTS_ADDFL_DIC](
			[ID_FIELD] [smallint] IDENTITY(1,1) NOT NULL,	/* ����� ��������������� ���� ���������� � ������� */
			[NAME_FIELD] [varchar](42) NOT NULL				/* ��� ��������������� ���� � ������� */
		)
		Insert into [dbo].[CLIENTS_ADDFL_DIC] ([NAME_FIELD]) values ('��� �������')
		Insert into [dbo].[CLIENTS_ADDFL_DIC] ([NAME_FIELD]) values ('����� ��������')
		Insert into [dbo].[CLIENTS_ADDFL_DIC] ([NAME_FIELD]) values ('����� ��������')
		Insert into [dbo].[CLIENTS_ADDFL_DIC] ([NAME_FIELD]) values ('���� ��������')
	END
	--check if [CLIENTS_ADDFL_STRING] table exists
	IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='CLIENTS_ADDFL_STRING' and xtype='U')
	BEGIN
		CREATE TABLE [dbo].[CLIENTS_ADDFL_STRING](
			[ID_CLIENT] [int] NOT NULL,						/* ����� ������� */
			[ID_FIELD] [smallint] NOT NULL,					/* ����� ��������������� ���� ���������� � ������� */
			[FIELD] [varchar](255) NOT NULL					/* �������� ��������������� ���� ���������� � ������� */
		)
		ALTER TABLE [dbo].[CLIENTS_ADDFL_STRING] WITH CHECK ADD CONSTRAINT [FK_CLIENTS_ADDFL_S__ID_OBJ] FOREIGN KEY([ID_OBJECT])
		REFERENCES [dbo].[CLIENTS] ([ID_CLIENT])
		------------------------
		ALTER TABLE [dbo].[CLIENTS_ADDFL_STRING] WITH CHECK ADD CONSTRAINT [FK_CLIENTS_ADDFL_S__ID_FL] FOREIGN KEY([ID_FIELD])
		REFERENCES [dbo].[CLIENTS_ADDFL_DIC] ([ID_FIELD])
	END
GO









