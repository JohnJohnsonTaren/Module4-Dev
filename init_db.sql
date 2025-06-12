-- Завдання №1 - спроєктувати БД
-- 
-- Створи файл init_db.sql, у якому змоделюй структуру бази даних для компанії MegaSoft згідно брифінгу. Мають бути наступні таблиці:
-- 
-- worker - таблиця для працівників. У таблиці мають бути наступні поля:
--     ID - ідентифікатор працівника, ціле число, сурогатний первинний ключ.
--     NAME - ім'я працівника, рядок. Обмеження - не має бути NULL, довжина має бути від 2 до 1000 символів включно.
--     BIRTHDAY - дата народження. Рік у цій даті має бути більшим за 1900
--     LEVEL - рівень технічного розвитку працівника. Має бути обмеження - це поле не може бути NULL, значення поля може бути одним з -
--               Trainee, Junior, Middle, Senior
--     SALARY - заробітна плата працівника за 1 місяць. Обмеження - ціле число, не менше 100 і не більше 100 000

CREATE TABLE worker (
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(1000) NOT NULL CHECK (LENGTH(NAME) >= 2),
    BIRTHDAY DATE NOT NULL CHECK (BIRTHDAY > '1900-01-01'),
    LEVEL VARCHAR(10) NOT NULL CHECK (LEVEL IN ('Trainee', 'Junior', 'Middle', 'Senior')),
    SALARY INTEGER NOT NULL CHECK (SALARY >= 100 AND SALARY <= 100000)
);


-- client - таблиця для клієнтів. Мають бути наступні поля:
--     ID - ідентифікатор клієнта, ціле число, сурогатний первинний ключ.
--     NAME - ім'я працівника, рядок. Обмеження - не має бути NULL, довжина має бути від 2 до 1000 символів включно.

CREATE TABLE client (
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(1000) NOT NULL CHECK (LENGTH(NAME) >= 2)
);


-- project - таблиця для проєктів. Мають бути наступні поля:
--     ID - ідентифікатор проєкту, ціле число, сурогатний первинний ключ.
--     CLIENT_ID - ідентифікатор клієнта, що замовив цей проєкт
--     START_DATE - дата початку виконання проєкту
--     FINISH_DATE - дата кінця виконання проєкту

CREATE TABLE project (
    ID SERIAL PRIMARY KEY,
    CLIENT_ID INTEGER NOT NULL REFERENCES client(ID),
    START_DATE DATE NOT NULL,
    FINISH_DATE DATE NOT NULL
);


-- project_worker - таблиця, що показує, які працівники над якими проєктами працюють. Поля таблиці:
--     PROJECT_ID - ідентифікатор проєкту. Зовнішній ключ для таблиці project(id)
--     WORKER_ID - ідентифікатор клієнту. Зовнішній ключ для таблиці worker(id)
--     первинний ключ для цієї таблиці - складений, пара (PROJECT_ID, WORKER_ID)

CREATE TABLE project_worker (
    PROJECT_ID INTEGER NOT NULL REFERENCES project(ID),
    WORKER_ID INTEGER NOT NULL REFERENCES worker(ID),
    PRIMARY KEY (PROJECT_ID, WORKER_ID)
);


