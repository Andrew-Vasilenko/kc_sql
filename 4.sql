/* 4. Написать скрипт вывода всех клиентов по возрасту в обратном порядке. */

USE [KCDB]
GO

SELECT ID_CLIENT
FROM CLIENTS_ADDFL_STRING
WHERE ID_FIELD = 4
ORDER BY FIELD;