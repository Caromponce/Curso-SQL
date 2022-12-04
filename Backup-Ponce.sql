-- Los nombres de las tablas incluidas son: "personas", "vendedores", "clientes", "metodos_pago", "tipos", "generos",
-- "productos", "ventas", "producto_venta", "delete_vendedores" e "historico_precios".




-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: libreria_ponce
-- ------------------------------------------------------
-- Server version	10.4.18-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,16,0),(2,17,0),(3,18,0),(4,19,1),(5,20,0),(6,21,1),(7,22,0),(8,23,0),(9,24,1),(10,25,0),(11,26,0),(12,27,1),(13,28,0),(14,29,0),(15,30,0);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `delete_vendedores`
--

LOCK TABLES `delete_vendedores` WRITE;
/*!40000 ALTER TABLE `delete_vendedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `delete_vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `generos`
--

LOCK TABLES `generos` WRITE;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` VALUES (7,'comedia'),(2,'cuento'),(11,'diálogo'),(8,'drama'),(10,'epístola'),(9,'fábula'),(3,'leyenda'),(1,'novela'),(13,'oda'),(4,'poema'),(5,'romance'),(12,'sátira'),(6,'tragedia');
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `historico_precios`
--

LOCK TABLES `historico_precios` WRITE;
/*!40000 ALTER TABLE `historico_precios` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_precios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `metodos_pago`
--

LOCK TABLES `metodos_pago` WRITE;
/*!40000 ALTER TABLE `metodos_pago` DISABLE KEYS */;
INSERT INTO `metodos_pago` VALUES (1,'crédito'),(3,'débito'),(2,'efectivo');
/*!40000 ALTER TABLE `metodos_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'Cleve','Jeratt',36993108,'cjeratt0@addthis.com','1962-11-04'),(2,'Nels','Reddan',33625613,'nreddan1@mapy.cz','2001-08-06'),(3,'Dale','Shanley',44966670,'dshanley2@youku.com','2003-07-23'),(4,'Janaya','Cawthry',29006567,'jcawthry3@51.la','1996-10-31'),(5,'Tallulah','Fairbairn',38790592,'tfairbairn4@eepurl.com','2000-11-03'),(6,'Marianna','Gossington',46533752,'mgossington5@creativecommons.org','2000-03-15'),(7,'Shaun','Haddick',41257677,'shaddick6@mapy.cz','2002-09-18'),(8,'Dyann','Jarley',24049484,'djarley7@archive.org','1999-07-19'),(9,'Roxine','Boullen',21392444,'rboullen8@google.com','1993-07-10'),(10,'Feodora','Danilyak',16279050,'fdanilyak9@people.com.cn','2002-10-18'),(11,'Corney','Barthelme',49682301,'cbarthelmea@google.com.au','1974-03-29'),(12,'Amalie','Theunissen',19063484,'atheunissenb@loc.gov','1985-04-02'),(13,'Ware','McCurlye',48862173,'wmccurlyec@mapquest.com','2002-07-12'),(14,'Buckie','Argente',41803186,'bargented@twitter.com','1989-07-30'),(15,'Alfy','Molden',31433942,'amoldene@yale.edu','1984-07-01'),(16,'Derick','Presnail',47670955,'dpresnailf@bloomberg.com','1960-06-20'),(17,'Oswald','Sommerling',45477640,'osommerlingg@omniture.com','2000-05-03'),(18,'Deloris','Northover',32328462,'dnorthoverh@imdb.com','1990-07-22'),(19,'Rosco','Woolmington',41677072,'rwoolmingtoni@omniture.com','1986-08-31'),(20,'Rocky','Smee',39029783,'rsmeej@earthlink.net','1989-12-25'),(21,'Shelby','Stredwick',18332675,'sstredwickk@nydailynews.com','1973-06-20'),(22,'Fara','Fosh',35835660,'ffoshl@com.com','1995-04-12'),(23,'Shawnee','Pagram',18013921,'spagramm@economist.com','1992-08-24'),(24,'Nerty','Morot',19308737,'nmorotn@reference.com','2008-09-07'),(25,'Garrik','Millichap',24219841,'gmillichapo@linkedin.com','2010-04-27'),(26,'Stinky','Wilber',47704018,'swilberp@is.gd','1989-10-13'),(27,'Linet','Marin',36183195,'lmarinq@irs.gov','1973-08-18'),(28,'Bari','Caurah',29282918,'bcaurahr@toplist.cz','1980-07-11'),(29,'Dulcie','Rubenchik',25472679,'drubenchiks@sciencedaily.com','1984-10-18'),(30,'Noel','Wrathmall',18843377,'nwrathmallt@alexa.com','1978-08-07');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `producto_venta`
--

LOCK TABLES `producto_venta` WRITE;
/*!40000 ALTER TABLE `producto_venta` DISABLE KEYS */;
INSERT INTO `producto_venta` VALUES (1,5),(1,6),(2,12),(3,1),(3,14),(4,10),(4,1),(4,13),(5,2),(6,7),(7,10),(7,13),(8,8),(9,5),(9,6),(10,6),(11,10),(12,6),(13,4),(14,14),(15,1);
/*!40000 ALTER TABLE `producto_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Harry Potter y la Piedra Filosofal','J.K. Rowling','9789878000404','1997-06-26',2,1,15642.36),(2,'Harry Potter y la Cámara Secreta','J.K. Rowling','9789878000442','1998-07-02',2,1,23182.28),(3,'Harry Potter y el Prisionero de Azkaban','J.K. Rowling','9789878000176','1999-07-08',2,1,1005.77),(4,'Harry Potter y el Cáliz de Fuego','J.K. Rowling','9789878000213','2000-07-08',2,1,4870.63),(5,'Harry Potter y la Orden del Fénix','J.K. Rowling','9789878000459','2003-06-21',2,1,21466.77),(6,'Harry Potter y el Misterio del Príncipe','J.K. Rowling','9789878000411','2005-07-16',2,1,19688.36),(7,'Harry Potter y las Reliquias de la Muerte','J.K. Rowling','9789878000190','2007-07-21',2,1,18809.81),(8,'El Retrato de Dorian Gray','Oscar Wilde','9788492635184','1890-07-01',2,1,16627.24),(9,'Carrie','Stephen King','9789871138999','1974-04-05',2,1,17808.48),(10,'El Eternauta','German Hector Oesterheld','9789504975755','1993-02-18',3,8,2150.67),(11,'Dragon Ball Color: Saga Freezer','Akira Toriyama','9788419010889','2015-02-22',3,11,2887.09),(12,'La Cenicienta','Charles Perrault','9789505814909','1697-01-01',2,2,848.62),(13,'IT','Stephen King','9789877253191','1986-09-15',2,1,21531.98),(14,'Heredera de un Secreto','Elisa Roldán','9789504646686','1999-05-23',2,1,15914.74),(15,'El Principito','Antoine De Saint-Exúpery','9789876376471','1943-04-06',2,1,10585.37),(16,'Hush Hush','Becca Fitzpatrick','9789877388459','2009-10-13',2,1,5399.00),(17,'Crescendo','Becca Fitzpatrick','9789877388657','2010-10-19',2,1,5400.00),(18,'Silence','Becca Fitzpatrick','9789877388794','2011-10-04',2,1,5450.00),(19,'Finale','Becca Fitzpatrick','9789877388800','2012-10-23',2,1,5600.00),(20,'El Príncipe y el Mendigo','Mark Twain','9788490744390','1881-04-04',2,1,4200.00);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipos`
--

LOCK TABLES `tipos` WRITE;
/*!40000 ALTER TABLE `tipos` DISABLE KEYS */;
INSERT INTO `tipos` VALUES (3,'comic'),(2,'libro'),(1,'revista');
/*!40000 ALTER TABLE `tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,1,10000,'mañana'),(2,2,10001,'mañana'),(3,3,10002,'tarde'),(4,4,10003,'tarde'),(5,5,10004,'mañana'),(6,6,10005,'mañana'),(7,7,10006,'tarde'),(8,8,10007,'mañana'),(9,9,10008,'tarde'),(10,10,10009,'mañana'),(11,11,10010,'tarde'),(12,12,10011,'mañana'),(13,13,10012,'tarde'),(14,14,10013,'mañana'),(15,15,10014,'tarde');
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,11,6,1,'2019-03-03 05:23:56'),(2,6,10,2,'2016-09-15 09:05:25'),(3,6,15,3,'2021-11-03 06:59:53'),(4,11,1,1,'2016-03-14 02:53:09'),(5,14,7,1,'2021-01-22 14:38:59'),(6,5,11,2,'2021-08-19 05:31:50'),(7,4,15,2,'2021-04-12 22:20:51'),(8,15,10,3,'2022-06-27 23:58:19'),(9,2,13,1,'2016-03-24 13:02:58'),(10,3,11,1,'2019-12-15 16:32:56'),(11,3,5,1,'2018-07-10 09:36:35'),(12,10,11,3,'2022-06-02 17:33:15'),(13,13,14,1,'2018-10-28 12:00:23'),(14,2,9,3,'2019-03-06 14:58:54'),(15,8,14,1,'2021-11-16 02:53:21');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-03 22:58:21
