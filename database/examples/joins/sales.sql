create table teste (
    id serial primary key,
    numeros integer[]
);

insert into teste (numeros) values ('{1, 7, 9}'), ('{3, 8, 10, 10}'), ('{4}');





SELECT id, SUM(num) FROM teste, UNNEST(numeros) WITH ORDINALITY AS t(num, i) GROUP BY id;