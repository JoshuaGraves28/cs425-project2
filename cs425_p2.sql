-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.18-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema cs425_p2
--

CREATE DATABASE IF NOT EXISTS cs425_p2;
USE cs425_p2;

--
-- Definition of table `applicants_to_jobs`
--

DROP TABLE IF EXISTS `applicants_to_jobs`;
CREATE TABLE `applicants_to_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `jobsid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_applicants_to_jobs_1` (`userid`),
  KEY `FK_applicants_to_jobs_2` (`jobsid`),
  CONSTRAINT `FK_applicants_to_jobs_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_applicants_to_jobs_2` FOREIGN KEY (`jobsid`) REFERENCES `jobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applicants_to_jobs`
--

/*!40000 ALTER TABLE `applicants_to_jobs` DISABLE KEYS */;
INSERT INTO `applicants_to_jobs` (`id`,`userid`,`jobsid`) VALUES 
 (1,1,8),
 (2,1,7);
/*!40000 ALTER TABLE `applicants_to_jobs` ENABLE KEYS */;


--
-- Definition of table `applicants_to_skills`
--

DROP TABLE IF EXISTS `applicants_to_skills`;
CREATE TABLE `applicants_to_skills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `skillsid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_applicants_to_skills_1` (`userid`),
  KEY `FK_applicants_to_skills_2` (`skillsid`),
  CONSTRAINT `FK_applicants_to_skills_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_applicants_to_skills_2` FOREIGN KEY (`skillsid`) REFERENCES `skills` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applicants_to_skills`
--

/*!40000 ALTER TABLE `applicants_to_skills` DISABLE KEYS */;
INSERT INTO `applicants_to_skills` (`id`,`userid`,`skillsid`) VALUES 
 (1,1,42),
 (2,1,47),
 (3,1,44),
 (4,1,36),
 (5,1,10),
 (6,1,27);
/*!40000 ALTER TABLE `applicants_to_skills` ENABLE KEYS */;


--
-- Definition of table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobs`
--

/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`id`,`name`,`description`) VALUES 
 (6,'Car Wash',''),
 (7,'Door Greeter',''),
 (8,'Customer Service',''),
 (9,'Janitor',''),
 (10,'Service Clerk',''),
 (11,'Cashier','');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;


--
-- Definition of table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `username` varchar(100) NOT NULL,
  `password` char(32) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`username`,`password`) VALUES 
 ('jobseeker','5b22aa4e4721fdbfb44afe2235ff4f2d');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;


--
-- Definition of table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `rolename` varchar(100) NOT NULL,
  PRIMARY KEY (`rolename`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`rolename`) VALUES 
 ('applicant');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


--
-- Definition of table `skills`
--

DROP TABLE IF EXISTS `skills`;
CREATE TABLE `skills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skills`
--

