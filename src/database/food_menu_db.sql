-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: food_menu_db
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_menu`
--

DROP TABLE IF EXISTS `tbl_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_menu` (
  `tbl_menu_id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`tbl_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_menu`
--

LOCK TABLES `tbl_menu` WRITE;
/*!40000 ALTER TABLE `tbl_menu` DISABLE KEYS */;
INSERT INTO `tbl_menu` VALUES (4,'./images/menudo.jpg','Menudo','A hearty tomato-based stew with pork, liver, potatoes, and carrots, often enjoyed during family gatherings and celebrations.',80),(5,'./images/dinuguan.jpg','Dinuguan','A rich, savory stew made from pork and pig\'s blood, seasoned with garlic, vinegar, and chili, offering a unique combination of tangy and spicy flavors.',75),(6,'./images/bicol.jpg','Bicol Express','A spicy stew from the Bicol region made with pork, shrimp paste, and coconut milk, infused with the heat of chili peppers.',85),(7,'./images/nilaga.jpg','Nilaga','A comforting soup featuring beef or pork boiled with vegetables like cabbage, potatoes, and corn, flavored with peppercorns and fish sauce.',120),(10,'./images/dumpling.jpg','Soup Dumpling','Steamed dumplings filled with savory meat and rich broth, bursting with warm, delicious flavor in every bite.',75),(11,'./images/bc3bdc77ec3929f07079006fe8e503b2.jpg','Caramel Machiato','dibuat oleh al khansa',100);
/*!40000 ALTER TABLE `tbl_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_order_items`
--

DROP TABLE IF EXISTS `tbl_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `item_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `tbl_order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tbl_orders` (`order_id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_order_items_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `tbl_menu` (`tbl_menu_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_order_items`
--

LOCK TABLES `tbl_order_items` WRITE;
/*!40000 ALTER TABLE `tbl_order_items` DISABLE KEYS */;
INSERT INTO `tbl_order_items` VALUES (1,1,4,1,80.00,80.00),(2,2,5,1,75.00,75.00),(3,3,4,1,80.00,80.00),(4,4,4,2,80.00,160.00),(5,5,4,1,80.00,80.00),(6,5,5,1,75.00,75.00),(7,6,4,1,80.00,80.00),(8,7,11,1,100.00,100.00);
/*!40000 ALTER TABLE `tbl_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_orders`
--

DROP TABLE IF EXISTS `tbl_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `customer_phone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `order_type` enum('dine_in','takeaway','delivery') COLLATE utf8mb4_general_ci NOT NULL,
  `table_number` int DEFAULT NULL,
  `delivery_address` text COLLATE utf8mb4_general_ci,
  `status` enum('pending','confirmed','preparing','ready','completed','cancelled') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending',
  `total_amount` decimal(10,2) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `special_instructions` text COLLATE utf8mb4_general_ci,
  `table_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_orders`
--

LOCK TABLES `tbl_orders` WRITE;
/*!40000 ALTER TABLE `tbl_orders` DISABLE KEYS */;
INSERT INTO `tbl_orders` VALUES (1,'Reynard Aydin','08111041407','aydin.workboard@gmail.com','dine_in',2,NULL,'cancelled',80.00,'2025-10-19 22:00:39','',NULL),(2,'Reynard Aydin','08111041407','aydin.workboard@gmail.com','dine_in',1,NULL,'pending',75.00,'2025-10-19 22:01:04','',NULL),(3,'Reynard Aydin','08111041407','aydin.workboard@gmail.com','dine_in',1,NULL,'preparing',80.00,'2025-10-19 22:07:42','',NULL),(4,'Reynard Aydin','08111041407','aydin.workboard@gmail.com','dine_in',1,NULL,'completed',160.00,'2025-10-19 22:09:14','',NULL),(5,'khansa','1231231','1231','dine_in',4,NULL,'completed',155.00,'2025-10-19 22:16:27','',NULL),(6,'jamal','as','as','dine_in',NULL,NULL,'confirmed',80.00,'2025-10-19 22:59:42','',0),(7,'Laura','08111041407','aydin.workboard@gmail.com','dine_in',NULL,NULL,'preparing',100.00,'2025-10-19 23:52:25','',2);
/*!40000 ALTER TABLE `tbl_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_payments`
--

DROP TABLE IF EXISTS `tbl_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `payment_method` enum('cash','card','online') COLLATE utf8mb4_general_ci NOT NULL,
  `payment_status` enum('pending','completed','failed','refunded') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending',
  `amount` decimal(10,2) NOT NULL,
  `payment_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `transaction_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `tbl_payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tbl_orders` (`order_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_payments`
--

LOCK TABLES `tbl_payments` WRITE;
/*!40000 ALTER TABLE `tbl_payments` DISABLE KEYS */;
INSERT INTO `tbl_payments` VALUES (1,1,'cash','pending',80.00,'2025-10-19 22:00:39',NULL),(2,2,'cash','pending',75.00,'2025-10-19 22:01:04',NULL),(3,3,'cash','pending',80.00,'2025-10-19 22:07:42',NULL),(4,4,'cash','pending',160.00,'2025-10-19 22:09:14',NULL),(5,5,'cash','pending',155.00,'2025-10-19 22:16:27',NULL),(6,6,'cash','pending',80.00,'2025-10-19 22:59:42',NULL),(7,7,'cash','pending',100.00,'2025-10-19 23:52:25',NULL);
/*!40000 ALTER TABLE `tbl_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tables`
--

DROP TABLE IF EXISTS `tbl_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tables` (
  `table_id` int NOT NULL AUTO_INCREMENT,
  `table_number` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `capacity` int NOT NULL,
  `status` enum('available','occupied','reserved','cleaning') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'available',
  `location` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'Main Hall',
  `description` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`table_id`),
  UNIQUE KEY `table_number` (`table_number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tables`
--

LOCK TABLES `tbl_tables` WRITE;
/*!40000 ALTER TABLE `tbl_tables` DISABLE KEYS */;
INSERT INTO `tbl_tables` VALUES (1,'T1',4,'available','Main Hall','Window side table'),(2,'T2',2,'available','Main Hall','Cozy corner table'),(3,'T3',6,'available','Main Hall','Family table'),(4,'T4',4,'available','Garden','Outdoor seating'),(5,'T5',8,'available','Private Room','VIP table');
/*!40000 ALTER TABLE `tbl_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `role` enum('admin','cashier') NOT NULL DEFAULT 'cashier',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (1,'cashier1','password123','John Smith','cashier','2025-11-29 05:12:05'),(2,'cashier2','password123','Maria Garcia','cashier','2025-11-29 05:12:05'),(3,'cashier3','password123','David Johnson','cashier','2025-11-29 05:12:05');
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-29  5:47:10
