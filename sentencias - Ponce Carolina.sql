-- Creación de un usuario que solo tiene permisos de lectura de datos.
DROP USER IF EXISTS 'user2'@'localhost';
CREATE USER 'user2'@'localhost' IDENTIFIED BY 'user123';
GRANT SELECT ON libreria_ponce. * TO 'user2'@'localhost';


-- Creación de un usuario que tiene permisos de lectura, inserción y modificación de datos.
DROP USER IF EXISTS 'user3'@'localhost';
CREATE USER 'user3'@'localhost' IDENTIFIED BY 'user456';
GRANT SELECT, INSERT, UPDATE ON libreria_ponce.* TO 'user3'@'localhost';