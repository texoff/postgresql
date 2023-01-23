1. Добавьте в определение таблицы aircrafts_log значение по умолчанию current_timestamp и соответствующим образом измените команды INSERT, приведенные в тексте главы.

2. В предложении RETURNING можно указывать не только символ «∗», означающий выбор всех столбцов таблицы, но и более сложные выражения, сформированные на основе этих столбцов. В тексте главы мы копировали содержимое таблицы «Самолеты» в таблицу aircrafts_tmp, используя в предложении RETURNING именно «∗». Однако возможен и другой вариант запроса:
```sql
    WITH add_row AS
      ( INSERT INTO aircrafts_tmp
        SELECT * FROM aircrafts
        RETURNING aircraft_code, model, range,current_timestamp, 'INSERT'
      )
    INSERT INTO aircrafts_log
    SELECT ? FROM add_row;
```
Что нужно написать в этом запросе вместо вопросительного знака?
3. 
4. 