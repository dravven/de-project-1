# Проект 1
1. Построение витрины для RFM-анализа: 1.1. Выяснение требований к целевой витрине: 

  1.Витрина должна располагаться в той же базе в схеме analysis.
  
  2.Витрина должна состоять из таких полей:
	user_id
	recency (число от 1 до 5)
	frequency (число от 1 до 5)
	monetary_value (число от 1 до 5)

  3.В витрине нужны данные с начала 2021 года.

  4.Назовите витрину dm_rfm_segments.

  5.Обновления не нужны.

  6.Успешно выполненный заказ это заказ со статусом Closed.


1.2. Изучение структуры данных:

  Витрина должна состоять из таких полей:
	user_id
	recency (число от 1 до 5)
	frequency (число от 1 до 5)
	monetary_value (число от 1 до 5)

  Нужны таблицы: orders, users. После обновления нужна еще таблица OrderStatusLog


1.3. Анализ качества данных: 

  production.OrderStatusLog(
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    order_id int NOT NULL REFERENCES production.Orders(order_id),
    status_id int NOT NULL REFERENCES production.OrderStatuses(id),
    dttm timestamp NOT NULL,
    UNIQUE(order_id, status_id)

  Orders(
    order_id int NOT NULL PRIMARY KEY,
    order_ts timestamp NOT NULL,
    user_id int NOT NULL,
    bonus_payment numeric(19, 5) NOT NULL DEFAULT 0,
    payment numeric(19, 5) NOT NULL DEFAULT 0 ,
    cost numeric(19, 5) NOT NULL DEFAULT 0 CHECK (cost = payment + bonus_payment),
    bonus_grant numeric(19, 5) NOT NULL DEFAULT 0,
    status int NOT NULL

  Users(
    id int NOT NULL PRIMARY KEY, 
    name varchar(2048) NULL,
    login varchar(2048) NOT NULL


1.4. Подготовка витрин данных: 1.4.1.

  Createview.sql - Сделайте представление для таблиц из базы production.

  datamart_ddl.sql - Напишите DDL-запрос для создания витрины.

  tmp_rfm_* - Напишите SQL-запрос для заполнения витрин, заведите таблицы под каждый показатель:

  datamart_query.sql - напишите в нём запрос, который на основе данных, подготовленных в таблицах analysis.tmp_rfm_recency, analysis.tmp_rfm_frequency и analysis.tmp_rfm_monetary_value, заполнит витрину analysis.dm_rfm_segments.


2 Доработка представлений: 

  order_view.sql - представление analysis.Orders: вернуть в него поле status.