/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.26-MariaDB : Database - scwv2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`scwv2` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `scwv2`;

/*Table structure for table `cibl17` */

DROP TABLE IF EXISTS `cibl17`;

CREATE TABLE `cibl17` (
  `IdBL` int(11) NOT NULL AUTO_INCREMENT,
  `IdLote` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Gasto` float DEFAULT '0',
  `Ventas` float DEFAULT '0',
  PRIMARY KEY (`IdBL`),
  KEY `FKIDFA` (`IdLote`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `cibl17` */

insert  into `cibl17`(`IdBL`,`IdLote`,`Nombre`,`Gasto`,`Ventas`) values (22,1,'Las palomas',23400,2323320000000),(23,2,'San Martìn',85000,363000),(24,3,'Brasil',NULL,NULL),(25,4,'Ciendillo',NULL,NULL);

/*Table structure for table `cicf18` */

DROP TABLE IF EXISTS `cicf18`;

CREATE TABLE `cicf18` (
  `IdClieFac` int(11) NOT NULL AUTO_INCREMENT,
  `IdFac` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  PRIMARY KEY (`IdClieFac`),
  KEY `FKIDFAC` (`IdFac`),
  KEY `FKIDCL` (`IdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cicf18` */

/*Table structure for table `cicl11` */

DROP TABLE IF EXISTS `cicl11`;

CREATE TABLE `cicl11` (
  `IdCliente` int(11) NOT NULL AUTO_INCREMENT,
  `IdPersona` int(11) NOT NULL,
  PRIMARY KEY (`IdCliente`),
  KEY `FKPERSONA` (`IdPersona`),
  CONSTRAINT `FKPERSONA` FOREIGN KEY (`IdPersona`) REFERENCES `uspr01` (`IdPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `cicl11` */

insert  into `cicl11`(`IdCliente`,`IdPersona`) values (1,1),(2,1),(3,2),(4,3);

/*Table structure for table `cico14` */

DROP TABLE IF EXISTS `cico14`;

CREATE TABLE `cico14` (
  `IdCContado` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` char(1) NOT NULL DEFAULT 'O',
  `IdCliente` int(11) NOT NULL,
  `Monto` float NOT NULL,
  PRIMARY KEY (`IdCContado`),
  KEY `FKCCON` (`IdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cico14` */

/*Table structure for table `cifa13` */

DROP TABLE IF EXISTS `cifa13`;

CREATE TABLE `cifa13` (
  `IdFac` int(11) NOT NULL AUTO_INCREMENT,
  `IdCliente` int(11) NOT NULL,
  `Monto` float NOT NULL,
  `Observacion` varchar(100) DEFAULT NULL,
  `IdLote` int(11) DEFAULT NULL,
  `FechaCompra` date DEFAULT NULL,
  `Estado` int(11) DEFAULT '0',
  PRIMARY KEY (`IdFac`),
  KEY `FKCLFAC` (`IdCliente`),
  KEY `FKLOFAC` (`IdLote`),
  CONSTRAINT `FKCLFAC` FOREIGN KEY (`IdCliente`) REFERENCES `cicl11` (`IdCliente`),
  CONSTRAINT `FKLOFAC` FOREIGN KEY (`IdLote`) REFERENCES `selo09` (`IdLote`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `cifa13` */

insert  into `cifa13`(`IdFac`,`IdCliente`,`Monto`,`Observacion`,`IdLote`,`FechaCompra`,`Estado`) values (1,1,50000,'asdadsad',1,'2018-03-22',1),(2,1,6500,'asdadasdasdad',1,'2018-03-22',0),(3,1,555,'asdasd',1,'2018-03-22',1),(4,3,555,'adsdad',1,'2018-03-22',0),(5,4,363000,'kaldjsaldkjjkalsd',2,'2018-03-22',1),(6,1,2323320000000,'dfddfdgfegfgfd',1,'2018-03-23',1),(7,1,50000,'Vhcggg',1,'2018-04-03',0),(8,4,20000,'se le vendiò un kilo de cafe',4,'2018-04-10',0);

/*Table structure for table `cifa16` */

DROP TABLE IF EXISTS `cifa16`;

CREATE TABLE `cifa16` (
  `IdFac` int(11) NOT NULL AUTO_INCREMENT,
  `FechaV` datetime NOT NULL,
  `IdUser` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `TotalFac` float NOT NULL,
  PRIMARY KEY (`IdFac`),
  KEY `FKUSERF` (`IdUser`),
  KEY `FKCLIENTEF` (`IdCliente`),
  CONSTRAINT `FKCLIENTEF` FOREIGN KEY (`IdCliente`) REFERENCES `cicl11` (`IdCliente`),
  CONSTRAINT `FKUSERF` FOREIGN KEY (`IdUser`) REFERENCES `sgus05` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cifa16` */

/*Table structure for table `citc12` */

DROP TABLE IF EXISTS `citc12`;

CREATE TABLE `citc12` (
  `IdTipoC` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` char(1) NOT NULL DEFAULT 'O',
  `Saldo` float unsigned DEFAULT NULL,
  PRIMARY KEY (`IdTipoC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `citc12` */

/*Table structure for table `inin08` */

DROP TABLE IF EXISTS `inin08`;

CREATE TABLE `inin08` (
  `IdInsumo` int(11) NOT NULL AUTO_INCREMENT,
  `IdTI` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Cantidad` float NOT NULL,
  `FechaComp` date NOT NULL,
  `PrecioUnit` float NOT NULL,
  `Detalle` varchar(30) DEFAULT NULL,
  `FechaVence` date NOT NULL,
  `Procedencia` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdInsumo`),
  KEY `FKTIPO` (`IdTI`),
  CONSTRAINT `FKTIPO` FOREIGN KEY (`IdTI`) REFERENCES `inti07` (`IdTI`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `inin08` */

insert  into `inin08`(`IdInsumo`,`IdTI`,`Nombre`,`Cantidad`,`FechaComp`,`PrecioUnit`,`Detalle`,`FechaVence`,`Procedencia`) values (1,1,'Insecticida',87,'2018-03-22',120,'asd','2018-03-31','Chino'),(2,2,'Semillas de melon',20,'2018-03-01',10000,'Se compra por saco','2020-04-04','San Josè'),(3,3,'Maiz',20,'2018-03-22',5000,'Se compra por saco','2019-04-04','Nandayure');

/*Table structure for table `inlo30` */

DROP TABLE IF EXISTS `inlo30`;

CREATE TABLE `inlo30` (
  `IdINLO` int(11) NOT NULL AUTO_INCREMENT,
  `IdLote` int(11) NOT NULL,
  `IdTC` int(11) NOT NULL,
  PRIMARY KEY (`IdINLO`),
  KEY `FKCLO` (`IdLote`),
  KEY `FKTCLO` (`IdTC`),
  CONSTRAINT `FKCLO` FOREIGN KEY (`IdLote`) REFERENCES `selo09` (`IdLote`),
  CONSTRAINT `FKTCLO` FOREIGN KEY (`IdTC`) REFERENCES `intc10` (`IdTdCampo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `inlo30` */

insert  into `inlo30`(`IdINLO`,`IdLote`,`IdTC`) values (1,1,3),(2,2,4),(3,2,5),(4,2,8),(5,2,9),(6,1,94);

/*Table structure for table `intc10` */

DROP TABLE IF EXISTS `intc10`;

CREATE TABLE `intc10` (
  `IdTdCampo` int(11) NOT NULL AUTO_INCREMENT,
  `FechaTC` date DEFAULT NULL,
  `Total` float NOT NULL,
  `Horas` int(11) DEFAULT '8',
  `Justificacion` varchar(100) DEFAULT NULL,
  `Inversion` float DEFAULT NULL,
  PRIMARY KEY (`IdTdCampo`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;

/*Data for the table `intc10` */

insert  into `intc10`(`IdTdCampo`,`FechaTC`,`Total`,`Horas`,`Justificacion`,`Inversion`) values (1,'2018-03-22',0,8,NULL,NULL),(2,'2018-03-22',0,8,NULL,NULL),(3,'2018-03-08',2400,5,'asdad',8400),(4,'2018-03-21',0,10,'Siembra de melon',50000),(5,'2018-03-21',240,10,'Siembra de melon',240),(6,'2018-03-23',0,8,NULL,NULL),(7,'2018-03-23',0,8,NULL,NULL),(8,'2018-03-14',10000,5,'siembra de melon',35000),(9,'2018-03-14',20000,5,'siembra de melon',20000),(10,'2018-03-23',0,8,NULL,NULL),(11,'2018-03-23',0,8,NULL,NULL),(12,'2018-03-23',0,8,NULL,NULL),(13,'2018-03-23',0,8,NULL,NULL),(14,'2018-03-23',0,8,NULL,NULL),(15,'2018-03-23',0,8,NULL,NULL),(16,'2018-03-23',0,8,NULL,NULL),(17,'2018-03-23',0,8,NULL,NULL),(18,'2018-03-23',0,8,NULL,NULL),(19,'2018-03-23',0,8,NULL,NULL),(20,'2018-03-23',0,8,NULL,NULL),(21,'2018-03-23',0,8,NULL,NULL),(22,'2018-03-23',0,8,NULL,NULL),(23,'2018-03-23',0,8,NULL,NULL),(24,'2018-03-23',0,8,NULL,NULL),(25,'2018-03-23',0,8,NULL,NULL),(26,'2018-03-23',0,8,NULL,NULL),(27,'2018-03-23',0,8,NULL,NULL),(28,'2018-03-23',0,8,NULL,NULL),(29,'2018-03-23',0,8,NULL,NULL),(30,'2018-03-23',0,8,NULL,NULL),(31,'2018-03-23',0,8,NULL,NULL),(32,'2018-03-23',0,8,NULL,NULL),(33,'2018-03-23',0,8,NULL,NULL),(34,'2018-03-23',0,8,NULL,NULL),(35,'2018-03-23',0,8,NULL,NULL),(36,'2018-03-23',0,8,NULL,NULL),(37,'2018-03-23',0,8,NULL,NULL),(38,'2018-03-23',0,8,NULL,NULL),(39,'2018-03-23',0,8,NULL,NULL),(40,'2018-03-23',0,8,NULL,NULL),(41,'2018-03-23',0,8,NULL,NULL),(42,'2018-03-23',0,8,NULL,NULL),(43,'2018-03-23',0,8,NULL,NULL),(44,'2018-03-23',0,8,NULL,NULL),(45,'2018-03-23',0,8,NULL,NULL),(46,'2018-03-23',0,8,NULL,NULL),(47,'2018-03-23',0,8,NULL,NULL),(48,'2018-03-23',0,8,NULL,NULL),(49,'2018-03-23',0,8,NULL,NULL),(50,'2018-03-23',0,8,NULL,NULL),(51,'2018-03-23',0,8,NULL,NULL),(52,'2018-03-23',0,8,NULL,NULL),(53,'2018-03-23',0,8,NULL,NULL),(54,'2018-03-23',0,8,NULL,NULL),(55,'2018-03-23',0,8,NULL,NULL),(56,'2018-03-23',0,8,NULL,NULL),(57,'2018-03-23',0,8,NULL,NULL),(58,'2018-03-23',0,8,NULL,NULL),(59,'2018-03-23',0,8,NULL,NULL),(60,'2018-03-23',0,8,NULL,NULL),(61,'2018-03-23',0,8,NULL,NULL),(62,'2018-03-23',0,8,NULL,NULL),(63,'2018-03-23',0,8,NULL,NULL),(64,'2018-03-23',0,8,NULL,NULL),(65,'2018-03-23',0,8,NULL,NULL),(66,'2018-03-23',0,8,NULL,NULL),(67,'2018-03-23',0,8,NULL,NULL),(68,'2018-03-23',0,8,NULL,NULL),(69,'2018-03-23',0,8,NULL,NULL),(70,'2018-03-23',0,8,NULL,NULL),(71,'2018-03-23',0,8,NULL,NULL),(72,'2018-03-23',0,8,NULL,NULL),(73,'2018-03-23',0,8,NULL,NULL),(74,'2018-03-23',0,8,NULL,NULL),(75,'2018-03-23',0,8,NULL,NULL),(76,'2018-03-23',0,8,NULL,NULL),(77,'2018-03-23',0,8,NULL,NULL),(78,'2018-03-23',0,8,NULL,NULL),(79,'2018-03-23',0,8,NULL,NULL),(80,'2018-03-23',0,8,NULL,NULL),(81,'2018-03-23',0,8,NULL,NULL),(82,'2018-03-23',0,8,NULL,NULL),(83,'2018-03-23',0,8,NULL,NULL),(84,'2018-03-23',0,8,NULL,NULL),(85,'2018-03-23',0,8,NULL,NULL),(86,'2018-03-23',0,8,NULL,NULL),(87,'2018-03-23',0,8,NULL,NULL),(88,'2018-03-23',0,8,NULL,NULL),(89,'2018-03-23',50000,8,NULL,NULL),(90,'2018-03-23',80000,8,NULL,NULL),(91,'2018-03-23',0,8,NULL,NULL),(92,'2018-03-23',100000,8,NULL,NULL),(93,'2018-03-23',0,8,NULL,NULL),(94,'2018-04-03',0,3,'adasdasd',15000),(95,'2018-04-10',0,8,NULL,NULL),(96,'2018-04-20',0,8,NULL,NULL),(97,'2018-04-21',0,8,NULL,NULL),(98,'2018-05-16',0,8,NULL,NULL);

/*Table structure for table `intco28` */

DROP TABLE IF EXISTS `intco28`;

CREATE TABLE `intco28` (
  `IdTCOL` int(11) NOT NULL AUTO_INCREMENT,
  `IdTdCampo` int(11) NOT NULL,
  `IdCol` int(11) NOT NULL,
  PRIMARY KEY (`IdTCOL`),
  KEY `FKIDCOLT` (`IdTdCampo`),
  KEY `FKCOLTDC` (`IdCol`),
  CONSTRAINT `FKCOLTDC` FOREIGN KEY (`IdCol`) REFERENCES `plco03` (`IdColaborador`),
  CONSTRAINT `FKIDCOLT` FOREIGN KEY (`IdTdCampo`) REFERENCES `intc10` (`IdTdCampo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `intco28` */

insert  into `intco28`(`IdTCOL`,`IdTdCampo`,`IdCol`) values (3,3,2),(4,4,3),(5,7,3),(6,8,3),(7,92,3),(8,94,3),(9,95,3);

/*Table structure for table `inti07` */

DROP TABLE IF EXISTS `inti07`;

CREATE TABLE `inti07` (
  `IdTI` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(30) NOT NULL,
  PRIMARY KEY (`IdTI`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `inti07` */

insert  into `inti07`(`IdTI`,`Tipo`) values (1,'Fumigable'),(2,'Semillas de melon'),(3,'Semillas de maiz'),(4,'Semillas de sandia'),(5,'asdasdasd'),(7,'mota'),(8,'semillas de cafè');

/*Table structure for table `intl29` */

DROP TABLE IF EXISTS `intl29`;

CREATE TABLE `intl29` (
  `IdTCL` int(11) NOT NULL AUTO_INCREMENT,
  `IdInsumo` int(11) NOT NULL,
  `IdTC` int(11) NOT NULL,
  `Cantidad` float NOT NULL,
  `Total` float NOT NULL,
  PRIMARY KEY (`IdTCL`),
  KEY `FKINLOT` (`IdInsumo`),
  KEY `FKINTDC` (`IdTC`),
  CONSTRAINT `FKINLOT` FOREIGN KEY (`IdInsumo`) REFERENCES `inin08` (`IdInsumo`),
  CONSTRAINT `FKINTDC` FOREIGN KEY (`IdTC`) REFERENCES `intc10` (`IdTdCampo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `intl29` */

insert  into `intl29`(`IdTCL`,`IdInsumo`,`IdTC`,`Cantidad`,`Total`) values (1,1,3,20,2400),(2,1,5,2,240),(3,2,8,1,10000),(4,2,9,2,20000),(5,2,89,5,50000),(6,2,90,1,10000),(7,2,90,1,10000),(8,2,90,1,10000),(9,2,90,5,50000),(10,3,92,20,100000);

/*Table structure for table `plcc26` */

DROP TABLE IF EXISTS `plcc26`;

CREATE TABLE `plcc26` (
  `IdCC` int(11) NOT NULL AUTO_INCREMENT,
  `IdColaborador` int(11) NOT NULL,
  `IdConcepto` int(11) NOT NULL,
  `Total` decimal(10,0) NOT NULL,
  `IdNomina` int(11) NOT NULL,
  PRIMARY KEY (`IdCC`),
  KEY `FKCOL` (`IdColaborador`),
  KEY `FKCON` (`IdConcepto`),
  KEY `FKNOMI` (`IdNomina`),
  CONSTRAINT `FKCOL` FOREIGN KEY (`IdColaborador`) REFERENCES `plco03` (`IdColaborador`),
  CONSTRAINT `FKCON` FOREIGN KEY (`IdConcepto`) REFERENCES `plcp21` (`IdConcepto`),
  CONSTRAINT `FKNOMI` FOREIGN KEY (`IdNomina`) REFERENCES `plno24` (`IdNomina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `plcc26` */

/*Table structure for table `plco03` */

DROP TABLE IF EXISTS `plco03`;

CREATE TABLE `plco03` (
  `IdColaborador` int(11) NOT NULL AUTO_INCREMENT,
  `IdPersona` int(11) NOT NULL,
  `IdTipoColaborador` int(11) NOT NULL,
  `FechaBaja` date DEFAULT NULL,
  `FechaIngreso` date NOT NULL,
  `SalarioBase` int(11) NOT NULL,
  `SalarioBruto` int(11) DEFAULT NULL,
  `Horas` int(11) NOT NULL,
  PRIMARY KEY (`IdColaborador`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `plco03` */

insert  into `plco03`(`IdColaborador`,`IdPersona`,`IdTipoColaborador`,`FechaBaja`,`FechaIngreso`,`SalarioBase`,`SalarioBruto`,`Horas`) values (2,5,5,'0000-00-00','2018-03-22',1200,1441200,1201),(3,0,1,'0000-00-00','2018-01-03',5000,30000,6),(4,5,6,'0000-00-00','2018-04-27',1200,12000,10),(5,11,1,'0000-00-00','2018-04-27',1201,12010,10);

/*Table structure for table `plcp21` */

DROP TABLE IF EXISTS `plcp21`;

CREATE TABLE `plcp21` (
  `IdConcepto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(15) NOT NULL,
  `Porcentaje` float unsigned DEFAULT NULL,
  `Total` float unsigned DEFAULT NULL,
  `Tipo` varchar(15) NOT NULL DEFAULT 'Deduccion',
  PRIMARY KEY (`IdConcepto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `plcp21` */

/*Table structure for table `plhe27` */

DROP TABLE IF EXISTS `plhe27`;

CREATE TABLE `plhe27` (
  `IdHoras` int(11) NOT NULL AUTO_INCREMENT,
  `Cantidad` int(11) NOT NULL,
  `IdColaborador` int(11) NOT NULL,
  `Estado` varchar(15) NOT NULL DEFAULT 'Pendiente',
  `Fecha` date NOT NULL,
  PRIMARY KEY (`IdHoras`),
  KEY `FKIDCOLHORAS` (`IdColaborador`),
  CONSTRAINT `FKIDCOLHORAS` FOREIGN KEY (`IdColaborador`) REFERENCES `plco03` (`IdColaborador`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `plhe27` */

insert  into `plhe27`(`IdHoras`,`Cantidad`,`IdColaborador`,`Estado`,`Fecha`) values (1,5,2,'Aplicado','2018-03-08'),(2,5,2,'Aplicado','2018-03-22'),(3,2,3,'Aplicado','2018-03-01'),(4,3,5,'Pendiente','2018-04-27');

/*Table structure for table `plno24` */

DROP TABLE IF EXISTS `plno24`;

CREATE TABLE `plno24` (
  `IdNomina` int(11) NOT NULL AUTO_INCREMENT,
  `IdColaborador` int(11) NOT NULL,
  `fInicio` date DEFAULT NULL,
  `fFin` date DEFAULT NULL,
  `IdPlanilla` int(11) DEFAULT NULL,
  `MontoNomina` decimal(10,0) DEFAULT NULL,
  `HE` int(11) DEFAULT '0',
  PRIMARY KEY (`IdNomina`),
  KEY `FKNOMICOLA` (`IdColaborador`),
  KEY `FKPLANILLA` (`IdPlanilla`),
  CONSTRAINT `FKNOMICOLA` FOREIGN KEY (`IdColaborador`) REFERENCES `plco03` (`IdColaborador`),
  CONSTRAINT `FKPLANILLA` FOREIGN KEY (`IdPlanilla`) REFERENCES `plpl25` (`IdPlanilla`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `plno24` */

insert  into `plno24`(`IdNomina`,`IdColaborador`,`fInicio`,`fFin`,`IdPlanilla`,`MontoNomina`,`HE`) values (13,2,'2018-03-22','2018-03-22',7,153000,5),(14,2,'2017-11-01','2018-04-05',9,144000,0),(16,2,'2018-07-01','2018-07-15',11,144000,0),(17,3,'2018-07-01','2018-07-15',11,30000,0),(19,2,'2018-08-01','2018-08-15',13,144000,0),(20,3,'2018-08-01','2018-08-15',13,30000,0),(21,2,'2018-04-27','2018-04-30',14,1441200,0),(22,3,'2018-04-27','2018-04-30',14,30000,0),(23,4,'2018-04-27','2018-04-30',14,12000,0),(24,5,'2018-04-27','2018-04-30',14,12010,0);

/*Table structure for table `plpl25` */

DROP TABLE IF EXISTS `plpl25`;

CREATE TABLE `plpl25` (
  `IdPlanilla` int(11) NOT NULL AUTO_INCREMENT,
  `Total` decimal(10,0) DEFAULT NULL,
  `Estado` varchar(15) DEFAULT 'Pendiente',
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  PRIMARY KEY (`IdPlanilla`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `plpl25` */

insert  into `plpl25`(`IdPlanilla`,`Total`,`Estado`,`FechaInicio`,`FechaFin`) values (7,153000,'Pendiente','2018-03-22','2018-03-22'),(8,144000,'Pendiente','2017-11-01','2018-04-05'),(9,45000,'Pendiente','2017-11-01','2018-04-05'),(10,144000,'Pendiente','2018-07-01','2018-07-15'),(11,30000,'Aprobado','2018-07-01','2018-07-15'),(13,174000,'Pendiente','2018-08-01','2018-08-15'),(14,1495210,'Aprobado','2018-04-27','2018-04-30');

/*Table structure for table `plse29` */

DROP TABLE IF EXISTS `plse29`;

CREATE TABLE `plse29` (
  `IdPlSe` int(11) NOT NULL AUTO_INCREMENT,
  `IdColaborador` int(11) NOT NULL,
  `IdLote` int(11) NOT NULL,
  PRIMARY KEY (`IdPlSe`),
  KEY `FKSELOCOL` (`IdLote`),
  KEY `FKCOLSELO` (`IdColaborador`),
  CONSTRAINT `FKCOLSELO` FOREIGN KEY (`IdColaborador`) REFERENCES `plco03` (`IdColaborador`),
  CONSTRAINT `FKSELOCOL` FOREIGN KEY (`IdLote`) REFERENCES `selo09` (`IdLote`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `plse29` */

/*Table structure for table `pltc02` */

DROP TABLE IF EXISTS `pltc02`;

CREATE TABLE `pltc02` (
  `IdTipoColaborador` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(30) NOT NULL DEFAULT '0',
  `Detalle` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdTipoColaborador`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `pltc02` */

insert  into `pltc02`(`IdTipoColaborador`,`Tipo`,`Detalle`) values (1,'Fijo','Fijo'),(5,'Jornal','Hola mundo'),(6,'temporal','chapeador');

/*Table structure for table `seil19` */

DROP TABLE IF EXISTS `seil19`;

CREATE TABLE `seil19` (
  `IdDLote` int(11) NOT NULL AUTO_INCREMENT,
  `IdTrabajoC` int(11) NOT NULL,
  `Costo` float NOT NULL,
  `FechaApl` datetime NOT NULL,
  PRIMARY KEY (`IdDLote`),
  KEY `FKTRACAM` (`IdTrabajoC`),
  CONSTRAINT `FKTRACAM` FOREIGN KEY (`IdTrabajoC`) REFERENCES `intc10` (`IdTdCampo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `seil19` */

/*Table structure for table `selo09` */

DROP TABLE IF EXISTS `selo09`;

CREATE TABLE `selo09` (
  `IdLote` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  `AreaL` float NOT NULL,
  `Estado` varchar(20) NOT NULL DEFAULT 'Habilitado',
  `Produccion` varchar(30) NOT NULL,
  PRIMARY KEY (`IdLote`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `selo09` */

insert  into `selo09`(`IdLote`,`Nombre`,`AreaL`,`Estado`,`Produccion`) values (1,'Las palomas',450,'Habilitado','Maiz '),(2,'San Martìn',500,'Habilitado','Melon'),(3,'Brasil',420,'Habilitado','Maiz'),(4,'Ciendillo',6000,'Habilitado','cafè');

/*Table structure for table `sgar06` */

DROP TABLE IF EXISTS `sgar06`;

CREATE TABLE `sgar06` (
  `IdUR` int(11) NOT NULL AUTO_INCREMENT,
  `IdUser` int(11) NOT NULL,
  `IdRol` int(11) NOT NULL,
  PRIMARY KEY (`IdUR`),
  KEY `FKUSER` (`IdUser`),
  KEY `FKROL` (`IdRol`),
  CONSTRAINT `FKROL` FOREIGN KEY (`IdRol`) REFERENCES `sgro04` (`IdRol`),
  CONSTRAINT `FKUSER` FOREIGN KEY (`IdUser`) REFERENCES `sgus05` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sgar06` */

/*Table structure for table `sgro04` */

DROP TABLE IF EXISTS `sgro04`;

CREATE TABLE `sgro04` (
  `IdRol` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(30) NOT NULL,
  PRIMARY KEY (`IdRol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sgro04` */

/*Table structure for table `sgus05` */

DROP TABLE IF EXISTS `sgus05`;

CREATE TABLE `sgus05` (
  `IdUser` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Apellido1` varchar(100) DEFAULT NULL,
  `Apellido2` varchar(100) DEFAULT NULL,
  `Rol` int(11) DEFAULT '0',
  `Recuperacion` varchar(100) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  PRIMARY KEY (`IdUser`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `sgus05` */

insert  into `sgus05`(`IdUser`,`userName`,`pass`,`Nombre`,`Apellido1`,`Apellido2`,`Rol`,`Recuperacion`,`Correo`) values (1,'bisash','e66fa7a618b1403c18c4ec9bc6bd5f33','Yoher','Obando','Duarte',1,'fa49e2b3711519eedc27ffa94860c550','yoher.od96@hotmail.com'),(6,'Cheski','c0784027b45aa11e848a38e890f8416c','Jose','Alvarez','Mayorga',1,'4ff69f0251b1d8562a7bc76733943511',''),(7,'JoseM','c0784027b45aa11e848a38e890f8416c','Jose Manuel','Alvarez','Mayorga',1,'51e813ee3c0fcf5c4d294f3c0b079ef6','josechez87@gmail.com');

/*Table structure for table `uspr01` */

DROP TABLE IF EXISTS `uspr01`;

CREATE TABLE `uspr01` (
  `IdPersona` int(11) NOT NULL AUTO_INCREMENT,
  `Cedula` varchar(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido1` varchar(30) NOT NULL,
  `Apellido2` varchar(30) NOT NULL,
  `Telefono` varchar(11) NOT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `uspr01` */

insert  into `uspr01`(`IdPersona`,`Cedula`,`Nombre`,`Apellido1`,`Apellido2`,`Telefono`,`Direccion`,`Correo`) values (1,'12312312','Javiers','Obando','Duarte','87906625','Brasilito','yoher.od96@hotmail.com'),(2,'555555','napo','po','aa','55555555','asdads','sad@aas.com'),(3,'113220560','Josè Manuel','Mayorga','Àlvarez','86649373','San martin','josechez87@gmail.com'),(4,'50259902','Jaime','Salazar','Sànchez','83688562','El porvenir de Nandayure','jaimesalazar181@gmail.com'),(5,'5041101911','yoher','obandos','Duarte','87906665','Brasilito','yoher.od96@hotmail.com'),(6,'12312312','Javier','Obando','Duarte','87906625','Brasilit','yoher.od96@hotmail.com'),(7,'12312312','Javier','Obando','Duarte','87906625','Brasilito','yoher.od96@hotmail.com'),(8,'12312312','Javier','Obandos','Duarte','87906625','Brasilito','yoher.od96@hotmail.com'),(9,'12312312','Javiers','Obando','Duarte','87906625','Brasilito','yoher.od96@hotmail.com'),(10,'12312312','Javiers','Obando','Duarte','87906625','Brasilito','yoher.od96@hotmail.com'),(11,'105260007','Carlos','Jimenez','Venegas','87906625','Puntarenas','fsd@asa.com');

/* Procedure structure for procedure `AgregaHE` */

/*!50003 DROP PROCEDURE IF EXISTS  `AgregaHE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregaHE`(in pcan int, in idcol int,in fecha date)
BEGIN
    declare i int;
    set i = 0;
    select count(IdNomina) into i
    from plno24
    where plno24.fInicio <= fecha
    and plno24.fFin >= fecha;
    if(i > 0) then
    insert into plhe27(Cantidad,IdColaborador,Fecha)
    values (pcan,idcol,fecha);
    end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `AlteraSalB` */

/*!50003 DROP PROCEDURE IF EXISTS  `AlteraSalB` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `AlteraSalB`(in id int ,in mm float,in idpl int)
BEGIN
declare topl int;
    update plno24
    set MontoNomina = mm
    where plno24.IdNomina = id;
          SELECT SUM(MontoNomina) into topl
          FROM plno24
          WHERE IdPlanilla = idpl ;
          Update plpl25
          set Total = topl
          where plpl25.IdPlanilla = idpl;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Anul` */

/*!50003 DROP PROCEDURE IF EXISTS  `Anul` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Anul`(in idf int)
BEGIN
    update cifa13
    set Estado = 1
    where IdFac = idf;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `AplicarHorasExtras` */

/*!50003 DROP PROCEDURE IF EXISTS  `AplicarHorasExtras` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `AplicarHorasExtras`(in id int, in f date,in idcol int)
BEGIN
    declare horas int;
    declare total float;
    declare idn int;
    declare monto float;
    declare toHE int;
    declare idpl int;
    select Cantidad into horas
    from plhe27
    where IdHoras = id;
    select IdNomina into idn
    from plno24
    where plno24.IdColaborador = idcol
    and f <= plno24.fFin
    and f >= plno24.fInicio;
    SELECT HE INTO toHE
    FROM plno24
    WHERE IdNomina = idn;
    SELECT IdPlanilla INTO idpl
    FROM plno24
    WHERE IdNomina = idn;
    select MontoNomina into total
    from plno24
    where IdNomina = idn;
    select SalarioBase into monto
    from plco03
    where IdColaborador = idcol;
    update plhe27
    set Estado = 'Aplicado'
    where IdHoras = id;
    update plno24
    set MontoNomina = (total + ((monto * 1.5)*horas)),
    HE = (toHE + horas)
    where IdNomina = idn;
          UPDATE plpl25
          SET Total = (plpl25.Total + ((monto * 1.5)*horas))
          WHERE plpl25.IdPlanilla = idpl;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `aprobarplanilla` */

/*!50003 DROP PROCEDURE IF EXISTS  `aprobarplanilla` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `aprobarplanilla`(IN idpl INT,IN op INT)
BEGIN
    IF op = 1 THEN
     UPDATE plpl25
     SET Estado = "Aprobado"
     WHERE IdPlanilla = idpl;
    ELSE
     UPDATE plpl25
     SET Estado = "Pendiente"
     WHERE IdPlanilla = idpl;
    END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `AsignarColALote` */

/*!50003 DROP PROCEDURE IF EXISTS  `AsignarColALote` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `AsignarColALote`(in PIdLote int, in IdCol int)
BEGIN
    Declare id int;
    DECLARE cont INT;
    SET cont = 0;
    set id = 0;
    SELECT count(IdPlSe) INTO cont
    FROM plse29
    WHERE IdColaborador = IdCol;
    select IdPlSe into id
    from plse29
    where IdColaborador = IdCol;
    if cont <= 0 then
    insert into plse29(IdColaborador,IdLote)
    values (IdCol,PIdLote);
    else
    update plse29
    set IdColaborador = IdCol,
    IdLote = PIdLote
    where IdPlSe = id;
    end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Balances` */

/*!50003 DROP PROCEDURE IF EXISTS  `Balances` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Balances`(in fi date,in ff date)
BEGIN
    DECLARE ventas FLOAT DEFAULT 0;
    DECLARE id int DEFAULT 0;
    delete from cibl17;
    insert into cibl17(IdLote,Nombre) select l.IdLote,l.Nombre from selo09 l;
    update cibl17 b,cifa13 f
    set Ventas = (select SUM(Monto)
	          FROM cifa13 f
	          WHERE f.IdLote = b.IdLote
	          and f.FechaCompra between fi and ff
	          GROUP BY f.IdLote);
    UPDATE cibl17 b,intc10 t,inlo30 l,selo09 o
    SET Gasto = (   SELECT sum(t.Inversion) FROM intc10 t,inlo30 l,selo09 o
		    WHERE t.IdTdCampo IN(SELECT IdTdCampo FROM intco28)
		    AND o.IdLote = l.IdLote
		    and b.IdLote = o.IdLote
		    AND l.IdTC = t.IdTdCampo
		    AND t.FechaTC BETWEEN fi AND ff
		    group by o.IdLote );
    END */$$
DELIMITER ;

/* Procedure structure for procedure `BBB` */

/*!50003 DROP PROCEDURE IF EXISTS  `BBB` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `BBB`(in op int)
BEGIN
    if op <= 0 then
     select * from cibl17;
    else
    select * from cibl17 b
    where b.IdLote = op;
    end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `calculaPorcentajeDD` */

/*!50003 DROP PROCEDURE IF EXISTS  `calculaPorcentajeDD` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `calculaPorcentajeDD`(in idd int)
BEGIN
    DECLARE Porce FLOAT;
    declare tot float;
    declare tipo varchar(20);
    SELECT n.Tipo INTO tipo
    FROM plcp21 n
    WHERE n.IdConcepto = idd;
    select n.Porcentaje into Porce
    from plcp21 n
    where n.IdConcepto = idd;
    SELECT n.Total INTO tot
    FROM plcp21 n
    WHERE n.IdConcepto = idd;
    select tot,Porce,tipo;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `CargaCBOLote` */

/*!50003 DROP PROCEDURE IF EXISTS  `CargaCBOLote` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `CargaCBOLote`(in idCol int)
BEGIN
    select IdLote
    from plse29
    where IdColaborador = idCol;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `CargaCol` */

/*!50003 DROP PROCEDURE IF EXISTS  `CargaCol` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `CargaCol`()
BEGIN
    select c.IdColaborador,p.Cedula,p.Nombre,p.Apellido1
    from plco03 c, uspr01 p
    where c.IdPersona = p.IdPersona;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `CargarInventario` */

/*!50003 DROP PROCEDURE IF EXISTS  `CargarInventario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `CargarInventario`(in id int, in cant float)
BEGIN
    
     DECLARE ff FLOAT;    
    DECLARE ss FLOAT;    
    
    SELECT Cantidad INTO ff
    FROM inin08
    WHERE IdInsumo = id;
    
    SELECT ff+cant INTO ss;
    
    UPDATE inin08
    SET Cantidad = ss
    WHERE IdInsumo = id;
    
    END */$$
DELIMITER ;

/* Procedure structure for procedure `cboCliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `cboCliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `cboCliente`()
BEGIN
    SELECT c.IdCliente,p.Cedula,CONCAT(p.Nombre,' ',p.Apellido1) AS 'Cliente'
    FROM cicl11 c, uspr01 p
    WHERE c.IdPersona = p.IdPersona;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `changepw` */

/*!50003 DROP PROCEDURE IF EXISTS  `changepw` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `changepw`(in usuario varchar(100),in newpw varchar(100),in newtoken varchar(100))
BEGIN
    update sgus05
    set pass = newpw,
    Recuperacion = newtoken
    where userName = usuario;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `codigorecuperacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `codigorecuperacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `codigorecuperacion`(in usuario varchar(100))
BEGIN
    select Recuperacion,Correo as "Correo"from sgus05
    where userName = usuario;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `ColColTC` */

/*!50003 DROP PROCEDURE IF EXISTS  `ColColTC` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ColColTC`(in tc int)
BEGIN
    SELECT t.IdCol,p.Nombre
    FROM intco28 t,plco03 c,uspr01 p
    WHERE IdTdCampo = tc
    AND t.IdCol = c.IdColaborador
    AND c.IdPersona = p.IdPersona;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `crearTipoCol` */

/*!50003 DROP PROCEDURE IF EXISTS  `crearTipoCol` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `crearTipoCol`(in id int,in tipo varchar(30), in detalle varchar(30))
BEGIN
    
    if id > 0 then
    
    update pltc02
    set Tipo = tipo,
    Detalle = detalle
    where IdTipoColaborador = id;
    
    else
    
    insert into pltc02 (Tipo,Detalle)
    values (tipo,detalle);
    
    end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `CreaTC` */

/*!50003 DROP PROCEDURE IF EXISTS  `CreaTC` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `CreaTC`(in Fecha date)
BEGIN
    insert into intc10(FechaTC)
    values (Fecha);
    select max(intc10.IdTdCampo)'IdTc'
    from intc10;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `dataUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `dataUsuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `dataUsuario`()
BEGIN
    select IdUser,Nombre,Apellido1,Apellido2
    from sgus05;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DlTCO` */

/*!50003 DROP PROCEDURE IF EXISTS  `DlTCO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DlTCO`(in idCol int,in idTC int)
BEGIN
    delete from intco28
    where IdCol = idCol
    AND IdTdCampo = idTC;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `EditarHE` */

/*!50003 DROP PROCEDURE IF EXISTS  `EditarHE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarHE`(in idH int, IN pcan INT, IN idcol INT,IN fecha DATE)
BEGIN
    update plhe27
    set Cantidad = pcan,
    Fecha = fecha,
    IdColaborador = idcol
    where IdHoras = idH;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `EliminaConceptoCol` */

/*!50003 DROP PROCEDURE IF EXISTS  `EliminaConceptoCol` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminaConceptoCol`(in idN int , in idCo int)
BEGIN
    delete from plcc26
    where IdNomina = idN
    and IdCC = idCo;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `EliminaTipo` */

/*!50003 DROP PROCEDURE IF EXISTS  `EliminaTipo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminaTipo`(in id int)
BEGIN
    delete from pltc02
    where IdTipoColaborador = id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GeneraNominas` */

/*!50003 DROP PROCEDURE IF EXISTS  `GeneraNominas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GeneraNominas`(in pFI date, in pFF date)
BEGIN
declare id int;
          INSERT INTO plno24 (IdColaborador,fInicio,fFin,MontoNomina)
          SELECT IdColaborador, pFI, pFF,SalarioBruto FROM plco03;
          insert into plpl25(total,FechaFin,FechaInicio)
          select sum(MontoNomina),pFF,pFI from plco03, plno24
          where plno24.IdColaborador = plco03.IdColaborador
          and plno24.fInicio = pFI
          and plno24.fFin = pFF;
SELECT LAST_INSERT_ID() INTO id;
SELECT IdPlanilla
from plpl25;
          update plno24
          set IdPlanilla = id
          where plno24.fInicio = pFI
          and plno24.fFin = pFF;
          END */$$
DELIMITER ;

/* Procedure structure for procedure `HorasAprovechadas` */

/*!50003 DROP PROCEDURE IF EXISTS  `HorasAprovechadas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `HorasAprovechadas`(in id int,in fi date,in ff date )
BEGIN
    declare toHoras int default 0;
    select sum(Horas) into toHoras
    from intc10
    where IdTdCampo in(select i.IdTdCampo from intco28 i where IdCol = id)
    and FechaTC between fi and ff;
    select toHoras as "hxa";
    END */$$
DELIMITER ;

/* Procedure structure for procedure `IGAS23` */

/*!50003 DROP PROCEDURE IF EXISTS  `IGAS23` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `IGAS23`(in pNombre varchar(15),
                               in pPorcentaje float,
                               in pTotal float)
BEGIN
    INSERT INTO plgo21(Nombre,Porcentaje,Total)
    VALUES (pNombre,pPorcentaje,pTotal);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `IGC22` */

/*!50003 DROP PROCEDURE IF EXISTS  `IGC22` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `IGC22`()
BEGIN
    INSERT INTO plgc23 (IdGasto,IdColaborador)
    VALUES (pIdGasto,pColaborador)
    ;END */$$
DELIMITER ;

/* Procedure structure for procedure `IIN007` */

/*!50003 DROP PROCEDURE IF EXISTS  `IIN007` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `IIN007`(in pIdTI int,
                               in pNombre varchar(30),
                               in pCantidad float,
                               in pFecCom date,
                               in pPrecio float,
                               in pDetalle varchar(30),
                               in pFeVe date,
                               in pProce varchar(30))
BEGIn
    insert into inin08(IdTI,Nombre,Cantidad,FechaComp,PrecioUnit,Detalle,FechaVence,Procedencia)
    values (pIdTI,pNombre,pCantidad,pFecCom,pPrecio,pDetalle,pFeVe,pProce)
    ;END */$$
DELIMITER ;

/* Procedure structure for procedure `ILO005` */

/*!50003 DROP PROCEDURE IF EXISTS  `ILO005` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ILO005`(IN pNombre varchar(30),
                               in pArea float,
                               in pEstado char(1),
                               in pProd varchar(30))
BEGIN
    insert into selo09(Nombre,AreaL,Estado,Produccion)
    values(pNombre,pArea,pEstado,pProd);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `INP001` */

/*!50003 DROP PROCEDURE IF EXISTS  `INP001` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `INP001`(in pCed varchar(11),
                               in pNombre varchar(30),
                               in pAp1 varchar(30),
                               in pAp2 varchar(30),
                               in pTel varchar(11),
                               in pDirecc varchar(100),
                               in pCorr	varchar(30))
BEGIN
    INSERT INTO uspr01(Cedula,Nombre,Apellido1,Apellido2,Telefono,Direccion,Correo)
    VALUES(pCed,pNombre,pAp1,pAp2,pTel,pDirecc,pCorr);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertarCliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertarCliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCliente`(in id int)
BEGIN
    declare per int default 0;
    select max(IdPersona) into per
    from uspr01;
    if id <= 0 then
    insert into cicl11(IdPersona)
    values(per);
    else
    INSERT INTO cicl11(IdPersona)
    VALUES(id);
    end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertarCoCol` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertarCoCol` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCoCol`(
  in idcol int,
  in idcon int,
  IN pto DOUBLE,
  in pId int
)
BEGIN
  insert into plcc26 (
    IdColaborador,
    IdConcepto,
    IdNomina,
    Total
  )
  values
    (idcol, idcon, pId, pto);
END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertarColaborador` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertarColaborador` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarColaborador`(
                                            in pIdTC int,
                                            in pTipo varchar(30),
                                            in pDetalle varchar(30),
                                            in pCedula varchar(30),
                                            in pNombre varchar(30),
                                            in pApellido1 varchar(30),
                                            in pApellido2 varchar(30),
                                            in pTelefono varchar(11),
                                            in pDireccion varchar(100),
                                            in pCorreo varchar(30),
                                            in pFI date,
                                            in pFB date,
                                            in pSBA int,
                                            in pHoras int)
BEGIN
     insert into uspr01(Cedula,Nombre,Apellido1,Apellido2,Telefono,Direccion,Correo)
     values (pCedula,pNombre,pApellido1,pApellido2,pTelefono,pDireccion,pCorreo);
     insert into pltc02(Tipo,Detalle)
     values (pTipo,pDetalle);
     insert into plco03(IdColaborador,IdPersona,IdTipoColaborador,FechaBaja,FechaIngreso,SalarioBase,SalarioBruto,Horas)
     values ( (SELECT MAX(IdPersona) from uspr01),pIdTC,pFB,pFI,pSBA,(pSBA*pHoras),pHoras);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `INSERTARTCLO` */

/*!50003 DROP PROCEDURE IF EXISTS  `INSERTARTCLO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTARTCLO`(IN pidL int, in pitdc int,in fec date,in pho int, in jus varchar(100),in inver float)
BEGIN
    Declare ver int;
    set ver = 0;
    select IdTC into ver
    from inlo30
    where IdTC = pitdc;
    if ver = 0 then
    insert into inlo30(IdTC,IdLote)
    values(pitdc,pidL);
    else
    update inlo30
    set IdLote = pidL
    where IdTC = ver;
    end if;
    update intc10
    set FechaTC = fec,
    Horas = pho,
    Justificacion = jus,
    Inversion = inver
    where IdTdCampo = pitdc;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Insum` */

/*!50003 DROP PROCEDURE IF EXISTS  `Insum` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Insum`(in fa int)
BEGIN
    select a.IdTCL, a.IdTC,a.IdInsumo,b.Nombre,a.Cantidad,a.Total
    from intl29 a,inin08 b
    where a.IdTC = fa
    and a.IdInsumo = b.IdInsumo;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InTCLO` */

/*!50003 DROP PROCEDURE IF EXISTS  `InTCLO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InTCLO`(in insumo int, in pidtc int, in catidad float)
BEGIN
    declare total float;
    declare precio float;
    declare tc float;
    declare ff float;
    select Total into tc
    from intc10
    where IdTdCampo = pidtc;
    select Cantidad into total
    from inin08
    where IdInsumo = insumo;
    SELECT PrecioUnit INTO precio
    FROM inin08
    WHERE IdInsumo = insumo;
    if total >= catidad then
    insert into intl29(IdInsumo,IdTC,Cantidad,Total)
    values (insumo,pidtc,catidad,(precio*catidad));
    update intc10
    set Total = intc10.Total + (precio*catidad)
    where IdTdCampo = pidtc;
    update inin08
    set Cantidad = (total - catidad)
    where IdInsumo = insumo;
    select '1' as 'dato';
    else
    select '0' as 'dato';
    end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InTCO` */

/*!50003 DROP PROCEDURE IF EXISTS  `InTCO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InTCO`(in pidCol int)
BEGIN
    DECLARE idtc INT;
    select max(IdTdCampo) into idtc
    from intc10;
    insert into intco28(IdTdCampo,IdCol)
    values (idtc, pidCol);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `IPC002` */

/*!50003 DROP PROCEDURE IF EXISTS  `IPC002` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `IPC002`(iN pTi varchar(30),
                               in pDet varchar(30))
BEGIN
    insert into pltc02(Tipo,Detalle)
    values(pTi,pDet);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `IRO003` */

/*!50003 DROP PROCEDURE IF EXISTS  `IRO003` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `IRO003`(in pDecr varchar(30))
BEGIN
    insert into sgro04(Descripcion)
    values (pDecr);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `ITC006` */

/*!50003 DROP PROCEDURE IF EXISTS  `ITC006` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ITC006`(in pTipo char(1))
BEGIN
    insert into citc12(Tipo)
    values(pTipo);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `ITI004` */

/*!50003 DROP PROCEDURE IF EXISTS  `ITI004` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ITI004`(in dTipo varchar(30))
BEGIN
    insert into inti07(Tipo)
    values (dTipo);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `LFA80` */

/*!50003 DROP PROCEDURE IF EXISTS  `LFA80` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `LFA80`()
BEGIN
    SELECT *FROM cifa16
    ORDER BY cifa16.FechaV;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `ListaHabilitadoLote` */

/*!50003 DROP PROCEDURE IF EXISTS  `ListaHabilitadoLote` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ListaHabilitadoLote`()
BEGIN
    select IdLote, Nombre
    from selo09
    where Estado = 'Habilitado';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listar`()
BEGIN
    SELECT i.IdInsumo,i.Nombre,i.Cantidad,i.FechaComp,i.PrecioUnit,i.FechaVence,i.Procedencia,i.Detalle,t.IdTI,t.Tipo
    FROM inin08 i,inti07 t
    where i.IdTI = t.IdTI;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `listarCC` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarCC` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarCC`(in id int)
BEGIN
    SELECT c.IdConcepto,c.Nombre,c.Porcentaje,c.Total,c.Tipo
    FROM plcc26 p,plcp21 c
    WHERE p.IdConcepto = c.IdConcepto
    AND p.IdColaborador = id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `ListarColaborador` */

/*!50003 DROP PROCEDURE IF EXISTS  `ListarColaborador` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarColaborador`()
BEGIN
    select c.IdColaborador,c.IdPersona,p.Cedula,p.Nombre,p.Apellido1,p.Apellido2,p.Telefono,p.Direccion,p.Correo,t.Tipo,c.FechaBaja,c.FechaIngreso,t.IdTipoColaborador,c.SalarioBase,c.SalarioBruto,c.Horas
    from plco03 c, uspr01 p, pltc02 t
    where c.IdPersona = p.IdPersona
    and t.IdTipoColaborador = c.IdTipoColaborador;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `listarCOLP` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarCOLP` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarCOLP`()
BEGIN
    select IdColaborador,concat(p.Cedula,' ',p.Nombre,' ',p.Apellido1) as 'Col'
    from uspr01 p, plco03 c
    where p.IdPersona = c.IdPersona;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `ListarCOLSTRC` */

/*!50003 DROP PROCEDURE IF EXISTS  `ListarCOLSTRC` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarCOLSTRC`(in idTc int)
BEGIN
    SELECT c.IdColaborador,p.Cedula,p.Nombre,p.Apellido1,c.SalarioBase
    FROM plco03 c, uspr01 p
    WHERE c.IdPersona = p.IdPersona
    AND c.IdColaborador NOT IN(SELECT IdCol FROM intco28 WHERE IdTdCampo = idTc);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `ListarHE` */

/*!50003 DROP PROCEDURE IF EXISTS  `ListarHE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarHE`()
BEGIN
    select c.IdColaborador ,concat(p.Nombre,' ',p.Apellido1) as 'Colaborador',h.IdHoras,h.Cantidad,h.Fecha,h.Estado
    from plhe27 h,plco03 c,uspr01 p
    where h.IdColaborador = c.IdColaborador
    and c.IdPersona = p.IdPersona;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `listarTipos` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarTipos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarTipos`()
BEGIN
    
    select IdTipoColaborador,Tipo,Detalle
    from pltc02;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `ListarTodosConceptos` */

/*!50003 DROP PROCEDURE IF EXISTS  `ListarTodosConceptos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarTodosConceptos`(in Ids int, in idn int)
BEGIN
  SELECT C.IdConcepto , C.Nombre, C.Porcentaje, C.Total, C.Tipo
  FROM plcp21 AS C
  WHERE C.IdConcepto NOT IN(SELECT IdConcepto FROM plcc26 WHERE IdColaborador = Ids and IdNomina = idn);
  END */$$
DELIMITER ;

/* Procedure structure for procedure `llamaconceptocol` */

/*!50003 DROP PROCEDURE IF EXISTS  `llamaconceptocol` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `llamaconceptocol`(in idCol int,in id int)
BEGIN
    select p.IdCC,c.IdConcepto,c.Nombre,c.Porcentaje,c.Total,c.Tipo
    from plcp21 c, plcc26 p
    where c.IdConcepto = p.IdConcepto
    and p.IdColaborador = idCol
    and p.IdNomina = id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `llamarConceptos` */

/*!50003 DROP PROCEDURE IF EXISTS  `llamarConceptos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `llamarConceptos`()
BEGIN
    select p.IdCC,p.IdColaborador,p.IdConcepto,p.Total
    from plcc26 p;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `newUser` */

/*!50003 DROP PROCEDURE IF EXISTS  `newUser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `newUser`(in userN varchar(100),in passp varchar(255),in nom varchar(100),IN ap1 VARCHAR(100),IN ap2 VARCHAR(100),in rol int,in Recu varchar(100),in cor varchar(100))
BEGIN
    insert into sgus05(userName,pass,Nombre,Apellido1,Apellido2,Rol,Recuperacion,Correo)
    values (userN,passp,nom,ap1,ap2,rol,Recu,cor);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `NOM24` */

/*!50003 DROP PROCEDURE IF EXISTS  `NOM24` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `NOM24`(IN pIdColaborador INT(11),
                               IN pSalario_Base FLOAT,
                               IN pSalario_Bruto FLOAT,
                               in pfInicio date,
                               in pfFin date,
                               in phoras int)
BEGIN
INSERT INTO plno24(IdColaborador,SalarioBase,SalarioBruto,fInicio, fFin, Horas)
VALUES (pIdColaborador,pSalario_Base,pSalario_Bruto,pfInicio,pfFin,phoras)
    ;END */$$
DELIMITER ;

/* Procedure structure for procedure `NOMINAFECHA` */

/*!50003 DROP PROCEDURE IF EXISTS  `NOMINAFECHA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `NOMINAFECHA`()
BEGIN
      SELECT fInicio AS "FechaI",fFin AS "FechaF",IdPlanilla AS "Planilla"
    FROM plno24
    GROUP BY fInicio;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `LISTARNOMINA` */

/*!50003 DROP PROCEDURE IF EXISTS  `LISTARNOMINA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTARNOMINA`(in vl int,in f1 date,in f2 date)
BEGIN
    declare maximo int default 0;
    select max(IdPlanilla) into maximo
    from plno24;
    if vl < 0 then
    select p.IdNomina,c.IdColaborador,a.Cedula,CONCAT(a.Nombre,' ', a.Apellido1)as 'Nombre',c.SalarioBase,c.SalarioBruto,p.fInicio,p.fFin,c.Horas,p.IdPlanilla,p.MontoNomina,p.HE
    from plno24 p,plco03 c,uspr01 a
    where p.IdColaborador = c.IdColaborador
    and c.IdPersona = a.IdPersona
    AND f1 <= p.fInicio
    AND f2 >= p.fFin;
    else
    if vl = 1 then
    SELECT p.IdNomina,c.IdColaborador,a.Cedula,CONCAT(a.Nombre,  ' ', a.Apellido1)AS 'Nombre',c.SalarioBase,c.SalarioBruto,p.fInicio,p.fFin,c.Horas,p.IdPlanilla,p.MontoNomina,p.HE
    FROM plno24 p,plco03 c,uspr01 a
    WHERE p.IdColaborador = c.IdColaborador
    AND c.IdPersona = a.IdPersona
    and IdPlanilla = maximo
    limit 1000;
    else
    SELECT p.IdNomina,c.IdColaborador,a.Cedula,CONCAT(a.Nombre,  ' ', a.Apellido1)AS 'Nombre',c.SalarioBase,c.SalarioBruto,p.fInicio,p.fFin,c.Horas,p.IdPlanilla,p.MontoNomina,p.HE
    FROM plno24 p,plco03 c,uspr01 a
    WHERE p.IdColaborador = c.IdColaborador
    AND c.IdPersona = a.IdPersona
    AND IdPlanilla = vl
    limit 1000;
        end if;
    end if;
   END */$$
DELIMITER ;

/* Procedure structure for procedure `plpl` */

/*!50003 DROP PROCEDURE IF EXISTS  `plpl` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `plpl`()
BEGIN
    SELECT IdPlanilla,Concat("₡",Total) AS Total,Estado,FechaInicio as 'FI',FechaFin as 'FF'
    FROM plpl25 ORDER BY IdPlanilla DESC;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `RevertirRestaInsumo` */

/*!50003 DROP PROCEDURE IF EXISTS  `RevertirRestaInsumo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `RevertirRestaInsumo`(in pidtcl int)
BEGIN
    declare tcTotal float default 0.0;
    declare tcId int default 0;
    declare tcCant float default 0.0;
    declare tcIdTC int default 0;
    declare tcTOT float default 0.0;
    select intl29.Cantidad into tcCant
    from intl29
    where IdTCL = pidtcl;
    select intl29.IdInsumo INTO tcId
    FROM intl29
    WHERE IdTCL = pidtcl;
    select intl29.IdTC INTO tcIdTC
    FROM intl29
    WHERE IdTCL = pidtcl;
    select intl29.Total INTO tcTotal
    FROM intl29
    WHERE IdTCL = pidtcl;
   /*
    delete FROM intl29
    WHERE IdTCL = pidtcl;
    update inin08
    set Cantidad = Cantidad + tcCant
    where IdInsumo = tcId;
    update intc10
    set Total = Total - tcTotal
    where IdTdCampo = tcIdTC;
    */
    select sum(Total) into tcTOT
    from intl29
    where IdTC = tcIdTC;
    if tcTOT < 0 then
    DELETE FROM intco28
    WHERE IdTdCampo = tcIdTC;
    delete from inlo30
    where IdTC = tcIdTC;
    delete from intc10
    where IdTdCampo = tcIdTC;
     SELECT "No";
     else
     SELECT "Si";
    end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `selecTC` */

/*!50003 DROP PROCEDURE IF EXISTS  `selecTC` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `selecTC`(in fi date, in ff date)
BEGIN
    SELECT t.IdTdCampo,t.FechaTC,concat("₡",t.Inversion) as Total,o.IdLote,o.Nombre
    FROM intc10 t,inlo30 l,selo09 o
    WHERE t.IdTdCampo IN(select IdTdCampo from intco28)
    and o.IdLote = l.IdLote
    and l.IdTC = t.IdTdCampo
    and t.FechaTC BETWEEN fi AND ff
    and t.Total > 0;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `todasVentas` */

/*!50003 DROP PROCEDURE IF EXISTS  `todasVentas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `todasVentas`(in f1 date, in f2 date)
BEGIN
    select f.IdFac,p.Nombre as 'Cliente',f.FechaCompra, concat("₡",Monto)as 'Monto',l.Nombre as 'Lote',f.IdCliente,f.Observacion,f.IdCliente,f.IdLote,f.Estado
    from cifa13 f,selo09 l,cicl11 cl, uspr01 p
    where f.IdLote = l.IdLote and
    f.IdCliente = cl.IdCliente and
    cl.IdPersona = p.IdPersona AND
    f.FechaCompra BETWEEN f1 AND f2
    order by f.IdFac desc;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `TotalInsumoXIDTC` */

/*!50003 DROP PROCEDURE IF EXISTS  `TotalInsumoXIDTC` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `TotalInsumoXIDTC`(in id int)
BEGIN
    declare total float default 0.0;
    select sum(f.Total) into total
    from intl29 f
    where f.IdTC = id
    group by f.IdTC;
    select total AS 'Inver';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `TotalNomina` */

/*!50003 DROP PROCEDURE IF EXISTS  `TotalNomina` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `TotalNomina`(in fi date , in ff date)
BEGIN
    select Sum(c.SalarioBruto)
    from plno24 n,plco03 c
    where c.IdColaborador = n.IdColaborador
    AND n.fInicio >= fi
    AND n.fFin <= ff;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Vender` */

/*!50003 DROP PROCEDURE IF EXISTS  `Vender` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Vender`(in idC int,in fecha date,in idL int,in mont float,in ob varchar(100) )
BEGIN
     insert into cifa13(IdCliente,Monto,Observacion,IdLote,FechaCompra)
     values (idC,mont,ob,idL,fecha);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `verifi` */

/*!50003 DROP PROCEDURE IF EXISTS  `verifi` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `verifi`(in username varchar(100),in pass varchar(255))
BEGIN
    DECLARE n VARCHAR(100);
    declare rol int;
    SELECT u.Nombre,u.Rol INTO n,rol
    FROM sgus05 u
    WHERE u.userName = username
    AND u.pass = pass;
    IF n <> "" THEN
    SELECT 'MATCH' AS 'Respuesta',rol as 'Rol',n as 'Nombre';
    ELSE
    SELECT 'NO_MATCH' AS 'Respuesta';
    END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `VentasPorLotes` */

/*!50003 DROP PROCEDURE IF EXISTS  `VentasPorLotes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `VentasPorLotes`(in f1 date,in f2 date,in op int)
BEGIN
    
    if op <= 0 then
	    SELECT f.IdLote,l.Nombre, (SELECT SUM(Monto) FROM cifa13 r,selo09 l WHERE r.IdLote = l.IdLote AND 
	                               r.Estado = 0 and r.IdLote = f.IdLote AND r.FechaCompra BETWEEN f1 AND f2
	                               GROUP BY f.IdLote) AS 'monto',
	                               
	                               (SELECT SUM(Monto) FROM cifa13 r,selo09 l WHERE r.IdLote = l.IdLote
	                                AND r.Estado = 1 AND r.IdLote = f.IdLote AND f.FechaCompra BETWEEN f1 AND f2
	                               GROUP BY f.IdLote) as 'Anulados' 
	    
	    FROM cifa13 f,selo09 l
	    WHERE f.IdLote = l.IdLote AND
	    f.FechaCompra BETWEEN f1 AND f2
	    GROUP BY f.IdLote;
    else
    
	    SELECT f.IdLote,l.Nombre, (SELECT SUM(Monto) FROM cifa13 f,selo09 l WHERE f.IdLote = l.IdLote AND
	                               f.IdLote = op AND f.Estado = 0 AND f.FechaCompra BETWEEN f1 AND f2
	                               GROUP BY f.IdLote) AS 'monto',
	                               ( SELECT SUM(Monto) FROM cifa13 f,selo09 l WHERE f.IdLote = l.IdLote AND
	                                f.IdLote = op AND f.Estado = 1 and f.FechaCompra BETWEEN f1 AND f2
	                                GROUP BY f.IdLote) as 'Anulados'
	    FROM cifa13 f,selo09 l
	    WHERE f.IdLote = l.IdLote and
	    f.IdLote = op and
	    f.FechaCompra BETWEEN f1 AND f2
	    GROUP BY f.IdLote;
    end if;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
