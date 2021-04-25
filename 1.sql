/* 1. Ќаписать скрипт заполнени€ таблицы [CLIENTS_ADDFL_STRING] произвольными данными (можно
придумать или сгенерировать) по номерам паспорта и серии паспорта. */

USE [KCDB]
GO

DECLARE @clientID int = (SELECT MIN(ID_CLIENT)
FROM CLIENTS)

WHILE @clientID IS NOT NULL
BEGIN
	DECLARE @PASS_SER varchar(4),
			@PASS_NUM varchar(6);

	SET @PASS_SER = RIGHT(CHECKSUM(NEWID()), 4);
	SET @PASS_NUM = RIGHT(CHECKSUM(NEWID()), 6);

	PRINT @PASS_SER;
	PRINT @PASS_NUM;

	Insert into [dbo].[CLIENTS_ADDFL_STRING] ([ID_CLIENT], [ID_FIELD], FIELD) values (@clientID, 2, @PASS_SER);
	Insert into [dbo].[CLIENTS_ADDFL_STRING] ([ID_CLIENT], [ID_FIELD], FIELD) values (@clientID, 3, @PASS_NUM);

	SET @clientID = (SELECT MIN(ID_CLIENT)
	FROM CLIENTS
	WHERE ID_CLIENT > @clientID)
END