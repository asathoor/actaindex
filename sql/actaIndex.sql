-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 02, 2016 at 09:04 AM
-- Server version: 5.5.47-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `actaIndex`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `articles_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) COLLATE utf8_bin NOT NULL,
  `vol` int(11) NOT NULL,
  `year` year(4) NOT NULL,
  PRIMARY KEY (`articles_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `authorArticle`
--
CREATE TABLE IF NOT EXISTS `authorArticle` (
`articles_id` int(11)
,`title` varchar(500)
,`vol` int(11)
,`year` year(4)
,`authors_id` int(11)
,`firstname` varchar(100)
,`lastname` varchar(100)
,`grad` varchar(100)
,`titel` varchar(100)
);
-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE IF NOT EXISTS `authors` (
  `authors_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(100) COLLATE utf8_bin NOT NULL,
  `grad` varchar(100) COLLATE utf8_bin NOT NULL,
  `titel` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`authors_id`),
  KEY `authors_id` (`authors_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='authors' AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `contains`
--

CREATE TABLE IF NOT EXISTS `contains` (
  `contains_id` int(11) NOT NULL AUTO_INCREMENT,
  `articles_id` int(11) NOT NULL,
  `indexes_id` int(11) NOT NULL,
  `page` int(11) NOT NULL,
  PRIMARY KEY (`contains_id`),
  KEY `indexes_id` (`indexes_id`),
  KEY `contains_id` (`contains_id`),
  KEY `articles_id` (`articles_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `indexes`
--

CREATE TABLE IF NOT EXISTS `indexes` (
  `indexes_id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`indexes_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `skriver`
--

CREATE TABLE IF NOT EXISTS `skriver` (
  `skriver_id` int(11) NOT NULL AUTO_INCREMENT,
  `authors_id` int(11) NOT NULL,
  `articles_id` int(11) NOT NULL,
  PRIMARY KEY (`skriver_id`),
  KEY `authors_id` (`authors_id`),
  KEY `articles_id` (`articles_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Structure for view `authorArticle`
--
DROP TABLE IF EXISTS `authorArticle`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `authorArticle` AS select `articles`.`articles_id` AS `articles_id`,`articles`.`title` AS `title`,`articles`.`vol` AS `vol`,`articles`.`year` AS `year`,`authors`.`authors_id` AS `authors_id`,`authors`.`firstname` AS `firstname`,`authors`.`lastname` AS `lastname`,`authors`.`grad` AS `grad`,`authors`.`titel` AS `titel` from ((`articles` join `authors`) join `skriver`) where ((`skriver`.`authors_id` = `authors`.`authors_id`) and (`skriver`.`articles_id` = `articles`.`articles_id`));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contains`
--
ALTER TABLE `contains`
  ADD CONSTRAINT `contains_to_articles` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`articles_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contains_to_index` FOREIGN KEY (`indexes_id`) REFERENCES `indexes` (`indexes_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `skriver`
--
ALTER TABLE `skriver`
  ADD CONSTRAINT `skriverArticles` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`articles_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `skriverAuthor` FOREIGN KEY (`authors_id`) REFERENCES `authors` (`authors_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
