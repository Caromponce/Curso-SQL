-- Función que permite recibir por parámetro el id de una venta, suma el precio de cada producto que tiene esa venta 
-- y le proporciona un descuento si supera los $20000, los $10000 o el precio sigue siemdo el mismo.

CREATE DEFINER=`root`@`localhost` FUNCTION `bonificacion_por_compra`(venta INT) RETURNS decimal(7,2)
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
END