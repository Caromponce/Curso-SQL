DROP SCHEMA IF EXISTS libreria_ponce;

CREATE DATABASE IF NOT EXISTS libreria_ponce;

USE libreria_ponce;

CREATE TABLE IF NOT EXISTS personas (
	id_persona INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(32) NOT NULL,
    apellido VARCHAR(32) NOT NULL,
    dni INT NOT NULL,
    email VARCHAR(32),
    fecha_nacimiento DATE
);
CREATE TABLE IF NOT EXISTS vendedores (
	id_vendedor INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_persona INT NOT NULL,
	legajo INT NOT NULL UNIQUE,
    horario VARCHAR(16) DEFAULT "tarde",
    FOREIGN KEY(id_persona) REFERENCES personas(id_persona)
);

CREATE TABLE IF NOT EXISTS clientes (
	id_cliente INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_persona INT NOT NULL,
    newsletter BOOLEAN NOT NULL DEFAULT 0,
    FOREIGN KEY(id_persona) REFERENCES personas(id_persona)
);

CREATE TABLE IF NOT EXISTS metodos_pago (
	id_pago INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    metodo_pago VARCHAR(32) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS tipos (
	id_tipo INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(32) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS generos (
	id_genero INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    genero VARCHAR(16) NOT NULL UNIQUE 
);

CREATE TABLE IF NOT EXISTS productos (
	id_producto INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(64) NOT NULL,
    autor VARCHAR(32) NOT NULL,
    isbn VARCHAR(32) NOT NULL UNIQUE,
    fecha_publicacion DATE NOT NULL,
    id_tipo INT NOT NULL,
    id_genero INT NOT NULL,
    precio DECIMAL (7, 2) NOT NULL,
    FOREIGN KEY(id_tipo) REFERENCES tipos(id_tipo),
    FOREIGN KEY(id_genero) REFERENCES generos(id_genero)
);

CREATE TABLE IF NOT EXISTS ventas (
	id_ventas INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    id_pago INT NOT NULL,
    fecha_venta DATETIME NOT NULL,
    FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY(id_vendedor) REFERENCES vendedores(id_vendedor),
    FOREIGN KEY(id_pago) REFERENCES metodos_pago(id_pago)
);

CREATE TABLE IF NOT EXISTS producto_venta (
	id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    FOREIGN KEY(id_venta) REFERENCES ventas(id_ventas),
    FOREIGN KEY(id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE IF NOT EXISTS delete_vendedores (
	id_delete_vendedor INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_persona INT NOT NULL,
    nombre_persona  VARCHAR(32) NOT NULL,
    apellido_persona  VARCHAR(32) NOT NULL,
	nombre_user VARCHAR(32) NOT NULL,
    fecha DATE,
    hora TIME,
    FOREIGN KEY(id_persona) REFERENCES personas(id_persona)
);

CREATE TABLE IF NOT EXISTS historico_precios (
	id_historico_precio INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    nombre_producto  VARCHAR(64) NOT NULL,
    autor_producto VARCHAR(32) NOT NULL,
    precio_anterior DECIMAL (7, 2) NOT NULL,
	precio_nuevo DECIMAL (7, 2) NOT NULL,
	nombre_user VARCHAR(32) NOT NULL,
    fecha DATE,
    hora TIME,
    FOREIGN KEY(id_producto) REFERENCES productos(id_producto)
);


-- FUNCIONES

DELIMITER $$
-- Función que permite recibir por parámetro el id de una venta, suma el precio de cada producto que tiene esa venta 
-- y le proporciona un descuento si supera los $20000, los $10000 o el precio sigue siemdo el mismo.
DROP FUNCTION IF EXISTS  `bonificacion_por_compra`$$
CREATE FUNCTION `bonificacion_por_compra`(venta INT)
RETURNS decimal(7,2)
READS SQL DATA
BEGIN
	DECLARE precio DECIMAL(7,2);
    DECLARE resultado  DECIMAL(7,2);
    SET precio = (SELECT SUM(ps.precio)
				FROM producto_venta pv JOIN productos ps ON (pv.id_producto = ps.id_producto)
				WHERE pv.id_venta = venta);
	IF precio >= 20000 THEN
		SET resultado = (precio -(precio * 0.2));
	ELSEIF precio >= 10000 THEN
		SET resultado = (precio -(precio * 0.1));
	ELSE
		SET resultado = precio;
	END IF;
RETURN resultado;
END$$


-- Función que permite conocer cuantas ventas realizó por año cada vendedor. (El vendedor 15, tiene 2 ventas en el año 2021)
DROP FUNCTION IF EXISTS  `ventas_por_anio`$$
CREATE FUNCTION `ventas_por_anio`(vendedor INT, anio INT)
RETURNS varchar(128) CHARSET utf8mb4
READS SQL DATA
BEGIN
	DECLARE cant_ventas INT;
    DECLARE resultado VARCHAR (128);
    SET cant_ventas = (SELECT COUNT(id_vendedor) FROM libreria.ventas WHERE id_vendedor = vendedor AND YEAR(fecha_venta) = anio); 
    IF cant_ventas >= 2 THEN
		SET resultado = "El vendedor recibirá una bonificación por tener mas de 2 ventas";
	ELSE 
		SET resultado = "LLamado de atención al vendedor";
	END IF;
RETURN resultado;
END$$


-- Stored Procedures

DELIMITER $$

DROP PROCEDURE IF EXISTS `ingresar_nuevo_vendedor`$$
CREATE PROCEDURE `ingresar_nuevo_vendedor`(
		IN nombre_param VARCHAR(32), 
        IN apellido_param VARCHAR(32), 
        IN dni_param INT, 
        IN email_param VARCHAR(32), 
        IN fecha_nacimiento_param DATE, 
        IN legajo_param INT, 
        IN horario_param VARCHAR(16)
)
BEGIN
	DECLARE id_ultima_persona INT;
    DECLARE email_new VARCHAR(32);
    DECLARE fecha_nacimiento_new DATE;
    DECLARE horario_new VARCHAR(16);
	
    IF(nombre_param <> '') AND (apellido_param <> '') THEN
		IF email_param = '' THEN
			SET email_new = NULL;
		ELSE
			SET email_new = email_param;
		END IF;
        IF fecha_nacimiento_param = '' THEN
			SET fecha_nacimiento_new = NULL;
		ELSE
			SET fecha_nacimiento_new = fecha_nacimiento_param;
		END IF;
        IF horario_param = '' OR horario_param <> 'mañana' THEN
			SET horario_new = 'tarde';
		ELSE
			SET horario_new = horario_param;
		END IF;

		INSERT INTO personas (id_persona, nombre, apellido, dni, email, fecha_nacimiento) VALUE
			(NULL, nombre_param, apellido_param, dni_param, email_new, fecha_nacimiento_new);
		SET id_ultima_persona = LAST_INSERT_ID();

		INSERT INTO vendedores (id_vendedor, id_persona, legajo, horario) VALUE
			(NULL, id_ultima_persona, legajo_param, horario_new);
	END IF;
END$$


DROP PROCEDURE IF EXISTS `ordenar_campo`$$
CREATE PROCEDURE `ordenar_campo`(IN campo varchar(32), IN orden VARCHAR(16))
BEGIN
	IF campo <> '' THEN
		SET @orden_campo = CONCAT('ORDER BY ', campo, ' ');
        IF orden = 'ASC' OR orden = 'DESC'  THEN
			SET @orden_campo =  CONCAT(@orden_campo, orden);
		END IF;
	ELSE 
		SET @orden_campo = '';
	END IF;
    SET @clausula = concat('SELECT * FROM personas ', @orden_campo);
	PREPARE runSQL FROM @clausula;
	EXECUTE runSQL;
	DEALLOCATE PREPARE runSQL;
END$$

DELIMITER ;
-- Vistas

-- Vista que muestra los nombres de los 5 productos más vendidos. 
CREATE OR REPLACE VIEW productos_mas_vendidos AS 
	(SELECT nombre, COUNT(nombre)
    FROM productos p JOIN producto_venta pv ON (p.id_producto = pv.id_producto)
    GROUP BY nombre ORDER BY COUNT(nombre) DESC
    LIMIT 5);

-- Vista que muestra de forma descendente los nombres y apellidos de los vendedores que vendieron algún producto y la cantidad de ventas que tuvo cada uno.    
CREATE OR REPLACE VIEW vendedores_mas_ventas AS
	(SELECT CONCAT(nombre," ", apellido) AS NombreYApellido, COUNT(v.id_vendedor) AS CantidadVendida
	FROM ventas v JOIN vendedores vd ON (v.id_vendedor = vd.id_vendedor) JOIN personas p ON (p.id_persona = vd.id_persona)
	GROUP BY v.id_vendedor ORDER BY COUNT(v.id_vendedor) DESC);

-- Vista que muestra el nombre, precio sin iva y precio con iva de cada producto.
CREATE OR REPLACE VIEW precios_con_iva AS
	(SELECT nombre, precio AS PrecioSinIVA, ((precio*0.21)+precio) AS PrecioConIVA
    FROM productos);

-- Vista que muestra nombre y apellido, e email de aquellos 5 clientes que compraron más productos.
CREATE OR REPLACE VIEW clientes_mas_compras AS
	(SELECT CONCAT(nombre," ", apellido) AS NombreYApellido, email, COUNT(c.id_cliente) AS ComprasRealizadas
	FROM ventas v JOIN clientes c ON (v.id_cliente = c.id_cliente) JOIN personas p ON (p.id_persona = c.id_cliente)
	GROUP BY c.id_cliente ORDER BY COUNT(c.id_cliente) DESC
    LIMIT 5);

-- Vista que muestra la cantidad que hay de vendedores en los distintos turnos.
CREATE OR REPLACE VIEW cantidad_por_turno AS
	(SELECT horario, COUNT(horario)
    FROM vendedores
    GROUP BY horario  ORDER BY COUNT(horario));
    
-- Triggers

DELIMITER $$
-- Trigger que registra aquellos vendedores que fueron eliminados y quedan almacenados en la tabla delete_vendedores.
DROP TRIGGER IF EXISTS `tr_delete_vendedores`$$
CREATE TRIGGER `tr_delete_vendedores` AFTER DELETE ON `vendedores` FOR EACH ROW
BEGIN
	DECLARE nomb_persona VARCHAR(32);
    DECLARE ape_persona VARCHAR(32);
    DECLARE nomb_user VARCHAR(16);
    
    SET nomb_persona = (SELECT nombre FROM personas as p WHERE OLD.id_persona = p.id_persona);
    SET ape_persona = (SELECT apellido FROM personas as p WHERE OLD.id_persona = p.id_persona);
    SET nomb_user = (SELECT USER()); 
    
	INSERT INTO `delete_vendedores` (id_persona, nombre_persona, apellido_persona, nombre_user, fecha, hora) 
    VALUES (OLD.id_persona, nomb_persona, ape_persona, nomb_user, CURRENT_DATE(), CURRENT_TIME());
END$$


-- Trigger que al insertar un nuevo producto, valida si el precio es mayor o igual a cero y que la fecha de publicación no sea
-- mayor a la de hoy, de lo contrario en ambas condiciones, mostrará un msj de error y no insertará los productos nuevos. 
DROP TRIGGER IF EXISTS `tr_insert_producto`$$
CREATE TRIGGER `tr_insert_producto` BEFORE INSERT ON `productos` FOR EACH ROW
BEGIN
	IF NEW.fecha_publicacion > CURRENT_DATE() THEN
		 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al insertar un producto porque la fecha de publicación no puede ser mayor a hoy.';
    END IF;
    IF NEW.precio < 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al insertar un producto porque el precio no puede ser menor a 0 pesos.';
    END IF;
END$$


-- Trigger que valida que un nuevo vendedor sea mayor de edad, de lo contrario muestra un código de error y no lo inserta en la
-- tabla de vendedores.
DROP TRIGGER IF EXISTS `tr_insert_vendedores`$$
CREATE TRIGGER `tr_insert_vendedores` BEFORE INSERT ON `vendedores` FOR EACH ROW
BEGIN
	DECLARE fecha_nac INT;
    DECLARE fecha_hoy DATE;    
    SET fecha_hoy = CURRENT_DATE();
    
    SELECT fecha_nacimiento
    INTO fecha_nac
    FROM personas
    WHERE NEW.id_persona = personas.id_persona; -- new.id_persona es de vendedor que se quiere agregar
    
    IF (YEAR(fecha_hoy) - YEAR(fecha_nac) <= 18) THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al insertar un vendedor porque la persona es menor de edad.';
    END IF;
    
END$$


DROP TRIGGER IF EXISTS `tr_update_precio`$$
CREATE TRIGGER `tr_update_precio` AFTER UPDATE ON `productos` FOR EACH ROW
BEGIN
	DECLARE nomb_user VARCHAR(16);
    
    SET nomb_user = (SELECT USER());
    
	INSERT INTO `historico_precios` (id_historico_precio, id_producto, nombre_producto, autor_producto, precio_anterior, precio_nuevo, nombre_user, fecha, hora)
    VALUES (NULL, OLD.id_producto, OLD.nombre, OLD.autor, OLD.precio, NEW.precio, nomb_user, CURRENT_DATE(), CURRENT_TIME());
END$$