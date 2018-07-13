-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: webshop
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (1,'Vasingtonska 2','052/845-456'),(2,'Pljevaljska 23','068/742-654'),(3,'Njegoseva 34','063/985-9632'),(4,'Mitra Mirica w','052/874-963'),(5,'Vucele Vučelića','020/512-963'),(6,'Savnicka','+382/8556-888'),(7,'Kralja Nikole','069893098'),(8,'Baja Pivljanina 34','123/123-456'),(9,'Mamurni ljudi 2','3052/584789'),(10,'Filipa Viš¡njića 22','068/333-222'),(11,'Miloseva','068/512-974'),(12,'Vardarska 12','069/875-654'),(13,'Kralja Dragutina 10','069/888-998'),(14,'Kralja Petra 16','069893-038'),(15,'Save Kovačevića 16','066/893-038'),(16,'Katićeva bb','065/445-465'),(17,'Dragana Draganovića 16','038/789-654'),(18,'Janka Ristana 333','023/448-648'),(19,'Mitra Kleca','068/787-256'),(20,'Bulevar DÅ¾ordÅ¾a VaÅ¡ingtona','065/8741-987'),(21,'Beogradska bb','+382/745-632'),(22,'Beranska 43','020/9845-621');
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderlist`
--

DROP TABLE IF EXISTS `orderlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `orderdetails_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_thfoq32jvy44ci4fklqjo0r3w` (`orderdetails_id`),
  CONSTRAINT `FK_thfoq32jvy44ci4fklqjo0r3w` FOREIGN KEY (`orderdetails_id`) REFERENCES `orderdetails` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlist`
--

LOCK TABLES `orderlist` WRITE;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
INSERT INTO `orderlist` VALUES (1,'dell780',230,6),(2,'dell780',230,7),(3,'dell780',230,7),(4,'name',345,8),(5,'name',192,9),(6,'dell780',230,10),(7,'lenovo g35',345,11),(8,'name',345,12),(9,'name',345,13),(10,'name',345,14),(11,'name',345,16),(12,'name',800.34,17),(13,'lenovo g35',345,18),(14,'lenovo g35',345,19),(15,'dell780',230,20),(16,'Mac Air',800.34,22);
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `productType_id` int(11) DEFAULT NULL,
  `picturepath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tl2frskf9y9xrpfit4dg8sr0q` (`productType_id`),
  CONSTRAINT `FK_tl2frskf9y9xrpfit4dg8sr0q` FOREIGN KEY (`productType_id`) REFERENCES `producttype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'lenovo g35',345,21,2,'6062100_rd.jpg'),(2,'dell780',230,21,1,'dell123.jpg'),(3,'Razor',345,5,7,'razor123.jpg'),(4,'Mac Air',800.34,8,2,'macair123.jpg'),(5,'Asus',192,9,4,'asus123.jpg'),(6,'Nokia 3310',40,3,5,'nokia3310.jpg'),(7,'Samsung S9',320,5,5,'samsungs9.jpg'),(8,'iphone5s',370,6,5,'iphone5s.jpg'),(9,'Samsung S3',90,1,5,'samsungs3.jpg'),(10,'Samsung S6',200,1,5,'samsungs6.jpg'),(11,'LG G4',150,1,5,'lgg4.jpg'),(12,'LG G3',122,2,5,'lgg3.jpg'),(13,'Iphone 6s',340,5,5,'iphone6.jpg'),(14,'Samsung S7',122,4,5,'samsungs7.jpg'),(15,'Iphone6c',324,4,5,'3b709357-6b29-4907-a499-6f024f675528iphone6.jpg'),(16,'Samsung led thin',1046,2,4,'0e5fea1d-3d22-409b-9e9e-47f516ce0257rs-full-hd-k6372-ue55k6372suxxh-001-front-black.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producttype`
--

DROP TABLE IF EXISTS `producttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producttype`
--

LOCK TABLES `producttype` WRITE;
/*!40000 ALTER TABLE `producttype` DISABLE KEYS */;
INSERT INTO `producttype` VALUES (1,'Desktop'),(2,'Laptopovi'),(3,'Tableti'),(4,'Monitori'),(5,'Mobilni telefoni'),(6,'Misevi'),(7,'Tastature');
/*!40000 ALTER TABLE `producttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sign`
--

DROP TABLE IF EXISTS `sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sign`
--

LOCK TABLES `sign` WRITE;
/*!40000 ALTER TABLE `sign` DISABLE KEYS */;
INSERT INTO `sign` VALUES (1,'123',2,'Mladen'),(2,'admin',1,'admin'),(3,'ahmedovski',2,'Jasar');
/*!40000 ALTER TABLE `sign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'webshop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-13 10:53:23
