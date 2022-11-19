-- Trigger que registra aquellos vendedores que fueron eliminados y quedan almacenados en la tabla delete_vendedores.

CREATE DEFINER=`root`@`localhost` TRIGGER `libreria_ponce`.`tr_delete_vendedores` AFTER DELETE ON `vendedores` FOR EACH ROW
BEGIN
	DECLARE nomb_persona VARCHAR(32);
    DECLARE ape_persona VARCHAR(32);
    DECLARE nomb_user VARCHAR(16);
    
    SET nomb_persona = (SELECT nombre FROM personas as p WHERE OLD.id_persona = p.id_persona);
    SET ape_persona = (SELECT apellido FROM personas as p WHERE OLD.id_persona = p.id_persona);
    SET nomb_user = (SELECT USER()); 
    
	INSERT INTO `delete_vendedores` (id_persona, nombre_persona, apellido_persona, nombre_user, fecha, hora) 
    VALUES (OLD.id_persona, nomb_persona, ape_persona, nomb_user, CURRENT_DATE(), CURRENT_TIME());
END