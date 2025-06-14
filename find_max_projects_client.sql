-- Завдання №4 - знайти клієнта з найбільшою кількістю проєктів
--
-- Створи файл find_max_projects_client.sql. У ньому напиши SQL,
--          який виведе працівника з найбільшою кількістю клієнтів.
--          Якщо таких працівників декілька - потрібно вивести всіх.

-- AS - псевдонім для стовпця, який виводить назву клієнта 

SELECT
    c.NAME Client_Name,
    COUNT(p.ID) Project_Count
FROM Client c
JOIN Project p ON c.ID = p.CLIENT_ID
GROUP BY c.ID, c.NAME
HAVING COUNT(p.ID) = (
    SELECT MAX(Project_Counts.Count)
    FROM (
        SELECT COUNT(ID) Count 
        FROM Project 
        GROUP BY CLIENT_ID
        ) Project_Counts);