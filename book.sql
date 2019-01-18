-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema project
--

CREATE DATABASE IF NOT EXISTS project;
USE project;

--
-- Definition of table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` int(10) unsigned NOT NULL,
  `sec_q` varchar(45) NOT NULL,
  `answer` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`id`,`username`,`name`,`password`,`sec_q`,`answer`) VALUES 
 (1,'turas','Raheeb Sarker',1234,'What is your favorite color?','Red'),
 (2,'ramy','Rezoana Sarker',1242,'What is your mother Toungue?','Bangla');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;


--
-- Definition of table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `book_id` int(10) unsigned NOT NULL,
  `book_name` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `author` varchar(45) NOT NULL,
  `copyright` varchar(45) NOT NULL,
  `edition` varchar(45) NOT NULL,
  `publisher` varchar(45) NOT NULL,
  `isbn_no` int(10) unsigned NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `pages` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` (`id`,`book_id`,`book_name`,`title`,`author`,`copyright`,`edition`,`publisher`,`isbn_no`,`price`,`pages`,`quantity`) VALUES 
 (1,971,'Java Script','Java','Micle Smith','Smith-2017','7th','USB',6541258,350,1200,10),
 (2,268,'Bangla','Benguli','Kaji Najrul Islam','Najrul@2017','8th','Bangla Academy',10249,450,1500,12),
 (3,741,'Bank Requirement','Banking System','Md. Arifur Rahman','arifur@2018','6th','Professor',16861,350,1250,5),
 (4,982,'Job Solution','Job Catagory','Md. Arifur Rahman','arifur@2017','3rd','BCS Prokashoni',664,650,2000,2);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;


--
-- Definition of table `bookb`
--

