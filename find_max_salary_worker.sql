-- Завдання №3 - знайти працівника з найбільшою заробітною платою
-- 
-- Створи файл find_max_salary_worker.sql. У ньому напиши SQL, 
--      який виведе працівника з найбільшою заробітною платою. 
--      Якщо таких працівників декілька - потрібно вивести всіх.

SELECT NAME, SALARY
FROM WORKER
WHERE SALARY = (SELECT MAX(SALARY) FROM WORKER);
