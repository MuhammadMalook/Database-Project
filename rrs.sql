CREATE DATABASE  IF NOT EXISTS `rrs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `rrs`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: rrs
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `adminID` varchar(10) NOT NULL,
  `First_Name` varchar(30) NOT NULL,
  `Last_Name` varchar(30) NOT NULL,
  `Password` varchar(20) NOT NULL,
  PRIMARY KEY (`adminID`),
  UNIQUE KEY `Password` (`Password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES ('007','Shahbaz','Arain','paki123'),('008','Malook','Mahar','iba123'),('9','Ali','Mahar','ali123');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengers` (
  `Passenger_ID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(30) NOT NULL,
  `Last_Name` varchar(30) NOT NULL,
  `CNIC` varchar(15) NOT NULL,
  `age` int DEFAULT NULL,
  `Ticket_Number` int DEFAULT NULL,
  PRIMARY KEY (`Passenger_ID`),
  UNIQUE KEY `CNIC` (`CNIC`),
  KEY `Passengers` (`Ticket_Number`),
  CONSTRAINT `passengers_ibfk_1` FOREIGN KEY (`Ticket_Number`) REFERENCES `tickets` (`Ticket_Number`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengers`
--

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
INSERT INTO `passengers` VALUES (2,'Humza','Muneer','45101-3456034-5',23,2005),(3,'Asad','Ali','45101-345433-5',20,2003),(4,'Rameez','Ali','45101-3256021-5',30,2001),(5,'Humza','laghari','45101-7583944-5',45,2004),(6,'Bakhtiar','Mahar','45101-3572394-5',60,2006),(7,'Shahid','Ali','45103-8743760-3',20,2006),(8,'Aijaz','Ahmed','45103-4535679-3',30,2011),(9,'Alim','Mahar','45103-2748923-2',22,2012),(10,'Ahsan','khan','45104-3784912-5',23,2013),(11,'Adnan','Akmal','45103-4365730-4',40,2014),(12,'Kamran','Akmal','45103-4367483-5',33,2015),(13,'Ali','Hassan','45103-436484-4',34,2016);
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations` (
  `Station_Name` varchar(50) NOT NULL,
  `Train_Name` varchar(30) DEFAULT NULL,
  `Station_Platform` int NOT NULL,
  PRIMARY KEY (`Station_Name`),
  KEY `STATIONS` (`Train_Name`),
  CONSTRAINT `stations_ibfk_1` FOREIGN KEY (`Train_Name`) REFERENCES `trains` (`Train_Name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES ('Ghotki','Allama Iqbal',4),('Islamabad','Hazara Express',5),('Multan','Badar Express',3),('Rahim yar Khan','Khyber Mail',2),('Sukkur','Awam Express',1);
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `Ticket_Number` int NOT NULL AUTO_INCREMENT,
  `Train_Name` varchar(30) DEFAULT NULL,
  `Ticket_date` date NOT NULL,
  PRIMARY KEY (`Ticket_Number`),
  KEY `Tickets` (`Train_Name`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`Train_Name`) REFERENCES `trains` (`Train_Name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2017 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (2001,'Badar Express','2020-07-23'),(2002,'Khyber Mail','2020-07-20'),(2003,'Awam Express','2020-09-19'),(2004,'Khyber Mail','2020-06-21'),(2005,'Khyber Mail','2020-02-14'),(2006,'Awam Express','2020-04-10'),(2011,'Khyber Mail','2020-07-20'),(2012,'Khyber Mail','2020-07-20'),(2013,'Khyber Mail','2020-07-20'),(2014,'Badar Express','2020-07-20'),(2015,'Hazara Express','2020-07-20'),(2016,'Allama Iqbal','2020-07-20');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trains`
--

DROP TABLE IF EXISTS `trains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trains` (
  `Train_Name` varchar(30) NOT NULL,
  `Train_capacity` int NOT NULL,
  `Departure_Time` varchar(20) DEFAULT NULL,
  `Arrival_Time` varchar(20) DEFAULT NULL,
  `DAY` varchar(50) NOT NULL,
  `Train_start` varchar(50) NOT NULL,
  `Train_stop` varchar(50) NOT NULL,
  `Ticket_Amount` int DEFAULT NULL,
  PRIMARY KEY (`Train_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trains`
--

LOCK TABLES `trains` WRITE;
/*!40000 ALTER TABLE `trains` DISABLE KEYS */;
INSERT INTO `trains` VALUES ('Allama Iqbal',150,'1:00 PM','4:00 PM','Sunday','Ghotki','Rohri',1000),('Awam Express',450,'8:00 PM','2:00 AM','Saturday','Sukkur','Karachi',2000),('Badar Express',200,'8:00 AM','12:00 PM','Monday','Multan','Sadiqabad',800),('Hazara Express',120,'3:00 PM','8:00 PM','Tueday','Isalamabad','Lahore',1200),('Khyber Mail',400,'9:30 AM','12:00 PM','Friday','Rahim Yar khan','Daharki',120);
/*!40000 ALTER TABLE `trains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'rrs'
--
/*!50003 DROP PROCEDURE IF EXISTS `INSERTINFO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTINFO`(IN fname varchar(20), IN lname varchar(20), IN nic varchar(15), IN age int, IN stname varchar(50))
BEGIN
SELECT stations.TRAIN_NAME,current_date() 
INTO @tname,@date
FROM stations join trains using(Train_name) WHERE Station_Name=stname; 
INSERT INTO TICKETS VALUES
(null,@tname,@date);
SELECT Ticket_Number INTO @tn FROM tickets ORDER by Ticket_Number DESC limit 1;
INSERT INTO passengers VALUES
(null,fname,lname,nic,age,@tn);
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

-- Dump completed on 2020-07-21 11:03:16