DROP TABLE IF EXISTS `bookb`;
CREATE TABLE `bookb` (
  `b_id` int(10) unsigned NOT NULL auto_increment,
  `bname` varchar(45) NOT NULL,
  `qty` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`b_id`,`bname`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookb`
--

/*!40000 ALTER TABLE `bookb` DISABLE KEYS */;
INSERT INTO `bookb` (`b_id`,`bname`,`qty`) VALUES 
 (1,'A',5),
 (2,'English',0),
 (3,'Math',0),
 (4,'English',0),
 (5,'Bangla',5),
 (6,'Math',0),
 (7,'Math',0),
 (8,'Physics',3),
 (9,'Physics',0),
 (10,'Physics',0),
 (11,'Statistics',0),
 (12,'Statistics',0),
 (13,'English',0),
 (14,'Math',0);
/*!40000 ALTER TABLE `bookb` ENABLE KEYS */;


--
-- Definition of table `issue`
--

DROP TABLE IF EXISTS `issue`;
CREATE TABLE `issue` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `book_id` int(10) unsigned NOT NULL,
  `book_name` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `author` varchar(45) NOT NULL,
  `copyright` varchar(45) NOT NULL,
  `edition` varchar(45) NOT NULL,
  `publisher` varchar(45) NOT NULL,
  `isbn_no` int(10) unsigned NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `pages` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `sname` varchar(45) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `course` varchar(45) NOT NULL,
  `branch` varchar(45) NOT NULL,
  `year` int(10) unsigned NOT NULL,
  `semester` varchar(45) NOT NULL,
  `contact` int(10) unsigned NOT NULL,
  `email` varchar(45) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issue`
--

/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;


--
-- Definition of table `issueb`
--

DROP TABLE IF EXISTS `issueb`;
CREATE TABLE `issueb` (
  `i_id` int(10) unsigned NOT NULL auto_increment,
  `b_id` int(10) unsigned NOT NULL,
  `price` double NOT NULL,
  `idate` date NOT NULL,
  `qty` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`i_id`),
  KEY `FK_issueb_bid` (`b_id`),
  CONSTRAINT `FK_issueb_bid` FOREIGN KEY (`b_id`) REFERENCES `bookb` (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issueb`
--

/*!40000 ALTER TABLE `issueb` DISABLE KEYS */;
INSERT INTO `issueb` (`i_id`,`b_id`,`price`,`idate`,`qty`) VALUES 
 (1,1,200,'2018-08-05',2);
/*!40000 ALTER TABLE `issueb` ENABLE KEYS */;


--
-- Definition of trigger `before_issueb`
--

DROP TRIGGER /*!50030 IF EXISTS */ `before_issueb`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `before_issueb` BEFORE INSERT ON `issueb` FOR EACH ROW BEGIN
update bookb
set qty = qty-NEW.qty
where b_id = NEW.b_id;

END $$

DELIMITER ;

--
-- Definition of table `return`
--

DROP TABLE IF EXISTS `return`;
CREATE TABLE `return` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `student_id` int(10) unsigned NOT NULL,
  `sname` varchar(45) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `course` varchar(45) NOT NULL,
  `branch` varchar(45) NOT NULL,
  `year` int(10) unsigned NOT NULL,
  `semester` varchar(45) NOT NULL,
  `contact` int(10) unsigned NOT NULL,
  `email` varchar(45) NOT NULL,
  `book_id` int(10) unsigned NOT NULL,
  `book_name` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `author` varchar(45) NOT NULL,
  `copyright` varchar(45) NOT NULL,
  `edition` varchar(45) NOT NULL,
  `publisher` varchar(45) NOT NULL,
  `isbn_no` int(10) unsigned NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `pages` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `datei` date NOT NULL,
  `dater` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `return`
--

/*!40000 ALTER TABLE `return` DISABLE KEYS */;
/*!40000 ALTER TABLE `return` ENABLE KEYS */;


--
-- Definition of table `returnb`
--

DROP TABLE IF EXISTS `returnb`;
CREATE TABLE `returnb` (
  `r_id` int(10) unsigned NOT NULL auto_increment,
  `b_id` int(10) unsigned NOT NULL,
  `price` double NOT NULL,
  `rdate` date NOT NULL,
  `qty` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`r_id`),
  KEY `FK_returnb_bid` (`b_id`),
  CONSTRAINT `FK_returnb_bid` FOREIGN KEY (`b_id`) REFERENCES `bookb` (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `returnb`
--

/*!40000 ALTER TABLE `returnb` DISABLE KEYS */;
INSERT INTO `returnb` (`r_id`,`b_id`,`price`,`rdate`,`qty`) VALUES 
 (1,1,200,'2018-08-05',3),
 (2,5,300,'2018-03-05',5),
 (3,8,120,'2018-02-06',3);
/*!40000 ALTER TABLE `returnb` ENABLE KEYS */;


--
-- Definition of trigger `before_returnb`
--

DROP TRIGGER /*!50030 IF EXISTS */ `before_returnb`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `before_returnb` BEFORE INSERT ON `returnb` FOR EACH ROW BEGIN
update bookb
set qty = qty+NEW.qty
where b_id = NEW.b_id;

END $$

DELIMITER ;

--
-- Definition of table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `student_id` int(10) unsigned NOT NULL,
  `sname` varchar(45) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `course` varchar(45) NOT NULL,
  `branch` varchar(45) NOT NULL,
  `year` int(10) unsigned NOT NULL,
  `semester` varchar(45) NOT NULL,
  `contact` int(10) unsigned NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`id`,`student_id`,`sname`,`fname`,`gender`,`course`,`branch`,`year`,`semester`,`contact`,`email`) VALUES 
 (1,211,'Jarin Tasniya','Md. Atatur Rahman','Female','BBA','CSE',3,'3rd',1712029554,'jarin@gmail.com'),
 (2,152,'Tanha Tabia','Md. Abu Taher','Female','BBS','CSE',2,'5th',1717236843,'tanha@gmail.com');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


--
-- Definition of function `getBookId`
--

DROP FUNCTION IF EXISTS `getBookId`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `getBookId`(book_name VARCHAR(50)) RETURNS int(11)
BEGIN
return(select b_id from bookb where bname=book_name);
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of function `getBookQty`
--

DROP FUNCTION IF EXISTS `getBookQty`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `getBookQty`(book_name VARCHAR(50)) RETURNS int(11)
BEGIN
return(select qty from bookb where bname=book_name);
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `listBook`
--

DROP PROCEDURE IF EXISTS `listBook`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listBook`()
BEGIN
select bname from bookb;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `saveBookb`
--

DROP PROCEDURE IF EXISTS `saveBookb`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `saveBookb`(bookname VARCHAR(30))
BEGIN
insert into bookb(bname)values(bookname);

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `save_issueb`
--

DROP PROCEDURE IF EXISTS `save_issueb`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `save_issueb`(IN id INT,IN price DOUBLE,IN dt DATE,IN qt INT)
BEGIN
insert into issueb(b_id, price, idate, qty)
values(id,price,dt,qt);

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `save_returnb`
--

DROP PROCEDURE IF EXISTS `save_returnb`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `save_returnb`(IN id INT,IN price DOUBLE,IN dt DATE,IN qt INT)
BEGIN
insert into returnb(b_id, price, rdate, qty)
values(id,price,dt,qt);


END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
