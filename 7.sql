/* 7. Написать скрипт вывода количества клиентов женского и количества клиентов
мужского пола отдельно. */

USE KCDB

GO

SELECT COUNT(FIELD)
FROM CLIENTS_ADDFL_STRING
WHERE FIELD = 'Ж'

SELECT COUNT(FIELD)
FROM CLIENTS_ADDFL_STRING
WHERE FIELD = 'М'