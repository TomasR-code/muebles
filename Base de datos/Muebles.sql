-- MariaDB dump 10.17  Distrib 10.4.10-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: muebles
-- ------------------------------------------------------
-- Server version	10.4.10-MariaDB

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
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrito` (
  `idcarrito` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `descuento` decimal(7,0) DEFAULT NULL,
  `impuesto` decimal(7,0) DEFAULT NULL,
  `facturar` varchar(2) DEFAULT NULL,
  `pednum` int(11) DEFAULT NULL,
  `transporte` varchar(100) DEFAULT NULL,
  `bultos` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`idcarrito`),
  KEY `fk_idProducto_carrito_idx` (`id_producto`),
  KEY `fk_idUsuario_carrito_idx` (`id_usuario`),
  CONSTRAINT `fk_idProducto_carrito` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idUsuario_carrito` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`),
  KEY `fk_idProducto_categoria_idx` (`idProducto`),
  CONSTRAINT `fk_idProducto_categoria` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `idEstado` int(11) NOT NULL,
  `nombreEstado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `idPedidos` int(11) NOT NULL,
  `idProducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPedidos`),
  KEY `fk_idProducto_idx` (`idProducto`),
  CONSTRAINT `fk_idProducto_pedidos` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portada`
--

DROP TABLE IF EXISTS `portada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portada` (
  `idPortada` int(11) NOT NULL,
  PRIMARY KEY (`idPortada`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portada`
--

LOCK TABLES `portada` WRITE;
/*!40000 ALTER TABLE `portada` DISABLE KEYS */;
/*!40000 ALTER TABLE `portada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `alto` decimal(10,0) DEFAULT NULL,
  `largo` decimal(10,0) DEFAULT NULL,
  `ancho` decimal(10,0) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `tipoMadera` varchar(45) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `alta` datetime DEFAULT NULL,
  `baja` datetime DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `fk_idEstado_producto_idx` (`idEstado`),
  CONSTRAINT `fk_idEstado_producto` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idestado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL,
  `nombreRol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `numero` varchar(9) DEFAULT NULL,
  `piso` varchar(4) DEFAULT NULL,
  `dpto` varchar(5) DEFAULT NULL,
  `codPostal` varchar(12) DEFAULT NULL,
  `localidad` varchar(25) DEFAULT NULL,
  `provincia` varchar(15) DEFAULT NULL,
  `pais` varchar(12) DEFAULT NULL,
  `cuit` varchar(20) DEFAULT NULL,
  `tipo` varchar(4) DEFAULT NULL,
  `baja` datetime DEFAULT NULL,
  `intentos` varchar(11) DEFAULT NULL,
  `grupo` varchar(15) DEFAULT NULL,
  `login_sesion` varchar(255) DEFAULT NULL,
  `email_status` varchar(20) DEFAULT NULL,
  `pasword_reset_key` varchar(255) DEFAULT NULL,
  `tipoiva` varchar(5) DEFAULT NULL,
  `transporte` varchar(100) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `whatsapp` varchar(4) DEFAULT NULL,
  `alta` datetime DEFAULT NULL,
  `ultima` datetime DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `razon` varchar(45) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `id_rol_usuario_fk_idx` (`id_rol`),
  KEY `fk_idEstado_usuario_idx` (`idEstado`),
  CONSTRAINT `fk_idEstado_usuario` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idestado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-30 23:22:20
