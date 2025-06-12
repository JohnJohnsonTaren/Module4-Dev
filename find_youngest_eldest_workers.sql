-- Завдання №6 - знайти найстаршого та наймолодшого працівника
-- 
-- Напиши SQL, який вибере наймолодшого та найстаршого працівників, та виведе їх у форматі таблиці з наступними полями:
-- 
--     TYPE - тип (може бути YOUNGEST або OLDEST)
--     NAME - ім'я працівника
--     BIRTHDAY - дата народження працівника

SELECT
    'YOUNGEST' AS TYPE,
    NAME,
    BIRTHDAY
FROM Worker
WHERE BIRTHDAY = (
    SELECT MAX(BIRTHDAY) FROM Worker
    )
UNION ALL
SELECT
    'OLDEST' AS TYPE,
    NAME,
    BIRTHDAY
FROM Worker
WHERE BIRTHDAY = (
    SELECT MIN(BIRTHDAY) FROM Worker
    )
    LIMIT 3
    ORDER BY TYPE, BIRTHDAY;