/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` (`id`,`description`) VALUES 
 (1,'Saying \"Hello\" and \"Have a nice day!\" to customers as they enter and leave the store.'),
 (2,'Handing out stickers to children.'),
 (3,'Putting items in the appropriate places.'),
 (4,'Restocking multiple times a day as needed.'),
 (5,'Wiping tables and trays.'),
 (6,'Sweeping and mopping.'),
 (7,'Counting items; comparing to lists.'),
 (8,'Keeping track of the number of items in stock.'),
 (9,'Helping customers find items.'),
 (10,'Checking prices for customers.'),
 (11,'Making and counting back change.'),
 (12,'Washing cars (exterior).'),
 (13,'Washing cars (interior).'),
 (14,'Washing cars (tires and rims).'),
 (15,'Rinsing cars.'),
 (16,'Drying cars.'),
 (17,'Waxing cars.'),
 (18,'Vacuuming cars.'),
 (19,'Washing windows (inside and outside).'),
 (20,'Replenishing paper towels.'),
 (21,'Emptying and removing trash.'),
 (22,'Cleaning and sanitizing toilets.'),
 (23,'Replenishing toilet paper.'),
 (24,'Replenishing soap.'),
 (25,'Unclogging toilets.'),
 (26,'Cleaning and sanitizing sinks and washbasins.'),
 (27,'Moving and lebeling boxes.'),
 (28,'Blocking merchandise (pulling items toward the front of the shelf).'),
 (29,'Checking for expired/out-of-date merchandise.'),
 (30,'Unloading boxes.'),
 (31,'Sorting boxes by department/category.'),
 (32,'Refilling doughnuts.'),
 (33,'Wiping counters and countertops.'),
 (34,'Handing orders to customers.'),
 (35,'Preparing coffee and other drinks.'),
 (36,'Checking blood pressure.'),
 (37,'Checking temperature.'),
 (38,'Checking weight and height.'),
 (39,'Holding conversations with patients.'),
 (40,'Helping patients in using restrooms.'),
 (41,'Waxing floors.'),
 (42,'Changing bed linens.'),
 (43,'Washing sheets and towels.'),
 (44,'Checking and replenishing food and water for pets.'),
 (45,'Walking pets.'),
 (46,'Cleaning up after pets.'),
 (47,'Changing cat litter.'),
 (48,'Watering plants'),
 (49,'Vacuuming floors.'),
 (50,'Sweeping floors.'),
 (51,'Wiping seats.'),
 (52,'Cleaning and sanitizing bathtubs and showers.'),
 (53,'Clipping nails.'),
 (54,'Cleaning and sanitizing kennels.'),
 (55,'Sanitizing brushes and razors.'),
 (56,'Cleaning and sanitizing floors.'),
 (57,'Sorting laundry.'),
 (58,'Washing dishes.'),
 (59,'Cleaning and sanitizing refrigerators and freezers.'),
 (60,'Dusting.'),
 (61,'Cleaning leather furniture.'),
 (62,'Cleaning desks.'),
 (63,'Cleaning ceiling fans and lights.'),
 (64,'Replacing light bulbs.'),
 (65,'Raking leaves.'),
 (66,'Cutting grass.'),
 (67,'Picking up sticks, rocks, and other outdoor debris.');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;


--
-- Definition of table `skills_to_jobs`
--

DROP TABLE IF EXISTS `skills_to_jobs`;
CREATE TABLE `skills_to_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `skillsid` int(10) unsigned NOT NULL,
  `jobsid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_skills_to_jobs_1` (`skillsid`),
  KEY `FK_skills_to_jobs_2` (`jobsid`),
  CONSTRAINT `FK_skills_to_jobs_1` FOREIGN KEY (`skillsid`) REFERENCES `skills` (`id`),
  CONSTRAINT `FK_skills_to_jobs_2` FOREIGN KEY (`jobsid`) REFERENCES `jobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skills_to_jobs`
--

/*!40000 ALTER TABLE `skills_to_jobs` DISABLE KEYS */;
INSERT INTO `skills_to_jobs` (`id`,`skillsid`,`jobsid`) VALUES 
 (85,52,9),
 (86,56,9),
 (87,26,9),
 (88,22,9),
 (89,20,9),
 (90,6,9),
 (91,2,7),
 (92,1,7),
 (105,28,10),
 (106,47,10),
 (107,21,10),
 (108,2,10),
 (109,6,10),
 (110,11,11),
 (132,16,6),
 (133,15,6),
 (134,18,6),
 (135,12,6),
 (136,13,6),
 (137,14,6),
 (138,19,6),
 (139,17,6),
 (140,10,8),
 (141,34,8),
 (142,9,8);
/*!40000 ALTER TABLE `skills_to_jobs` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `displayname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_1` (`username`),
  CONSTRAINT `FK_user_1` FOREIGN KEY (`username`) REFERENCES `login` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`,`username`,`displayname`) VALUES 
 (1,'jobseeker','Example Job Seeker');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `user_to_role`
--

DROP TABLE IF EXISTS `user_to_role`;
CREATE TABLE `user_to_role` (
  `username` varchar(100) NOT NULL,
  `rolename` varchar(100) NOT NULL,
  PRIMARY KEY (`username`,`rolename`),
  KEY `FK_user_to_role_2` (`rolename`),
  CONSTRAINT `FK_user_to_role_1` FOREIGN KEY (`username`) REFERENCES `login` (`username`),
  CONSTRAINT `FK_user_to_role_2` FOREIGN KEY (`rolename`) REFERENCES `role` (`rolename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_to_role`
--

/*!40000 ALTER TABLE `user_to_role` DISABLE KEYS */;
INSERT INTO `user_to_role` (`username`,`rolename`) VALUES 
 ('jobseeker','applicant');
/*!40000 ALTER TABLE `user_to_role` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
