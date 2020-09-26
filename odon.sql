-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: odon
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `dentist_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `note` text,
  `state` tinyint DEFAULT '0',
  `hour` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_appointments_dentists1_idx` (`dentist_id`),
  KEY `fk_appointments_users1_idx` (`user_id`),
  CONSTRAINT `fk_appointments_dentists1` FOREIGN KEY (`dentist_id`) REFERENCES `dentists` (`id`),
  CONSTRAINT `fk_appointments_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (30,'2020-09-25',30,40,'sdfdfds',0,'2020-09-24 10:30:00'),(31,'2020-09-25',30,41,'Tengo los sintomas',1,'2020-09-24 11:00:00');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dentists`
--

DROP TABLE IF EXISTS `dentists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dentists` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `note` text,
  `person_Id` bigint NOT NULL,
  `specialty_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dentists_person1_idx` (`person_Id`),
  KEY `fk_dentists_specialties1_idx` (`specialty_id`),
  CONSTRAINT `fk_dentists_person1` FOREIGN KEY (`person_Id`) REFERENCES `persons` (`Id`),
  CONSTRAINT `fk_dentists_specialties1` FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dentists`
--

LOCK TABLES `dentists` WRITE;
/*!40000 ALTER TABLE `dentists` DISABLE KEYS */;
INSERT INTO `dentists` VALUES (29,'Nota',71,1),(30,'Nota',72,2);
/*!40000 ALTER TABLE `dentists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genders`
--

DROP TABLE IF EXISTS `genders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genders`
--

LOCK TABLES `genders` WRITE;
/*!40000 ALTER TABLE `genders` DISABLE KEYS */;
INSERT INTO `genders` VALUES (1,'Masculino','M'),(2,'Femenino','F');
/*!40000 ALTER TABLE `genders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(65) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `second_surname` varchar(45) DEFAULT NULL,
  `document_number` bigint NOT NULL,
  `img_url` text,
  `gender_id` bigint DEFAULT NULL,
  `number_phone` varchar(45) DEFAULT NULL,
  `email` varchar(65) DEFAULT NULL,
  `type_document_id` bigint DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_person_genders_idx` (`gender_id`),
  KEY `fk_person_type_documents1_idx` (`type_document_id`),
  CONSTRAINT `fk_person_genders` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`),
  CONSTRAINT `fk_person_type_documents1` FOREIGN KEY (`type_document_id`) REFERENCES `type_documents` (`id`) ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` VALUES (70,'Diego','Rambao',NULL,1001879447,NULL,NULL,NULL,'admin@admin',NULL),(71,'Maria','Herrera','DDKDKD',100215484,NULL,1,'545454','maria@maria',1),(72,'Daniel','Rambao','dfdfd',12000212,NULL,1,NULL,'daniel@daniel',1),(73,'Diego','Rambao',NULL,100188987,NULL,NULL,NULL,'diego@diego',NULL),(74,'william','mamamama',NULL,454545,NULL,NULL,NULL,'william@gmail.com',1);
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialties`
--

DROP TABLE IF EXISTS `specialties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialties` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(65) DEFAULT NULL,
  `state` enum('A','I') DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialties`
--

LOCK TABLES `specialties` WRITE;
/*!40000 ALTER TABLE `specialties` DISABLE KEYS */;
INSERT INTO `specialties` VALUES (1,'Ortodoncia',NULL,'OR'),(2,'Braquest',NULL,'Br');
/*!40000 ALTER TABLE `specialties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_documents`
--

DROP TABLE IF EXISTS `type_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_documents` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_documents`
--

