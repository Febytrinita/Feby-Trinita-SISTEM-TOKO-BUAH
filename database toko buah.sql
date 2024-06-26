/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - db_tokobuah
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_tokobuah` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `db_tokobuah`;

/*Table structure for table `buah` */

DROP TABLE IF EXISTS `buah`;

CREATE TABLE `buah` (
  `buah_id` int(11) NOT NULL,
  `nama_buah` varchar(100) NOT NULL,
  `jenis_buah` varchar(50) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  PRIMARY KEY (`buah_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `buah` */

LOCK TABLES `buah` WRITE;

insert  into `buah`(`buah_id`,`nama_buah`,`jenis_buah`,`harga`,`stok`) values 
(1,'Apel','Tropis',5000.00,100),
(2,'Jeruk','Agrum',3000.00,150),
(3,'Mangga','Subtropis',7000.00,50),
(4,'Pisang','Tropis',4000.00,80);

UNLOCK TABLES;

/*Table structure for table `detail_transaksi` */

DROP TABLE IF EXISTS `detail_transaksi`;

CREATE TABLE `detail_transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `buah_id` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  PRIMARY KEY (`transaksi_id`,`buah_id`),
  KEY `idx_buah_id` (`buah_id`),
  CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`transaksi_id`),
  CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`buah_id`) REFERENCES `buah` (`buah_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detail_transaksi` */

LOCK TABLES `detail_transaksi` WRITE;

insert  into `detail_transaksi`(`transaksi_id`,`buah_id`,`jumlah`) values 
(1,1,2),
(1,2,3),
(2,3,1),
(2,4,2);

UNLOCK TABLES;

/*Table structure for table `transaksi` */

DROP TABLE IF EXISTS `transaksi`;

CREATE TABLE `transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `tanggal_transaksi` date DEFAULT NULL,
  `nama_pelanggan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`transaksi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `transaksi` */

LOCK TABLES `transaksi` WRITE;

insert  into `transaksi`(`transaksi_id`,`tanggal_transaksi`,`nama_pelanggan`) values 
(1,'2024-06-01','riri'),
(2,'2024-06-02','ruru');

UNLOCK TABLES;

/* Trigger structure for table `detail_transaksi` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `update_stok_trigger` */$$

/*!50003 CREATE */ /*!50003 TRIGGER `update_stok_trigger` AFTER INSERT ON `detail_transaksi` FOR EACH ROW 
BEGIN
    UPDATE buah
    SET stok = stok - NEW.jumlah
    WHERE id = NEW.buah_id;
END */$$


DELIMITER ;

/*Table structure for table `buah_tersedia` */

DROP TABLE IF EXISTS `buah_tersedia`;

/*!50001 DROP VIEW IF EXISTS `buah_tersedia` */;
/*!50001 DROP TABLE IF EXISTS `buah_tersedia` */;

/*!50001 CREATE TABLE  `buah_tersedia`(
 `buah_id` int(11) ,
 `nama_buah` varchar(100) ,
 `jenis_buah` varchar(50) ,
 `harga` decimal(10,2) ,
 `stok` int(11) 
)*/;

/*View structure for view buah_tersedia */

/*!50001 DROP TABLE IF EXISTS `buah_tersedia` */;
/*!50001 DROP VIEW IF EXISTS `buah_tersedia` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `buah_tersedia` AS select `b`.`buah_id` AS `buah_id`,`b`.`nama_buah` AS `nama_buah`,`b`.`jenis_buah` AS `jenis_buah`,`b`.`harga` AS `harga`,`b`.`stok` AS `stok` from `buah` `b` where `b`.`stok` > 0 */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
