-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: pos_system
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `City` varchar(45) DEFAULT NULL,
  `Zip_code` varchar(45) DEFAULT NULL,
  `Street` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Prishtine','10000','Bedri Shala'),(2,'Prizren','10000','Rrustem Statovci'),(3,'Gjakove','10000','Ndue Perlleshi'),(4,'Peje','10000','Agim Ramadani'),(5,'Ferizaj','10000','Bajram Kelmendi'),(6,'Gjilan','10000','Skenderbeu'),(7,'Mitrovice','10000','Isa Kastrati');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Order_id` int NOT NULL,
  `Product_id` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_product_id_idx` (`Product_id`),
  KEY `fk_order_id_idx` (`Order_id`),
  CONSTRAINT `fk_order_id` FOREIGN KEY (`Order_id`) REFERENCES `orders` (`ID`),
  CONSTRAINT `fk_product_id` FOREIGN KEY (`Product_id`) REFERENCES `product` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
INSERT INTO `order_product` VALUES (1,10,3),(2,11,5),(3,12,2),(4,15,1),(5,10,5),(6,11,3),(7,12,3);
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_type`
--

DROP TABLE IF EXISTS `order_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_type`
--

LOCK TABLES `order_type` WRITE;
/*!40000 ALTER TABLE `order_type` DISABLE KEYS */;
INSERT INTO `order_type` VALUES (1,'sell'),(2,'buy');
/*!40000 ALTER TABLE `order_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Date` datetime NOT NULL,
  `user_id` int NOT NULL,
  `loc_id` int NOT NULL,
  `order_type_id` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_user_id_idx` (`user_id`),
  KEY `fk_location _idx` (`loc_id`),
  KEY `fk_order_type_idx` (`order_type_id`),
  CONSTRAINT `fk_location ` FOREIGN KEY (`loc_id`) REFERENCES `location` (`ID`),
  CONSTRAINT `fk_order_type` FOREIGN KEY (`order_type_id`) REFERENCES `order_type` (`ID`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (10,'2002-02-20 22:00:00',1,2,1),(11,'2006-05-20 22:00:00',1,5,1),(12,'2002-09-20 22:00:00',2,4,2),(13,'2007-04-20 22:00:00',3,6,2),(14,'2003-08-20 22:00:00',4,3,2),(15,'2002-02-20 22:00:00',1,1,1),(16,'2002-10-20 22:00:00',4,1,2),(17,'2020-12-20 22:00:00',3,2,1),(18,'2030-12-20 22:00:00',2,3,2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Price` float NOT NULL,
  `Product_type_id` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_product_type_id_idx` (`Product_type_id`),
  CONSTRAINT `fk_product_type_id` FOREIGN KEY (`Product_type_id`) REFERENCES `product_type` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Coca-cola 2L',1.2,1),(2,'Fanta 2L',1.1,1),(3,'Oil 1L',2.6,1),(4,'Nivea',3.6,2),(5,'Palmolive',3.85,2),(6,'Flour 1KG',0.95,1),(7,'Sugar 5KG',3.65,1),(8,'Meat 1KG',8.5,1),(9,'Chicken Meat 1KG ',3.95,1),(10,'Flower',2.3,3),(11,'Vase',1.25,3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_location`
--

DROP TABLE IF EXISTS `product_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_location` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `location_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_location_idx` (`location_id`),
  KEY `fk_product_idx` (`product_id`),
  CONSTRAINT `fk_location_prod` FOREIGN KEY (`location_id`) REFERENCES `location` (`ID`),
  CONSTRAINT `fk_product_loc` FOREIGN KEY (`product_id`) REFERENCES `product` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_location`
--

LOCK TABLES `product_location` WRITE;
/*!40000 ALTER TABLE `product_location` DISABLE KEYS */;
INSERT INTO `product_location` VALUES (1,1,5),(2,2,2),(3,6,10),(4,5,11),(5,7,5),(6,2,3),(7,1,7),(8,1,9);
/*!40000 ALTER TABLE `product_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Product_category` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
INSERT INTO `product_type` VALUES (1,'Food'),(2,'Hygiene'),(3,'Garden');
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salaries`
--

DROP TABLE IF EXISTS `salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salaries` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Value` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salaries`
--

LOCK TABLES `salaries` WRITE;
/*!40000 ALTER TABLE `salaries` DISABLE KEYS */;
INSERT INTO `salaries` VALUES (1,450),(2,500),(3,750);
/*!40000 ALTER TABLE `salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Emaill` varchar(60) NOT NULL,
  `Phone_nr` varchar(45) DEFAULT NULL,
  `Password_salt` varchar(80) DEFAULT NULL,
  `Password_hash` varchar(80) DEFAULT NULL,
  `Salary_id` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Emaill_UNIQUE` (`Emaill`),
  KEY `fk_salaryID_idx` (`Salary_id`),
  CONSTRAINT `fk_salaryID` FOREIGN KEY (`Salary_id`) REFERENCES `salaries` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ermal','ermal@gmail.com','044-552-663',NULL,NULL,1),(2,'Egzona','eg-zona@live.com','049-792-220',NULL,NULL,1),(3,'Alban ','albani.90@yahoo.com','049-221-321',NULL,NULL,2),(4,'Hana','hanaaa@hotmalil.com','045-226-998',NULL,NULL,3),(5,'Nili ','nili-pr@live.com','049-335-531',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-22 11:31:01
