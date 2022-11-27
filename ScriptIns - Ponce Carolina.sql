USE libreria_ponce;

INSERT INTO personas (id_persona, nombre, apellido, dni, email, fecha_nacimiento) VALUES
(NULL, 'Cleve', 'Jeratt', 36993108, 'cjeratt0@addthis.com', '1962-11-04'),
(NULL, 'Nels', 'Reddan', 33625613, 'nreddan1@mapy.cz', '2001-08-06'),
(NULL, 'Dale', 'Shanley', 44966670, 'dshanley2@youku.com', '2003-07-23'),
(NULL, 'Janaya', 'Cawthry', 29006567, 'jcawthry3@51.la', '1996-10-31'),
(NULL, 'Tallulah', 'Fairbairn', 38790592, 'tfairbairn4@eepurl.com', '2000-11-03'),
(NULL, 'Marianna', 'Gossington', 46533752, 'mgossington5@creativecommons.org', '2000-03-15'),
(NULL, 'Shaun', 'Haddick', 41257677, 'shaddick6@mapy.cz', '2002-09-18'),
(NULL, 'Dyann', 'Jarley', 24049484, 'djarley7@archive.org', '1999-07-19'),
(NULL, 'Roxine', 'Boullen', 21392444, 'rboullen8@google.com', '1993-07-10'),
(NULL, 'Feodora', 'Danilyak', 16279050, 'fdanilyak9@people.com.cn', '2002-10-18'),
(NULL, 'Corney', 'Barthelme', 49682301, 'cbarthelmea@google.com.au', '1974-03-29'),
(NULL, 'Amalie', 'Theunissen', 19063484, 'atheunissenb@loc.gov', '1985-04-02'),
(NULL, 'Ware', 'McCurlye', 48862173, 'wmccurlyec@mapquest.com', '2002-07-12'),
(NULL, 'Buckie', 'Argente', 41803186, 'bargented@twitter.com', '1989-07-30'),
(NULL, 'Alfy', 'Molden', 31433942, 'amoldene@yale.edu', '1984-07-01'),
(NULL, 'Derick', 'Presnail', 47670955, 'dpresnailf@bloomberg.com', '1960-06-20'),
(NULL, 'Oswald', 'Sommerling', 45477640, 'osommerlingg@omniture.com', '2000-05-03'),
(NULL, 'Deloris', 'Northover', 32328462, 'dnorthoverh@imdb.com', '1990-07-22'),
(NULL, 'Rosco', 'Woolmington', 41677072, 'rwoolmingtoni@omniture.com', '1986-08-31'),
(NULL, 'Rocky', 'Smee', 39029783, 'rsmeej@earthlink.net', '1989-12-25'),
(NULL, 'Shelby', 'Stredwick', 18332675, 'sstredwickk@nydailynews.com', '1973-06-20'),
(NULL, 'Fara', 'Fosh', 35835660, 'ffoshl@com.com', '1995-04-12'),
(NULL, 'Shawnee', 'Pagram', 18013921, 'spagramm@economist.com', '1992-08-24'),
(NULL, 'Nerty', 'Morot', 19308737, 'nmorotn@reference.com', '2008-09-07'),
(NULL, 'Garrik', 'Millichap', 24219841, 'gmillichapo@linkedin.com', '2010-04-27'),
(NULL, 'Stinky', 'Wilber', 47704018, 'swilberp@is.gd', '1989-10-13'),
(NULL, 'Linet', 'Marin', 36183195, 'lmarinq@irs.gov', '1973-08-18'),
(NULL, 'Bari', 'Caurah', 29282918, 'bcaurahr@toplist.cz', '1980-07-11'),
(NULL, 'Dulcie', 'Rubenchik', 25472679, 'drubenchiks@sciencedaily.com', '1984-10-18'),
(NULL, 'Noel', 'Wrathmall', 18843377, 'nwrathmallt@alexa.com', '1978-08-07');



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
(NULL, 16, DEFAULT),
(NULL, 17, FALSE),
(NULL, 18, FALSE),
(NULL, 19, TRUE),
(NULL, 20, FALSE),
(NULL, 21, TRUE),
(NULL, 22, FALSE),
(NULL, 23, DEFAULT),
(NULL, 24, TRUE),
(NULL, 25, FALSE),
(NULL, 26, DEFAULT),
(NULL, 27, TRUE),
(NULL, 28, FALSE),
(NULL, 29, FALSE),
(NULL, 30, DEFAULT);

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
(NULL, "El Principito", "Antoine De Saint-Exúpery", "9789876376471", "1943-04-06", 2, 1, 10585.37),
(NULL, "Hush Hush", "Becca Fitzpatrick", "9789877388459", "2009-10-13", 2, 1, 5399.00),
(NULL, "Crescendo", "Becca Fitzpatrick", "9789877388657", "2010-10-19", 2, 1, 5400.00),
(NULL, "Silence", "Becca Fitzpatrick", "9789877388794", "2011-10-04", 2, 1, 5450.00),
(NULL, "Finale", "Becca Fitzpatrick", "9789877388800", "2012-10-23", 2, 1, 5600.00),
(NULL,"El Príncipe y el Mendigo", "Mark Twain", "9788490744390", "1881-04-04", 2, 1,  4200.00);

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