CREATE DEFINER=`root`@`localhost` PROCEDURE `ordenar_campo`(IN campo varchar(32), IN orden VARCHAR(16))
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
END