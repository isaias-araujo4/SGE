-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sge
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `entrada_produto`
--

DROP TABLE IF EXISTS `entrada_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrada_produto` (
  `idEntrada_Produto` int NOT NULL AUTO_INCREMENT,
  `Quantidade_Entrada` int NOT NULL,
  `Data_Entrada` date NOT NULL,
  `Hora_Entrada` time NOT NULL,
  `Observacao` varchar(45) DEFAULT NULL,
  `Produto_idProduto` int NOT NULL,
  `Funcionario_idFuncionario` int NOT NULL,
  `Nota_Fiscal_idNota_Fiscal` int NOT NULL,
  PRIMARY KEY (`idEntrada_Produto`),
  KEY `fk_Entrada_Produto_Produto1_idx` (`Produto_idProduto`),
  KEY `fk_Entrada_Produto_Funcionario1_idx` (`Funcionario_idFuncionario`),
  KEY `fk_Entrada_Produto_Nota_Fiscal1` (`Nota_Fiscal_idNota_Fiscal`),
  CONSTRAINT `fk_Entrada_Produto_Funcionario1` FOREIGN KEY (`Funcionario_idFuncionario`) REFERENCES `funcionario` (`idFuncionario`),
  CONSTRAINT `fk_Entrada_Produto_Nota_Fiscal1` FOREIGN KEY (`Nota_Fiscal_idNota_Fiscal`) REFERENCES `nota_fiscal` (`idNota_Fiscal`),
  CONSTRAINT `fk_Entrada_Produto_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada_produto`
--

LOCK TABLES `entrada_produto` WRITE;
/*!40000 ALTER TABLE `entrada_produto` DISABLE KEYS */;
INSERT INTO `entrada_produto` VALUES (1,10,'2025-01-28','22:19:59','',1,1,1);
/*!40000 ALTER TABLE `entrada_produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-28 23:10:12
