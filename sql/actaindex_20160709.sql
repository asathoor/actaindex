-- Adminer 3.3.3 MySQL dump

SET NAMES utf8;
SET foreign_key_checks = 0;
SET time_zone = 'SYSTEM';
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `articles_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) COLLATE utf8_bin NOT NULL,
  `vol` int(11) NOT NULL,
  `year` year(4) NOT NULL,
  PRIMARY KEY (`articles_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `articles` (`articles_id`, `title`, `vol`, `year`) VALUES
(1,	'Frimureriets tiltrækningskraft illustreret ved logernes bygninger',	14,	'2011'),
(2,	'Forskning i frimureriets tiltrækningskraft',	14,	'2011'),
(3,	'Kronprins Frederiks (VI) og hans svoger hertugen af Augustenborgs forhold til frimureriet',	7,	'2004');

DROP TABLE IF EXISTS `authors`;
CREATE TABLE `authors` (
  `authors_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(100) COLLATE utf8_bin NOT NULL,
  `grad` varchar(100) COLLATE utf8_bin NOT NULL,
  `titel` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`authors_id`),
  KEY `authors_id` (`authors_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='authors';

INSERT INTO `authors` (`authors_id`, `firstname`, `lastname`, `grad`, `titel`) VALUES
(1,	'Per Thykjær',	'Jensen',	'X',	'Lektor'),
(2,	'Fred',	'Mosekjær',	'X',	'Systemadministrator'),
(3,	'Frederik',	'Andreasen',	'X, FH',	'Prof. Dr. Med.'),
(4,	'Nils G.',	'Bartholdy',	'XI',	'Arkivar, seniorforsker, cand.phil.');

DROP TABLE IF EXISTS `contains`;
CREATE TABLE `contains` (
  `contains_id` int(11) NOT NULL AUTO_INCREMENT,
  `articles_id` int(11) NOT NULL,
  `indexes_id` int(11) NOT NULL,
  `page` int(11) NOT NULL,
  PRIMARY KEY (`contains_id`),
  KEY `indexes_id` (`indexes_id`),
  KEY `contains_id` (`contains_id`),
  KEY `articles_id` (`articles_id`),
  CONSTRAINT `contains_to_articles` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`articles_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contains_to_index` FOREIGN KEY (`indexes_id`) REFERENCES `indexes` (`indexes_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `contains` (`contains_id`, `articles_id`, `indexes_id`, `page`) VALUES
(2,	2,	2,	777),
(3,	2,	2,	666),
(4,	1,	2,	555),
(5,	1,	4,	111),
(6,	1,	3,	222),
(7,	3,	4,	999),
(8,	3,	3,	888),
(13,	3,	27,	1),
(14,	2,	28,	2),
(15,	3,	2,	1234);

DROP TABLE IF EXISTS `indexes`;
CREATE TABLE `indexes` (
  `indexes_id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`indexes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `indexes` (`indexes_id`, `word`) VALUES
(2,	'test'),
(3,	'ostemad'),
(4,	'currywurst'),
(27,	'saskatchewan'),
(28,	'wascana'),
(29,	'ÆØÅæøåaäöë');

DROP TABLE IF EXISTS `skriver`;
CREATE TABLE `skriver` (
  `skriver_id` int(11) NOT NULL AUTO_INCREMENT,
  `authors_id` int(11) NOT NULL,
  `articles_id` int(11) NOT NULL,
  PRIMARY KEY (`skriver_id`),
  KEY `authors_id` (`authors_id`),
  KEY `articles_id` (`articles_id`),
  CONSTRAINT `skriverArticles` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`articles_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `skriverAuthor` FOREIGN KEY (`authors_id`) REFERENCES `authors` (`authors_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `skriver` (`skriver_id`, `authors_id`, `articles_id`) VALUES
(1,	1,	1),
(2,	2,	2),
(3,	3,	2),
(4,	1,	2),
(5,	4,	3);

DROP VIEW IF EXISTS `authorArticle`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `authorArticle` AS select `articles`.`articles_id` AS `articles_id`,`articles`.`title` AS `title`,`articles`.`vol` AS `vol`,`articles`.`year` AS `year`,`authors`.`authors_id` AS `authors_id`,`authors`.`firstname` AS `firstname`,`authors`.`lastname` AS `lastname`,`authors`.`grad` AS `grad`,`authors`.`titel` AS `titel` from ((`articles` join `authors`) join `skriver`) where ((`skriver`.`authors_id` = `authors`.`authors_id`) and (`skriver`.`articles_id` = `articles`.`articles_id`));

DROP VIEW IF EXISTS `word_vol_title_page`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `word_vol_title_page` AS select `indexes`.`word` AS `word`,`articles`.`vol` AS `vol`,`articles`.`year` AS `year`,`contains`.`page` AS `page`,`articles`.`title` AS `title` from ((`articles` join `contains`) join `indexes`) where ((`indexes`.`indexes_id` = `contains`.`indexes_id`) and (`articles`.`articles_id` = `contains`.`articles_id`)) order by `indexes`.`word`,`articles`.`vol`,`articles`.`title`,`contains`.`page`;

-- 2016-07-10 10:01:25
