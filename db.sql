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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `cicl11` */

insert  into `cicl11`(`IdCliente`,`IdPersona`) values (14,1),(15,4);

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

/*Table structure for table `cidf17` */

DROP TABLE IF EXISTS `cidf17`;

CREATE TABLE `cidf17` (
  `IdDetalle` int(11) NOT NULL AUTO_INCREMENT,
  `IdFac` int(11) NOT NULL,
  `Producto_Nombre` varchar(30) NOT NULL,
  `Precio_Unit` float NOT NULL,
  `Cantidad` float NOT NULL,
  `IdLote` int(11) NOT NULL,
  `Total` float NOT NULL,
  PRIMARY KEY (`IdDetalle`),
  KEY `FKIDFA` (`IdFac`),
  KEY `FKLOT` (`IdLote`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cidf17` */

/*Table structure for table `cifa13` */

DROP TABLE IF EXISTS `cifa13`;

CREATE TABLE `cifa13` (
  `IdFac` int(11) NOT NULL AUTO_INCREMENT,
  `IdCliente` int(11) NOT NULL,
  `Monto` float NOT NULL,
  `Observacion` varchar(100) DEFAULT NULL,
  `IdLote` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdFac`),
  KEY `FKCLFAC` (`IdCliente`),
  KEY `FKLOFAC` (`IdLote`),
  CONSTRAINT `FKCLFAC` FOREIGN KEY (`IdCliente`) REFERENCES `cicl11` (`IdCliente`),
  CONSTRAINT `FKLOFAC` FOREIGN KEY (`IdLote`) REFERENCES `selo09` (`IdLote`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cifa13` */

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `inin08` */

insert  into `inin08`(`IdInsumo`,`IdTI`,`Nombre`,`Cantidad`,`FechaComp`,`PrecioUnit`,`Detalle`,`FechaVence`,`Procedencia`) values (1,1,'Insecticida',7,'2018-03-04',20,'Niguno','2018-03-31','Super del chino');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `inlo30` */

insert  into `inlo30`(`IdINLO`,`IdLote`,`IdTC`) values (1,1,1),(3,1,29),(4,1,54),(5,1,60),(6,1,62),(7,1,63);

/*Table structure for table `intc10` */

DROP TABLE IF EXISTS `intc10`;

CREATE TABLE `intc10` (
  `IdTdCampo` int(11) NOT NULL AUTO_INCREMENT,
  `FechaTC` date DEFAULT NULL,
  `Total` float NOT NULL,
  `Horas` int(11) DEFAULT '8',
  `Justificacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdTdCampo`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;

/*Data for the table `intc10` */

insert  into `intc10`(`IdTdCampo`,`FechaTC`,`Total`,`Horas`,`Justificacion`) values (1,'2018-03-04',1200,8,NULL),(28,'2018-03-07',240,8,NULL),(29,'2018-03-06',1440,4,'Chapiar Lote'),(54,'2018-04-14',6000,5,'Chapiar'),(60,'2018-04-05',1200,10,'Chapiar'),(61,'2018-03-09',0,8,NULL),(62,'2018-04-11',960,10,'Chapiar'),(63,'2018-05-02',120,12,'adsad'),(64,'2018-03-09',0,8,NULL),(65,'2018-03-09',0,8,NULL),(66,'2018-03-09',0,8,NULL),(67,'2018-03-11',0,8,NULL),(68,'2018-03-11',0,8,NULL),(69,'2018-03-11',0,8,NULL),(70,'2018-03-13',0,8,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `intco28` */

insert  into `intco28`(`IdTCOL`,`IdTdCampo`,`IdCol`) values (1,1,42),(2,29,42),(3,29,43),(4,54,42),(5,60,43),(6,60,42),(7,61,43),(8,61,42),(9,63,43),(10,63,42);

/*Table structure for table `inti07` */

DROP TABLE IF EXISTS `inti07`;

CREATE TABLE `inti07` (
  `IdTI` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(30) NOT NULL,
  PRIMARY KEY (`IdTI`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `inti07` */

insert  into `inti07`(`IdTI`,`Tipo`) values (1,'Fumigable'),(2,'Fertilizante');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `intl29` */

insert  into `intl29`(`IdTCL`,`IdInsumo`,`IdTC`,`Cantidad`,`Total`) values (1,1,1,10,1200),(2,1,28,2,240),(3,1,29,12,1440),(4,1,54,50,6000),(5,1,60,10,1200),(6,1,62,8,960),(7,1,63,1,120);

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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

/*Data for the table `plco03` */

insert  into `plco03`(`IdColaborador`,`IdPersona`,`IdTipoColaborador`,`FechaBaja`,`FechaIngreso`,`SalarioBase`,`SalarioBruto`,`Horas`) values (42,1,1,'0000-00-00','2018-03-04',1200,144000,120),(43,2,1,'0000-00-00','2018-03-06',2500,325000,130);

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

insert  into `plhe27`(`IdHoras`,`Cantidad`,`IdColaborador`,`Estado`,`Fecha`) values (2,10,42,'Pendiente','2018-03-01'),(3,10,42,'Pendiente','2018-03-01'),(4,10,42,'Pendiente','2018-03-01');

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `plno24` */

insert  into `plno24`(`IdNomina`,`IdColaborador`,`fInicio`,`fFin`,`IdPlanilla`,`MontoNomina`,`HE`) values (2,42,'2018-03-01','2018-03-15',8,144000,0),(5,42,'2018-03-01','2018-03-15',8,144000,0),(8,42,'2018-03-15','2018-03-31',3,144000,0),(10,42,'2018-04-01','2018-03-31',4,144000,0),(11,42,'2018-04-15','2018-04-30',5,144000,0),(12,43,'2018-04-15','2018-04-30',5,325000,0),(14,42,'2018-05-01','2018-05-15',6,144000,0),(15,43,'2018-05-01','2018-05-15',6,325000,0),(17,42,'2018-03-01','2018-03-30',7,144000,0),(18,43,'2018-03-01','2018-03-30',7,325000,0),(20,42,'2018-03-01','2018-03-15',8,144000,0),(21,43,'2018-03-01','2018-03-15',8,325000,0),(23,42,'2018-01-01','2018-01-15',9,144000,0),(24,43,'2018-01-01','2018-01-15',9,325000,0);

/*Table structure for table `plpl25` */

DROP TABLE IF EXISTS `plpl25`;

CREATE TABLE `plpl25` (
  `IdPlanilla` int(11) NOT NULL AUTO_INCREMENT,
  `Total` decimal(10,0) DEFAULT NULL,
  `Estado` varchar(15) DEFAULT 'Pendiente',
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  PRIMARY KEY (`IdPlanilla`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `plpl25` */

insert  into `plpl25`(`IdPlanilla`,`Total`,`Estado`,`FechaInicio`,`FechaFin`) values (1,288000,'Pendiente',NULL,NULL),(2,576000,'Pendiente',NULL,NULL),(3,288000,'Pendiente',NULL,NULL),(4,144000,'Pendiente',NULL,NULL),(5,469000,'Pendiente',NULL,NULL),(6,469000,'Pendiente',NULL,NULL),(7,469000,'Pendiente',NULL,NULL),(8,757000,'Pendiente',NULL,NULL),(9,469000,'Aprobado','2018-01-01','2018-01-15');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `pltc02` */

insert  into `pltc02`(`IdTipoColaborador`,`Tipo`,`Detalle`) values (1,'Fijo','Fijo');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `selo09` */

insert  into `selo09`(`IdLote`,`Nombre`,`AreaL`,`Estado`,`Produccion`) values (1,'Santa Rita',120,'Habilitado','Maiz'),(2,'Chicho Land',120,'Habilitado','Maiz'),(3,'Napo',300,'Habilitado','Arroz');

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
  `IdPersona` int(11) NOT NULL,
  `IdUser` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL,
  `pass` varchar(255) NOT NULL,
  PRIMARY KEY (`IdUser`),
  KEY `FKIDPERSONA` (`IdPersona`),
  CONSTRAINT `FKIDPERSONA` FOREIGN KEY (`IdPersona`) REFERENCES `uspr01` (`IdPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `sgus05` */

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `uspr01` */

insert  into `uspr01`(`IdPersona`,`Cedula`,`Nombre`,`Apellido1`,`Apellido2`,`Telefono`,`Direccion`,`Correo`) values (1,'504110191','Yoher','Obando','Duarte','87906665','Brasilito','yoher.od96@hotmail.com'),(2,'113220560','Josè Manuel','Mayorga','Alvarez','88665544','Nicoya, San Martin','jose@gmail.com'),(4,'404110191','Walter','Centeno','Corea','56203698','Brasilito','reypate@gmail.com'),(5,'204110191','Arjen','Obando','Leal','66998877','Brasil','yoher.od96@hotmail.com'),(6,'304110191','Mariela','Perez','Camacho','66224466','Nicoya','yoher.od96@hotmail.com'),(7,'904110191','Ismael','Reyes','Diaz','96969696','Nicoya','fabi@gmail.com'),(8,'704110191','Randall','Brenes','Diaz','69203679','Santa Cruz','yoher.od96@hotmail.com');

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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTARTCLO`(IN pidL int, in pitdc int,in fec date,in pho int, in jus varchar(100))
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
    Justificacion = jus
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
    SELECT c.IdColaborador,p.Cedula,p.Nombre,p.Apellido1
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
   
 
    SELECT t.IdTdCampo,t.FechaTC,concat("₡",t.Total) as Total,o.IdLote,o.Nombre
    FROM intc10 t,inlo30 l,selo09 o
    WHERE t.IdTdCampo IN(select IdTdCampo from intco28)
    and o.IdLote = l.IdLote
    and l.IdTC = t.IdTdCampo
    and t.FechaTC BETWEEN fi AND ff
    and t.Total > 0;
    
    
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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
