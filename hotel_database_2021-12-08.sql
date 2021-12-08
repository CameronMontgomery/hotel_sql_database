CREATE DATABASE  IF NOT EXISTS `hotel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hotel`;
-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: localhost    Database: hotel
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `room_number` int NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `number_of_guests` int NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `booking_fk_rooms` (`room_number`),
  CONSTRAINT `booking_fk_rooms` FOREIGN KEY (`room_number`) REFERENCES `rooms` (`room_number`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1,'2021-11-06','2021-11-08',1),(2,2,'2021-11-06','2021-11-07',1),(3,21,'2021-11-06','2021-11-09',3),(4,29,'2021-11-06','2021-11-07',1),(5,8,'2021-11-07','2021-11-08',2),(6,9,'2021-11-07','2021-11-08',1),(7,24,'2021-11-08','2021-11-10',3),(8,5,'2021-11-08','2021-11-11',4);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `persons_id` int NOT NULL,
  `job_id` int NOT NULL,
  `sick_time` int NOT NULL DEFAULT '0',
  `hire_date` date NOT NULL,
  `bonus` decimal(9,2) DEFAULT '0.00',
  PRIMARY KEY (`employee_id`),
  KEY `employees_fk_personal` (`persons_id`),
  KEY `employees_fk_job` (`job_id`),
  CONSTRAINT `employees_fk_job` FOREIGN KEY (`job_id`) REFERENCES `job_types` (`job_id`),
  CONSTRAINT `employees_fk_personal` FOREIGN KEY (`persons_id`) REFERENCES `persons` (`persons_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,1,3,3,'2019-04-21',120.00),(2,2,2,8,'2019-04-27',80.00),(3,3,1,2,'2019-05-01',0.00),(4,4,4,0,'2020-02-21',0.00),(5,5,4,1,'2021-06-15',0.00);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `guest contact info`
--

DROP TABLE IF EXISTS `guest contact info`;
/*!50001 DROP VIEW IF EXISTS `guest contact info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `guest contact info` AS SELECT 
 1 AS `last_name`,
 1 AS `first_name`,
 1 AS `contact_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `guest loyalty balence`
--

DROP TABLE IF EXISTS `guest loyalty balence`;
/*!50001 DROP VIEW IF EXISTS `guest loyalty balence`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `guest loyalty balence` AS SELECT 
 1 AS `last_name`,
 1 AS `first_name`,
 1 AS `contact_number`,
 1 AS `points`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `guests`
--

DROP TABLE IF EXISTS `guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guests` (
  `guest_id` int NOT NULL AUTO_INCREMENT,
  `persons_id` int NOT NULL,
  PRIMARY KEY (`guest_id`),
  KEY `guests_fk_persons` (`persons_id`),
  CONSTRAINT `guests_fk_persons` FOREIGN KEY (`persons_id`) REFERENCES `persons` (`persons_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guests`
--

LOCK TABLES `guests` WRITE;
/*!40000 ALTER TABLE `guests` DISABLE KEYS */;
INSERT INTO `guests` VALUES (1,5),(2,6),(3,7),(4,8),(5,9),(6,10),(7,11),(8,12);
/*!40000 ALTER TABLE `guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `invoice_id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `guest_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `payment_id` int NOT NULL,
  `invoice_date` date NOT NULL,
  `invoice_total` decimal(5,2) NOT NULL,
  `payment_total` decimal(5,2) NOT NULL DEFAULT '0.00',
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `invoices_fk_booking` (`booking_id`),
  KEY `invoices_fk_guest` (`guest_id`),
  KEY `invoices_fk_employee` (`employee_id`),
  KEY `invoices_fk_payment` (`payment_id`),
  KEY `invoices_invoice_date_ix` (`invoice_date` DESC),
  CONSTRAINT `invoices_fk_booking` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`),
  CONSTRAINT `invoices_fk_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `invoices_fk_guest` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`guest_id`),
  CONSTRAINT `invoices_fk_payment` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,1,1,3,1,'2021-11-06',160.00,160.00,'2021-11-06'),(2,2,2,3,2,'2021-11-06',80.00,80.00,'2021-11-06'),(3,3,3,3,3,'2021-11-06',360.00,360.00,'2021-11-06'),(4,4,4,3,4,'2021-11-06',120.00,120.00,'2021-11-06'),(5,5,5,3,5,'2021-11-07',80.00,80.00,'2021-11-07'),(6,6,6,3,6,'2021-11-07',80.00,80.00,'2021-11-07'),(7,7,7,3,7,'2021-11-08',160.00,160.00,'2021-11-08'),(8,8,8,3,8,'2021-11-08',360.00,360.00,'2021-11-08');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_types`
--

DROP TABLE IF EXISTS `job_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_types` (
  `job_id` int NOT NULL,
  `job_name` varchar(30) NOT NULL,
  `base_pay` varchar(50) NOT NULL,
  PRIMARY KEY (`job_id`),
  UNIQUE KEY `job_name` (`job_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_types`
--

LOCK TABLES `job_types` WRITE;
/*!40000 ALTER TABLE `job_types` DISABLE KEYS */;
INSERT INTO `job_types` VALUES (1,'Front Desk','22.75'),(2,'Maintenence','25.00'),(3,'Manager','35.00'),(4,'House Keeper','18.25');
/*!40000 ALTER TABLE `job_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loyalty`
--

DROP TABLE IF EXISTS `loyalty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loyalty` (
  `loyalty_id` int NOT NULL AUTO_INCREMENT,
  `guest_id` int NOT NULL,
  `points` int DEFAULT '0',
  PRIMARY KEY (`loyalty_id`),
  KEY `loyalty_fk_guests` (`guest_id`),
  CONSTRAINT `loyalty_fk_guests` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`guest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loyalty`
--

LOCK TABLES `loyalty` WRITE;
/*!40000 ALTER TABLE `loyalty` DISABLE KEYS */;
INSERT INTO `loyalty` VALUES (1,1,2200),(2,4,820),(3,5,0),(4,6,1380),(5,7,30),(6,8,420);
/*!40000 ALTER TABLE `loyalty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(20) NOT NULL,
  `card_number` varchar(16) NOT NULL,
  `exp_date` varchar(5) NOT NULL,
  `cvv` varchar(4) NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'Credit','1000223489891011','01/22','234'),(2,'Debit','2200223489894565','04/22','454'),(3,'Credit','2230253489895555','06/23','564'),(4,'Credit','8084523489895656','07/23','895'),(5,'Credit','1000143489899797','03/22','678'),(6,'Debit','8080228889891818','03/24','236'),(7,'Debit','1410202089345654','09/22','223'),(8,'Debit','1222223489894456','12/21','987');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons` (
  `persons_id` int NOT NULL AUTO_INCREMENT,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zipcode` varchar(20) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  PRIMARY KEY (`persons_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` VALUES (1,'Toby','McMillian','132 S Race St','Denver','CO','80209','720-332-6878','tmcmill23@gmail.com'),(2,'Trujillo','Ana','1298 E Smathers St','Aurora','CO','80014','303-555-7733','dagmar62@hotmail.com'),(3,'Moreno','Antonio','695 N Parkland Ave','Denver','CO','80209','720-555-8332','eden59@yahoo.com'),(4,'Hardy','Thomas','13244 E Kettle Pl','Centennial','CO','80112','720-555-1139','HardThomas88@yahoo.com'),(5,'Berglund','Christina','2277 E 73rd Ave','Denver','CO','80209','319-555-1139','crypt@yahoo.com'),(6,'Moos','Hanna','1778 N Bovine Ave','Peoria','IL','61638','309-555-8755','kludge@aol.com'),(7,'Citeaux','Fred','1234 Main St','Normal','IL','61761','309-555-1914','sscorpio@icloud.com'),(8,'Summer','Martin','1877 Ete Ct','Frogtown','LA','70563','337-555-9441','formis@msn.com'),(9,'Lebihan','Laurence','717 E Michigan Ave','Chicago','IL','60611','312-555-9441','crusader@me.com'),(10,'Lincoln','Elizabeth','4562 Rt 78 E','Vancouver','WA','98684','360-555-2680','nasarius@yahoo.com'),(11,'Snyder','Howard','2732 Baker Blvd.','Eugene','OR','97403','503-555-7555','vertigo@att.net'),(12,'Latimer','Yoshi','516 Main St.','Elgin','OR','97827','503-555-6874','cantu@icloud.com');
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_status`
--

DROP TABLE IF EXISTS `room_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_status` (
  `status_id` int NOT NULL,
  `status_type` varchar(20) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_status`
--

LOCK TABLES `room_status` WRITE;
/*!40000 ALTER TABLE `room_status` DISABLE KEYS */;
INSERT INTO `room_status` VALUES (1,'Clean'),(2,'Dirty'),(3,'Out of Order');
/*!40000 ALTER TABLE `room_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `room_number` int NOT NULL,
  `status_id` int NOT NULL,
  `number_of_beds` int NOT NULL,
  `suite` tinyint(1) NOT NULL,
  `room_price` decimal(5,2) NOT NULL,
  PRIMARY KEY (`room_number`),
  KEY `rooms_fk_status` (`status_id`),
  CONSTRAINT `rooms_fk_status` FOREIGN KEY (`status_id`) REFERENCES `room_status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,1,1,0,80.00),(2,1,1,0,80.00),(3,1,1,0,80.00),(4,1,2,0,80.00),(5,2,2,1,120.00),(6,2,2,1,120.00),(7,1,2,0,80.00),(8,1,1,0,80.00),(9,1,1,0,80.00),(10,3,1,0,80.00),(11,1,2,0,80.00),(12,1,2,0,80.00),(21,1,2,1,120.00),(22,2,2,1,120.00),(23,2,2,0,80.00),(24,1,2,0,80.00),(25,1,2,0,80.00),(26,1,1,1,120.00),(27,1,1,1,120.00),(28,1,1,1,120.00),(29,1,1,1,120.00);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `rooms to clean`
--

DROP TABLE IF EXISTS `rooms to clean`;
/*!50001 DROP VIEW IF EXISTS `rooms to clean`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rooms to clean` AS SELECT 
 1 AS `Dirty Room Numbers`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vacent rooms`
--

DROP TABLE IF EXISTS `vacent rooms`;
/*!50001 DROP VIEW IF EXISTS `vacent rooms`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vacent rooms` AS SELECT 
 1 AS `Availiable Room Numbers`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'hotel'
--

--
-- Dumping routines for database 'hotel'
--
/*!50003 DROP FUNCTION IF EXISTS `get_persons_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_persons_id`(
	person_last_param VARCHAR(50),
    person_first_param VARCHAR(50)
) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN 
	DECLARE persons_id_var INT;
    
    SELECT persons_id
    INTO persons_id_var
    FROM persons
	WHERE last_name = person_last_param AND first_name = person_first_param;
    
    RETURN(persons_id_var);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_person` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_person`(
	IN last_name_param			VARCHAR(50),
    IN first_name_param			VARCHAR(50),
    IN address_param			VARCHAR(50),
    IN city_param				VARCHAR(30),
    IN state_param				VARCHAR(2),
    IN zipcode_param			VARCHAR(20),
    IN contact_number_param		VARCHAR(20),
    IN email_param				VARCHAR(40)
)
BEGIN
	INSERT INTO persons
    VALUES (DEFAULT, last_name_param, first_name_param, address_param, city_param, state_param,
			zipcode_param, contact_number_param, email_param);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `make_reservation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `make_reservation`(
	IN room_number_param		INT,
    IN check_in_param			DATE,
    IN check_out_param			DATE,
    IN num_guests_param			INT
)
BEGIN
	INSERT INTO booking
    VALUES (DEFAULT, room_number_param, check_in_param, check_out_param, num_guests_param);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `guest contact info`
--

/*!50001 DROP VIEW IF EXISTS `guest contact info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `guest contact info` AS select `persons`.`last_name` AS `last_name`,`persons`.`first_name` AS `first_name`,`persons`.`contact_number` AS `contact_number` from (`persons` join `guests` on((`persons`.`persons_id` = `guests`.`persons_id`))) order by `persons`.`last_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `guest loyalty balence`
--

/*!50001 DROP VIEW IF EXISTS `guest loyalty balence`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `guest loyalty balence` AS select `p`.`last_name` AS `last_name`,`p`.`first_name` AS `first_name`,`p`.`contact_number` AS `contact_number`,`l`.`points` AS `points` from ((`persons` `p` join `guests` `g` on((`p`.`persons_id` = `g`.`persons_id`))) join `loyalty` `l` on((`l`.`guest_id` = `g`.`guest_id`))) order by `p`.`last_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rooms to clean`
--

/*!50001 DROP VIEW IF EXISTS `rooms to clean`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rooms to clean` AS select `rooms`.`room_number` AS `Dirty Room Numbers` from `rooms` where (`rooms`.`status_id` = 2) order by `rooms`.`room_number` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vacent rooms`
--

/*!50001 DROP VIEW IF EXISTS `vacent rooms`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vacent rooms` AS select `rooms`.`room_number` AS `Availiable Room Numbers` from `rooms` where (`rooms`.`status_id` = 1) order by `rooms`.`room_number` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-08 12:15:03
