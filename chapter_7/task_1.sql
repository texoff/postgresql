-- Добавьте в определение таблицы aircrafts_log значение по умолчанию
-- current_timestamp и соответствующим образом измените команды INSERT,
-- приведенные в тексте главы.
-- Создадин временные таблицы
CREATE TEMP TABLE aircrafts_tmp AS
SELECT
  *
FROM
  aircrafts WITH NO DATA;
CREATE TEMP TABLE aircrafts_log AS
SELECT
  *
FROM
  aircrafts WITH NO DATA;
-- Добавим столбцы
ALTER TABLE
  aircrafts_tmp
ADD
  PRIMARY KEY (aircraft_code);
ALTER TABLE
  aircrafts_tmp
ADD
  UNIQUE (model);
ALTER TABLE
  aircrafts_log
ADD
  COLUMN when_add timestamp DEFAULT current_timestamp;
ALTER TABLE
  aircrafts_log
ADD
  COLUMN operation text;
-- Добавляем данные
  WITH add_row AS (
    INSERT INTO
      aircrafts_tmp
    SELECT
      *
    FROM
      aircrafts RETURNING *
  )
INSERT INTO
  aircrafts_log
SELECT
  add_row.aircraft_code,
  add_row.model,
  add_row.range,
  current_timestamp,
  'INSERT'
FROM
  add_row;