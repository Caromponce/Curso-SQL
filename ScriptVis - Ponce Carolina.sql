USE libreria;

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
    
