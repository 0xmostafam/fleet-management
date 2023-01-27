-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: fleet_management_system
-- ------------------------------------------------------
-- Server version	8.0.32-0buntu0.22.04.1

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
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int NOT NULL DEFAULT '12',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES (1,'Bus 1',12,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(2,'Bus 2',12,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(3,'Bus 3',12,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(4,'Bus 4',12,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(5,'Bus 5',12,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL);
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_seat`
--

DROP TABLE IF EXISTS `bus_seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus_seat` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bus_id` bigint unsigned NOT NULL,
  `seat_number` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bus_seat_bus_id_foreign` (`bus_id`),
  CONSTRAINT `bus_seat_bus_id_foreign` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_seat`
--

LOCK TABLES `bus_seat` WRITE;
/*!40000 ALTER TABLE `bus_seat` DISABLE KEYS */;
INSERT INTO `bus_seat` VALUES (1,1,1,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(2,1,2,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(3,1,3,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(4,1,4,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(5,1,5,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(6,1,6,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(7,1,7,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(8,1,8,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(9,1,9,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(10,1,10,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(11,1,11,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(12,1,12,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(13,2,1,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(14,2,2,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(15,2,3,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(16,2,4,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(17,2,5,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(18,2,6,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(19,2,7,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(20,2,8,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(21,2,9,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(22,2,10,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(23,2,11,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(24,2,12,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(25,3,1,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(26,3,2,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(27,3,3,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(28,3,4,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(29,3,5,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(30,3,6,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(31,3,7,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(32,3,8,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(33,3,9,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(34,3,10,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(35,3,11,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(36,3,12,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(37,4,1,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(38,4,2,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(39,4,3,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(40,4,4,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(41,4,5,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(42,4,6,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(43,4,7,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(44,4,8,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(45,4,9,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(46,4,10,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(47,4,11,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(48,4,12,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(49,5,1,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(50,5,2,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(51,5,3,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(52,5,4,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(53,5,5,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(54,5,6,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(55,5,7,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(56,5,8,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(57,5,9,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(58,5,10,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(59,5,11,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(60,5,12,'2023-01-27 15:02:29','2023-01-27 15:02:29',NULL);
/*!40000 ALTER TABLE `bus_seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2023_01_26_151300_create_station_table',1),(6,'2023_01_26_151322_create_bus_table',1),(7,'2023_01_26_151323_create_trip_table',1),(8,'2023_01_26_151329_create_bus_seat_table',1),(9,'2023_01_26_151330_create_trip_stop_table',1),(10,'2023_01_26_151411_create_reservation_table',1),(11,'2023_01_27_122621_create_permission_tables',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(2,'App\\Models\\User',2);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `trip_id` bigint unsigned NOT NULL,
  `bus_id` bigint unsigned NOT NULL,
  `bus_seat_id` bigint unsigned NOT NULL,
  `start_station_id` bigint unsigned NOT NULL,
  `end_station_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reservation_user_id_foreign` (`user_id`),
  KEY `reservation_trip_id_foreign` (`trip_id`),
  KEY `reservation_bus_id_foreign` (`bus_id`),
  KEY `reservation_bus_seat_id_foreign` (`bus_seat_id`),
  KEY `reservation_start_station_id_foreign` (`start_station_id`),
  KEY `reservation_end_station_id_foreign` (`end_station_id`),
  CONSTRAINT `reservation_bus_id_foreign` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`id`),
  CONSTRAINT `reservation_bus_seat_id_foreign` FOREIGN KEY (`bus_seat_id`) REFERENCES `bus_seat` (`id`),
  CONSTRAINT `reservation_end_station_id_foreign` FOREIGN KEY (`end_station_id`) REFERENCES `station` (`id`),
  CONSTRAINT `reservation_start_station_id_foreign` FOREIGN KEY (`start_station_id`) REFERENCES `station` (`id`),
  CONSTRAINT `reservation_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`),
  CONSTRAINT `reservation_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','web','2023-01-27 15:02:29','2023-01-27 15:02:29'),(2,'user','web','2023-01-27 15:02:29','2023-01-27 15:02:29');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (1,'Cairo','2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(2,'Al Minyah','2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(3,'Alexandria','2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(4,'Aswan','2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(5,'Asyut','2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(6,'Banha','2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(7,'Beni Suef','2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(8,'Damanhour','2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(9,'Damietta','2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(10,'El Arish','2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(11,'El Giza','2023-01-27 15:02:30','2023-01-27 15:02:30',NULL);
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `start_station_id` bigint unsigned NOT NULL,
  `end_station_id` bigint unsigned NOT NULL,
  `bus_id` bigint unsigned NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trip_start_station_id_foreign` (`start_station_id`),
  KEY `trip_end_station_id_foreign` (`end_station_id`),
  KEY `trip_bus_id_foreign` (`bus_id`),
  CONSTRAINT `trip_bus_id_foreign` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`id`),
  CONSTRAINT `trip_end_station_id_foreign` FOREIGN KEY (`end_station_id`) REFERENCES `station` (`id`),
  CONSTRAINT `trip_start_station_id_foreign` FOREIGN KEY (`start_station_id`) REFERENCES `station` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (1,7,10,4,'2023-01-28 17:02:30','2023-01-28 19:02:30','2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(2,11,5,4,'2023-01-28 19:32:30','2023-01-28 21:32:30','2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(3,7,3,1,'2023-01-28 17:02:30','2023-01-28 19:02:30','2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(4,8,10,5,'2023-01-28 17:02:30','2023-01-28 19:02:30','2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(5,7,10,1,'2023-01-28 19:32:30','2023-01-28 21:32:30','2023-01-27 15:02:30','2023-01-27 15:02:30',NULL);
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip_stop`
--

DROP TABLE IF EXISTS `trip_stop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip_stop` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `trip_id` bigint unsigned NOT NULL,
  `station_id` bigint unsigned NOT NULL,
  `order` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trip_stop_trip_id_foreign` (`trip_id`),
  KEY `trip_stop_station_id_foreign` (`station_id`),
  CONSTRAINT `trip_stop_station_id_foreign` FOREIGN KEY (`station_id`) REFERENCES `station` (`id`),
  CONSTRAINT `trip_stop_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip_stop`
--

LOCK TABLES `trip_stop` WRITE;
/*!40000 ALTER TABLE `trip_stop` DISABLE KEYS */;
INSERT INTO `trip_stop` VALUES (1,1,7,1,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(2,1,1,2,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(3,1,2,3,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(4,1,3,4,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(5,1,4,5,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(6,1,5,6,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(7,1,6,7,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(8,1,8,8,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(9,1,9,9,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(10,1,11,10,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(11,1,10,11,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(12,2,11,1,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(13,2,1,2,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(14,2,2,3,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(15,2,3,4,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(16,2,4,5,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(17,2,6,6,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(18,2,7,7,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(19,2,8,8,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(20,2,9,9,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(21,2,10,10,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(22,2,5,11,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(23,3,7,1,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(24,3,1,2,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(25,3,2,3,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(26,3,4,4,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(27,3,5,5,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(28,3,6,6,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(29,3,8,7,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(30,3,9,8,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(31,3,10,9,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(32,3,11,10,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(33,3,3,11,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(34,4,8,1,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(35,4,1,2,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(36,4,2,3,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(37,4,3,4,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(38,4,4,5,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(39,4,5,6,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(40,4,6,7,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(41,4,7,8,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(42,4,9,9,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(43,4,11,10,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(44,4,10,11,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(45,5,7,1,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(46,5,1,2,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(47,5,2,3,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(48,5,3,4,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(49,5,4,5,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(50,5,5,6,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(51,5,6,7,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(52,5,8,8,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(53,5,9,9,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(54,5,11,10,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL),(55,5,10,11,'2023-01-27 15:02:30','2023-01-27 15:02:30',NULL);
/*!40000 ALTER TABLE `trip_stop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@admin.com','2023-01-27 15:02:29','$2y$10$S2j.RLdUp.1KMppUYb17ReMUUgc9rw9WdbwPbDHwACTWgU3L4HomK','yzCTWiSlC2','2023-01-27 15:02:29','2023-01-27 15:02:29',NULL),(2,'User','user@user.com','2023-01-27 15:02:29','$2y$10$XVrKyMw0uD.Z3oqgQDfjzuG3RGkwDd5zTFMTZgGUxKva9c4327Q5C','AzUo7q4Rxv','2023-01-27 15:02:29','2023-01-27 15:02:29',NULL);
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

-- Dump completed on 2023-01-27 19:03:04
