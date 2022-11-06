CREATE DATABASE IF NOT EXISTS libreria;

USE libreria;

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

