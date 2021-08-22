-- using mysql  Ver 15.1 Distrib 10.3.31-MariaDB, for debian-linux-gnu (x86_64) using readline 5.2
-- also works on MariaDb on https://sqliteonline.com

CREATE DATABASE IF NOT EXISTS test;

USE test;

CREATE TABLE IF NOT EXISTS dogs(id BIGINT PRIMARY KEY, name VARCHAR(50) NOT NULL);

CREATE TABLE IF NOT EXISTS cats(id BIGINT PRIMARY KEY, name VARCHAR(50) NOT NULL);


INSERT IGNORE INTO dogs(id, name) VALUES
(1, "Bohuslav"),
(2, "Olaf"),
(3, "Lalo"),
(4, "Rogério"),
(5, "Samira"),
(6, "Tzion"),
(7, "Perttu"),
(8, "Hecate"),
(9, "Efe"),
(10, "Sameer"),
(11, "Ranya"),
(12, "Mórríghan"),
(13, "Tymon"),
(14, "Marita"),
(15, "Salomo");


INSERT IGNORE INTO cats(id, name) VALUES
(1, "Joos"),
(2, "Fatsani"),
(3, "Mwangi"),
(4, "Vaike"),
(5, "Spyros"),
(6, "Bohuslav"),
(7, "Olaf"),
(8, "Lalo"),
(9, "Rogério"),
(10, "Samira"),
(11, "Tzion"),
(12, "Gunnar"),
(13, "Liisi"),
(14, "Gezabele"),
(15, "Radobod");


SELECT DISTINCT `name` FROM(
    SELECT DISTINCT `name` FROM dogs
    UNION ALL
    SELECT DISTINCT `name` FROM cats
) t
ORDER BY 1;
