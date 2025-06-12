-- Завдання №5 - знайти проєкт з найбільшою тривалістю
-- Створи файл find_longest_project.sql. У ньому напиши SQL, 

-- який виведе проєкт з найбільшою тривалістю в місяцях. 
-- Якщо таких проєктів декілька - потрібно вивести всі ці проєкти.

SELECT DATEDIFF(
    MONTH, p.START_DATE, p.FINISH_DATE
    ) AS Project_Duration,
       -- p.ID AS Project_ID, -- коментуємо, якщо не потрібно виводити ID
       c.NAME AS Client_Name
FROM Project p
JOIN Client c ON p.CLIENT_ID = c.ID
ORDER BY Project_Duration DESC
LIMIT 3;
