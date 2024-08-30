-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: company_constraints
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Current Database: `company_constraints`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `company_constraints` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `company_constraints`;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Dname` varchar(15) NOT NULL,
  `Dnumber` int NOT NULL,
  `Mgr_ssn` char(9) DEFAULT NULL,
  `Mgr_start_date` date DEFAULT NULL,
  `dept_create_date` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE KEY `unique_name_dept` (`Dname`),
  KEY `fk_dept` (`Mgr_ssn`),
  CONSTRAINT `fk_dept` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Ssn`) ON UPDATE CASCADE,
  CONSTRAINT `chk_date_dept` CHECK ((`dept_create_date` < `Mgr_start_date`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_locations`
--

DROP TABLE IF EXISTS `dept_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_locations` (
  `Dnumber` int NOT NULL,
  `Dlocation` varchar(15) NOT NULL,
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  CONSTRAINT `fk_dept_locations` FOREIGN KEY (`Dnumber`) REFERENCES `department` (`Dnumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_locations`
--

LOCK TABLES `dept_locations` WRITE;
/*!40000 ALTER TABLE `dept_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `dept_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Fname` varchar(15) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int NOT NULL,
  PRIMARY KEY (`Ssn`),
  KEY `fk_employee` (`Super_ssn`),
  CONSTRAINT `fk_employee` FOREIGN KEY (`Super_ssn`) REFERENCES `employee` (`Ssn`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `chk_salary_employee` CHECK ((`Salary` > 2000.0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `employess_salary_27000_view`
--

DROP TABLE IF EXISTS `employess_salary_27000_view`;
/*!50001 DROP VIEW IF EXISTS `employess_salary_27000_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employess_salary_27000_view` AS SELECT 
 1 AS `Nome`,
 1 AS `Salary`,
 1 AS `Dept_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employess_salary_view`
--

DROP TABLE IF EXISTS `employess_salary_view`;
/*!50001 DROP VIEW IF EXISTS `employess_salary_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employess_salary_view` AS SELECT 
 1 AS `Nome`,
 1 AS `Salary`,
 1 AS `Dept_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `Pname` varchar(15) NOT NULL,
  `Pnumber` int NOT NULL,
  `Plocation` varchar(15) DEFAULT NULL,
  `Dnum` int NOT NULL,
  PRIMARY KEY (`Pnumber`),
  UNIQUE KEY `unique_project` (`Pname`),
  KEY `fk_project` (`Dnum`),
  CONSTRAINT `fk_project` FOREIGN KEY (`Dnum`) REFERENCES `department` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_today`
--

DROP TABLE IF EXISTS `v_today`;
/*!50001 DROP VIEW IF EXISTS `v_today`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_today` AS SELECT 
 1 AS `today`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_on` (
  `Essn` char(9) NOT NULL,
  `Pno` int NOT NULL,
  `Hours` decimal(3,1) NOT NULL,
  PRIMARY KEY (`Essn`,`Pno`),
  KEY `fk_project_works_on` (`Pno`),
  CONSTRAINT `fk_employee_works_on` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`),
  CONSTRAINT `fk_project_works_on` FOREIGN KEY (`Pno`) REFERENCES `project` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'company_constraints'
--

--
-- Dumping routines for database 'company_constraints'
--

--
-- Current Database: `ecommerce_refinado`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ecommerce_refinado` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ecommerce_refinado`;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `Cliente_idClientePF` int DEFAULT NULL,
  `Cliente_idClientePJ` int DEFAULT NULL,
  `cliente_Email` varchar(30) NOT NULL,
  `Cliente_Celular` char(11) DEFAULT NULL,
  `Cliente_Telefone` char(10) DEFAULT NULL,
  `Cliente_CEP` char(8) NOT NULL,
  `Cliente_Logradouro` varchar(45) NOT NULL,
  `Cliente_Numero` varchar(5) DEFAULT NULL,
  `Cliente_Complemento` varchar(20) DEFAULT NULL,
  `Cliente_Bairro` varchar(15) NOT NULL,
  `Cliente_Municipio` varchar(20) NOT NULL,
  `Cliente_UF` char(2) NOT NULL,
  `Cliente_Regiao` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `unique_email_cliente` (`cliente_Email`),
  UNIQUE KEY `unique_celular_cliente` (`Cliente_Celular`),
  UNIQUE KEY `unique_telefone_cliente` (`Cliente_Telefone`),
  KEY `fk_idClientePF_ClientePF` (`Cliente_idClientePF`),
  KEY `fk_idClientePJ_ClientePJ` (`Cliente_idClientePJ`),
  CONSTRAINT `fk_idClientePF_ClientePF` FOREIGN KEY (`Cliente_idClientePF`) REFERENCES `clientepf` (`idClientePF`),
  CONSTRAINT `fk_idClientePJ_ClientePJ` FOREIGN KEY (`Cliente_idClientePJ`) REFERENCES `clientepj` (`idClientePJ`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,1,NULL,'Emano@emmc.com.br','83987417417',NULL,'57025458','rua silva de prata','29',NULL,'Carangola','Cidade das flores','PB','Nordeste'),(2,2,NULL,'saulo@sdc.com.br','82965452154','8233554411','88047596','Rua Manoel Soares DAzevedo Maia','255',NULL,'Carianos','Maceió','AL','Nordeste'),(3,3,NULL,'jorge@jtg.com.br',NULL,'6838485483','69919817','Rua N2','2',NULL,'Conjunto Tucumã','Rio Branco','AC','Norte'),(4,4,NULL,'ryan.vilar@geradornv.com.br','71993683614','7133230670','41950690','Travessa Professora Nilzete','54',NULL,'Rio Vermelho','Salvador','BA','Nordeste');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientepf`
--

DROP TABLE IF EXISTS `clientepf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientepf` (
  `idClientePF` int NOT NULL AUTO_INCREMENT,
  `ClientePF_CPF` char(11) NOT NULL,
  `ClientePF_Nome` varchar(10) NOT NULL,
  `ClientePF_Sobrenome` varchar(25) NOT NULL,
  `ClientePF_DataNascimento` date NOT NULL,
  PRIMARY KEY (`idClientePF`),
  UNIQUE KEY `unique_CPF_ClientePF` (`ClientePF_CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientepf`
--

LOCK TABLES `clientepf` WRITE;
/*!40000 ALTER TABLE `clientepf` DISABLE KEYS */;
INSERT INTO `clientepf` VALUES (1,'12346789421','Emanuel','M Carvalho','2002-07-05'),(2,'65487465254','Saulo','D Carvalho','2000-12-02'),(3,'12332125125','Jorge','T Galhardo','1997-05-13'),(4,'22664456504','Ryan','F Vilar','1973-03-24');
/*!40000 ALTER TABLE `clientepf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientepj`
--

DROP TABLE IF EXISTS `clientepj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientepj` (
  `idClientePJ` int NOT NULL AUTO_INCREMENT,
  `ClientePJ_CNPJ` char(15) NOT NULL,
  `ClientePJ_RazaoSocial` varchar(30) NOT NULL,
  `ClientePJ_NomeFantasia` varchar(30) NOT NULL,
  PRIMARY KEY (`idClientePJ`),
  UNIQUE KEY `unique_CNPJ_ClientePJ` (`ClientePJ_CNPJ`),
  UNIQUE KEY `unique_RazaoSocial_ClientePJ` (`ClientePJ_RazaoSocial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientepj`
--

LOCK TABLES `clientepj` WRITE;
/*!40000 ALTER TABLE `clientepj` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientepj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `idEstoque` int NOT NULL AUTO_INCREMENT,
  `Estoque_Cidade` varchar(45) NOT NULL,
  `Estoque_UF` char(2) NOT NULL,
  PRIMARY KEY (`idEstoque`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'Maceió','AL'),(2,'João Pessoa','PB'),(3,'Belo Horizonte','MG'),(4,'Manaus','AM'),(5,'São Paulo','SP'),(6,'Brasília','DF');
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoqueproduto`
--

DROP TABLE IF EXISTS `estoqueproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoqueproduto` (
  `Estoque_idEstoque` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  `EstoqueProduto_Quantidade` int NOT NULL,
  PRIMARY KEY (`Estoque_idEstoque`,`Produto_idProduto`),
  KEY `fk_idEstoqueProduto_Produto` (`Produto_idProduto`),
  CONSTRAINT `fk_idEstoqueProduto_Estoque` FOREIGN KEY (`Estoque_idEstoque`) REFERENCES `estoque` (`idEstoque`),
  CONSTRAINT `fk_idEstoqueProduto_Produto` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoqueproduto`
--

LOCK TABLES `estoqueproduto` WRITE;
/*!40000 ALTER TABLE `estoqueproduto` DISABLE KEYS */;
INSERT INTO `estoqueproduto` VALUES (1,3,100),(1,4,30),(1,5,15),(2,6,60),(3,3,200),(3,5,45),(4,6,300),(5,1,400),(5,2,300),(6,6,200);
/*!40000 ALTER TABLE `estoqueproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `idFornecedor` int NOT NULL AUTO_INCREMENT,
  `Fornecedor_CNPJ` char(14) NOT NULL,
  `Fornecedor_RazaoSocial` varchar(30) NOT NULL,
  `Fornecedor_NomeFantasia` varchar(30) NOT NULL,
  `Fornecedor_Email` varchar(30) NOT NULL,
  `Fornecedor_Celular` char(11) DEFAULT NULL,
  `Fornecedor_Telefone` char(10) DEFAULT NULL,
  `Fornecedor_CEP` char(8) NOT NULL,
  `Fornecedor_Logradouro` varchar(45) NOT NULL,
  `Fornecedor_Numero` varchar(5) DEFAULT NULL,
  `Fornecedor_Complemento` varchar(20) DEFAULT NULL,
  `Fornecedor_Bairro` varchar(15) NOT NULL,
  `Fornecedor_Municipio` varchar(30) NOT NULL,
  `Fornecedor_UF` char(2) NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE KEY `unique_CNPJ_Fornecedor` (`Fornecedor_CNPJ`),
  UNIQUE KEY `unique_RazaoSocial_Fornecedor` (`Fornecedor_RazaoSocial`),
  UNIQUE KEY `unique_Email_Fornecedor` (`Fornecedor_Email`),
  UNIQUE KEY `unique_Celular_Fornecedor` (`Fornecedor_Celular`),
  UNIQUE KEY `unique_Telefone_Fornecedor` (`Fornecedor_Telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'12345678912345','Almeida e filhos','Marquinhos construções','marquinhos@marquinhos.com.br','77955442232','7733150121','57435214','Rua abcs','542',NULL,'desconhecidos','Salvador','BA'),(2,'85419649143457','Eletrônicos Silva','Flavinho do eletrônico','flavinho@flavio.com.br',NULL,'6133998424','47895324','Rua Trindade','578',NULL,'Asa Norte','Ceilândia','DF'),(3,'93456789934695','Eletrônicos Emanoshow','Emanuelsonzin eletro','emanuelson@sonzin.com.br','83955554433',NULL,'69852457','Rua Ketchup','2878',NULL,'Tambaú','João Pessoa','PB');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedorproduto`
--

DROP TABLE IF EXISTS `fornecedorproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedorproduto` (
  `Fornecedor_idFornecedor` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  `FornecedorProduto_Quantidade` int NOT NULL,
  PRIMARY KEY (`Fornecedor_idFornecedor`,`Produto_idProduto`),
  KEY `fk_idFornecedorProduto_Produto` (`Produto_idProduto`),
  CONSTRAINT `fk_idFornecedor_Fornecedor` FOREIGN KEY (`Fornecedor_idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  CONSTRAINT `fk_idFornecedorProduto_Produto` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedorproduto`
--

LOCK TABLES `fornecedorproduto` WRITE;
/*!40000 ALTER TABLE `fornecedorproduto` DISABLE KEYS */;
INSERT INTO `fornecedorproduto` VALUES (1,3,1300),(1,4,1154),(1,5,980),(2,6,800),(3,1,1540),(3,2,1354);
/*!40000 ALTER TABLE `fornecedorproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `idPagamento` int NOT NULL AUTO_INCREMENT,
  `Cliente_idClientePF` int DEFAULT NULL,
  `Cliente_idClientePJ` int DEFAULT NULL,
  `Pedido_idPedido` int DEFAULT NULL,
  `Pagamento_TipoPagamento` enum('Cartão de crédito','Cartão de Débito','PIX','Boleto') NOT NULL,
  `Pagamento_CartaoNumero` char(12) DEFAULT NULL,
  `Pagamento_CartaoValidade` char(6) DEFAULT NULL,
  `Pagamento_CartaoCVV` char(3) DEFAULT NULL,
  `Pagamento_ValorTotal` float DEFAULT NULL,
  `Pagamento_Aprovado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idPagamento`),
  KEY `fk_idPedido_Pedido` (`Pedido_idPedido`),
  KEY `fk_ClienteidClientePF_ClientePF` (`Cliente_idClientePF`),
  KEY `fk_ClienteidClientePJ_ClientePJ` (`Cliente_idClientePJ`),
  CONSTRAINT `fk_ClienteidClientePF_ClientePF` FOREIGN KEY (`Cliente_idClientePF`) REFERENCES `clientepf` (`idClientePF`),
  CONSTRAINT `fk_ClienteidClientePJ_ClientePJ` FOREIGN KEY (`Cliente_idClientePJ`) REFERENCES `clientepj` (`idClientePJ`),
  CONSTRAINT `fk_idPedido_Pedido` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,1,NULL,1,'Cartão de crédito','123456789102','72027','666',322.99,1),(2,1,NULL,2,'Cartão de crédito','534456200102','42030','412',1299.99,1),(3,2,NULL,3,'PIX',NULL,NULL,NULL,10549,1),(4,3,NULL,4,'Cartão de Débito','942255021347','1229','987',4049.1,0),(5,3,NULL,5,'Cartão de Débito','942255021347','1229','987',3540,1),(6,4,NULL,6,'Boleto',NULL,NULL,NULL,2430.99,1);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `Cliente_idCliente` int DEFAULT NULL,
  `Pedido_Status` enum('Cancelado','Confirmado','Em processamento') NOT NULL DEFAULT 'Em processamento',
  `Pedido_Descricao` varchar(255) DEFAULT NULL,
  `Pedido_CodRastreamento` char(6) DEFAULT NULL,
  `Pedido_ValorFrete` float DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  UNIQUE KEY `unique_CodRastreamento_Pedido` (`Pedido_CodRastreamento`),
  KEY `fk_idCliente_Cliente` (`Cliente_idCliente`),
  CONSTRAINT `fk_idCliente_Cliente` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,'Em processamento','Compra via App','25648',150),(2,1,'Confirmado','Compra via Web Site','54845',100),(3,2,'Em processamento','Compra via App','54421',50),(4,3,'Cancelado','Com via Web Site',NULL,NULL),(5,3,'Em processamento','Compra via Web Site','54231',40),(6,4,'Confirmado','Compra via App','89541',120);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidoproduto`
--

DROP TABLE IF EXISTS `pedidoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidoproduto` (
  `Pedido_idPedido` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  `PedidoProduto_Quantidade` int NOT NULL,
  `PedidoProduto_Status` enum('Disponível','Sem estoque') NOT NULL DEFAULT 'Disponível',
  `PedidoProduto_DataPedido` date NOT NULL,
  PRIMARY KEY (`Pedido_idPedido`,`Produto_idProduto`),
  KEY `fk_idPedidoProduto_Produto` (`Produto_idProduto`),
  CONSTRAINT `fk_idPedidoProduto_Pedido` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`),
  CONSTRAINT `fk_idPedidoProduto_Produto` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidoproduto`
--

LOCK TABLES `pedidoproduto` WRITE;
/*!40000 ALTER TABLE `pedidoproduto` DISABLE KEYS */;
INSERT INTO `pedidoproduto` VALUES (1,3,2,'Disponível','2023-01-23'),(2,5,1,'Disponível','2023-01-17'),(3,2,1,'Disponível','2023-03-01'),(4,6,1,'Sem estoque','2023-04-14'),(5,1,1,'Disponível','2023-04-20'),(6,4,2,'Disponível','2023-04-24');
/*!40000 ALTER TABLE `pedidoproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `Produto_Nome` varchar(45) NOT NULL,
  `Produto_Categoria` enum('Notebook','Desktop','Memória','Placa de Vídeo','Placa mãe') NOT NULL,
  `Produto_Descricao` varchar(255) DEFAULT NULL,
  `Produto_Marca` varchar(20) NOT NULL,
  `Produto_Modelo` varchar(40) NOT NULL,
  `Produto_Avaliacao` float DEFAULT NULL,
  `Produto_Valor` float NOT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Notebook Dell Vostro 3510','Notebook','11ª geração Intel® Core™ i5-1135G7 (4-core, cache de 8MB, até 4.2GHz)','Dell','Vostro 3510',4.8,3500),(2,'Desktop Dell XPS 8950','Desktop','12ª geração Intel® Core™ i7-12700 - NVIDIA® GeForce RTX™ 3060 12GB GDDR6 - Memória de 16GB DDR5 SSD de 256GB PCIe NVMe M.2 + HD de 1TB (7200RPM)','Dell','XPS 8950',5,10449),(3,'Memória Kingston Fury Beast','Memória','Memória Kingston Fury Beast, 8GB, 3200MHz, DDR4, CL16, Preto - KF432C16BB/8','Kingston','Fury Beast',4.9,172.99),(4,'PNY NVIDIA Geforce RTX 3060','Placa de Vídeo','Placa de Video PNY NVIDIA Geforce RTX 3060, 12 GB GDDR6, DLSS, Ray Tracing - VCG306012DFBPB1','PNY','RTX 3060',4,2310.99),(5,'Asus TUF Gaming','Placa mãe','Placa Mãe Asus TUF Gaming B660M-PLUS D4, Intel LGA 1700, mATX, DDR4, RGB','Asus','B660M-PLUS D4',5,1199.99),(6,'Notebook ASUS VivoBook X513EA','Notebook','Intel® Core™ i5 - 11ª Geração - Intel® Iris® Xe - 16GB - 256GB SSD','Asus','X513EA-BQ3400W',4.7,4049.1);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `idVendedor` int NOT NULL AUTO_INCREMENT,
  `Vendedor_CNPJ` char(14) NOT NULL,
  `Vendedor_RazaoSocial` varchar(30) NOT NULL,
  `Vendedor_NomeFantasia` varchar(30) NOT NULL,
  `Vendedor_Email` varchar(30) NOT NULL,
  `Vendedor_Celular` char(11) DEFAULT NULL,
  `Vendedor_Telefone` char(10) DEFAULT NULL,
  `Vendedor_CEP` char(8) NOT NULL,
  `Vendedor_Logradouro` varchar(45) NOT NULL,
  `Vendedor_Numero` varchar(5) DEFAULT NULL,
  `Vendedor_Complemento` varchar(20) DEFAULT NULL,
  `Vendedor_Bairro` varchar(15) NOT NULL,
  `Vendedor_Municipio` varchar(30) NOT NULL,
  `Vendedor_UF` char(2) NOT NULL,
  PRIMARY KEY (`idVendedor`),
  UNIQUE KEY `unique_CNPJ_Vendedor` (`Vendedor_CNPJ`),
  UNIQUE KEY `unique_RazaoSocial_Vendedor` (`Vendedor_RazaoSocial`),
  UNIQUE KEY `unique_Email_Vendedor` (`Vendedor_Email`),
  UNIQUE KEY `unique_Celular_Vendedor` (`Vendedor_Celular`),
  UNIQUE KEY `unique_Telefone_Vendedor` (`Vendedor_Telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,'23456789456321','Tech eletronics','Technology','tech@tech.com.br','21988547414',NULL,'12354684','Rua Rio blue','5487',NULL,'Tambaú','João Pessoa','PB'),(2,'12345678374541','Botique Durgas','Durgas','durgas@durgas.com.br',NULL,'3855446622','98754214','Rua Minas','74',NULL,'Jaboatão','Belo Horizonte','MG'),(3,'45678912365448','Kids World','KW','kw@kidsworld.com.br','11988552288','1166554477','77798542','Rua da Liberdade','777',NULL,'Liberdade','São Paulo','SP'),(4,'13167385000128','Camille & Moraes Tecnologia','CMT','camille.moraes@cmoraes.com.br','82998552142',NULL,'57040509','5ª Travessa Santo Antonio','25',NULL,'Jatiúca','Maceió','AL'),(5,'47271766000174','Regufe Tech','Regufe ','brunna@regufe.com.br',NULL,'9235650744','69036070','Beco Lobo Soropita','823',NULL,'Compensa','Manaus','AM');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedorproduto`
--

DROP TABLE IF EXISTS `vendedorproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedorproduto` (
  `Vendedor_idVendedor` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  `VendendorProduto_Quantidade` int NOT NULL,
  PRIMARY KEY (`Vendedor_idVendedor`,`Produto_idProduto`),
  KEY `fk_idProduto_Produto` (`Produto_idProduto`),
  CONSTRAINT `fk_idProduto_Produto` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `fk_idVendedor_Vendedor` FOREIGN KEY (`Vendedor_idVendedor`) REFERENCES `vendedor` (`idVendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedorproduto`
--

LOCK TABLES `vendedorproduto` WRITE;
/*!40000 ALTER TABLE `vendedorproduto` DISABLE KEYS */;
INSERT INTO `vendedorproduto` VALUES (1,1,3),(1,2,1),(1,3,8),(1,4,12),(1,5,7),(1,6,5),(2,1,10),(2,2,7),(2,3,25),(2,4,14),(2,5,11),(2,6,5),(3,1,30),(3,2,35),(3,3,40),(3,4,50),(3,5,15),(3,6,22),(4,1,15),(4,2,12),(4,3,30),(4,4,8),(4,5,3),(4,6,0),(5,1,0),(5,2,0),(5,3,15),(5,4,8),(5,5,4),(5,6,30);
/*!40000 ALTER TABLE `vendedorproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommerce_refinado'
--

--
-- Dumping routines for database 'ecommerce_refinado'
--

--
-- Current Database: `viagens`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `viagens` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `viagens`;

--
-- Table structure for table `destinos`
--

DROP TABLE IF EXISTS `destinos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destinos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinos`
--

LOCK TABLES `destinos` WRITE;
/*!40000 ALTER TABLE `destinos` DISABLE KEYS */;
INSERT INTO `destinos` VALUES (1,'Praia do Rosa','Linda praia'),(2,'Ponta verde','Bela praia'),(3,'destino sem reserva','nada');
/*!40000 ALTER TABLE `destinos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_destino` int DEFAULT NULL,
  `data_r` date DEFAULT NULL,
  `status` varchar(255) DEFAULT 'Pendente',
  PRIMARY KEY (`id`),
  KEY `fk_reservas_usuarios` (`id_usuario`),
  CONSTRAINT `fk_reservas_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,4,1,'2024-05-11','Pendente'),(2,3,1,'2024-04-11','Pendente'),(3,4,2,'2024-06-20','Pendente'),(4,1,3,NULL,'Pendente');
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL COMMENT 'Nome do usuário',
  `email` varchar(100) NOT NULL,
  `data_nascimento` date NOT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'saulo','teste@teste.com','2000-03-01','Rua A',' 123',' Cidade X',' Estado Y'),(2,'carlos','carlos@teste.com','1995-03-01','Rua B',' 456',' Cidade Y',' Estado Z'),(3,'pedro','pedro@teste.com','1994-03-01','Rua C',' 789',' Cidade H',' Estado I'),(4,'paulo','peste@teste.com','1980-03-01','Rua D',' 454',' Cidade K',' Estado L'),(5,'saulo2','teste3@teste.com','2000-03-01','Rua A',' 123',' Cidade X',' Estado Y'),(6,'João Silva','joao.silva@example.com','1990-01-01','Rua A',NULL,NULL,NULL),(7,'Maria Santos','maria.santos@example.com','1992-03-15','Rua B',NULL,NULL,NULL),(8,'Pedro Almeida','pedro.almeida@example.com','1985-07-10','Rua C',NULL,NULL,NULL),(9,'Ana Oliveira','ana.oliveira@example.com','1998-12-25','Rua D',NULL,NULL,NULL),(10,'Carlos Pereira','carlos.pereira@example.com','1991-06-05','Rua E',NULL,NULL,NULL),(11,'Laura Mendes','laura.mendes@example.com','1994-09-12','Rua F',NULL,NULL,NULL),(12,'Fernando Santos','fernando.santos@example.com','1988-02-20','Rua G',NULL,NULL,NULL),(13,'Mariana Costa','mariana.costa@example.com','1997-11-30','Rua H',NULL,NULL,NULL),(14,'Ricardo Rodrigues','ricardo.rodrigues@example.com','1993-04-18','Rua I',NULL,NULL,NULL),(15,'Camila Alves','camila.alves@example.com','1989-08-08','Rua J',NULL,NULL,NULL),(16,'Bruno Carvalho','bruno.carvalho@example.com','1995-03-25','Rua K',NULL,NULL,NULL),(17,'Amanda Silva','amanda.silva@example.com','1996-12-02','Rua L',NULL,NULL,NULL),(18,'Paulo Mendonça','paulo.mendonca@example.com','1999-07-20','Rua M',NULL,NULL,NULL),(19,'Larissa Oliveira','larissa.oliveira@example.com','1987-10-15','Rua N',NULL,NULL,NULL),(20,'Fernanda Sousa','fernanda.sousa@example.com','1992-05-08','Rua O',NULL,NULL,NULL),(21,'Gustavo Santos','gustavo.santos@example.com','1993-09-18','Rua P',NULL,NULL,NULL),(22,'Helena Costa','helena.costa@example.com','1998-02-22','Rua Q',NULL,NULL,NULL),(23,'Diego Almeida','diego.almeida@example.com','1991-11-27','Rua R',NULL,NULL,NULL),(24,'Juliana Lima','juliana.lima@example.com','1997-04-05','Rua S',NULL,NULL,NULL),(25,'Rafaela Silva','rafaela.silva@example.com','1996-01-10','Rua T',NULL,NULL,NULL),(26,'Lucas Pereira','lucas.pereira@example.com','1986-08-30','Rua U',NULL,NULL,NULL),(27,'Fábio Rodrigues','fabio.rodrigues@example.com','1989-03-12','Rua V',NULL,NULL,NULL),(28,'Isabela Santos','isabela.santos@example.com','1994-12-07','Rua W',NULL,NULL,NULL),(29,'André Alves','andre.alves@example.com','1995-09-28','Rua X',NULL,NULL,NULL),(30,'Clara Carvalho','clara.carvalho@example.com','1990-02-15','Rua Y',NULL,NULL,NULL),(31,'Roberto Mendes','roberto.mendes@example.com','1992-07-21','Rua Z',NULL,NULL,NULL),(32,'Mariana Oliveira','mariana.oliveira@example.com','1997-05-03','Av. A',NULL,NULL,NULL),(33,'Gustavo Costa','gustavo.costa@example.com','1998-11-16','Av. B',NULL,NULL,NULL),(34,'Lara Sousa','lara.sousa@example.com','1993-06-09','Av. C',NULL,NULL,NULL),(35,'Pedro Lima','pedro.lima@example.com','1996-09-27','Av. D',NULL,NULL,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'viagens'
--

--
-- Dumping routines for database 'viagens'
--

--
-- Current Database: `customer_management`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `customer_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `customer_management`;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id_customer` int NOT NULL AUTO_INCREMENT,
  `c_name` varchar(25) DEFAULT NULL,
  `c_email` varchar(40) DEFAULT NULL,
  `c_cpf` char(9) DEFAULT NULL,
  `c_credit_card` char(13) DEFAULT NULL,
  `c_contact` char(9) DEFAULT NULL,
  `c_address` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_customer`),
  KEY `index_email` (`c_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'customer_management'
--

--
-- Dumping routines for database 'customer_management'
--

--
-- Current Database: `company_desafio`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `company_desafio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `company_desafio`;

--
-- Table structure for table `departament`
--

DROP TABLE IF EXISTS `departament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departament` (
  `Dname` varchar(15) NOT NULL,
  `Dnumber` int NOT NULL,
  `Mgr_ssn` char(9) DEFAULT NULL,
  `Mgr_start_date` date DEFAULT NULL,
  `Dept_create_date` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE KEY `unique_name_dept` (`Dname`),
  KEY `fk_dept` (`Mgr_ssn`),
  CONSTRAINT `departament_ibfk_1` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Ssn`),
  CONSTRAINT `fk_dept` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Ssn`) ON UPDATE CASCADE,
  CONSTRAINT `chk_date_dept` CHECK ((`Dept_create_date` < `Mgr_start_date`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departament`
--

LOCK TABLES `departament` WRITE;
/*!40000 ALTER TABLE `departament` DISABLE KEYS */;
INSERT INTO `departament` VALUES ('Headquarters',1,'888665555','1981-06-19','1980-06-19'),('Administration',4,'987654321','1995-01-01','1994-01-01'),('Research',5,'333445555','1988-05-22','1986-05-22');
/*!40000 ALTER TABLE `departament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependent` (
  `Essn` char(9) NOT NULL,
  `Dependent_name` varchar(15) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Dependent_name`),
  CONSTRAINT `fk_dependent` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES ('123456789','Alice','F','1988-12-30','Daughter'),('123456789','Elizabeth','F','1967-05-05','Spouse'),('123456789','Michael','M','1988-01-04','Son'),('333445555','Alice','F','1986-04-05','Daughter'),('333445555','Joy','F','1958-05-03','Spouse'),('333445555','Theodore','M','1983-10-25','Son'),('987654321','Abner','M','1942-02-28','Spouse');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_locations`
--

DROP TABLE IF EXISTS `dept_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_locations` (
  `Dnumber` int NOT NULL,
  `Dlocation` varchar(15) NOT NULL,
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  CONSTRAINT `fk_dept_locations` FOREIGN KEY (`Dnumber`) REFERENCES `departament` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_locations`
--

LOCK TABLES `dept_locations` WRITE;
/*!40000 ALTER TABLE `dept_locations` DISABLE KEYS */;
INSERT INTO `dept_locations` VALUES (1,'Houston'),(4,'Stafford'),(5,'Bellaire'),(5,'Houston'),(5,'Sugarland');
/*!40000 ALTER TABLE `dept_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Fname` varchar(15) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`Ssn`),
  KEY `fk_employee` (`Super_ssn`),
  CONSTRAINT `fk_employee` FOREIGN KEY (`Super_ssn`) REFERENCES `employee` (`Ssn`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('John','B','Smith','123456789','1965-01-09','731-Fondren-Houston-TX','M',30000.00,'333445555',5),('Franklin','T','Wong','333445555','1955-12-08','638-Voss-Houston-TX','M',40000.00,'888665555',5),('Joyce','A','English','453453453','1972-07-31','5631-Rice-Houston-TX','F',25000.00,'333445555',5),('Ramesh','K','Narayan','666884444','1962-09-15','975-Fire-Oak-Humble-TX','M',38000.00,'333445555',5),('James','E','Borg','888665555','1937-11-10','450-Stone-Houston-TX','M',55000.00,NULL,1),('Jennifer','S','Wallace','987654321','1941-06-20','291-Berry-Bellaire-TX','F',43000.00,'888665555',4),('Ahmad','V','Jabbar','987987987','1969-03-29','980-Dallas-Houston-TX','M',25000.00,'987654321',4),('Alicia','J','Zelaya','999887777','1968-01-19','3321-Castle-Spring-TX','F',25000.00,'987654321',4);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `Pname` varchar(15) NOT NULL,
  `Pnumber` int NOT NULL,
  `Plocation` varchar(15) DEFAULT NULL,
  `Dnum` int NOT NULL,
  PRIMARY KEY (`Pnumber`),
  UNIQUE KEY `unique_project` (`Pname`),
  KEY `fk_project` (`Dnum`),
  CONSTRAINT `fk_project` FOREIGN KEY (`Dnum`) REFERENCES `departament` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('ProductX',1,'Bellaire',5),('ProductY',2,'Sugarland',5),('ProductZ',3,'Houston',5),('Computerization',10,'Stafford',4),('Reorganization',20,'Houston',1),('Newbenefits',30,'Stafford',4);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_on` (
  `Essn` char(9) NOT NULL,
  `Pno` int NOT NULL,
  `Hours` decimal(3,1) NOT NULL,
  PRIMARY KEY (`Essn`,`Pno`),
  KEY `fk_project_works_on` (`Pno`),
  CONSTRAINT `fk_employee_works_on` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`),
  CONSTRAINT `fk_project_works_on` FOREIGN KEY (`Pno`) REFERENCES `project` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES ('123456789',1,32.5),('123456789',2,7.5),('333445555',2,10.0),('333445555',3,10.0),('333445555',10,10.0),('333445555',20,10.0),('453453453',1,20.0),('453453453',2,20.0),('666884444',3,40.0),('888665555',20,0.0),('987654321',20,15.0),('987654321',30,20.0),('987987987',10,35.0),('987987987',30,5.0),('999887777',10,10.0),('999887777',30,30.0);
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'company_desafio'
--

--
-- Dumping routines for database 'company_desafio'
--

--
-- Current Database: `ecommerce`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ecommerce`;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `Pnome` varchar(10) NOT NULL,
  `Sobrenome` varchar(30) DEFAULT NULL,
  `Endereco` varchar(255) DEFAULT NULL,
  `DataNascimento` date NOT NULL,
  `CPF` char(11) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Celular` char(11) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `unique_cpf_cliente` (`CPF`),
  UNIQUE KEY `unique_email_cliente` (`Email`),
  UNIQUE KEY `unique_celular_cliente` (`Celular`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Maria','M Silva','rua silva de prata 29, Carangola - Cidade das flores','2000-07-05','12346789','maria@msilva.com.br','82987417417'),(2,'Matheus','O Pimentel','rua alemeda 289, Centro - Cidade das flores','1990-04-04','987654321','matheus@opimentel.com.br','77945214741'),(3,'Ricardo','F Silva','avenida alemeda vinha 1009, Centro - Cidade das flores','1995-10-25','45678913','ricardo@fsilva.com.br','11947581354'),(4,'Julia','S França','rua lareijras 861, Centro - Cidade das flores','2001-01-25','789123456','julia@ffranca.com.br','31945789652'),(5,'Roberta','G Assis','avenidade koller 19, Centro - Cidade das flores','1999-03-01','98745631','roberta@gassis.com.br','81987432568'),(6,'Isabela','M Cruz','rua alemeda das flores 28, Centro - Cidade das flores','1995-05-20','654789123','isabela@mcruz.com.br','11998547567');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `idEstoque` int NOT NULL AUTO_INCREMENT,
  `Localizacao` varchar(255) NOT NULL,
  `Quantidade` int NOT NULL,
  PRIMARY KEY (`idEstoque`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'Rio de Janeiro',1000),(2,'Rio de Janeiro',500),(3,'São Paulo',10),(4,'São Paulo',100),(5,'São Paulo',10),(6,'Brasília',60),(7,'Rio de Janeiro',1000),(8,'Rio de Janeiro',500),(9,'São Paulo',10),(10,'São Paulo',100),(11,'São Paulo',10),(12,'Brasília',60);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoqueproduto`
--

DROP TABLE IF EXISTS `estoqueproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoqueproduto` (
  `idLproduto` int NOT NULL,
  `idLestoque` int NOT NULL,
  `localizacao` varchar(255) NOT NULL,
  PRIMARY KEY (`idLproduto`,`idLestoque`),
  KEY `fk_estoqueProduto_estoque` (`idLestoque`),
  CONSTRAINT `fk_estoqueProduto_estoque` FOREIGN KEY (`idLestoque`) REFERENCES `estoque` (`idEstoque`),
  CONSTRAINT `fk_estoqueProduto_produto` FOREIGN KEY (`idLproduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoqueproduto`
--

LOCK TABLES `estoqueproduto` WRITE;
/*!40000 ALTER TABLE `estoqueproduto` DISABLE KEYS */;
INSERT INTO `estoqueproduto` VALUES (1,2,'RJ'),(2,6,'GO');
/*!40000 ALTER TABLE `estoqueproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `idFornecedor` int NOT NULL AUTO_INCREMENT,
  `CNPJ` char(15) NOT NULL,
  `RazaoSocial` varchar(45) NOT NULL,
  `NomeFantasia` varchar(45) DEFAULT NULL,
  `Endereco` varchar(255) NOT NULL,
  `Contato` varchar(11) NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE KEY `unique_cnpj_fornecedor` (`CNPJ`),
  UNIQUE KEY `unique_razaosocial_fornecedor` (`RazaoSocial`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'123456789123456','Almeida e filhos','Marquinhos construções','Rua Americo Vasco, 215 - PE','21985474'),(2,'854519649143457','Eletrônicos Silva','Flavinho do eletrônico','Rua Trindade, 578 - AL','21985484'),(3,'934567893934695','Eletrônicos Valma','Emanuelsonzin eletro','Rua tambaú, 2878 - PB','21975474');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `idCliente` int NOT NULL,
  `idPagamento` int NOT NULL,
  `idPedidoPagamento` int DEFAULT NULL,
  `TipodePagamento` enum('Cartão de crédito','Cartão de débito','Boleto','Dinheiro','PIX') DEFAULT NULL,
  `CartaoNumero` char(16) DEFAULT NULL,
  `CartaoValidade` char(5) DEFAULT NULL,
  `CartaoCVV` char(3) DEFAULT NULL,
  `ValorTotal` float DEFAULT NULL,
  PRIMARY KEY (`idCliente`,`idPagamento`),
  KEY `fk_pagamento_pedido` (`idPedidoPagamento`),
  CONSTRAINT `fk_pagamento_pedido` FOREIGN KEY (`idPedidoPagamento`) REFERENCES `pedido` (`idPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `idPedidoCliente` int DEFAULT NULL,
  `PedidoStatus` enum('Cancelado','Confirmado','Em processamento') DEFAULT 'Em processamento',
  `Descricao` varchar(255) DEFAULT NULL,
  `Frete` float DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_pedido_cliente` (`idPedidoCliente`),
  CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`idPedidoCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,'Em processamento','compra via aplicativo',NULL),(2,2,'Em processamento','compra via aplicativo',50),(3,3,'Confirmado',NULL,NULL),(4,4,'Em processamento','compra via web site',150),(6,2,'Em processamento','Compra via Aplicativo',NULL);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `ProdutoNome` varchar(50) NOT NULL,
  `ClassificadoCriancas` tinyint(1) DEFAULT '0',
  `Categoria` enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') NOT NULL,
  `Descricao` varchar(255) DEFAULT NULL,
  `Avaliacao` float DEFAULT NULL,
  `dimencao` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Fone de ouvido',0,'Eletrônico',NULL,4,NULL),(2,'Barbie Elsa',1,'Brinquedos',NULL,3,NULL),(3,'Body Carters',1,'Vestimenta',NULL,5,NULL),(4,'Microfone Vedo - Youtuber',0,'Eletrônico',NULL,4,NULL),(5,'Sofá retrátil',0,'Móveis',NULL,3,'3x57x80'),(6,'Farinha de arroz',0,'Alimentos',NULL,2,NULL),(7,'Fire Stick Amazon',0,'Eletrônico',NULL,3,NULL);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtofornecedor`
--

DROP TABLE IF EXISTS `produtofornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtofornecedor` (
  `idPsFornecedor` int NOT NULL,
  `idpsProduto` int NOT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`idPsFornecedor`,`idpsProduto`),
  KEY `fk_produtoFornecedor_produto` (`idpsProduto`),
  CONSTRAINT `fk_produtoFornecedor_fornecedor` FOREIGN KEY (`idPsFornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  CONSTRAINT `fk_produtoFornecedor_produto` FOREIGN KEY (`idpsProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtofornecedor`
--

LOCK TABLES `produtofornecedor` WRITE;
/*!40000 ALTER TABLE `produtofornecedor` DISABLE KEYS */;
INSERT INTO `produtofornecedor` VALUES (1,1,500),(1,2,400),(2,4,633),(2,5,10),(3,3,5);
/*!40000 ALTER TABLE `produtofornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtopedido`
--

DROP TABLE IF EXISTS `produtopedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtopedido` (
  `idProdutoProduto` int NOT NULL,
  `idProdutoPedido` int NOT NULL,
  `ProdutoQuantidade` int DEFAULT '1',
  `ProdutoPedidoStatus` enum('Disponível','Sem estoque') DEFAULT 'Disponível',
  PRIMARY KEY (`idProdutoProduto`,`idProdutoPedido`),
  KEY `fk_pedido_pedido` (`idProdutoPedido`),
  CONSTRAINT `fk_pedido_pedido` FOREIGN KEY (`idProdutoPedido`) REFERENCES `pedido` (`idPedido`),
  CONSTRAINT `fk_produto_pedido` FOREIGN KEY (`idProdutoProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtopedido`
--

LOCK TABLES `produtopedido` WRITE;
/*!40000 ALTER TABLE `produtopedido` DISABLE KEYS */;
INSERT INTO `produtopedido` VALUES (1,1,2,'Disponível'),(2,1,1,'Disponível'),(3,2,1,'Disponível');
/*!40000 ALTER TABLE `produtopedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtovendedor`
--

DROP TABLE IF EXISTS `produtovendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtovendedor` (
  `idProdutoVendedor` int NOT NULL,
  `idProduto` int NOT NULL,
  `Quantidade` int NOT NULL,
  PRIMARY KEY (`idProdutoVendedor`,`idProduto`),
  KEY `fk_produto_produto` (`idProduto`),
  CONSTRAINT `fk_produto_produto` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `fk_produto_vendedor` FOREIGN KEY (`idProdutoVendedor`) REFERENCES `vendedor` (`idVendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtovendedor`
--

LOCK TABLES `produtovendedor` WRITE;
/*!40000 ALTER TABLE `produtovendedor` DISABLE KEYS */;
INSERT INTO `produtovendedor` VALUES (1,6,80),(2,7,10);
/*!40000 ALTER TABLE `produtovendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `idVendedor` int NOT NULL AUTO_INCREMENT,
  `CNPJ` char(15) DEFAULT NULL,
  `CPF` char(11) DEFAULT NULL,
  `RazaoSocial` varchar(45) DEFAULT NULL,
  `NomeFantasia` varchar(45) DEFAULT NULL,
  `Nome` varchar(10) DEFAULT NULL,
  `Sobrenome` varchar(30) DEFAULT NULL,
  `Endereco` varchar(255) NOT NULL,
  `Contato` varchar(11) NOT NULL,
  PRIMARY KEY (`idVendedor`),
  UNIQUE KEY `unique_cnpj_vendedor` (`CNPJ`),
  UNIQUE KEY `unique_cpf_vendedor` (`CPF`),
  UNIQUE KEY `unique_razaosocial_vendedor` (`RazaoSocial`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,'123456789456321',NULL,'Tech eletronics',NULL,NULL,NULL,'Rio de Janeiro','219946287'),(2,NULL,'123456783','Botique Durgas',NULL,'Emanuel','M Carvalho','Rio de Janeiro','219567895'),(3,'456789123654485',NULL,'Kids World',NULL,NULL,NULL,'São Paulo','1198657484');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommerce'
--

--
-- Dumping routines for database 'ecommerce'
--

--
-- Current Database: `company`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `company` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `company`;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `Fname` varchar(15) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int NOT NULL,
  PRIMARY KEY (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departament`
--

DROP TABLE IF EXISTS `departament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departament` (
  `Dname` varchar(15) NOT NULL,
  `Dnumber` int NOT NULL,
  `Mgr_ssn` char(9) DEFAULT NULL,
  `Mgr_start_date` date DEFAULT NULL,
  `Dept_create_date` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE KEY `unique_name_dept` (`Dname`),
  KEY `fk_dept` (`Mgr_ssn`),
  CONSTRAINT `fk_dept` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Ssn`) ON UPDATE CASCADE,
  CONSTRAINT `chk_date_dept` CHECK ((`Dept_create_date` < `Mgr_start_date`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departament`
--

LOCK TABLES `departament` WRITE;
/*!40000 ALTER TABLE `departament` DISABLE KEYS */;
INSERT INTO `departament` VALUES ('Headquarters',1,'888665555','1981-06-19','1980-06-19'),('Administration',4,'987654321','1995-01-01','1994-01-01'),('Research',5,'333445555','1988-05-22','1986-05-22');
/*!40000 ALTER TABLE `departament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependent` (
  `Essn` char(9) NOT NULL,
  `Dependent_name` varchar(15) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Dependent_name`),
  CONSTRAINT `fk_dependent` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES ('123456789','Alice','F','1988-12-30','Daughter'),('123456789','Elizabeth','F','1967-05-05','Spouse'),('123456789','Michael','M','1988-01-04','Son'),('333445555','Alice','F','1986-04-05','Daughter'),('333445555','Joy','F','1958-05-03','Spouse'),('333445555','Theodore','M','1983-10-25','Son'),('987654321','Abner','M','1942-02-28','Spouse');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_locations`
--

DROP TABLE IF EXISTS `dept_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_locations` (
  `Dnumber` int NOT NULL,
  `Dlocation` varchar(15) NOT NULL,
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  CONSTRAINT `fk_dept_locations` FOREIGN KEY (`Dnumber`) REFERENCES `departament` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_locations`
--

LOCK TABLES `dept_locations` WRITE;
/*!40000 ALTER TABLE `dept_locations` DISABLE KEYS */;
INSERT INTO `dept_locations` VALUES (1,'Houston'),(4,'Stafford'),(5,'Bellaire'),(5,'Houston'),(5,'Sugarland');
/*!40000 ALTER TABLE `dept_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Fname` varchar(15) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int NOT NULL,
  PRIMARY KEY (`Ssn`),
  KEY `fk_employee` (`Super_ssn`),
  CONSTRAINT `fk_employee` FOREIGN KEY (`Super_ssn`) REFERENCES `employee` (`Ssn`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `chk_salary_employee` CHECK ((`Salary` > 2000.0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('Roberta','H','Teixeira','123419824','1990-08-10','731-Fondren-Houston-TX','M',40000.00,'123456789',1),('João','B','Smith','123456759','1965-01-09','rua rua rua rua','M',32000.00,'987654321',5),('John','B','Smith','123456789','1965-01-09','731-Fondren-Houston-TX','M',32000.00,NULL,5),('Amanda','H','Teixeira','123769824','1990-08-10','731-Fondren-Houston-TX','M',40000.00,'123456789',1),('Cláudio','B','Teixeira','123859824','1990-08-10','731-Fondren-Houston-TX','M',40000.00,'123456789',4),('Maria','B','Smith','145754678','1965-08-10','731-Fondren-Houston-TX','F',3500.00,'123456789',5),('Franklin','T','Wong','333445555','1955-12-08','638-Voss-Houston-TX','M',42000.00,'123456789',5),('Joyce','A','English','453453453','1972-07-31','5631-Rice-Houston-TX','F',27000.00,'987654321',5),('Carlinhos','V','Chagas','554466229','1974-01-09',NULL,'M',29000.00,'333445555',1),('Ramesh','K','Narayan','666884444','1962-09-15','975-Fire-Oak-Humble-TX','M',40000.00,'987654321',5),('James','E','Borg','888665555','1937-11-10','450-Stone-Houston-TX','M',58000.00,NULL,1),('Jennifer','S','Wallace','987654321','1941-06-20','291-Berry-Bellaire-TX','F',44500.00,NULL,4),('Ahmad','V','Jabbar','987987987','1969-03-29','980-Dallas-Houston-TX','M',26500.00,'123456789',4),('Alicia','J','Zelaya','999887777','1968-01-19','3321-Castle-Spring-TX','F',26500.00,'333445555',4);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `salary_check` BEFORE INSERT ON `employee` FOR EACH ROW begin 
		case new.Dno
			when 1 then set new.Super_ssn = '333445555';
            when 2 then set new.Super_ssn = null;
            when 3 then set new.Super_ssn = null;
            when 4 then set new.Super_ssn = '123456789';
            when 5 then set new.Super_ssn = '987654321';
		end case;
	end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `null_value_check` AFTER INSERT ON `employee` FOR EACH ROW begin
        if (new.Address is null) then 
			insert into users_messages(message, ssn)
				values ('Update your address, please!', new.Ssn);
		end if;
	end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `employess_dependent_view`
--

DROP TABLE IF EXISTS `employess_dependent_view`;
/*!50001 DROP VIEW IF EXISTS `employess_dependent_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employess_dependent_view` AS SELECT 
 1 AS `Nome`,
 1 AS `Dependent`,
 1 AS `Departament`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employess_salary_27000_view`
--

DROP TABLE IF EXISTS `employess_salary_27000_view`;
/*!50001 DROP VIEW IF EXISTS `employess_salary_27000_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employess_salary_27000_view` AS SELECT 
 1 AS `Nome`,
 1 AS `Salary`,
 1 AS `Dept_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employess_salary_view`
--

DROP TABLE IF EXISTS `employess_salary_view`;
/*!50001 DROP VIEW IF EXISTS `employess_salary_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employess_salary_view` AS SELECT 
 1 AS `Nome`,
 1 AS `Salary`,
 1 AS `Dept_number`,
 1 AS `Ssn`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employess_salary_view_dependent`
--

DROP TABLE IF EXISTS `employess_salary_view_dependent`;
/*!50001 DROP VIEW IF EXISTS `employess_salary_view_dependent`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employess_salary_view_dependent` AS SELECT 
 1 AS `Nome`,
 1 AS `Dependent`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `Pname` varchar(15) NOT NULL,
  `Pnumber` int NOT NULL,
  `Plocation` varchar(15) DEFAULT NULL,
  `Dnum` int NOT NULL,
  PRIMARY KEY (`Pnumber`),
  UNIQUE KEY `unique_project` (`Pname`),
  KEY `fk_project` (`Dnum`),
  CONSTRAINT `fk_project` FOREIGN KEY (`Dnum`) REFERENCES `departament` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('ProductX',1,'Bellaire',5),('ProductY',2,'Sugarland',5),('ProductZ',3,'Houston',5),('Computerization',10,'Stafford',4),('Reorganization',20,'Houston',1),('Newbenefits',30,'Stafford',4);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_messages`
--

DROP TABLE IF EXISTS `users_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(100) DEFAULT NULL,
  `ssn` char(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ssn_messages` (`ssn`),
  CONSTRAINT `fk_ssn_messages` FOREIGN KEY (`ssn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_messages`
--

LOCK TABLES `users_messages` WRITE;
/*!40000 ALTER TABLE `users_messages` DISABLE KEYS */;
INSERT INTO `users_messages` VALUES (1,'Update your address, please!','554466229');
/*!40000 ALTER TABLE `users_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_today`
--

DROP TABLE IF EXISTS `v_today`;
/*!50001 DROP VIEW IF EXISTS `v_today`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_today` AS SELECT 
 1 AS `today`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_on` (
  `Essn` char(9) NOT NULL,
  `Pno` int NOT NULL,
  `Hours` decimal(3,1) NOT NULL,
  PRIMARY KEY (`Essn`,`Pno`),
  KEY `fk_project_works_on` (`Pno`),
  CONSTRAINT `fk_employee_works_on` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`),
  CONSTRAINT `fk_project_works_on` FOREIGN KEY (`Pno`) REFERENCES `project` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES ('123456789',1,32.5),('123456789',2,7.5),('333445555',2,10.0),('333445555',3,10.0),('333445555',10,10.0),('333445555',20,10.0),('453453453',1,20.0),('453453453',2,20.0),('666884444',3,40.0),('888665555',20,0.0),('987654321',20,15.0),('987654321',30,20.0),('987987987',10,35.0),('987987987',30,5.0),('999887777',10,10.0),('999887777',30,30.0);
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'company'
--

--
-- Dumping routines for database 'company'
--
/*!50003 DROP PROCEDURE IF EXISTS `info_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `info_employee`()
begin
	select * from employee inner join departament on dno = dnumber;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_into_employee_proc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_into_employee_proc`(
	in Fname_p varchar(15), 
    in Minit_p varchar(1), 
    in Lname_p varchar(15), 
    in Ssn_p char(9), 
    in Bdate_p date, 
    in Address_p varchar(30), 
    in Sex_p char(1), 
    in Salary_p decimal(10,2), 
    in Super_ssn_p char(9), 
    in Dno_p int
)
begin
	insert into employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
	#values ('Maria', 'B', 'Smith', '145754678', '1965-08-10', '731-Fondren-Houston-TX', 'F', '3500.0', '123456789', '5');
	values (Fname_p, Minit_p, Lname_p, Ssn_p, Bdate_p, Address_p, Sex_p, Salary_p, Super_ssn_p, Dno_p);
	
    select 'Inserção bem sucedida' as Message, Fname, Ssn from employee where ssn = ssn_p;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `company_constraints`
--

USE `company_constraints`;

--
-- Final view structure for view `employess_salary_27000_view`
--

/*!50001 DROP VIEW IF EXISTS `employess_salary_27000_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employess_salary_27000_view` AS select concat(`employee`.`Fname`,`employee`.`Minit`,`employee`.`Lname`) AS `Nome`,`employee`.`Salary` AS `Salary`,`employee`.`Dno` AS `Dept_number` from `employee` where (`employee`.`Salary` > 26999) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employess_salary_view`
--

/*!50001 DROP VIEW IF EXISTS `employess_salary_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employess_salary_view` AS select concat(`employee`.`Fname`,`employee`.`Minit`,`employee`.`Lname`) AS `Nome`,`employee`.`Salary` AS `Salary`,`employee`.`Dno` AS `Dept_number` from `employee` where (`employee`.`Sex` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_today`
--

/*!50001 DROP VIEW IF EXISTS `v_today`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_today` (`today`) AS select curdate() AS `current_date()` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Current Database: `ecommerce_refinado`
--

USE `ecommerce_refinado`;

--
-- Current Database: `viagens`
--

USE `viagens`;

--
-- Current Database: `customer_management`
--

USE `customer_management`;

--
-- Current Database: `company_desafio`
--

USE `company_desafio`;

--
-- Current Database: `ecommerce`
--

USE `ecommerce`;

--
-- Current Database: `company`
--

USE `company`;

--
-- Final view structure for view `employess_dependent_view`
--

/*!50001 DROP VIEW IF EXISTS `employess_dependent_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employess_dependent_view` AS select concat(`e`.`Fname`,`e`.`Minit`,`e`.`Lname`) AS `Nome`,`d`.`Dependent_name` AS `Dependent`,`e`.`Dno` AS `Departament` from (`employee` `e` join `dependent` `d` on((`e`.`Ssn` = `d`.`Essn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employess_salary_27000_view`
--

/*!50001 DROP VIEW IF EXISTS `employess_salary_27000_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employess_salary_27000_view` AS select concat(`employee`.`Fname`,`employee`.`Minit`,`employee`.`Lname`) AS `Nome`,`employee`.`Salary` AS `Salary`,`employee`.`Dno` AS `Dept_number` from `employee` where (`employee`.`Salary` > 26999) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employess_salary_view`
--

/*!50001 DROP VIEW IF EXISTS `employess_salary_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employess_salary_view` AS select concat(`employee`.`Fname`,`employee`.`Minit`,`employee`.`Lname`) AS `Nome`,`employee`.`Salary` AS `Salary`,`employee`.`Dno` AS `Dept_number`,`employee`.`Ssn` AS `Ssn` from `employee` where (`employee`.`Sex` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employess_salary_view_dependent`
--

/*!50001 DROP VIEW IF EXISTS `employess_salary_view_dependent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employess_salary_view_dependent` AS select concat(`e`.`Fname`,`e`.`Minit`,`e`.`Lname`) AS `Nome`,`d`.`Dependent_name` AS `Dependent` from (`employee` `e` join `dependent` `d` on((`e`.`Ssn` = `d`.`Essn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_today`
--

/*!50001 DROP VIEW IF EXISTS `v_today`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_today` (`today`) AS select curdate() AS `current_date()` */;
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

-- Dump completed on 2024-08-30 17:38:37
