-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: localbrandshop
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `price` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_size_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_product` (`user_id`,`product_id`),
  KEY `product_id` (`product_id`),
  KEY `product_size_id` (`product_size_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `cart_ibfk_3` FOREIGN KEY (`product_size_id`) REFERENCES `product_size` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Áo Thun','Áo thun chất liệu cotton, thoáng mát'),(2,'Áo Sơ Mi','Áo sơ mi phong cách công sở'),(3,'Áo Khoác','Áo khoác chống gió, chống nước'),(4,'Áo Vest','Áo vest lịch lãm, sang trọng'),(5,'Áo Len','Áo len ấm áp, thời trang'),(6,'Áo Hoodie','Áo hoodie trẻ trung, năng động'),(7,'Áo Polo','Áo polo thoải mái, dễ chịu'),(8,'Quần Jean','Quần jean bền đẹp, phong cách'),(9,'Quần Kaki','Quần kaki thoải mái, dễ chịu'),(10,'Quần Tây','Quần tây lịch lãm, sang trọng'),(11,'Quần Short','Quần short thoáng mát, năng động'),(12,'Quần Jogger','Quần jogger thể thao, thoải mái'),(13,'Quần Legging','Quần legging co giãn, thoải mái'),(14,'Quần Dài','Quần dài phong cách, thời trang'),(15,'Quần Lửng','Quần lửng thoáng mát, năng động'),(16,'Quần Váy','Quần váy duyên dáng, thanh lịch'),(17,'Áo Ba Lỗ','Áo ba lỗ thể thao, thoáng mát'),(18,'Áo Dài','Áo dài truyền thống, thanh lịch'),(19,'Áo Thể Thao','Áo thể thao thoáng mát, năng động'),(20,'Áo Khoác Dù','Áo khoác dù chống gió, chống nước');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourite_product`
--

