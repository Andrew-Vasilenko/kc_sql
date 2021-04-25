/* 6. Написать скрипт вывода клиентов женского пола старше 40 лет, но младше 55 лет. */

USE KCDB
GO

DECLARE @CURRENT_DATE DATE = GETDATE()
DECLARE @40YRS_BACK DATE = DateAdd(YY, -40, @CURRENT_DATE)
PRINT @40YRS_BACK
DECLARE @55YRS_BACK DATE = DateAdd(YY, -55, @CURRENT_DATE)
PRINT @55YRS_BACK

DECLARE @myTableVariable TABLE (client_id INT NOT NULL, first_name varchar(255), middle_name varchar(255), last_name varchar(255))

-- проверка возраста
DECLARE @CLIENT_ID int
SET @CLIENT_ID = (SELECT MIN(ID_CLIENT)
FROM CLIENTS_ADDFL_STRING
WHERE ID_FIELD = 4 AND (CONVERT(DATE, FIELD) < @40YRS_BACK AND CONVERT(DATE, FIELD) > @55YRS_BACK))

WHILE @CLIENT_ID IS NOT NULL
BEGIN
	insert into @myTableVariable values(@CLIENT_ID, '', '', '')
	SET @CLIENT_ID = (SELECT MIN(ID_CLIENT)
	FROM CLIENTS_ADDFL_STRING
	WHERE (ID_FIELD = 4 AND (CONVERT(DATE, FIELD) < @40YRS_BACK AND CONVERT(DATE, FIELD) > @55YRS_BACK)) AND (ID_CLIENT > @CLIENT_ID))
END

-- проверка половой принадлежности
DECLARE @clientID varchar = (SELECT MIN(client_id)
FROM @myTableVariable)

WHILE @clientID IS NOT NULL
BEGIN
	DECLARE @CLIENT_GENDER varchar = (SELECT FIELD
	FROM CLIENTS_ADDFL_STRING
	WHERE ID_CLIENT = @clientID AND ID_FIELD = 1)

	IF @CLIENT_GENDER = 'М'
	BEGIN
		DELETE FROM @myTableVariable WHERE client_id = @clientID
	END

	SET @clientID = (SELECT MIN(client_id)
	FROM @myTableVariable
	WHERE client_id > @clientID)
END

-- заполнение именами
SET @clientID = (SELECT MIN(client_id)
FROM @myTableVariable)

WHILE @clientID IS NOT NULL
BEGIN
	DECLARE @CLIENT_FIRSTNAME varchar(255) = (SELECT FIRST_NAME
	FROM CLIENTS
	WHERE ID_CLIENT = @clientID)
	DECLARE @CLIENT_MIDDLENAME varchar(255) = (SELECT MIDDLE_NAME
	FROM CLIENTS
	WHERE ID_CLIENT = @clientID)
	DECLARE @CLIENT_LASTNAME varchar(255) = (SELECT LAST_NAME
	FROM CLIENTS
	WHERE ID_CLIENT = @clientID)

	UPDATE @myTableVariable
	SET first_name = @CLIENT_FIRSTNAME,
	middle_name = @CLIENT_MIDDLENAME,
	last_name = @CLIENT_LASTNAME
	WHERE client_id = @clientID;

	SET @clientID = (SELECT MIN(client_id)
	FROM @myTableVariable
	WHERE client_id > @clientID)
END

select * from @myTableVariable