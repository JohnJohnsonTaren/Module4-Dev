-- Завдання №7 - вивести вартість кожного проєкту
-- 
-- Напиши SQL, який виведе список проєктів та вартість кожного проєкту.
-- 
-- Вартість проєкту - це сума заробітних плат працівників, що працюють над цим проєктом, помножених на тривалість у місяцях проєкту.
-- 
-- Наприклад, над проєктом Project A працюють працівники Max (заробітна плата 1000) та Joe (заробітна плата 1500). 

-- Проєкт триває 17 місяців. Тоді вартість проєкту Project A = 17 * (1000 + 1500) = 42500

-- Відсортуй проєкти по спаданню - спочатку виведи найдорожчі проєкти.

SELECT
    p.CLIENT_ID AS Project_Client,
    SUM(w.SALARY) * DATEDIFF(MONTH, p.START_DATE, p.FINISH_DATE) AS Project_Cost
FROM Project p
JOIN project_worker pw ON p.ID = pw.PROJECT_ID
JOIN Worker w ON pw.WORKER_ID = w.ID
GROUP BY p.ID, p.CLIENT_ID
ORDER BY Project_Cost DESC;
