-- Trigger que valida que un nuevo vendedor sea mayor de edad, de lo contrario muestra un código de error y no lo inserta en la
-- tabla de vendedores.
CREATE DEFINER=`root`@`localhost` TRIGGER `libreria_ponce`.`tr_insert_vendedores` BEFORE INSERT ON `vendedores` FOR EACH ROW
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
    
END