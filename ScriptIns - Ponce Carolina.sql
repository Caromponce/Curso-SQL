USE libreria;

INSERT INTO personas (id_persona, nombre, apellido, dni, email, fecha_nacimiento) VALUES
(NULL, "Hubert", "Gubbins", 47393713, "hgubbins0@bravesites.com", "2001-09-30"),
(NULL, "Bpersonasabs", "Schapero", 48537601, "bschapero1@shutterfly.com", "2006-05-31"),
(NULL, "Gallagher", "Brasier", 39506702, "gbrasier2@samsung.com", "1988-01-19"),
(NULL, "Goober", "OShea", 27331808, "goshea3@newyorker.com", "1971-05-04"),
(NULL, "Karyn", "Sones", 24130649, "ksones4@hexun.com", "2014-03-09"),
(NULL, "Erminie", "Giovanazzi", 46099354, "egiovanazzi5@example.com", "1992-11-24"),
(NULL, "Pauli", "Standbrook", 41219114, "pstandbrook6@naver.com", "1977-09-17"),
(NULL, "Andriana", "Hackinge", 37797943, "ahackinge7@nhs.uk", "1980-07-05"),
(NULL, "Aigneis", "Kernocke", 16470072, "akernocke8@hc360.com", "1965-07-15"),
(NULL, "Dannie", "Linscott", 17486678, "dlinscott9@fema.gov", "2004-03-10"),
(NULL, "Dorisa", "Horche", 45454456, "dhorchea@4shared.com", "2007-09-05"),
(NULL, "Raphael", "Tosdevin", 30575623, "rtosdevinb@huffingtonpost.com", "2012-04-12"),
(NULL, "Lishe", "Cowl", 21671404, "lcowlc@merriam-webster.com", "2008-06-24"),
(NULL, "Sonnie", "Shilton", 19559913, "sshiltond@google.nl", "1972-12-16"),
(NULL, "Marji", "Semple", 28205696, "msemplee@who.int", "2016-07-13");

INSERT INTO vendedores (id_vendedor, id_persona, legajo, horario) VALUES
(NULL, 1, 10000,"mañana"),
(NULL, 2, 10001,"mañana"),
(NULL, 3, 10002,"tarde"),
(NULL, 4, 10003,DEFAULT),
(NULL, 5, 10004,"mañana"),
(NULL, 6, 10005,"mañana"),
(NULL, 7, 10006,"tarde"),
(NULL, 8, 10007,"mañana"),
(NULL, 9, 10008,DEFAULT),
(NULL, 10, 10009,"mañana"),
(NULL, 11, 10010,"tarde"),
(NULL, 12, 10011,"mañana"),
(NULL, 13, 10012,DEFAULT),
(NULL, 14, 10013,"mañana"),
(NULL, 15, 10014,"tarde");

INSERT INTO clientes (id_cliente, id_persona, newsletter) VALUES
(NULL, 1, DEFAULT),
(NULL, 2, FALSE),
(NULL, 3, FALSE),
(NULL, 4, TRUE),
(NULL, 5, FALSE),
(NULL, 6, TRUE),
(NULL, 7, FALSE),
(NULL, 8, DEFAULT),
(NULL, 9, TRUE),
(NULL, 10, FALSE),
(NULL, 11, DEFAULT),
(NULL, 12, TRUE),
(NULL, 13, FALSE),
(NULL, 14, FALSE),
(NULL, 15, DEFAULT);

INSERT INTO metodos_pago (id_pago, metodo_pago) VALUES
(NULL, "crédito"),
(NULL, "efectivo"),
(NULL, "débito");

INSERT INTO tipos (id_tipo, tipo) VALUES
(NULL, "revista"),
(NULL, "libro"),
(NULL, "comic");

INSERT INTO generos (id_genero, genero) VALUES
(NULL, "novela"),
(NULL, "cuento"),
(NULL, "leyenda"),
(NULL, "poema"),
(NULL, "romance"),
(NULL, "tragedia"),
(NULL, "comedia"),
(NULL, "drama"),
(NULL, "fábula"),
(NULL, "epístola"),
(NULL, "diálogo"),
(NULL, "sátira"),
(NULL, "oda");

