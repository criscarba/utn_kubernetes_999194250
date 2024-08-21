CREATE DATABASE IF NOT EXISTS mysql_db_modulo4;

USE mysql_db_modulo4;

CREATE TABLE IF NOT EXISTS personas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    surname VARCHAR(50)
);

INSERT INTO personas (name, surname) VALUES ('Walter', 'Canetti');
INSERT INTO personas (name, surname) VALUES ('Cristian', 'Peralta');
INSERT INTO personas (name, surname) VALUES ('Cristian', 'Carballo');