CREATE DEFINER=`root`@`localhost` PROCEDURE `ingresar_nuevo_vendedor`(
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
END