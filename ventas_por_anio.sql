-- Función que permite conocer cuantas ventas realizó por año cada vendedor. (El vendedor 15, tiene 2 ventas en el año 2021)
CREATE DEFINER=`root`@`localhost` FUNCTION `ventas_por_anio`(vendedor INT, anio INT) RETURNS varchar(128) CHARSET utf8mb4
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
END