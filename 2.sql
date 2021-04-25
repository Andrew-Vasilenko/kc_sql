/* 2. Написать скрипт заполнения таблицы [CLIENTS_ADDFL_STRING] данными по полу клиента
(любым способом). */

-- !!! это "толерантный" скрипт - генерит пол случайно.

USE [KCDB]
GO

DECLARE @clientID int = (SELECT MIN(ID_CLIENT)
FROM CLIENTS)

WHILE @clientID IS NOT NULL
BEGIN
	DECLARE @GENDER BIT,
			@GENDER_CHAR varchar(1);

	SET @GENDER = ROUND(RAND(), 0);

	IF (@GENDER = 1)
		SET @GENDER_CHAR = 'М';
	ELSE 
		SET @GENDER_CHAR = 'Ж';

	PRINT @GENDER_CHAR;

	Insert into [dbo].[CLIENTS_ADDFL_STRING] ([ID_CLIENT], [ID_FIELD], FIELD) values (@clientID, 1, @GENDER_CHAR);

	SET @clientID = (SELECT MIN(ID_CLIENT)
	FROM CLIENTS
	WHERE ID_CLIENT > @clientID)
END