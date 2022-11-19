-- Trigger que al insertar un nuevo producto, valida si el precio es mayor o igual a cero y que la fecha de publicación no sea
-- mayor a la de hoy, de lo contrario en ambas condiciones, mostrará un msj de error y no insertará los productos nuevos. 

CREATE DEFINER=`root`@`localhost` TRIGGER `libreria_ponce`.`tr_insert_producto` BEFORE INSERT ON `productos` FOR EACH ROW
BEGIN
	IF NEW.fecha_publicacion > CURRENT_DATE() THEN
		 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al insertar un producto porque la fecha de publicación no puede ser mayor a hoy.';
    END IF;
    IF NEW.precio < 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al insertar un producto porque el precio no puede ser menor a 0 pesos.';
    END IF;
END