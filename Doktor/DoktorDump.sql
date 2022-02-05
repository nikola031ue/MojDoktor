-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: doktor2
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
-- Table structure for table `dijagnoza`
--

DROP TABLE IF EXISTS `dijagnoza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dijagnoza` (
  `idDijagnoza` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) DEFAULT NULL,
  `opis` varchar(100) DEFAULT NULL,
  `idPregled` int NOT NULL,
  PRIMARY KEY (`idDijagnoza`),
  KEY `fk_dijagnoza_pregled1` (`idPregled`),
  CONSTRAINT `fk_dijagnoza_pregled1` FOREIGN KEY (`idPregled`) REFERENCES `pregled` (`idPregled`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dijagnoza`
--

LOCK TABLES `dijagnoza` WRITE;
/*!40000 ALTER TABLE `dijagnoza` DISABLE KEYS */;
INSERT INTO `dijagnoza` VALUES (3,'Upala','Bol u grlu',6),(12,'Upala misica','Bol u misicima',10),(13,'Infekcija srednjeg uha','Bol u srednjem uhu',10),(65,'Mucnina','Nekoliko puta povracala i imala proliv.',14),(66,'Astma','Otezano disanje i kaslje.',17),(67,'Upala pluca','Previse pusi',16),(68,'Kasalj','Pio hladnu vodu',19);
/*!40000 ALTER TABLE `dijagnoza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doktor`
--

DROP TABLE IF EXISTS `doktor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doktor` (
  `idDoktor` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(45) DEFAULT NULL,
  `prezime` varchar(45) DEFAULT NULL,
  `brojPregledaPoDanu` int DEFAULT NULL,
  `idSpecijalizacija` int NOT NULL,
  PRIMARY KEY (`idDoktor`),
  KEY `fk_doktor_specijalizacija1` (`idSpecijalizacija`),
  CONSTRAINT `fk_doktor_specijalizacija1` FOREIGN KEY (`idSpecijalizacija`) REFERENCES `specijalizacija` (`idSpecijalizacija`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doktor`
--

LOCK TABLES `doktor` WRITE;
/*!40000 ALTER TABLE `doktor` DISABLE KEYS */;
INSERT INTO `doktor` VALUES (3,'Danica','Gruicic',0,3),(5,'Branimir','Nestorovic',0,2),(10,'Ivan','Ivanovic',0,2),(11,'Goran','Goranovic',0,3),(12,'admin2','admin2',0,1),(14,'Dzejms','Vilson',0,23),(15,'Sanja','Jolic',0,24),(16,'Milica','Milica',0,3);
/*!40000 ALTER TABLE `doktor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `korisnik`
--

DROP TABLE IF EXISTS `korisnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `korisnik` (
  `idKorisnik` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `idPacijent` int DEFAULT NULL,
  `idDoktor` int DEFAULT NULL,
  `idUloga` int NOT NULL,
  PRIMARY KEY (`idKorisnik`),
  KEY `fk_korisnik_pacijent1_idx` (`idPacijent`),
  KEY `fk_korisnik_doktor1_idx` (`idDoktor`),
  KEY `fk_korisnik_uloga1_idx` (`idUloga`),
  CONSTRAINT `fk_korisnik_doktor1` FOREIGN KEY (`idDoktor`) REFERENCES `doktor` (`idDoktor`),
  CONSTRAINT `fk_korisnik_pacijent1` FOREIGN KEY (`idPacijent`) REFERENCES `pacijent` (`idPacijent`),
  CONSTRAINT `fk_korisnik_uloga1` FOREIGN KEY (`idUloga`) REFERENCES `uloga` (`idUloga`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korisnik`
--

LOCK TABLES `korisnik` WRITE;
/*!40000 ALTER TABLE `korisnik` DISABLE KEYS */;
INSERT INTO `korisnik` VALUES (1,'ivan123','$2a$10$Uv0os3a2vsF6XXk2GF8cYuJKU6hEzeZkflJcRIyiDoocVICdtIXMC',5,NULL,3),(4,'nestor','$2a$10$2KsS5n4c7lLR8ebm0RtrquiTVTXWFIF84ytZrugOkHvdFzwn4US4y',NULL,5,2),(10,'goran','$2a$10$65KVTXY4dxFXN34llb9qZejFuZ6y17nnWV7JAGeBNaPTFXOqCPefi',NULL,11,2),(11,'admin2','$2a$10$2TCTF2Rb1ls.USEu1IoHTe3Gen9ht6h4HmBU1f.Yg5HLtZYjwPeUG',NULL,12,1),(12,'sinan','$2a$10$SEQHG4v8NE6Y3BAHv6fA8OgK2INIWaTdm5u2hNiur2Zgi7MuSvr82',6,NULL,3),(15,'mica','$2a$10$131bO7dU394UZIQTblhGFO1EE/CWLBM58Pv0bnP15XtqOn5ktdGgm',8,NULL,3),(16,'vilson','$2a$10$pHqaFne007jms3A64LJ5OOAJ9HdDL9BbxowDFUew/jGlhwH1sQQmq',NULL,14,2),(17,'sanja','$2a$10$Giaun9rbfxGm06DBImx9xOpjXiyo9ACuK1cawAM9k3D2S17S8nOVq',NULL,15,2),(18,'slova','$2a$10$Af6OYlrXXQxqT.9MsXMSA.BDm2wShd4H71HZusbIjnmRiYFc/xUfS',9,NULL,3),(19,'mica1','$2a$10$.4Lhc7ADREsqf1AZEjbehOwQOAzvsVHzXW5kqdFMMSrw18hHgHzPS',NULL,16,2);
/*!40000 ALTER TABLE `korisnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lek`
--

DROP TABLE IF EXISTS `lek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lek` (
  `idLek` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idLek`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lek`
--

LOCK TABLES `lek` WRITE;
/*!40000 ALTER TABLE `lek` DISABLE KEYS */;
INSERT INTO `lek` VALUES (5,'Paracetamol'),(6,'Andol'),(11,'Palitreks'),(12,'Kardiopirin'),(13,'Panklav'),(14,'Kafetin'),(19,'Probiotik'),(20,'Propomucil 600g');
/*!40000 ALTER TABLE `lek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lekdijagnoza`
--

DROP TABLE IF EXISTS `lekdijagnoza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lekdijagnoza` (
  `idLekdijagnoza` int NOT NULL AUTO_INCREMENT,
  `idLek` int DEFAULT NULL,
  `idDijagnoza` int NOT NULL,
  PRIMARY KEY (`idLekdijagnoza`),
  KEY `fk_lek_has_dijagnoza_dijagnoza1` (`idDijagnoza`),
  KEY `fk_lek_has_dijagnoza_lek1` (`idLek`),
  CONSTRAINT `fk_lek_has_dijagnoza_dijagnoza1` FOREIGN KEY (`idDijagnoza`) REFERENCES `dijagnoza` (`idDijagnoza`),
  CONSTRAINT `fk_lek_has_dijagnoza_lek1` FOREIGN KEY (`idLek`) REFERENCES `lek` (`idLek`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lekdijagnoza`
--

LOCK TABLES `lekdijagnoza` WRITE;
/*!40000 ALTER TABLE `lekdijagnoza` DISABLE KEYS */;
INSERT INTO `lekdijagnoza` VALUES (2,NULL,3),(8,6,12),(9,13,13),(61,19,65),(62,20,66),(63,20,67),(64,11,68);
/*!40000 ALTER TABLE `lekdijagnoza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacijent`
--

DROP TABLE IF EXISTS `pacijent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacijent` (
  `idPacijent` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(45) DEFAULT NULL,
  `prezime` varchar(45) DEFAULT NULL,
  `datumRodjenja` date DEFAULT NULL,
  PRIMARY KEY (`idPacijent`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacijent`
--

LOCK TABLES `pacijent` WRITE;
/*!40000 ALTER TABLE `pacijent` DISABLE KEYS */;
INSERT INTO `pacijent` VALUES (3,'Ivan','Ivanovic',NULL),(4,'Ivan','Ivanovic',NULL),(5,'Ivan','Ivanovic',NULL),(6,'Sinan','Sakic','2022-01-10'),(8,'Mica','Micic','2022-02-16'),(9,'Slovenka','Antonijevic','1949-04-04');
/*!40000 ALTER TABLE `pacijent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacijentdijagnoza`
--

DROP TABLE IF EXISTS `pacijentdijagnoza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacijentdijagnoza` (
  `idPacijentdijagnoza` int NOT NULL AUTO_INCREMENT,
  `idDijagnoza` int NOT NULL,
  `idPacijent` int NOT NULL,
  PRIMARY KEY (`idPacijentdijagnoza`),
  KEY `fk_pacijentdijagnoza_dijagnoza1` (`idDijagnoza`),
  KEY `fk_pacijentdijagnoza_pacijent1` (`idPacijent`),
  CONSTRAINT `fk_pacijentdijagnoza_dijagnoza1` FOREIGN KEY (`idDijagnoza`) REFERENCES `dijagnoza` (`idDijagnoza`),
  CONSTRAINT `fk_pacijentdijagnoza_pacijent1` FOREIGN KEY (`idPacijent`) REFERENCES `pacijent` (`idPacijent`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacijentdijagnoza`
--

LOCK TABLES `pacijentdijagnoza` WRITE;
/*!40000 ALTER TABLE `pacijentdijagnoza` DISABLE KEYS */;
INSERT INTO `pacijentdijagnoza` VALUES (2,3,3),(3,12,6),(4,13,6),(56,65,8),(57,66,9),(58,67,8),(59,68,6);
/*!40000 ALTER TABLE `pacijentdijagnoza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregled`
--

DROP TABLE IF EXISTS `pregled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pregled` (
  `idPregled` int NOT NULL AUTO_INCREMENT,
  `datumVreme` datetime DEFAULT NULL,
  `idDoktor` int NOT NULL,
  `idPacijent` int NOT NULL,
  PRIMARY KEY (`idPregled`),
  KEY `fk_pregled_doktor1` (`idDoktor`),
  KEY `fk_pregled_pacijent1` (`idPacijent`),
  CONSTRAINT `fk_pregled_doktor1` FOREIGN KEY (`idDoktor`) REFERENCES `doktor` (`idDoktor`),
  CONSTRAINT `fk_pregled_pacijent1` FOREIGN KEY (`idPacijent`) REFERENCES `pacijent` (`idPacijent`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregled`
--

LOCK TABLES `pregled` WRITE;
/*!40000 ALTER TABLE `pregled` DISABLE KEYS */;
INSERT INTO `pregled` VALUES (6,'2020-02-03 00:00:00',3,3),(7,'2022-02-02 00:00:00',5,6),(8,'2022-02-04 00:00:00',10,6),(9,'2022-01-18 09:00:00',10,6),(10,'2022-01-19 09:00:00',3,6),(11,'2022-01-03 10:25:00',11,6),(12,'2022-01-18 09:30:00',3,6),(13,'2022-01-11 10:00:00',11,6),(14,'2022-02-03 11:20:00',14,8),(16,'2022-02-25 08:55:00',5,8),(17,'2022-02-03 08:00:00',15,9),(18,'2022-02-17 08:00:00',5,8),(19,'2022-02-08 08:00:00',16,6);
/*!40000 ALTER TABLE `pregled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specijalizacija`
--

DROP TABLE IF EXISTS `specijalizacija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specijalizacija` (
  `idSpecijalizacija` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idSpecijalizacija`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specijalizacija`
--

LOCK TABLES `specijalizacija` WRITE;
/*!40000 ALTER TABLE `specijalizacija` DISABLE KEYS */;
INSERT INTO `specijalizacija` VALUES (1,'Kardiolog'),(2,'Pulmolog'),(3,'Neurolog'),(9,'Urolog'),(18,'Radiolog'),(23,'Oftamolog'),(24,'Internista');
/*!40000 ALTER TABLE `specijalizacija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uloga`
--

DROP TABLE IF EXISTS `uloga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uloga` (
  `idUloga` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUloga`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uloga`
--

LOCK TABLES `uloga` WRITE;
/*!40000 ALTER TABLE `uloga` DISABLE KEYS */;
INSERT INTO `uloga` VALUES (1,'ADMIN'),(2,'DOKTOR'),(3,'PACIJENT');
/*!40000 ALTER TABLE `uloga` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-05 23:12:53
