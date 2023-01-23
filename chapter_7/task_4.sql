"Напишите команду INSERT для вставки новой строки в эту таблицу и преду-
смотрите возможный конфликт добавляемой строки со строкой, уже имеющей-
ся в таблице. Сделайте два варианта предложения ON CONFLICT: первый — с ис-
пользованием перечисления имен столбцов для проверки наличия дублирова-
ния, второй — с использованием предложения ON CONSTRAINT.
Для того чтобы не изменить содержимое таблицы «Места»"

-- Создаём копию таблицы "Места"
CREATE temp TABLE seats_tmp as
SELECT
  *
from
  seats;
--Добавляем ограничения
alter table
  pg_temp_3.seats_tmp
add
  PRIMARY KEY (aircraft_code, seat_no);


-- Добавляем данные
insert into
  seats_tmp(aircraft_code, seat_no, fare_conditions)
values
  ('319', '2A', 'Business') on CONFLICT do nothing returning *;
  
--С использванием ON CONSTRAINT
insert into
  seats_tmp(aircraft_code, seat_no, fare_conditions)
values
  ('319', '2A', 'Business') on CONFLICT ON CONSTRAINT seats_tmp_pkey do
update
set
  aircraft_code = excluded.aircraft_code,
  seat_no = excluded.seat_no returning *;