DROP TABLE IF EXISTS `favourite_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourite_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_product` (`product_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `favourite_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `favourite_product_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourite_product`
--

LOCK TABLES `favourite_product` WRITE;
/*!40000 ALTER TABLE `favourite_product` DISABLE KEYS */;
INSERT INTO `favourite_product` VALUES (1,1,2),(7,2,4),(4,3,3),(10,4,5),(2,5,2),(13,6,6),(5,7,3),(8,8,4),(11,9,5),(3,10,2),(14,11,6),(6,12,3),(16,13,7),(19,14,8),(9,15,4),(22,16,9),(25,17,10),(17,18,7),(20,19,8),(12,20,5),(23,21,9),(26,22,10),(15,25,6),(27,28,10),(18,30,7),(21,35,8),(24,40,9);
/*!40000 ALTER TABLE `favourite_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `sale_order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_size_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_product` (`sale_order_id`,`product_id`),
  KEY `product_id` (`product_id`),
  KEY `product_size_id` (`product_size_id`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`sale_order_id`) REFERENCES `sale_order` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `order_detail_ibfk_3` FOREIGN KEY (`product_size_id`) REFERENCES `product_size` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,3,450000,101,6,2),(2,5,1000000,102,2,3),(3,2,600000,103,3,1),(4,4,1400000,104,4,4),(5,1,500000,105,5,2),(6,7,3150000,106,6,3),(7,6,12000000,107,7,1),(8,8,20000000,108,8,4),(9,9,3600000,109,9,2),(10,2,700000,110,10,3),(11,3,900000,111,11,1),(12,4,1280000,112,12,4),(13,5,1250000,113,13,2),(14,6,1620000,114,14,3),(15,7,2800000,115,15,1),(16,8,3600000,116,16,4),(17,9,3150000,117,17,2),(18,1,300000,118,18,3),(19,2,1000000,119,19,1),(20,3,1650000,120,20,4),(21,4,800000,121,21,2),(22,5,1100000,122,22,3),(23,6,1800000,123,23,1),(24,7,2240000,124,24,4),(25,8,2000000,125,25,2),(26,9,2430000,126,26,3),(27,1,400000,127,27,1),(28,2,900000,128,28,4),(29,3,600000,129,29,2),(30,4,880000,130,30,3),(31,5,1500000,131,31,1),(32,6,1920000,132,32,4),(33,7,1050000,133,33,2),(34,8,1360000,134,34,3),(35,9,18000000,135,35,1),(36,1,2500000,136,36,4),(37,2,600000,137,37,2),(38,3,960000,138,38,3),(39,4,2000000,139,39,1),(40,5,2750000,140,40,4),(41,3,450000,140,6,2),(42,5,1000000,141,2,3),(43,2,600000,142,3,1),(44,4,1400000,143,4,4),(45,1,500000,144,5,2),(46,7,3150000,145,6,3),(47,6,12000000,146,7,1),(48,8,20000000,147,8,4),(49,9,3600000,148,9,2),(50,2,700000,149,10,3),(51,3,900000,150,11,1),(52,4,1280000,151,12,4),(53,5,1250000,152,13,2),(54,6,1620000,153,14,3),(55,7,2800000,154,15,1),(56,8,3600000,155,16,4),(57,9,3150000,156,17,2),(58,1,300000,157,18,3),(59,2,1000000,158,19,1),(60,3,1650000,159,20,4),(61,4,800000,160,21,2),(62,5,1100000,161,22,3),(63,6,1800000,162,23,1),(64,7,2240000,163,24,4),(65,8,2000000,164,25,2),(66,9,2430000,165,26,3),(67,1,400000,166,27,1),(68,2,900000,167,28,4),(69,3,600000,168,29,2),(70,4,880000,169,30,3),(71,5,1500000,170,1,1),(72,6,1920000,171,2,4),(73,7,1050000,172,3,2),(74,8,1360000,173,4,3),(75,9,18000000,174,5,1),(76,1,2500000,175,6,4),(77,2,600000,176,7,2),(78,3,960000,177,8,3),(79,4,2000000,178,9,1),(80,5,2750000,179,10,4),(81,6,1350000,180,11,2),(82,7,1890000,181,12,3),(83,8,2000000,182,13,1),(84,9,2430000,183,14,4),(85,1,150000,184,15,2),(86,2,900000,185,16,3),(87,3,1050000,186,17,1),(88,4,1200000,187,18,4),(89,5,2500000,188,19,2),(90,6,1320000,189,20,3),(91,7,1400000,190,21,1),(92,8,1760000,191,22,4),(93,9,2700000,192,23,2),(94,1,250000,193,24,3),(95,2,540000,194,25,1),(96,3,810000,195,26,4),(97,4,1600000,196,27,2);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `price` int NOT NULL,
  `rating` decimal(3,2) DEFAULT (0.00),
  `rating_count` int DEFAULT (0),
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Áo Thun Nike','Áo thun Nike chất liệu cotton, thoáng mát, phù hợp cho hoạt động thể thao','2024-09-30 07:33:21','2024-10-01 13:29:03',150000,4.30,3,1),(2,'Áo Thun Adidas','Áo thun Adidas với thiết kế trẻ trung, năng động, chất liệu thoáng mát','2024-09-30 07:33:21','2024-10-01 13:50:31',200000,3.43,3,1),(3,'Áo Sơ Mi Zara','Áo sơ mi Zara phong cách công sở, chất liệu mềm mại, dễ chịu','2024-09-30 07:33:21','2024-10-01 13:50:59',300000,4.97,3,2),(4,'Áo Sơ Mi H&M','Áo sơ mi H&M với thiết kế hiện đại, phù hợp cho môi trường văn phòng','2024-09-30 07:33:21','2024-10-01 13:51:25',350000,3.07,3,2),(5,'Áo Khoác Uniqlo','Áo khoác Uniqlo chống gió, chống nước, giữ ấm tốt','2024-09-30 07:33:21','2024-09-30 08:18:54',500000,4.65,2,3),(6,'Áo Khoác The North Face','Áo khoác The North Face bền bỉ, chống thấm nước, thích hợp cho leo núi','2024-09-30 07:33:21','2024-09-30 08:18:54',450000,3.85,2,3),(7,'Áo Vest Calvin Klein','Áo vest Calvin Klein lịch lãm, sang trọng, phù hợp cho các sự kiện quan trọng','2024-09-30 07:33:21','2024-09-30 08:18:54',2000000,4.60,2,4),(8,'Áo Vest Hugo Boss','Áo vest Hugo Boss với thiết kế tinh tế, chất liệu cao cấp','2024-09-30 07:33:21','2024-09-30 08:18:54',2500000,3.35,2,4),(9,'Áo Len Mango','Áo len Mango ấm áp, thời trang, phù hợp cho mùa đông','2024-09-30 07:33:21','2024-09-30 08:18:54',400000,5.00,2,5),(10,'Áo Len Gap','Áo len Gap với chất liệu mềm mại, giữ ấm tốt','2024-09-30 07:33:21','2024-09-30 08:18:54',350000,4.25,2,5),(11,'Áo Hoodie Champion','Áo hoodie Champion trẻ trung, năng động, phù hợp cho hoạt động ngoài trời','2024-09-30 07:33:21','2024-09-30 08:18:54',300000,4.50,1,6),(12,'Áo Hoodie Puma','Áo hoodie Puma với thiết kế hiện đại, chất liệu thoải mái','2024-09-30 07:33:21','2024-09-30 08:18:54',320000,4.00,1,6),(13,'Áo Polo Lacoste','Áo polo Lacoste thoải mái, dễ chịu, phù hợp cho mọi hoạt động','2024-09-30 07:33:21','2024-09-30 08:18:54',250000,5.00,1,7),(14,'Áo Polo Ralph Lauren','Áo polo Ralph Lauren với thiết kế sang trọng, chất liệu cao cấp','2024-09-30 07:33:21','2024-09-30 08:18:54',270000,2.50,1,7),(15,'Quần Jean Levi\'s','Quần jean Levi\'s bền đẹp, phong cách, phù hợp cho mọi hoạt động','2024-09-30 07:33:21','2024-09-30 08:18:54',400000,4.80,1,8),(16,'Quần Jean Wrangler','Quần jean Wrangler với thiết kế hiện đại, chất liệu bền bỉ','2024-09-30 07:33:21','2024-09-30 08:18:54',450000,4.20,1,8),(17,'Quần Kaki Dockers','Quần kaki Dockers thoải mái, dễ chịu, phù hợp cho môi trường công sở','2024-09-30 07:33:21','2024-09-30 08:18:54',350000,4.70,1,9),(18,'Quần Kaki Banana Republic','Quần kaki Banana Republic với chất liệu mềm mại, thiết kế hiện đại','2024-09-30 07:33:21','2024-09-30 08:18:54',300000,3.00,1,9),(19,'Quần Tây Brooks Brothers','Quần tây Brooks Brothers lịch lãm, sang trọng, phù hợp cho các sự kiện quan trọng','2024-09-30 07:33:21','2024-09-30 08:18:54',500000,5.00,1,10),(20,'Quần Tây J.Crew','Quần tây J.Crew với thiết kế tinh tế, chất liệu cao cấp','2024-09-30 07:33:21','2024-09-30 08:18:54',550000,3.50,1,10),(21,'Quần Short Old Navy','Quần short Old Navy thoáng mát, năng động, phù hợp cho mùa hè','2024-09-30 07:33:21','2024-09-30 08:18:54',200000,4.00,1,11),(22,'Quần Short Abercrombie & Fitch','Quần short Abercrombie & Fitch với thiết kế trẻ trung, chất liệu thoải mái','2024-09-30 07:33:21','2024-09-30 08:18:54',220000,5.00,1,11),(23,'Quần Jogger Under Armour','Quần jogger Under Armour thể thao, thoải mái, phù hợp cho tập luyện','2024-09-30 07:33:21','2024-09-30 08:18:54',300000,2.50,1,12),(24,'Quần Jogger Nike','Quần jogger Nike với thiết kế hiện đại, chất liệu co giãn tốt','2024-09-30 07:33:21','2024-09-30 08:18:54',320000,4.80,1,12),(25,'Quần Legging Lululemon','Quần legging Lululemon co giãn, thoải mái, phù hợp cho yoga','2024-09-30 07:33:21','2024-09-30 08:18:54',250000,4.20,1,13),(26,'Quần Legging Athleta','Quần legging Athleta với chất liệu mềm mại, thiết kế hiện đại','2024-09-30 07:33:21','2024-09-30 08:18:54',270000,4.70,1,13),(27,'Quần Dài Columbia','Quần dài Columbia phong cách, thời trang, phù hợp cho hoạt động ngoài trời','2024-09-30 07:33:21','2024-09-30 08:18:54',400000,3.00,1,14),(28,'Quần Dài Patagonia','Quần dài Patagonia với chất liệu bền bỉ, thiết kế hiện đại','2024-09-30 07:33:21','2024-09-30 08:18:54',450000,5.00,1,14),(29,'Quần Lửng REI','Quần lửng REI thoáng mát, năng động, phù hợp cho mùa hè','2024-09-30 07:33:21','2024-09-30 08:18:54',200000,3.50,1,15),(30,'Quần Lửng North Face','Quần lửng North Face với thiết kế trẻ trung, chất liệu thoải mái','2024-09-30 07:33:21','2024-09-30 07:33:21',220000,0.00,0,15),(31,'Quần Váy Free People','Quần váy Free People duyên dáng, thanh lịch, phù hợp cho các buổi dạo phố','2024-09-30 07:33:21','2024-09-30 07:33:21',300000,0.00,0,16),(32,'Quần Váy Anthropologie','Quần váy Anthropologie với thiết kế tinh tế, chất liệu cao cấp','2024-09-30 07:33:21','2024-09-30 07:33:21',320000,0.00,0,16),(33,'Áo Ba Lỗ Reebok','Áo ba lỗ Reebok thể thao, thoáng mát, phù hợp cho tập luyện','2024-09-30 07:33:21','2024-09-30 07:33:21',150000,0.00,0,17),(34,'Áo Ba Lỗ Adidas','Áo ba lỗ Adidas với thiết kế hiện đại, chất liệu co giãn tốt','2024-09-30 07:33:21','2024-09-30 07:33:21',170000,0.00,0,17),(35,'Áo Dài Áo Dài Ngọc Hân','Áo dài truyền thống, thanh lịch, phù hợp cho các dịp lễ hội','2024-09-30 07:33:21','2024-09-30 07:33:21',2000000,0.00,0,18),(36,'Áo Dài Áo Dài Minh Đức','Áo dài với thiết kế tinh tế, chất liệu cao cấp','2024-09-30 07:33:21','2024-09-30 07:33:21',2500000,0.00,0,18),(37,'Áo Thể Thao Decathlon','Áo thể thao Decathlon thoáng mát, năng động, phù hợp cho mọi hoạt động','2024-09-30 07:33:21','2024-09-30 07:33:21',300000,0.00,0,19),(38,'Áo Thể Thao Nike','Áo thể thao Nike với thiết kế hiện đại, chất liệu thoải mái','2024-09-30 07:33:21','2024-09-30 07:33:21',320000,0.00,0,19),(39,'Áo Khoác Dù Columbia','Áo khoác dù Columbia chống gió, chống nước, phù hợp cho hoạt động ngoài trời','2024-09-30 07:33:21','2024-09-30 07:33:21',500000,0.00,0,20),(40,'Áo Khoác Dù Patagonia','Áo khoác dù Patagonia với chất liệu bền bỉ, thiết kế hiện đại','2024-09-30 07:33:21','2024-09-30 07:33:21',550000,0.00,0,20);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (1,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',1),(2,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',2),(3,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',3),(4,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',4),(5,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',5),(6,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',6),(7,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',7),(8,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',8),(9,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',9),(10,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',10),(11,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',11),(12,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',12),(13,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',13),(14,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',14),(15,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',15),(16,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',16),(17,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',17),(18,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',18),(19,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',19),(20,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',20),(21,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',21),(22,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',22),(23,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',23),(24,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',24),(25,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',25),(26,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',26),(27,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',27),(28,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',28),(29,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',29),(30,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',30),(31,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',31),(32,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',32),(33,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',33),(34,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',34),(35,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',35),(36,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',36),(37,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',37),(38,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',38),(39,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',39),(40,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',40),(41,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',1),(42,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',1),(43,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',1),(44,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',2),(45,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',2),(46,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',2),(47,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',3),(48,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',3),(49,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',3),(50,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',4),(51,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',4),(52,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',4),(53,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',5),(54,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',5),(55,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',5),(56,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',6),(57,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',6),(58,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',6),(59,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',7),(60,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',7),(61,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',7),(62,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',8),(63,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',8),(64,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',8),(65,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',9),(66,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',9),(67,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',9),(68,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',10),(69,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',10),(70,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',10),(71,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',11),(72,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',11),(73,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',11),(74,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',12),(75,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',12),(76,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',12),(77,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',13),(78,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',13),(79,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',13),(80,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',14),(81,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',14),(82,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',14),(83,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',15),(84,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',15),(85,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',15),(86,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',16),(87,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',16),(88,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',16),(89,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',17),(90,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',17),(91,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',17),(92,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',18),(93,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',18),(94,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',18),(95,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790684/lictsb9geerciyqwjfuw.jpg',19),(96,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',19),(97,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',19),(98,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg',20),(99,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790630/mmw7nzocvxqnlfscvdjf.jpg',20),(100,'https://res.cloudinary.com/dxfewpnlk/image/upload/v1727790657/ziin4gldfugdncwtfwea.jpg',20);
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_quantity`
--

DROP TABLE IF EXISTS `product_quantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_quantity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL DEFAULT (0),
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `product_id` int NOT NULL,
  `size_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `size_id` (`size_id`),
  CONSTRAINT `product_quantity_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_quantity_ibfk_2` FOREIGN KEY (`size_id`) REFERENCES `product_size` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_quantity`
--

LOCK TABLES `product_quantity` WRITE;
/*!40000 ALTER TABLE `product_quantity` DISABLE KEYS */;
INSERT INTO `product_quantity` VALUES (1,10,'2024-09-30 07:47:21','2024-10-01 13:29:03',1,1),(2,15,'2024-09-30 07:47:21','2024-10-01 13:29:03',1,2),(3,20,'2024-09-30 07:47:21','2024-10-01 13:29:03',1,3),(4,6,'2024-09-30 07:47:21','2024-10-01 13:29:03',1,4),(5,12,'2024-09-30 07:47:21','2024-10-01 13:50:31',2,1),(6,18,'2024-09-30 07:47:21','2024-10-01 13:50:31',2,2),(7,14,'2024-09-30 07:47:21','2024-10-01 13:50:31',2,3),(8,8,'2024-09-30 07:47:21','2024-10-01 13:50:31',2,4),(9,16,'2024-09-30 07:47:21','2024-10-01 13:50:59',3,1),(10,9,'2024-09-30 07:47:21','2024-10-01 13:50:59',3,2),(11,11,'2024-09-30 07:47:21','2024-10-01 13:50:59',3,3),(12,7,'2024-09-30 07:47:21','2024-10-01 13:50:59',3,4),(13,13,'2024-09-30 07:47:21','2024-10-01 13:51:25',4,1),(14,19,'2024-09-30 07:47:21','2024-10-01 13:51:25',4,2),(15,10,'2024-09-30 07:47:21','2024-10-01 13:51:25',4,3),(16,6,'2024-09-30 07:47:21','2024-10-01 13:51:25',4,4),(17,17,'2024-09-30 07:47:21','2024-09-30 07:47:21',5,1),(18,8,'2024-09-30 07:47:21','2024-09-30 07:47:21',5,2),(19,12,'2024-09-30 07:47:21','2024-09-30 07:47:21',5,3),(20,14,'2024-09-30 07:47:21','2024-09-30 07:47:21',5,4),(21,9,'2024-09-30 07:47:21','2024-09-30 07:47:21',6,1),(22,15,'2024-09-30 07:47:21','2024-09-30 07:47:21',6,2),(23,11,'2024-09-30 07:47:21','2024-09-30 07:47:21',6,3),(24,7,'2024-09-30 07:47:21','2024-09-30 07:47:21',6,4),(25,13,'2024-09-30 07:47:21','2024-09-30 07:47:21',7,1),(26,18,'2024-09-30 07:47:21','2024-09-30 07:47:21',7,2),(27,10,'2024-09-30 07:47:21','2024-09-30 07:47:21',7,3),(28,6,'2024-09-30 07:47:21','2024-09-30 07:47:21',7,4),(29,16,'2024-09-30 07:47:21','2024-09-30 07:47:21',8,1),(30,9,'2024-09-30 07:47:21','2024-09-30 07:47:21',8,2),(31,12,'2024-09-30 07:47:21','2024-09-30 07:47:21',8,3),(32,14,'2024-09-30 07:47:21','2024-09-30 07:47:21',8,4),(33,11,'2024-09-30 07:47:21','2024-09-30 07:47:21',9,1),(34,17,'2024-09-30 07:47:21','2024-09-30 07:47:21',9,2),(35,8,'2024-09-30 07:47:21','2024-09-30 07:47:21',9,3),(36,7,'2024-09-30 07:47:21','2024-09-30 07:47:21',9,4),(37,13,'2024-09-30 07:47:21','2024-09-30 07:47:21',10,1),(38,19,'2024-09-30 07:47:21','2024-09-30 07:47:21',10,2),(39,10,'2024-09-30 07:47:21','2024-09-30 07:47:21',10,3),(40,6,'2024-09-30 07:47:21','2024-09-30 07:47:21',10,4),(41,6,'2024-09-30 07:47:21','2024-09-30 07:47:21',11,2),(42,7,'2024-09-30 07:47:21','2024-09-30 07:47:21',12,2),(43,8,'2024-09-30 07:47:21','2024-09-30 07:47:21',13,2),(44,9,'2024-09-30 07:47:21','2024-09-30 07:47:21',14,2),(45,10,'2024-09-30 07:47:21','2024-09-30 07:47:21',15,2),(46,5,'2024-09-30 07:47:21','2024-09-30 07:47:21',16,2),(47,4,'2024-09-30 07:47:21','2024-09-30 07:47:21',17,2),(48,3,'2024-09-30 07:47:21','2024-09-30 07:47:21',18,2),(49,2,'2024-09-30 07:47:21','2024-09-30 07:47:21',19,2),(50,6,'2024-09-30 07:47:21','2024-09-30 07:47:21',20,2),(51,7,'2024-09-30 07:47:21','2024-09-30 07:47:21',21,2),(52,8,'2024-09-30 07:47:21','2024-09-30 07:47:21',22,2),(53,9,'2024-09-30 07:47:21','2024-09-30 07:47:21',23,2),(54,10,'2024-09-30 07:47:21','2024-09-30 07:47:21',24,2),(55,5,'2024-09-30 07:47:21','2024-09-30 07:47:21',25,2),(56,4,'2024-09-30 07:47:21','2024-09-30 07:47:21',26,2),(57,3,'2024-09-30 07:47:21','2024-09-30 07:47:21',27,2),(58,2,'2024-09-30 07:47:21','2024-09-30 07:47:21',28,2),(59,6,'2024-09-30 07:47:21','2024-09-30 07:47:21',29,2),(60,7,'2024-09-30 07:47:21','2024-09-30 07:47:21',30,2),(61,8,'2024-09-30 07:47:21','2024-09-30 07:47:21',31,2),(62,9,'2024-09-30 07:47:21','2024-09-30 07:47:21',32,2),(63,10,'2024-09-30 07:47:21','2024-09-30 07:47:21',33,2),(64,5,'2024-09-30 07:47:21','2024-09-30 07:47:21',34,2),(65,4,'2024-09-30 07:47:21','2024-09-30 07:47:21',35,2),(66,3,'2024-09-30 07:47:21','2024-09-30 07:47:21',36,2),(67,2,'2024-09-30 07:47:21','2024-09-30 07:47:21',37,2),(68,6,'2024-09-30 07:47:21','2024-09-30 07:47:21',38,2),(69,7,'2024-09-30 07:47:21','2024-09-30 07:47:21',39,2),(70,8,'2024-09-30 07:47:21','2024-09-30 07:47:21',40,2);
/*!40000 ALTER TABLE `product_quantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_size`
--

DROP TABLE IF EXISTS `product_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `size` char(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `size` (`size`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_size`
--

LOCK TABLES `product_size` WRITE;
/*!40000 ALTER TABLE `product_size` DISABLE KEYS */;
INSERT INTO `product_size` VALUES (3,'L'),(2,'M'),(1,'S'),(4,'XL');
/*!40000 ALTER TABLE `product_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_unicode_520_ci,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rating` decimal(3,2) NOT NULL DEFAULT (0.00),
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,'Sản phẩm chất lượng tốt, rất hài lòng','2024-09-30 08:03:50','2024-09-30 08:03:50',4.50,1,2),(2,'Áo đẹp, chất liệu thoáng mát','2024-09-30 08:03:50','2024-09-30 08:03:50',4.00,2,2),(3,'Giá cả hợp lý, sẽ mua lại','2024-09-30 08:03:50','2024-09-30 08:03:50',5.00,3,2),(4,'Chất lượng không như mong đợi','2024-09-30 08:03:50','2024-09-30 08:03:50',2.50,4,3),(5,'Giao hàng nhanh, sản phẩm đẹp','2024-09-30 08:03:50','2024-09-30 08:03:50',4.80,5,3),(6,'Áo vừa vặn, chất liệu tốt','2024-09-30 08:03:50','2024-09-30 08:03:50',4.20,6,3),(7,'Sản phẩm tốt, giá cả phải chăng','2024-09-30 08:03:50','2024-09-30 08:03:50',4.70,7,4),(8,'Chất liệu không tốt lắm','2024-09-30 08:03:50','2024-09-30 08:03:50',3.00,8,4),(9,'Rất hài lòng với sản phẩm','2024-09-30 08:03:50','2024-09-30 08:03:50',5.00,9,4),(10,'Áo đẹp, nhưng giao hàng chậm','2024-09-30 08:03:50','2024-09-30 08:03:50',3.50,10,5),(11,'Chất lượng tốt, sẽ mua lại','2024-09-30 08:03:50','2024-09-30 08:03:50',4.50,11,5),(12,'Giá cả hợp lý, chất liệu tốt','2024-09-30 08:03:50','2024-09-30 08:03:50',4.00,12,5),(13,'Sản phẩm không như mong đợi','2024-09-30 08:03:50','2024-09-30 08:03:50',2.00,13,6),(14,'Giao hàng nhanh, chất lượng tốt','2024-09-30 08:03:50','2024-09-30 08:03:50',4.80,14,6),(15,'Áo vừa vặn, rất hài lòng','2024-09-30 08:03:50','2024-09-30 08:03:50',4.30,15,6),(16,'Sản phẩm tốt, giá cả hợp lý','2024-09-30 08:03:50','2024-09-30 08:03:50',4.60,16,7),(17,'Chất liệu không tốt lắm','2024-09-30 08:03:50','2024-09-30 08:03:50',3.20,17,7),(18,'Rất hài lòng với sản phẩm','2024-09-30 08:03:50','2024-09-30 08:03:50',5.00,18,7),(19,'Áo đẹp, nhưng giao hàng chậm','2024-09-30 08:03:50','2024-09-30 08:03:50',3.70,19,8),(20,'Chất lượng tốt, sẽ mua lại','2024-09-30 08:03:50','2024-09-30 08:03:50',4.40,20,8),(21,'Giá cả hợp lý, chất liệu tốt','2024-09-30 08:03:50','2024-09-30 08:03:50',4.10,1,9),(22,'Sản phẩm không như mong đợi','2024-09-30 08:03:50','2024-09-30 08:03:50',2.30,2,9),(23,'Giao hàng nhanh, chất lượng tốt','2024-09-30 08:03:50','2024-09-30 08:03:50',4.90,3,9),(24,'Áo vừa vặn, rất hài lòng','2024-09-30 08:03:50','2024-09-30 08:03:50',4.20,4,10),(25,'Sản phẩm tốt, giá cả hợp lý','2024-09-30 08:03:50','2024-09-30 08:03:50',4.50,5,10),(26,'Chất liệu không tốt lắm','2024-09-30 08:03:50','2024-09-30 08:03:50',3.10,6,10),(27,'Sản phẩm chất lượng tốt, rất hài lòng','2024-09-30 08:03:50','2024-09-30 08:03:50',4.50,7,2),(28,'Áo đẹp, chất liệu thoáng mát','2024-09-30 08:03:50','2024-09-30 08:03:50',4.00,8,2),(29,'Giá cả hợp lý, sẽ mua lại','2024-09-30 08:03:50','2024-09-30 08:03:50',5.00,9,3),(30,'Chất lượng không như mong đợi','2024-09-30 08:03:50','2024-09-30 08:03:50',2.50,10,3),(31,'Giao hàng nhanh, sản phẩm đẹp','2024-09-30 08:03:50','2024-09-30 08:03:50',4.80,11,4),(32,'Áo vừa vặn, chất liệu tốt','2024-09-30 08:03:50','2024-09-30 08:03:50',4.20,12,4),(33,'Sản phẩm tốt, giá cả phải chăng','2024-09-30 08:03:50','2024-09-30 08:03:50',4.70,13,5),(34,'Chất liệu không tốt lắm','2024-09-30 08:03:50','2024-09-30 08:03:50',3.00,14,5),(35,'Rất hài lòng với sản phẩm','2024-09-30 08:03:50','2024-09-30 08:03:50',5.00,15,6),(36,'Áo đẹp, nhưng giao hàng chậm','2024-09-30 08:03:50','2024-09-30 08:03:50',3.50,16,6),(37,'Chất lượng tốt, sẽ mua lại','2024-09-30 08:03:50','2024-09-30 08:03:50',4.50,17,7),(38,'Giá cả hợp lý, chất liệu tốt','2024-09-30 08:03:50','2024-09-30 08:03:50',4.00,18,7),(39,'Sản phẩm không như mong đợi','2024-09-30 08:03:50','2024-09-30 08:03:50',2.00,19,8),(40,'Giao hàng nhanh, chất lượng tốt','2024-09-30 08:03:50','2024-09-30 08:03:50',4.80,20,8),(41,'Áo vừa vặn, rất hài lòng','2024-09-30 08:03:50','2024-09-30 08:03:50',4.30,1,9),(42,'Sản phẩm tốt, giá cả hợp lý','2024-09-30 08:03:50','2024-09-30 08:03:50',4.60,2,9),(43,'Chất liệu không tốt lắm','2024-09-30 08:03:50','2024-09-30 08:03:50',3.20,3,10),(44,'Rất hài lòng với sản phẩm','2024-09-30 08:03:50','2024-09-30 08:03:50',5.00,4,10),(45,'Sản phẩm chất lượng tốt, rất hài lòng','2024-09-30 08:03:50','2024-09-30 08:03:50',4.50,20,11),(46,'Áo đẹp, chất liệu thoáng mát','2024-09-30 08:03:50','2024-09-30 08:03:50',4.00,21,12),(47,'Giá cả hợp lý, sẽ mua lại','2024-09-30 08:03:50','2024-09-30 08:03:50',5.00,22,13),(48,'Chất lượng không như mong đợi','2024-09-30 08:03:50','2024-09-30 08:03:50',2.50,23,14),(49,'Giao hàng nhanh, sản phẩm đẹp','2024-09-30 08:03:50','2024-09-30 08:03:50',4.80,24,15),(50,'Áo vừa vặn, chất liệu tốt','2024-09-30 08:03:50','2024-09-30 08:03:50',4.20,25,16),(51,'Sản phẩm tốt, giá cả phải chăng','2024-09-30 08:03:50','2024-09-30 08:03:50',4.70,26,17),(52,'Chất liệu không tốt lắm','2024-09-30 08:03:50','2024-09-30 08:03:50',3.00,27,18),(53,'Rất hài lòng với sản phẩm','2024-09-30 08:03:50','2024-09-30 08:03:50',5.00,28,19),(54,'Áo đẹp, nhưng giao hàng chậm','2024-09-30 08:03:50','2024-09-30 08:03:50',3.50,29,20);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_order`
--

DROP TABLE IF EXISTS `sale_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  `order_status_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_status_id` (`order_status_id`),
  CONSTRAINT `sale_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `sale_order_ibfk_2` FOREIGN KEY (`order_status_id`) REFERENCES `sale_order_status` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_order`
--

LOCK TABLES `sale_order` WRITE;
/*!40000 ALTER TABLE `sale_order` DISABLE KEYS */;
INSERT INTO `sale_order` VALUES (101,'123 Đường Lê Lợi, Quận 1, Thành phố Hồ Chí Minh','2016-01-01 07:19:10','2016-01-05 09:22:30',1,3),(102,'456 Đường Nguyễn Huệ, Quận 1, Thành phố Hồ Chí Minh','2017-02-15 02:45:20','2017-02-19 04:50:45',1,3),(103,'789 Đường Trần Hưng Đạo, Quận 5, Thành phố Hồ Chí Minh','2018-03-20 06:30:00','2018-03-24 08:35:10',1,3),(104,'101 Đường Lý Thường Kiệt, Quận 10, Thành phố Hồ Chí Minh','2019-04-25 01:10:05','2019-04-29 03:15:25',1,3),(105,'202 Đường Phạm Ngũ Lão, Quận 1, Thành phố Hồ Chí Minh','2020-05-30 10:25:40','2020-06-03 12:30:55',1,3),(106,'303 Đường Hai Bà Trưng, Quận 3, Thành phố Hồ Chí Minh','2016-06-05 05:00:00','2016-06-09 07:05:15',2,3),(107,'404 Đường Điện Biên Phủ, Quận Bình Thạnh, Thành phố Hồ Chí Minh','2017-07-10 03:15:30','2017-07-14 05:20:45',2,3),(108,'505 Đường Võ Văn Tần, Quận 3, Thành phố Hồ Chí Minh','2018-08-15 02:30:45','2018-08-19 04:35:55',2,3),(109,'606 Đường Nguyễn Thị Minh Khai, Quận 1, Thành phố Hồ Chí Minh','2019-09-20 07:45:50','2019-09-24 09:50:05',2,3),(110,'707 Đường Cách Mạng Tháng 8, Quận 10, Thành phố Hồ Chí Minh','2020-10-25 01:00:00','2020-10-29 03:05:10',2,3),(111,'808 Đường Nguyễn Văn Cừ, Quận 5, Thành phố Hồ Chí Minh','2016-11-30 04:15:20','2016-12-04 06:20:35',3,3),(112,'909 Đường Lê Văn Sỹ, Quận 3, Thành phố Hồ Chí Minh','2017-12-05 08:30:40','2017-12-09 10:35:55',3,3),(113,'1010 Đường Trường Chinh, Quận Tân Bình, Thành phố Hồ Chí Minh','2018-01-10 02:45:50','2018-01-14 04:50:05',3,3),(114,'1111 Đường Hoàng Văn Thụ, Quận Phú Nhuận, Thành phố Hồ Chí Minh','2019-02-15 07:00:00','2019-02-19 09:05:15',3,3),(115,'1212 Đường Nguyễn Đình Chiểu, Quận 3, Thành phố Hồ Chí Minh','2020-03-20 01:15:30','2020-03-24 03:20:45',3,3),(116,'1313 Đường Lê Quang Định, Quận Bình Thạnh, Thành phố Hồ Chí Minh','2016-04-25 05:30:45','2016-04-29 07:35:55',4,3),(117,'1414 Đường Nguyễn Trãi, Quận 5, Thành phố Hồ Chí Minh','2017-05-30 02:45:50','2017-06-03 04:50:05',4,3),(118,'1515 Đường Lý Tự Trọng, Quận 1, Thành phố Hồ Chí Minh','2018-07-05 07:00:00','2018-07-09 09:05:15',4,3),(119,'1616 Đường Nguyễn Văn Trỗi, Quận Phú Nhuận, Thành phố Hồ Chí Minh','2019-08-10 01:15:30','2019-08-14 03:20:45',4,3),(120,'1717 Đường Phan Đăng Lưu, Quận Phú Nhuận, Thành phố Hồ Chí Minh','2020-09-15 05:30:45','2020-09-19 07:35:55',4,3),(121,'1818 Đường Nguyễn Thái Học, Quận 1, Thành phố Hồ Chí Minh','2016-10-20 02:45:50','2016-10-24 04:50:05',5,3),(122,'1919 Đường Nguyễn Văn Linh, Quận 7, Thành phố Hồ Chí Minh','2017-11-25 07:00:00','2017-11-29 09:05:15',5,3),(123,'2020 Đường Phạm Văn Đồng, Quận Thủ Đức, Thành phố Hồ Chí Minh','2018-12-30 01:15:30','2019-01-03 03:20:45',5,3),(124,'2121 Đường Võ Thị Sáu, Quận 3, Thành phố Hồ Chí Minh','2019-01-04 05:30:45','2019-01-08 07:35:55',5,3),(125,'2222 Đường Nguyễn Văn Linh, Quận 7, Thành phố Hồ Chí Minh','2020-02-09 02:45:50','2020-02-13 04:50:05',5,3),(126,'2323 Đường Lê Lợi, Quận 1, Thành phố Hồ Chí Minh','2016-03-15 07:19:10','2016-03-19 09:45:30',6,3),(127,'2424 Đường Nguyễn Huệ, Quận 1, Thành phố Hồ Chí Minh','2017-04-20 02:12:45','2017-04-24 04:30:55',6,3),(128,'2525 Đường Trần Hưng Đạo, Quận 5, Thành phố Hồ Chí Minh','2018-05-25 01:05:20','2018-05-29 03:15:40',6,3),(129,'2626 Đường Lý Thường Kiệt, Quận 10, Thành phố Hồ Chí Minh','2019-06-30 06:25:50','2019-07-04 08:35:10',6,3),(130,'2727 Đường Phạm Ngũ Lão, Quận 1, Thành phố Hồ Chí Minh','2020-08-05 00:45:30','2020-08-09 02:55:50',6,3),(131,'2828 Đường Hai Bà Trưng, Quận 3, Thành phố Hồ Chí Minh','2016-09-10 03:15:20','2016-09-14 05:25:40',7,3),(132,'2929 Đường Điện Biên Phủ, Quận Bình Thạnh, Thành phố Hồ Chí Minh','2017-10-15 04:35:30','2017-10-19 06:45:50',7,3),(133,'3030 Đường Võ Văn Tần, Quận 3, Thành phố Hồ Chí Minh','2018-11-20 07:55:40','2018-11-24 10:05:00',7,3),(134,'3131 Đường Nguyễn Thị Minh Khai, Quận 1, Thành phố Hồ Chí Minh','2019-12-25 02:15:50','2019-12-29 04:25:10',7,3),(135,'3232 Đường Cách Mạng Tháng 8, Quận 10, Thành phố Hồ Chí Minh','2020-01-30 01:35:00','2020-02-03 03:45:20',7,3),(136,'3333 Đường Nguyễn Văn Cừ, Quận 5, Thành phố Hồ Chí Minh','2016-02-05 00:55:10','2016-02-09 03:05:30',8,3),(137,'3434 Đường Lê Văn Sỹ, Quận 3, Thành phố Hồ Chí Minh','2017-03-10 02:15:20','2017-03-14 04:25:40',8,3),(138,'3535 Đường Trường Chinh, Quận Tân Bình, Thành phố Hồ Chí Minh','2018-04-15 03:35:30','2018-04-19 05:45:50',8,3),(139,'3636 Đường Hoàng Văn Thụ, Quận Phú Nhuận, Thành phố Hồ Chí Minh','2019-05-20 04:55:40','2019-05-24 07:05:00',8,3),(140,'3737 Đường Nguyễn Đình Chiểu, Quận 3, Thành phố Hồ Chí Minh','2020-06-25 06:15:50','2020-06-29 08:25:10',8,3),(141,'3838 Đường Lê Quang Định, Quận Bình Thạnh, Thành phố Hồ Chí Minh','2016-07-30 07:35:00','2016-08-03 09:45:20',9,3),(142,'3939 Đường Nguyễn Trãi, Quận 5, Thành phố Hồ Chí Minh','2017-09-04 00:55:10','2017-09-08 03:05:30',9,3),(143,'4040 Đường Lý Tự Trọng, Quận 1, Thành phố Hồ Chí Minh','2018-10-09 02:15:20','2018-10-13 04:25:40',9,3),(144,'4141 Đường Nguyễn Văn Trỗi, Quận Phú Nhuận, Thành phố Hồ Chí Minh','2019-11-14 03:35:30','2019-11-18 05:45:50',9,3),(145,'4242 Đường Phan Đăng Lưu, Quận Phú Nhuận, Thành phố Hồ Chí Minh','2020-12-19 04:55:40','2020-12-23 07:05:00',9,3),(146,'4343 Đường Nguyễn Thái Học, Quận 1, Thành phố Hồ Chí Minh','2016-01-24 06:15:50','2016-01-28 08:25:10',10,3),(147,'4848 Đường Lê Lợi, Quận 1, Thành phố Hồ Chí Minh','2016-07-19 07:19:10','2016-07-23 09:45:30',11,3),(148,'4949 Đường Nguyễn Huệ, Quận 1, Thành phố Hồ Chí Minh','2017-08-24 02:12:45','2017-08-28 04:30:55',11,3),(149,'5050 Đường Trần Hưng Đạo, Quận 5, Thành phố Hồ Chí Minh','2018-09-29 01:05:20','2018-10-03 03:15:40',11,3),(150,'5151 Đường Lý Thường Kiệt, Quận 10, Thành phố Hồ Chí Minh','2019-11-04 06:25:50','2019-11-08 08:35:10',11,3),(151,'5252 Đường Phạm Ngũ Lão, Quận 1, Thành phố Hồ Chí Minh','2020-12-09 00:45:30','2020-12-13 02:55:50',11,3),(152,'5353 Đường Hai Bà Trưng, Quận 3, Thành phố Hồ Chí Minh','2016-01-14 03:15:20','2016-01-18 05:25:40',12,3),(153,'5454 Đường Điện Biên Phủ, Quận Bình Thạnh, Thành phố Hồ Chí Minh','2017-02-19 04:35:30','2017-02-23 06:45:50',12,3),(154,'5555 Đường Võ Văn Tần, Quận 3, Thành phố Hồ Chí Minh','2018-03-24 07:55:40','2018-03-28 10:05:00',12,3),(155,'5656 Đường Nguyễn Thị Minh Khai, Quận 1, Thành phố Hồ Chí Minh','2019-04-29 02:15:50','2019-05-03 04:25:10',12,3),(156,'5757 Đường Cách Mạng Tháng 8, Quận 10, Thành phố Hồ Chí Minh','2020-06-04 01:35:00','2020-06-08 03:45:20',12,3),(157,'5858 Đường Nguyễn Văn Cừ, Quận 5, Thành phố Hồ Chí Minh','2016-07-09 00:55:10','2016-07-13 03:05:30',13,3),(158,'5959 Đường Lê Văn Sỹ, Quận 3, Thành phố Hồ Chí Minh','2017-08-14 02:15:20','2017-08-18 04:25:40',13,3),(159,'6060 Đường Trường Chinh, Quận Tân Bình, Thành phố Hồ Chí Minh','2018-09-19 03:35:30','2018-09-23 05:45:50',13,3),(160,'6161 Đường Hoàng Văn Thụ, Quận Phú Nhuận, Thành phố Hồ Chí Minh','2019-10-24 04:55:40','2019-10-28 07:05:00',13,3),(161,'6262 Đường Nguyễn Đình Chiểu, Quận 3, Thành phố Hồ Chí Minh','2020-11-29 06:15:50','2020-12-03 08:25:10',13,3),(162,'6363 Đường Lê Quang Định, Quận Bình Thạnh, Thành phố Hồ Chí Minh','2016-01-04 07:35:00','2016-01-08 09:45:20',14,3),(163,'6464 Đường Nguyễn Trãi, Quận 5, Thành phố Hồ Chí Minh','2017-02-09 00:55:10','2017-02-13 03:05:30',14,3),(164,'6565 Đường Lý Tự Trọng, Quận 1, Thành phố Hồ Chí Minh','2018-03-14 02:15:20','2018-03-18 04:25:40',14,3),(165,'6666 Đường Nguyễn Văn Trỗi, Quận Phú Nhuận, Thành phố Hồ Chí Minh','2019-04-19 03:35:30','2019-04-23 05:45:50',14,3),(166,'6767 Đường Phan Đăng Lưu, Quận Phú Nhuận, Thành phố Hồ Chí Minh','2020-05-24 04:55:40','2020-05-28 07:05:00',14,3),(167,'6868 Đường Nguyễn Thái Học, Quận 1, Thành phố Hồ Chí Minh','2016-06-29 06:15:50','2016-07-03 08:25:10',15,3),(168,'6969 Đường Nguyễn Văn Linh, Quận 7, Thành phố Hồ Chí Minh','2017-08-04 07:35:00','2017-08-08 09:45:20',15,3),(169,'7070 Đường Phạm Văn Đồng, Quận Thủ Đức, Thành phố Hồ Chí Minh','2018-09-09 00:55:10','2018-09-13 03:05:30',15,3),(170,'7171 Đường Võ Thị Sáu, Quận 3, Thành phố Hồ Chí Minh','2019-10-14 02:15:20','2019-10-18 04:25:40',15,3),(171,'7272 Đường Nguyễn Văn Linh, Quận 7, Thành phố Hồ Chí Minh','2020-11-19 03:35:30','2020-11-23 05:45:50',15,3),(172,'7373 Đường Lê Lợi, Quận 1, Thành phố Hồ Chí Minh','2016-12-24 07:19:10','2016-12-28 09:45:30',16,3),(173,'7474 Đường Nguyễn Huệ, Quận 1, Thành phố Hồ Chí Minh','2017-01-29 02:12:45','2017-02-02 04:30:55',16,3),(174,'7575 Đường Trần Hưng Đạo, Quận 5, Thành phố Hồ Chí Minh','2018-03-06 01:05:20','2018-03-10 03:15:40',16,3),(175,'7676 Đường Lý Thường Kiệt, Quận 10, Thành phố Hồ Chí Minh','2019-04-11 06:25:50','2019-04-15 08:35:10',16,3),(176,'7777 Đường Phạm Ngũ Lão, Quận 1, Thành phố Hồ Chí Minh','2020-05-16 00:45:30','2020-05-20 02:55:50',16,3),(177,'7878 Đường Hai Bà Trưng, Quận 3, Thành phố Hồ Chí Minh','2016-06-21 03:15:20','2016-06-25 05:25:40',17,3),(178,'7979 Đường Điện Biên Phủ, Quận Bình Thạnh, Thành phố Hồ Chí Minh','2017-07-26 04:35:30','2017-07-30 06:45:50',17,3),(179,'8080 Đường Võ Văn Tần, Quận 3, Thành phố Hồ Chí Minh','2018-08-31 07:55:40','2018-09-04 10:05:00',17,3),(180,'8181 Đường Nguyễn Thị Minh Khai, Quận 1, Thành phố Hồ Chí Minh','2019-10-05 02:15:50','2019-10-09 04:25:10',17,3),(181,'8282 Đường Cách Mạng Tháng 8, Quận 10, Thành phố Hồ Chí Minh','2020-11-10 01:35:00','2020-11-14 03:45:20',17,3),(182,'8383 Đường Nguyễn Văn Cừ, Quận 5, Thành phố Hồ Chí Minh','2016-12-15 00:55:10','2016-12-19 03:05:30',18,3),(183,'8484 Đường Lê Văn Sỹ, Quận 3, Thành phố Hồ Chí Minh','2017-01-20 02:15:20','2017-01-24 04:25:40',18,3),(184,'8585 Đường Trường Chinh, Quận Tân Bình, Thành phố Hồ Chí Minh','2018-02-25 03:35:30','2018-03-01 05:45:50',18,3),(185,'8686 Đường Hoàng Văn Thụ, Quận Phú Nhuận, Thành phố Hồ Chí Minh','2019-04-02 04:55:40','2019-04-06 07:05:00',18,3),(186,'8787 Đường Nguyễn Đình Chiểu, Quận 3, Thành phố Hồ Chí Minh','2020-05-07 06:15:50','2020-05-11 08:25:10',18,3),(187,'8888 Đường Lê Quang Định, Quận Bình Thạnh, Thành phố Hồ Chí Minh','2016-06-12 07:35:00','2016-06-16 09:45:20',19,3),(188,'8989 Đường Nguyễn Trãi, Quận 5, Thành phố Hồ Chí Minh','2017-07-17 00:55:10','2017-07-21 03:05:30',19,3),(189,'9090 Đường Lý Tự Trọng, Quận 1, Thành phố Hồ Chí Minh','2018-08-22 02:15:20','2018-08-26 04:25:40',19,3),(190,'9191 Đường Nguyễn Văn Trỗi, Quận Phú Nhuận, Thành phố Hồ Chí Minh','2019-09-27 03:35:30','2019-10-01 05:45:50',19,3),(191,'9292 Đường Phan Đăng Lưu, Quận Phú Nhuận, Thành phố Hồ Chí Minh','2020-11-02 04:55:40','2020-11-06 07:05:00',19,3),(192,'9393 Đường Nguyễn Thái Học, Quận 1, Thành phố Hồ Chí Minh','2016-12-07 06:15:50','2016-12-11 08:25:10',20,3),(193,'9494 Đường Nguyễn Văn Linh, Quận 7, Thành phố Hồ Chí Minh','2017-01-12 07:35:00','2017-01-16 09:45:20',20,3),(194,'9595 Đường Phạm Văn Đồng, Quận Thủ Đức, Thành phố Hồ Chí Minh','2018-02-17 00:55:10','2018-02-21 03:05:30',20,3),(195,'9696 Đường Võ Thị Sáu, Quận 3, Thành phố Hồ Chí Minh','2019-03-24 02:15:20','2019-03-28 04:25:40',20,3),(196,'9797 Đường Nguyễn Văn Linh, Quận 7, Thành phố Hồ Chí Minh','2020-04-29 03:35:30','2020-05-03 05:45:50',20,3);
/*!40000 ALTER TABLE `sale_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_order_status`
--

DROP TABLE IF EXISTS `sale_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_order_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` char(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_order_status`
--

LOCK TABLES `sale_order_status` WRITE;
/*!40000 ALTER TABLE `sale_order_status` DISABLE KEYS */;
INSERT INTO `sale_order_status` VALUES (2,'DOING'),(3,'DONE'),(1,'NOT DO');
/*!40000 ALTER TABLE `sale_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `phone` char(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `role` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT (_utf8mb4'ROLE_USER'),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Nhân','Lê Thành','2010-09-30 07:19:10','2024-10-01 14:27:53','lenhan@gmail.com','HCM','0332222222','nhanle','$2a$10$V0pYyv78rgxvMMPJIFtfmO1LD55YhqSh37jVliZGgawBD3hlyGMEa',1,'ROLE_ADMIN'),(2,'Long','Đỗ Thành','2010-09-30 07:19:10','2024-10-01 14:27:53','dolong@gmail.com','456 Đường DEF, Quận 2, TP.HCM','0902345678','dolong','$2a$10$V0pYyv78rgxvMMPJIFtfmO1LD55YhqSh37jVliZGgawBD3hlyGMEa',1,'ROLE_USER'),(3,'Minh','Trần Văn','2010-09-30 07:19:10','2024-10-01 14:27:53','minh.tranvan@example.com','789 Đường GHI, Quận 3, TP.HCM','0903456789','minhtran','password123',1,'ROLE_USER'),(4,'Lan','Phạm Thị','2010-09-30 07:19:10','2024-10-01 14:27:53','lan.phamthi@example.com','101 Đường JKL, Quận 4, TP.HCM','0904567890','lanpham','password123',1,'ROLE_USER'),(5,'Hùng','Hoàng Văn','2014-09-30 07:19:10','2024-10-01 14:27:53','hung.hoangvan@example.com','202 Đường MNO, Quận 5, TP.HCM','0905678901','hunghoang','password123',1,'ROLE_USER'),(6,'Mai','Vũ Thị','2014-09-30 07:19:10','2024-10-01 14:27:53','mai.vuthi@example.com','303 Đường PQR, Quận 6, TP.HCM','0906789012','maivu','password123',1,'ROLE_USER'),(7,'Tùng','Đặng Văn','2014-09-30 07:19:10','2024-10-01 14:27:53','tung.dangvan@example.com','404 Đường STU, Quận 7, TP.HCM','0907890123','tungdang','password123',1,'ROLE_USER'),(8,'Hạnh','Bùi Thị','2014-09-30 07:19:10','2024-10-01 14:27:53','hanh.buithi@example.com','505 Đường VWX, Quận 8, TP.HCM','0908901234','hanhbui','password123',1,'ROLE_USER'),(9,'Khoa','Đỗ Văn','2014-09-30 07:19:10','2024-10-01 14:27:53','khoa.dovan@example.com','606 Đường YZ, Quận 9, TP.HCM','0909012345','khoado','password123',1,'ROLE_USER'),(10,'Phúc','Nguyễn Thành','2014-09-30 07:19:10','2024-10-01 14:27:53','phuc.nguyenthanh@example.com','707 Đường ABC, Quận 10, TP.HCM','0910123456','phucnguyen','password123',1,'ROLE_USER'),(11,'Thảo','Lê Thị','2014-09-30 07:19:10','2024-10-01 14:27:53','thao.lethi@example.com','808 Đường DEF, Quận 11, TP.HCM','0911234567','thaole','password123',1,'ROLE_USER'),(12,'Dũng','Trần Văn','2014-09-30 07:19:10','2024-10-01 14:27:53','dung.tranvan@example.com','909 Đường GHI, Quận 12, TP.HCM','0912345678','dungtran','password123',1,'ROLE_USER'),(13,'Vy','Phạm Thị','2014-09-30 07:19:10','2024-10-01 14:27:53','vy.phamthi@example.com','1010 Đường JKL, Quận Bình Thạnh, TP.HCM','0913456789','vypham','password123',1,'ROLE_USER'),(14,'Quang','Hoàng Văn','2014-09-30 07:19:10','2024-10-01 14:27:53','quang.hoangvan@example.com','1111 Đường MNO, Quận Gò Vấp, TP.HCM','0914567890','quanghoang','password123',1,'ROLE_USER'),(15,'Linh','Vũ Thị','2014-09-30 07:19:10','2024-10-01 14:27:53','linh.vuthi@example.com','1212 Đường PQR, Quận Tân Bình, TP.HCM','0915678901','linhvu','password123',1,'ROLE_USER'),(16,'Hải','Đặng Văn','2014-09-30 07:19:10','2024-10-01 14:27:53','hai.dangvan@example.com','1313 Đường STU, Quận Phú Nhuận, TP.HCM','0916789012','haidang','password123',1,'ROLE_USER'),(17,'Trang','Bùi Thị','2014-09-30 07:19:10','2024-10-01 14:27:53','trang.buithi@example.com','1414 Đường VWX, Quận Thủ Đức, TP.HCM','0917890123','trangbui','password123',1,'ROLE_USER'),(18,'Nam','Đỗ Văn','2014-09-30 07:19:10','2024-10-01 14:27:53','nam.dovan@example.com','1515 Đường YZ, Quận Bình Tân, TP.HCM','0918901234','namdo','password123',1,'ROLE_USER'),(19,'Huy','Nguyễn Thành','2014-09-30 07:19:10','2024-10-01 14:27:53','huy.nguyenthanh@example.com','1616 Đường ABC, Quận 1, TP.HCM','0919012345','huynguyen','password123',1,'ROLE_USER'),(20,'Thủy','Lê Thị','2014-09-30 07:19:10','2024-10-01 14:27:53','thuy.lethi@example.com','1717 Đường DEF, Quận 2, TP.HCM','0920123456','thuyle','password123',1,'ROLE_USER'),(21,'Abc','Nguyễn Văn','2014-09-30 09:59:42','2024-10-01 14:27:53','dsa434dsad3423adas@ou.edu.vn','HCM','0332222233','aaa','$2a$10$V0pYyv78rgxvMMPJIFtfmO1LD55YhqSh37jVliZGgawBD3hlyGMEa',1,'ROLE_ADMIN');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-01 21:55:37