LOCK TABLES `type_documents` WRITE;
/*!40000 ALTER TABLE `type_documents` DISABLE KEYS */;
INSERT INTO `type_documents` VALUES (1,'CC','Cedula de Ciudadania'),(2,'TI','Tarjeta de identidad');
/*!40000 ALTER TABLE `type_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` text NOT NULL,
  `type_user` enum('P','A','D') DEFAULT NULL,
  `person_Id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_person1_idx` (`person_Id`),
  CONSTRAINT `fk_users_person1` FOREIGN KEY (`person_Id`) REFERENCES `persons` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (39,'$2y$10$zsb5Sdhwb8i.QJQBrVGJkOgE993d5D2FzsupWJXssbQQonN0H2YLS','A',70),(40,'$2y$10$V/wOkVxMsgkb5dSBJvSBeetLxrwMXmSlnDgwUOanj0KbkxWYG6NBu','P',73),(41,'$2y$10$fhyAkcb6VIOkZaSAx8myN.X2.U49dwVvBfNqqgW97G4Ab4axk7mTq','P',74);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'odon'
--
/*!50003 DROP PROCEDURE IF EXISTS `create_appointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_appointment`(IN `appointment` JSON)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Create an Appointment'
BEGIN
  DECLARE dentist, user JSON;
  SET dentist = appointment->>'$.dentist';
  SET user = appointment->>'$.user';

	INSERT INTO appointments(dentist_id, user_id, date, hour, note)
  VALUES(dentist->>'$.id', user->>'$.id', appointment->>'$.date', appointment->>'$.hour', appointment->>'$.note');
  IF ROW_COUNT() > 0 THEN
    SELECT LAST_INSERT_ID() id;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_dentist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_dentist`(IN `dentist` JSON)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Create a dentist'
BEGIN
	DECLARE person, specialty JSON;
	DECLARE personId BIGINT;

  SET person = dentist->>'$.person';
  SET specialty = dentist->>'$.specialty';

  IF  person->>'$.id' IS NULL OR person->>'$.id' = 'null' THEN
    CALL create_person(person);
    SET personId = @personId;
  ELSE
    SET personId = person->>'$.id';
  END IF;
  INSERT INTO dentists(person_id, specialty_id, note)
  VALUES (personId, specialty->>'$.id', dentist->>'$.note');
  
  SELECT last_insert_id() id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_gender` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_gender`(IN `gender` JSON)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Create a Gender'
BEGIN
	INSERT INTO genders(name, code)
  VALUES(gender->>'$.name', gender->>'$.code');
  IF ROW_COUNT() > 0 THEN
    SELECT LAST_INSERT_ID() id;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_person` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_person`(IN `person` JSON)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Create a Person'
BEGIN
	DECLARE gender , type_document JSON;
  DECLARE i INT;

  SET gender = person->>'$.gender';
  SET type_document = person->>'$.typeDocument';

  INSERT INTO persons(
         name, surname, second_surname, type_document_id, document_number,
         gender_id, img_url, number_phone, email)
  VALUES (person->>'$.name', person->>'$.surname', person->>'$.secondSurname' OR NULL,
         type_document->>'$.id' OR NULL, person->>'$.documentNumber', gender->>'$.id' OR NULL,
         person->>'$.imgUrl' OR NULL, person->>'$.numberPhone' OR NULL, person->>'$.email');

  SET @personId = LAST_INSERT_ID();
  SET person = JSON_SET(person, '$.id', @personId);

  SELECT person->>'$.id' id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_specialty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_specialty`(IN `specialty` JSON)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Create a Specialty'
BEGIN
	INSERT INTO specialties(code, name, state)
  VALUES(specialty->>'$.code', specialty->>'$.name', specialty->>'$.state');
  IF ROW_COUNT() > 0 THEN
    SELECT LAST_INSERT_ID() id;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_type_document` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_type_document`(IN `type_document` JSON)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Create a Type Document'
BEGIN
	INSERT INTO type_documents(name, code)
  VALUES(type_document->>'$.name', type_document->>'$.code');
  IF ROW_COUNT() > 0 THEN
    SELECT LAST_INSERT_ID() id;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_user`(IN `user` JSON)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Create a user'
BEGIN
	DECLARE person JSON;
	DECLARE personId BIGINT;

  SET person = user->>'$.person';

  IF  person->>'$.id' IS NULL OR person->>'$.id' = 'null' THEN
    CALL create_person(person);
    SET personId = @personId;
  ELSE
    SET personId = person->>'$.id';
  END IF;
  INSERT INTO users(person_id,  password, type_user)
  VALUES (personId, user->>'$.password', user->>'$.typeUser');
  SELECT LAST_INSERT_ID() id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_appointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_appointment`(IN `appointment` BIGINT)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Logic deletion for a appointment'
BEGIN
	DECLARE success TINYINT DEFAULT 0;
		DELETE FROM appointments WHERE id = appointment->>'$.id';
	IF ROW_COUNT() > 0 THEN
		SET success=1;
	END IF;
	SELECT success;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_dentist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_dentist`(IN `dentist` JSON)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'delete logic dentist.'
BEGIN

DECLARE success TINYINT DEFAULT 0;
  DECLARE i BIGINT DEFAULT 0;
  DECLARE person JSON;
  SET person = dentist->>'$.person';

  DELETE FROM dentists WHERE id = dentist->>'$.id';

  IF ROW_COUNT() > 0 THEN
     CALL delete_person(person);
      SET success = 1;
  END IF;
  SELECT success;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_gender` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_gender`(IN `gender` JSON)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Logic deleted for a Gender'
BEGIN
	DECLARE success TINYINT DEFAULT 0;
	DELETE FROM genders WHERE id = gender->>'$.id';
	IF ROW_COUNT() > 0 THEN
		SET success=1;
	END IF;
	SELECT success;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_person` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_person`(IN `person` JSON)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Logic deletion for a person'
BEGIN
	DECLARE success TINYINT DEFAULT 0;
	DELETE FROM persons WHERE id = person->>'$.id';

    IF ROW_COUNT() > 0 THEN
		SET success=1;
	END IF;
	SELECT success;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_specialty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_specialty`(IN `specialty` JSON)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Logic deleted for a Specialty'
BEGIN
	DECLARE success TINYINT DEFAULT 0;
	DELETE FROM specialties WHERE id = specialty->>'.$.id';
	IF ROW_COUNT() > 0 THEN
		SET success=1;
	END IF;
	SELECT success;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_type_document` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_type_document`(IN `type_document` JSON)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Logic deleted for a Type Document'
BEGIN
	DECLARE success TINYINT DEFAULT 0;
	DELETE FROM type_documents WHERE id = type_document->>'$.id';
	IF ROW_COUNT() > 0 THEN
		SET success=1;
	END IF;
	SELECT success;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user`(IN `user` JSON)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'delete logic user.'
BEGIN

DECLARE success TINYINT DEFAULT 0;
  DECLARE i BIGINT DEFAULT 0;
  DECLARE person JSON;
  SET person = user->>'$.person';

  DELETE FROM users WHERE id = user->>'$.id';

  IF ROW_COUNT() > 0 THEN
     CALL delete_person(person);
      SET success = 1;
  END IF;
  SELECT success;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_appointments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_appointments`()
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Return all appointments limited by offset and limit.'
BEGIN
    SELECT JSON_ARRAYAGG(JSON_OBJECT('id', A.id, 'date', A.date, 'hour', A.hour, 'note', A.note,
      'user', JSON_OBJECT('id', U.id, 'typeUser', U.type_user,
                    'person', JSON_OBJECT('id',P.id, 'name', P.name, 'surname', P.surname, 'second_surname', P.second_surname,
                        'typeDocument', JSON_OBJECT('id', T.id, 'code', T.code,'name', T.name),
                        'document_number', P.document_number, 'imgUrl', P.img_url, 'numberPhone', P.number_phone,
                        'gender', JSON_OBJECT('id', G.id, 'code', G.code,'name', G.name))),
      'dentist', JSON_OBJECT('id', D.id, 'note', D.note,
                    'Specialty', JSON_OBJECT('id', S.id, 'name', S.name, 'state', S.state),
                    'person', JSON_OBJECT('id',PD.id, 'name', PD.name, 'surname', PD.surname, 'second_surname', PD.second_surname,
                        'typeDocument', JSON_OBJECT('id', TD.id, 'code', TD.code,'name', TD.name),
                        'document_number', PD.document_number, 'imgUrl', PD.img_url, 'numberPhone', PD.number_phone,
                        'gender', JSON_OBJECT('id', GD.id, 'code', GD.code,'name', GD.name))))) AS data
	    FROM appointments A INNER JOIN users U
      ON A.user_id = U.id INNER JOIN
      persons P ON U.person_id = P.id INNER JOIN
          genders G ON P.gender_id = G.id INNER JOIN
          type_documents T ON P.type_document_id = T.id INNER JOIN
      dentists D ON A.dentist_id = D.id INNER JOIN
         specialties S ON D.specialty_id = S.id INNER JOIN
         persons PD ON D.person_id = PD.id INNER JOIN
          genders GD ON P.gender_id = GD.id INNER JOIN
          type_documents TD ON PD.type_document_id = TD.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_appointments_by_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_appointments_by_user`(IN `_id` BIGINT, IN `_state` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Return all appointments limited by offset and limit.'
BEGIN
     SELECT JSON_ARRAYAGG(JSON_OBJECT('id', A.id, 'date', A.date, 'hour', A.hour,'note', A.note,
      'user', JSON_OBJECT('id', U.id, 'typeUser', U.type_user,
                    'person', JSON_OBJECT('id',P.id, 'name', P.name, 'surname', P.surname, 'second_surname', P.second_surname,
                        'typeDocument', JSON_OBJECT('id', T.id, 'code', T.code,'name', T.name),
                        'document_number', P.document_number, 'imgUrl', P.img_url, 'numberPhone', P.number_phone,
                        'gender', JSON_OBJECT('id', G.id, 'code', G.code,'name', G.name))),
      'dentist', JSON_OBJECT('id', D.id, 'note', D.note,
                    'Specialty', JSON_OBJECT('id', S.id, 'name', S.name, 'state', S.state),
                    'person', JSON_OBJECT('id',PD.id, 'name', PD.name, 'surname', PD.surname, 'second_surname', PD.second_surname,
                        'typeDocument', JSON_OBJECT('id', TD.id, 'code', TD.code,'name', TD.name),
                        'document_number', PD.document_number, 'imgUrl', PD.img_url, 'numberPhone', PD.number_phone,
                        'gender', JSON_OBJECT('id', GD.id, 'code', GD.code,'name', GD.name))))) AS data
	    FROM appointments A INNER JOIN users U
      ON A.user_id = U.id INNER JOIN
      persons P ON U.person_id = P.id LEFT JOIN
          genders G ON P.gender_id = G.id LEFT JOIN
          type_documents T ON P.type_document_id = T.id INNER JOIN
      dentists D ON A.dentist_id = D.id INNER JOIN
         specialties S ON D.specialty_id = S.id INNER JOIN
         persons PD ON D.person_id = PD.id LEFT JOIN
          genders GD ON P.gender_id = GD.id LEFT JOIN
          type_documents TD ON PD.type_document_id = TD.id
    WHERE U.id = _id AND A.state = _state;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_dentists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_dentists`()
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Return a Dentist by id.'
BEGIN
  SELECT JSON_ARRAYAGG(JSON_OBJECT('id', D.id, 'note', D.note,
                    'Specialty', JSON_OBJECT('id', S.id, 'name', S.name, 'state', S.state),
                    'person', JSON_OBJECT('id',P.id, 'name', P.name, 'surname', P.surname, 'second_surname', P.second_surname,
                        'typeDocument', JSON_OBJECT('id', T.id, 'code', T.code,'name', T.name),
                        'document_number', document_number, 'imgUrl', P.img_url, 'numberPhone', P.number_phone,
                        'gender', JSON_OBJECT('id', G.id, 'code', G.code,'name', G.name)))) data
    FROM dentists D INNER JOIN
         specialties S ON D.specialty_id = S.id INNER JOIN
         persons P ON D.person_id = P.id INNER JOIN
          genders G ON P.gender_id = G.id INNER JOIN
          type_documents T ON P.type_document_id = T.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_genders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_genders`()
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Return all Genders limited by offset and limit.'
BEGIN
    SELECT JSON_ARRAYAGG(JSON_OBJECT('id', id, 'code', code, 'name', name)) AS data
    FROM genders;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_persons` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_persons`()
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Return all persons limited by offset and limit.'
BEGIN
  SELECT JSON_ARRAYAGG(JSON_OBJECT('id',P.id, 'name', P.name, 'surname', P.surname, 'second_surname', P.second_surname,
          'typeDocument', JSON_OBJECT('id', T.id, 'code', T.code,'name', T.name),
          'document_number', document_number, 'imgUrl', P.img_url, 'numberPhone', P.number_phone,
          'gender', JSON_OBJECT('id', G.id, 'code', G.code,'name', G.name))) data
     FROM persons P INNER JOIN
          genders G ON gender_id = G.id INNER JOIN
          type_documents T ON P.type_document_id = T.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_specialties` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_specialties`()
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Return all Type Documents limited by offset and limit.'
BEGIN
    SELECT JSON_ARRAYAGG(JSON_OBJECT('id', id, 'code', code, 'state', state, 'name', name)) AS data
    FROM specialties;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_type_documents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_type_documents`()
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Return all Type Documents limited by offset and limit.'
BEGIN
    SELECT JSON_ARRAYAGG(JSON_OBJECT('id', id, 'code', code, 'name', name)) AS data
    FROM type_documents;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_users` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_users`()
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Return a user by id.'
BEGIN
  SELECT JSON_ARRAYAGG(JSON_OBJECT('id', U.id, 'typeUser', U.type_user, 'password', U.password,
                    'person', JSON_OBJECT('id',P.id, 'name', P.name, 'email', P.email,'surname', P.surname, 'secondSurname', P.second_surname,
                        'typeDocument', JSON_OBJECT('id', T.id, 'code', T.code,'name', T.name),
                        'documentNumber', document_number, 'imgUrl', P.img_url, 'numberPhone', P.number_phone,
                        'gender', JSON_OBJECT('id', G.id, 'code', G.code,'name', G.name)))) data
    FROM users U INNER JOIN
         persons P ON U.person_id = P.id LEFT JOIN
          genders G ON P.gender_id = G.id LEFT JOIN
          type_documents T ON P.type_document_id = T.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_appointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_appointment`(IN `_id` BIGINT)
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Return a appointment by id is.'
BEGIN
    SELECT JSON_OBJECT('id', A.id, 'date', A.date, 'hour',TIME_FORMAT(A.hour, "%h:%i %p"), 'note', A.note,
      'user', JSON_OBJECT('id', U.id, 'typeUser', U.type_user,
                    'person', JSON_OBJECT('id',P.id, 'name', P.name, 'surname', P.surname, 'second_surname', P.second_surname,
                        'typeDocument', JSON_OBJECT('id', T.id, 'code', T.code,'name', T.name),
                        'document_number', P.document_number, 'imgUrl', P.img_url, 'numberPhone', P.number_phone,
                        'gender', JSON_OBJECT('id', G.id, 'code', G.code,'name', G.name))),
      'dentist', JSON_OBJECT('id', D.id, 'note', D.note,
                    'Specialty', JSON_OBJECT('id', S.id, 'name', S.name, 'state', S.state),
                    'person', JSON_OBJECT('id',PD.id, 'name', PD.name, 'surname', PD.surname, 'second_surname', PD.second_surname,
                        'typeDocument', JSON_OBJECT('id', TD.id, 'code', TD.code,'name', TD.name),
                        'document_number', PD.document_number, 'imgUrl', PD.img_url, 'numberPhone', PD.number_phone,
                        'gender', JSON_OBJECT('id', GD.id, 'code', GD.code,'name', GD.name))))  data
	    FROM appointments A INNER JOIN users U
      ON A.user_id = U.id INNER JOIN
      persons P ON U.person_id = P.id INNER JOIN
          genders G ON P.gender_id = G.id INNER JOIN
          type_documents T ON P.type_document_id = T.id INNER JOIN
      dentists D ON A.dentist_id = D.id INNER JOIN
         specialties S ON D.specialty_id = S.id INNER JOIN
         persons PD ON D.person_id = PD.id INNER JOIN
          genders GD ON P.gender_id = GD.id INNER JOIN
          type_documents TD ON PD.type_document_id = TD.id
	   WHERE  (A.id = _id OR _id IS NULL);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_dentist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_dentist`(IN `_id` BIGINT)
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Return a Dentist by id.'
BEGIN
  SELECT JSON_OBJECT('id', D.id, 'note', D.note,
                    'Specialty', JSON_OBJECT('id', S.id, 'name', S.name, 'state', S.state),
                    'person', JSON_OBJECT('id',P.id, 'name', P.name, 'surname', P.surname, 'second_surname', P.second_surname,
                        'typeDocument', JSON_OBJECT('id', T.id, 'code', T.code,'name', T.name),
                        'document_number', document_number, 'imgUrl', P.img_url, 'numberPhone', P.number_phone,
                        'gender', JSON_OBJECT('id', G.id, 'code', G.code,'name', G.name))) data
    FROM dentists D INNER JOIN
         specialties S ON D.specialty_id = S.id INNER JOIN
         persons P ON D.person_id = P.id INNER JOIN
          genders G ON P.gender_id = G.id INNER JOIN
          type_documents T ON P.type_document_id = T.id
    WHERE D.id != 0 AND D.id = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_gender` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_gender`(IN `_id` BIGINT)
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Return a Gender by id is.'
BEGIN
    SELECT JSON_OBJECT('id', id, 'code', code, 'name', name) AS data
	    FROM genders
	     WHERE (id = _id OR _id IS NULL);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_person` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_person`(IN `_id` BIGINT)
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Return a person by id.'
BEGIN
  SELECT JSON_OBJECT('id',P.id, 'name', P.name, 'surname', P.surname, 'second_surname', P.second_surname,
          'typeDocument', JSON_OBJECT('id', T.id, 'code', T.code,'name', T.name),
          'document_number', document_number, 'imgUrl', P.img_url, 'numberPhone', P.number_phone,
          'gender', JSON_OBJECT('id', G.id, 'code', G.code,'name', G.name)) data
    FROM persons P INNER JOIN
          genders G ON gender_id = G.id INNER JOIN
          type_documents T ON type_documents = T.id
    WHERE P.id != 0 AND P.id = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_specialty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_specialty`(IN `_id` BIGINT)
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Return a Type Document by id is.'
BEGIN
    SELECT JSON_OBJECT('id', id, 'code', code,'state', state,  'name', name) AS data
	    FROM specialties
	     WHERE (id = _id OR _id IS NULL);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_type_document` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_type_document`(IN `_id` BIGINT)
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Return a Type Document by id is.'
BEGIN
    SELECT JSON_OBJECT('id', id, 'code', code, 'name', name) AS data
	    FROM type_documents
	     WHERE (id = _id OR _id IS NULL);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user`(IN `_id` BIGINT)
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Return a user by id.'
BEGIN
  SELECT JSON_OBJECT('id', U.id, 'typeUser', U.type_user,'password', U.password,
                    'person', JSON_OBJECT('id',P.id, 'name', P.name, 'email', P.email, 'surname', P.surname, 'secondSurname', P.second_surname,
                        'typeDocument', JSON_OBJECT('id', T.id, 'code', T.code,'name', T.name),
                        'documentNumber', document_number, 'imgUrl', P.img_url, 'numberPhone', P.number_phone,
                        'gender', JSON_OBJECT('id', G.id, 'code', G.code,'name', G.name))) data
    FROM users U INNER JOIN
         persons P ON U.person_id = P.id LEFT JOIN
          genders G ON P.gender_id = G.id LEFT JOIN
          type_documents T ON P.type_document_id = T.id
    WHERE U.id != 0 AND U.id = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_by_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_by_email`(IN `_email` VARCHAR(100))
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Return a user by id.'
BEGIN
  SELECT JSON_OBJECT('id', U.id, 'typeUser', U.type_user, 'password', U.password,
                    'person', JSON_OBJECT('id',P.id, 'name', P.name, 'email', P.email, 'surname', P.surname, 'secondSurname', P.second_surname,
                        'typeDocument', JSON_OBJECT('id', T.id, 'code', T.code,'name', T.name),
                        'documentNumber', document_number, 'imgUrl', P.img_url, 'numberPhone', P.number_phone,
                        'gender', JSON_OBJECT('id', G.id, 'code', G.code,'name', G.name))) data
    FROM users U INNER JOIN
         persons P ON U.person_id = P.id LEFT JOIN
          genders G ON P.gender_id = G.id LEFT JOIN
          type_documents T ON P.type_document_id = T.id
    WHERE P.email = _email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_appointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_appointment`(IN `appointment` JSON)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'update a appointment'
BEGIN
	DECLARE success TINYINT DEFAULT 0;
  DECLARE dentist, user JSON;
  SET dentist = appointment->>'$.dentist';
  SET user = appointment->>'$.user';
	UPDATE appointments
     SET dentist_id = dentist->>'$.id',
         user_id = user->>'$.id',
         date = appointment->>'$.date',
         hour = appointment->>'$.hour',
         note = appointment->>'$.note'
   WHERE id = appointment->>'$.id';
	IF ROW_COUNT() > 0 THEN
		SET success = 1;
	END IF;
	SELECT success;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_dentist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_dentist`(IN `dentist` JSON)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Update a dentist.'
BEGIN
	DECLARE person, specialty JSON;
	DECLARE success TINYINT DEFAULT 0;
  DECLARE i BIGINT DEFAULT 0;
  SET person = dentist->>'$.person';
  SET specialty = dentist->>'$.specialty';

	UPDATE dentists
	   SET note = dentist->>'$.note',
         specialty_id = specialty->>'$.id'
	 WHERE id = dentist->>'$.id';


    CALL update_person(person);

    IF ROW_COUNT() > 0 THEN
        SET success = 1;
    END IF;

    SELECT success;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_gender` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_gender`(IN `gender` JSON)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'update a Gender'
BEGIN
	DECLARE success TINYINT DEFAULT 0;
	UPDATE genders
     SET code = gender->>'$.code',
         name = gender->>'$.name'
   WHERE id = gender->>'$.id';
	IF ROW_COUNT() > 0 THEN
		SET success = 1;
	END IF;
	SELECT success;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_person` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_person`(IN `person` JSON)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Update a person.'
BEGIN
	DECLARE gender , type_document JSON;
	DECLARE success TINYINT DEFAULT 0;
    DECLARE i BIGINT;
    SET gender = person->>'$.gender';
	SET type_document = person->>'$.typeDocument';

	UPDATE persons
	   SET name = person->>'$.name',
	       surname = person->>'$.surname',
	       second_surname = person->>'$.secondSurname' OR NULL,
	       gender_id = gender->>'$.id' OR NULL,
	       type_document_id = type_document->>'$.id' OR NULL,
	       document_number = person->>'$.documentNumber',
	       img_url = person->>'$.imgUrl' OR NULL,
           number_phone = person->>'$.numberPhone' OR NULL,
           email = person->>'$.email'
	 WHERE id = person->>'$.id';

    IF ROW_COUNT() > 0 THEN
		SET success = 1;
	END IF;
	SELECT success;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_specialty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_specialty`(IN `specialty` JSON)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'update a Type Document'
BEGIN
	DECLARE success TINYINT DEFAULT 0;
	UPDATE specialties
     SET state = specialty->>'$.state',
         name = specialty->>'$.name',
         code = specialty->>'$.code'
   WHERE id = specialty->>'$.id';
	IF ROW_COUNT() > 0 THEN
		SET success = 1;
	END IF;
	SELECT success;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_type_document` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_type_document`(IN `type_document` JSON)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'update a Type Document'
BEGIN
	DECLARE success TINYINT DEFAULT 0;
	UPDATE type_documents
     SET code = type_document->>'$.code',
         name = type_document->>'$.name'
   WHERE id = type_document->>'$.id';
	IF ROW_COUNT() > 0 THEN
		SET success = 1;
	END IF;
	SELECT success;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user`(IN `user` JSON)
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Update a user.'
BEGIN
	DECLARE person JSON;
	DECLARE success TINYINT DEFAULT 0;
  DECLARE i BIGINT DEFAULT 0;
  SET person = user->>'$.person';

	UPDATE users
	   SET password = user->>'$.password',
           type_user = user->>'$.typeUser'
	 WHERE id = user->>'$.id';

    CALL update_person(person);

    IF ROW_COUNT() > 0 THEN
        SET success = 1;
    END IF;

    SELECT success;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-25 19:06:28
