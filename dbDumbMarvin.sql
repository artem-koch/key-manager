CREATE DATABASE  IF NOT EXISTS `key-manager` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `key-manager`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: key-manager
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Marvin','Schmidt');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raueme`
--

DROP TABLE IF EXISTS `raueme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raueme` (
  `rid` int(10) NOT NULL AUTO_INCREMENT,
  `raumname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raueme`
--

LOCK TABLES `raueme` WRITE;
/*!40000 ALTER TABLE `raueme` DISABLE KEYS */;
INSERT INTO `raueme` VALUES (1,'215');
/*!40000 ALTER TABLE `raueme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schluessel`
--

DROP TABLE IF EXISTS `schluessel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schluessel` (
  `sid` int(10) NOT NULL AUTO_INCREMENT,
  `schluesselNr` int(10) DEFAULT NULL,
  `bestand` int(10) DEFAULT NULL,
  `faerbung` int(10) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schluessel`
--

LOCK TABLES `schluessel` WRITE;
/*!40000 ALTER TABLE `schluessel` DISABLE KEYS */;
INSERT INTO `schluessel` VALUES (1,1,100,1);
/*!40000 ALTER TABLE `schluessel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schluesselpasstzuzylinder`
--

DROP TABLE IF EXISTS `schluesselpasstzuzylinder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schluesselpasstzuzylinder` (
  `szid` int(10) NOT NULL AUTO_INCREMENT,
  `zid` int(10) DEFAULT NULL,
  `sid` int(10) DEFAULT NULL,
  PRIMARY KEY (`szid`),
  KEY `zid` (`zid`),
  KEY `sid` (`sid`),
  CONSTRAINT `schluesselpasstzuzylinder_ibfk_1` FOREIGN KEY (`zid`) REFERENCES `zylinder` (`zid`) ON DELETE CASCADE,
  CONSTRAINT `schluesselpasstzuzylinder_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `schluessel` (`sid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schluesselpasstzuzylinder`
--

LOCK TABLES `schluesselpasstzuzylinder` WRITE;
/*!40000 ALTER TABLE `schluesselpasstzuzylinder` DISABLE KEYS */;
INSERT INTO `schluesselpasstzuzylinder` VALUES (1,1,1);
/*!40000 ALTER TABLE `schluesselpasstzuzylinder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL,
  `username` varchar(250) DEFAULT NULL,
  `pw` varchar(250) DEFAULT NULL,
  `privilege` int(10) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `pid` (`pid`),
  CONSTRAINT `user_account_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `person` (`pid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vergabevonschluesseln`
--

DROP TABLE IF EXISTS `vergabevonschluesseln`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vergabevonschluesseln` (
  `vid` int(10) NOT NULL AUTO_INCREMENT,
  `sid` int(10) DEFAULT NULL,
  `pid` int(10) DEFAULT NULL,
  `ausgabe_datum` date DEFAULT NULL,
  `rueckgabe_datum` date DEFAULT NULL,
  PRIMARY KEY (`vid`),
  KEY `pid` (`pid`),
  KEY `sid` (`sid`),
  CONSTRAINT `vergabevonschluesseln_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `person` (`pid`) ON DELETE CASCADE,
  CONSTRAINT `vergabevonschluesseln_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `schluessel` (`sid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vergabevonschluesseln`
--

LOCK TABLES `vergabevonschluesseln` WRITE;
/*!40000 ALTER TABLE `vergabevonschluesseln` DISABLE KEYS */;
INSERT INTO `vergabevonschluesseln` VALUES (1,1,1,'2000-01-01','2015-01-01');
/*!40000 ALTER TABLE `vergabevonschluesseln` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zylinder`
--

DROP TABLE IF EXISTS `zylinder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zylinder` (
  `zid` int(10) NOT NULL AUTO_INCREMENT,
  `bezeichnung` varchar(50) DEFAULT NULL,
  `bestand` int(10) DEFAULT NULL,
  `typ` varchar(10) DEFAULT NULL,
  `laengeInnen` int(10) DEFAULT NULL,
  `laengeAussen` int(10) DEFAULT NULL,
  PRIMARY KEY (`zid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zylinder`
--

LOCK TABLES `zylinder` WRITE;
/*!40000 ALTER TABLE `zylinder` DISABLE KEYS */;
INSERT INTO `zylinder` VALUES (1,'bla',10,'2',10,5);
/*!40000 ALTER TABLE `zylinder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zylinderwechsel`
--

DROP TABLE IF EXISTS `zylinderwechsel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zylinderwechsel` (
  `zwid` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(10) DEFAULT NULL,
  `zid` int(10) DEFAULT NULL,
  `einbau_datum` date DEFAULT NULL,
  `ausbau_datum` date DEFAULT NULL,
  PRIMARY KEY (`zwid`),
  KEY `rid` (`rid`),
  KEY `zid` (`zid`),
  CONSTRAINT `zylinderwechsel_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `raueme` (`rid`) ON DELETE CASCADE,
  CONSTRAINT `zylinderwechsel_ibfk_2` FOREIGN KEY (`zid`) REFERENCES `zylinder` (`zid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zylinderwechsel`
--

LOCK TABLES `zylinderwechsel` WRITE;
/*!40000 ALTER TABLE `zylinderwechsel` DISABLE KEYS */;
INSERT INTO `zylinderwechsel` VALUES (1,1,1,'2000-01-01','2015-01-01');
/*!40000 ALTER TABLE `zylinderwechsel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-14 19:47:22
