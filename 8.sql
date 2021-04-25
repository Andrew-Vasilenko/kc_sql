/* �������� ������ ������ �������� � ���� ����� �������� ���������� � �03� */

USE KCDB

GO

/* ��� ���� �������� (���� ���� ��������)
SELECT ID_CLIENT
FROM CLIENTS_ADDFL_STRING
WHERE ID_FIELD = 2 AND FIELD LIKE '03%'
*/

-- � ������� ��������
DECLARE @myTableVariable TABLE (client_id INT NOT NULL, first_name varchar(255), middle_name varchar(255), last_name varchar(255))

DECLARE @CLIENT_ID int
SET @CLIENT_ID = (SELECT MIN(ID_CLIENT)
FROM CLIENTS_ADDFL_STRING
WHERE ID_FIELD = 2 AND FIELD LIKE '03%')

WHILE @CLIENT_ID IS NOT NULL
BEGIN
	DECLARE @CLIENT_FIRSTNAME varchar(255) = (SELECT FIRST_NAME
	FROM CLIENTS
	WHERE ID_CLIENT = @CLIENT_ID)
	DECLARE @CLIENT_MIDDLENAME varchar(255) = (SELECT MIDDLE_NAME
	FROM CLIENTS
	WHERE ID_CLIENT = @CLIENT_ID)
	DECLARE @CLIENT_LASTNAME varchar(255) = (SELECT LAST_NAME
	FROM CLIENTS
	WHERE ID_CLIENT = @CLIENT_ID)

	INSERT INTO @myTableVariable values(@CLIENT_ID, @CLIENT_FIRSTNAME, @CLIENT_MIDDLENAME, @CLIENT_LASTNAME)
	
	SET @CLIENT_ID = (SELECT MIN(ID_CLIENT)
	FROM CLIENTS_ADDFL_STRING
	WHERE (ID_FIELD = 2 AND FIELD LIKE '03%') AND (ID_CLIENT > @CLIENT_ID))
END

SELECT * FROM @myTableVariable