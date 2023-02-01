create table test(
  column1 text not null,
  column2 text DEFAULT NULL,
  PRIMARY KEY (column1)
);
insert into
  test(column1, column2)
values
  ('ABC', NULL);


ОШИБКА:  повторяющееся значение ключа нарушает ограничение уникальности "test_pkey"
ПОДРОБНОСТИ:  Ключ "(column1)=(ABC)" уже существует.