CREATE DEFINER=`root`@`localhost` TRIGGER `libreria_ponce`.`tr_update_precio` AFTER UPDATE ON `productos` FOR EACH ROW
BEGIN
	DECLARE nomb_user VARCHAR(16);
    
    SET nomb_user = (SELECT USER());
    
	INSERT INTO `historico_precios` (id_historico_precio, id_producto, nombre_producto, autor_producto, precio_anterior, precio_nuevo, nombre_user, fecha, hora)
    VALUES (NULL, OLD.id_producto, OLD.nombre, OLD.autor, OLD.precio, NEW.precio, nomb_user, CURRENT_DATE(), CURRENT_TIME());
END