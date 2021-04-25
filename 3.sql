/* 3. �������� ������ ���������� ������� [CLIENTS_ADDFL_STRING] ������� �� �������� �������
(�����������). */

USE [KCDB]
GO

DECLARE @clientID int = (SELECT MIN(ID_CLIENT)
FROM CLIENTS)

WHILE @clientID IS NOT NULL
BEGIN
	DECLARE	@RANDOM_DAYS INT,
			@CLIENT_BIRTHDATE DATE,			
			@DATE_START DATE = '1871-01-01';

	-- ������������ ������� �������� �������� 150 ��� �����
	-- ����������� ������� - 18 ��� (2003 �.�.)
	-- 150 ��� ����� ��� 1871 ���
	-- 2003 - 1871 == 132 ���� - ���������� �������� �������� �������� (� 2021 ���� �� ����� �� 18 �� 150 ��� ������������)
	-- 48576 ���� ������ � 01.01.1871 �� 31.12.2003 (������ ��� �������� � ����� �� ���� ����)
	SET @RANDOM_DAYS = 0 + ROUND(RAND() * (48576 + 1 - 0), 0);

	SET @CLIENT_BIRTHDATE = DateAdd(DD, @RANDOM_DAYS, @DATE_START)
	
	PRINT @RANDOM_DAYS;
	PRINT @CLIENT_BIRTHDATE;

	Insert into [dbo].[CLIENTS_ADDFL_STRING] ([ID_CLIENT], [ID_FIELD], FIELD) values (@clientID, 4, CONVERT(varchar, @CLIENT_BIRTHDATE));

	SET @clientID = (SELECT MIN(ID_CLIENT)
	FROM CLIENTS
	WHERE ID_CLIENT > @clientID)
END