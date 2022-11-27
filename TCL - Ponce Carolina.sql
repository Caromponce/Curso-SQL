-- Transacciones: primer tabla.
-- Inicialmente en la tabla "Productos" hay 20 registros, con esta transacción se eliminarán los
-- registros del 16 al 20.

SET @@AUTOCOMMIT = 0;

START TRANSACTION;
DELETE FROM productos WHERE id_producto BETWEEN 16 AND 20;

ROLLBACK;
-- COMMIT;

-- Transacciones: segunda tabla.
-- Se insertarán 8 registros en la tabla "Personas", un savepoint luego del registro número 4 y otro savepoint luego del registro número 8.
-- Luego se eliminará el primer savepoint.


-- START TRANSACTION;
-- INSERT INTO personas (id_persona, nombre, apellido, dni, email, fecha_nacimiento) VALUES (NULL, 'Linoel', 'Surpliss', 20419323, 'lsurpliss0@pcworld.com', '1966-09-26');
-- INSERT INTO personas (id_persona, nombre, apellido, dni, email, fecha_nacimiento) VALUES (NULL, 'Kirby', 'Baggiani', 12858091, 'kbaggiani1@yelp.com', '1988-11-09');
-- INSERT INTO personas (id_persona, nombre, apellido, dni, email, fecha_nacimiento) VALUES (NULL, 'Averell', 'Perello', 26453590, 'aperello2@umich.edu', '1961-10-20');
-- INSERT INTO personas (id_persona, nombre, apellido, dni, email, fecha_nacimiento) VALUES (NULL, 'Brena', 'Turrell', 35799544, 'bturrell3@list-manage.com', '1999-01-26');
-- SAVEPOINT lote_1;
-- INSERT INTO personas (id_persona, nombre, apellido, dni, email, fecha_nacimiento) VALUES (NULL, 'Massimiliano', 'Emblow', 18572979, 'memblow4@lulu.com', '1996-03-15');
-- INSERT INTO personas (id_persona, nombre, apellido, dni, email, fecha_nacimiento) VALUES (NULL, 'Olympia', 'McCrossan', 37785222, 'omccrossan5@ucla.edu', '2000-05-04');
-- INSERT INTO personas (id_persona, nombre, apellido, dni, email, fecha_nacimiento) VALUES (NULL, 'Gigi', 'Furtado', 11963570, 'gfurtado6@mac.com', '1963-10-14');
-- INSERT INTO personas (id_persona, nombre, apellido, dni, email, fecha_nacimiento) VALUES (NULL, 'Leslie', 'Charlon', 37476850, 'lcharlon7@google.com.hk', '1960-03-14');
-- SAVEPOINT lote_2;

-- RELEASE SAVEPOINT lote_1;
SET @@AUTOCOMMIT = 1;