INSERT INTO productos (id_producto, nombre, autor, isbn, fecha_publicacion, id_tipo, id_genero, precio) VALUES
(NULL, "Harry Potter y la Piedra Filosofal", "J.K. Rowling", "9789878000404", "1997-06-26", 2, 1, 15642.36),
(NULL, "Harry Potter y la Cámara Secreta", "J.K. Rowling", "9789878000442", "1998-07-02", 2, 1, 23182.28),
(NULL, "Harry Potter y el Prisionero de Azkaban", "J.K. Rowling", "9789878000176", "1999-07-08", 2, 1, 1005.77),
(NULL, "Harry Potter y el Cáliz de Fuego", "J.K. Rowling", "9789878000213", "2000-07-08", 2, 1, 4870.63),
(NULL, "Harry Potter y la Orden del Fénix", "J.K. Rowling", "9789878000459", "2003-06-21", 2, 1, 21466.77),
(NULL, "Harry Potter y el Misterio del Príncipe","J.K. Rowling", "9789878000411", "2005-07-16", 2, 1, 19688.36),
(NULL, "Harry Potter y las Reliquias de la Muerte", "J.K. Rowling", "9789878000190", "2007-07-21", 2, 1, 18809.81),
(NULL, "El Retrato de Dorian Gray", "Oscar Wilde", "9788492635184", "1890-07-01", 2, 1, 16627.24),
(NULL, "Carrie", "Stephen King", "9789871138999", "1974-04-05", 2, 1, 17808.48),
(NULL, "El Eternauta", "German Hector Oesterheld", "9789504975755", "1993-02-18", 3, 8, 2150.67),
(NULL, "Dragon Ball Color: Saga Freezer", "Akira Toriyama", "9788419010889", "2015-02-22", 3, 11, 2887.09),
(NULL, "La Cenicienta", "Charles Perrault", "9789505814909", "1697-01-01", 2, 2, 848.62),
(NULL, "IT", "Stephen King", "9789877253191", "1986-09-15", 2, 1, 21531.98),
(NULL, "Heredera de un Secreto", "Elisa Roldán", "9789504646686", "1999-05-23", 2, 1, 15914.74),
(NULL, "El Principito", "Antoine De Saint-Exúpery", "9789876376471", "1943-04-06", 2, 1, 10585.37);

INSERT INTO ventas (id_ventas, id_cliente, id_vendedor, id_pago, fecha_venta) VALUES
(NULL, 11, 6, 1, '2019-03-03 05:23:56'),
(NULL, 6, 10, 2, '2016-09-15 09:05:25'),
(NULL, 6, 15, 3, '2021-11-03 06:59:53'),
(NULL, 11, 1, 1, '2016-03-14 02:53:09'),
(NULL, 14, 7, 1, '2021-01-22 14:38:59'),
(NULL, 5, 11, 2, '2021-08-19 05:31:50'),
(NULL, 4, 15, 2, '2021-04-12 22:20:51'),
(NULL, 15, 10, 3, '2022-06-27 23:58:19'),
(NULL, 2, 13, 1, '2016-03-24 13:02:58'),
(NULL, 3, 11, 1, '2019-12-15 16:32:56'),
(NULL, 3, 5, 1, '2018-07-10 09:36:35'),
(NULL, 10, 11, 3, '2022-06-02 17:33:15'),
(NULL, 13, 14, 1, '2018-10-28 12:00:23'),
(NULL, 2, 9, 3, '2019-03-06 14:58:54'),
(NULL, 8, 14, 1, '2021-11-16 02:53:21');

INSERT INTO producto_venta (id_venta, id_producto) VALUE
(1,5),
(1,6),
(2,12),
(3,1),
(3,14),
(4,10),
(4,1),
(4,13),
(5,2),
(6,7),
(7,10),
(7,13),
(8,8),
(9,5),
(9,6),
(10,6),
(11,10),
(12,6),
(13,4),
(14,14),
(15,1);