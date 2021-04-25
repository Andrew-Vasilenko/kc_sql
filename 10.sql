/* 10. �������� ������ �������� ������� ������� ���� ��������� 
//������� ��� ������� ���
"������� ������ ������� ������� ��� ������� �� �������� ������, �������� ���:
��� � ������ ���� � �������� ������� ���� �� ������ � ����������� ���������;
��� ������ ������� �� ����� ���� ��������� (�.�. ��������� ������ ���, ��������, ��� ������� ��� ��� �����)
� ������ ������� � ���������� ���, � ������ ���� ������ � ������ ��� �������� (� ��������� ������ - �� �������)"*/

USE KCDB
GO

DECLARE @CLIENT_TO_DELETE varchar(255) = '������ ���� ��������'

DECLARE @TAB TABLE (val VARCHAR(255))

INSERT INTO @TAB
SELECT VALUE
FROM STRING_SPLIT(@CLIENT_TO_DELETE, ' ')


DECLARE @LAST_NAME varchar(255) = (SELECT top(1) val FROM @TAB)
DELETE TOP(1) FROM @TAB
DECLARE @FIRST_NAME varchar(255) = (SELECT top(1) val FROM @TAB)
DELETE TOP(1) FROM @TAB
DECLARE @MIDDLE_NAME varchar(255) = (SELECT top(1) val FROM @TAB)
DELETE TOP(1) FROM @TAB

DECLARE @COUNTCHECK INT = (select count(ID_CLIENT) from CLIENTS
where LAST_NAME = @LAST_NAME AND FIRST_NAME = @FIRST_NAME AND MIDDLE_NAME = @MIDDLE_NAME)

IF @COUNTCHECK > 1
	PRINT 'ERROR! CLIENT IS NOT UNIQUE (MULTIPLE CLIENTS WITH SUCH NAMES FOUND)! DELETION PROCESS ABORTED!'
ELSE IF @COUNTCHECK = 0
	PRINT 'ERROR! THERE ARE NO CLIENTS WITH SUCH NAMES! DELETION PROCESS ABORTED!'
ELSE IF @COUNTCHECK = 1
	BEGIN
		DECLARE @CLIENT_ID INT = (SELECT ID_CLIENT FROM CLIENTS WHERE LAST_NAME = @LAST_NAME AND FIRST_NAME = @FIRST_NAME AND MIDDLE_NAME = @MIDDLE_NAME)

		DELETE FROM CLIENTS_ADDFL_STRING WHERE ID_CLIENT = @CLIENT_ID
		DELETE FROM CLIENTS WHERE LAST_NAME = @LAST_NAME AND FIRST_NAME = @FIRST_NAME AND MIDDLE_NAME = @MIDDLE_NAME
	END