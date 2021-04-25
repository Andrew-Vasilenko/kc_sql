/* 3. Написать скрипт заполнения таблицы [CLIENTS_ADDFL_STRING] данными по возрасту клиента
(произвольно). */

USE [KCDB]
GO

DECLARE @clientID int = (SELECT MIN(ID_CLIENT)
FROM CLIENTS)

WHILE @clientID IS NOT NULL
BEGIN
	DECLARE	@RANDOM_DAYS INT,
			@CLIENT_BIRTHDATE DATE,			
			@DATE_START DATE = '1871-01-01';

	-- максимальный возраст клиентов поставил 150 лет ровно
	-- минимальный возраст - 18 лет (2003 г.р.)
	-- 150 лет назад был 1871 год
	-- 2003 - 1871 == 132 года - допустимый диапазон рождения клиентов (в 2021 году им будет от 18 до 150 лет включительно)
	-- 48576 дней прошло с 01.01.1871 по 31.12.2003 (клиент мог родиться в любой из этих дней)
	SET @RANDOM_DAYS = 0 + ROUND(RAND() * (48576 + 1 - 0), 0);

	SET @CLIENT_BIRTHDATE = DateAdd(DD, @RANDOM_DAYS, @DATE_START)
	
	PRINT @RANDOM_DAYS;
	PRINT @CLIENT_BIRTHDATE;

	Insert into [dbo].[CLIENTS_ADDFL_STRING] ([ID_CLIENT], [ID_FIELD], FIELD) values (@clientID, 4, CONVERT(varchar, @CLIENT_BIRTHDATE));

	SET @clientID = (SELECT MIN(ID_CLIENT)
	FROM CLIENTS
	WHERE ID_CLIENT > @clientID)
END