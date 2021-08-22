-- using mysql  Ver 15.1 Distrib 10.3.31-MariaDB, for debian-linux-gnu (x86_64) using readline 5.2
-- also works on MariaDb on https://sqliteonline.com

CREATE DATABASE IF NOT EXISTS test;

USE test;

CREATE TABLE IF NOT EXISTS students(id BIGINT PRIMARY KEY, name VARCHAR(256), value INT);

CREATE TABLE IF NOT EXISTS notes(grade INT PRIMARY KEY, min_value INT, max_value int);

INSERT IGNORE INTO students(id, name, `value`) VALUES
(1, "Julia", 81),
(2, "Carol", 68),
(3, "Maria", 99),
(4, "Andreia", 78),
(5, "Jaqueline", 63),
(6, "Marcela", 88);

INSERT IGNORE INTO notes(grade, min_value, max_value) VALUES
(1,0,9),
(2,10,19),
(3,20,29),
(4,30,39),
(5,40,49),
(6,50,59),
(7,60,69),
(8,70,79),
(9,80,89),
(10,90,100);

SELECT IF(n.grade > 7, s.name, NULL) as name, n.grade, s.`value`
FROM students s JOIN notes n ON s.`value` BETWEEN n.min_value AND n.max_value  
ORDER BY 2 DESC;
