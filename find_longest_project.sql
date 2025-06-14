-- Завдання №5 - знайти проєкт з найбільшою тривалістю
-- Створи файл find_longest_project.sql. У ньому напиши SQL, 

-- який виведе проєкт з найбільшою тривалістю в місяцях. 
-- Якщо таких проєктів декілька - потрібно вивести всі ці проєкти.

SELECT DATEDIFF(
    MONTH, p.START_DATE, p.FINISH_DATE
    ) Project_Duration, c.NAME Client_Name
FROM Project p
JOIN Client c ON p.CLIENT_ID = c.ID
WHERE DATEDIFF(MONTH, p.START_DATE, p.FINISH_DATE) = (
    SELECT MAX(
        DATEDIFF(MONTH, START_DATE, FINISH_DATE)
        ) 
        FROM Project);