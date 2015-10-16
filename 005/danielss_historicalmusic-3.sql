-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Oct 16, 2015 at 12:23 AM
-- Server version: 5.5.45-cll
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `danielss_historicalmusic`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE IF NOT EXISTS `artist` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `origin` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `beginning_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`(255),`origin`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`id`, `name`, `origin`, `beginning_date`, `end_date`) VALUES
(2, 'Arlo Guthrie', 'New York', '1967-01-01', '2015-10-15'),
(4, 'Metallica', 'Los Angeles', '1981-01-01', '2015-10-15'),
(5, 'Neil Young', 'Winnipeg', '1960-01-01', '2015-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `disc`
--

CREATE TABLE IF NOT EXISTS `disc` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `year` year(4) NOT NULL,
  `artist_id` int(8) NOT NULL,
  `ext` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`(255),`year`),
  KEY `artist_id` (`artist_id`),
  KEY `year` (`year`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `disc`
--

INSERT INTO `disc` (`id`, `title`, `year`, `artist_id`, `ext`) VALUES
(1, 'Alice''s Restaurant ', 1967, 2, ''),
(2, '...And Justice for All', 1988, 4, ''),
(4, 'Living With War', 2006, 5, '');

-- --------------------------------------------------------

--
-- Table structure for table `disc_label`
--

CREATE TABLE IF NOT EXISTS `disc_label` (
  `disc_id` int(8) NOT NULL,
  `label_id` int(8) NOT NULL,
  KEY `disc_id` (`disc_id`,`label_id`),
  KEY `label_id` (`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `disc_label`
--

INSERT INTO `disc_label` (`disc_id`, `label_id`) VALUES
(1, 1),
(1, 1),
(4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE IF NOT EXISTS `genre` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Folk'),
(2, 'Heavy Metal'),
(3, 'Rock');

-- --------------------------------------------------------

--
-- Table structure for table `historical_subject`
--

CREATE TABLE IF NOT EXISTS `historical_subject` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(22) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`(255),`type`(255),`location`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `historical_subject`
--

INSERT INTO `historical_subject` (`id`, `name`, `date`, `type`, `location`) VALUES
(1, 'Vietnam War', '1955 - 1975', 'War', 'Vietnam'),
(2, 'Vietnam War Protest', '', 'War Protest', 'United States'),
(4, 'World War One', '1914 - 1918', 'War', 'Continental Europe'),
(5, 'Second Iraq War', '2003 - 2011', 'War', 'Iraq');

-- --------------------------------------------------------

--
-- Table structure for table `label`
--

CREATE TABLE IF NOT EXISTS `label` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `label`
--

INSERT INTO `label` (`id`, `name`) VALUES
(1, 'Warner Bros.'),
(2, 'Elektra'),
(3, 'Reprise');

-- --------------------------------------------------------

--
-- Table structure for table `relationship`
--

CREATE TABLE IF NOT EXISTS `relationship` (
  `historical_subject_id1` int(8) NOT NULL,
  `historical_subject_id2` int(8) NOT NULL,
  `relationship_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  KEY `historical_subject_id1` (`historical_subject_id1`,`historical_subject_id2`),
  KEY `historical_subject_id2` (`historical_subject_id2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `relationship`
--

INSERT INTO `relationship` (`historical_subject_id1`, `historical_subject_id2`, `relationship_name`) VALUES
(2, 1, 'Protest'),
(2, 1, 'Protest');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE IF NOT EXISTS `track` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `length` time NOT NULL,
  `disc_id` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`(255),`disc_id`),
  KEY `disc_id` (`disc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`id`, `title`, `length`, `disc_id`) VALUES
(3, 'Alice''s Restaurant Massacree', '18:20:00', 1),
(4, 'One', '07:27:00', 2),
(5, 'Living With War', '05:04:00', 4);

-- --------------------------------------------------------

--
-- Table structure for table `track_genre`
--

CREATE TABLE IF NOT EXISTS `track_genre` (
  `track_id` int(8) NOT NULL,
  `genre_id` int(8) NOT NULL,
  KEY `track_id` (`track_id`,`genre_id`),
  KEY `genre_id` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `track_genre`
--

INSERT INTO `track_genre` (`track_id`, `genre_id`) VALUES
(3, 1),
(4, 2),
(5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `track_subject`
--

CREATE TABLE IF NOT EXISTS `track_subject` (
  `historical_subject_id` int(8) NOT NULL,
  `track_id` int(8) NOT NULL,
  KEY `historical_subject_id` (`historical_subject_id`,`track_id`),
  KEY `track_id` (`track_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `track_subject`
--

INSERT INTO `track_subject` (`historical_subject_id`, `track_id`) VALUES
(1, 3),
(1, 3),
(2, 3),
(2, 3),
(4, 4),
(5, 5);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `disc`
--
ALTER TABLE `disc`
  ADD CONSTRAINT `disc_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`);

--
-- Constraints for table `disc_label`
--
ALTER TABLE `disc_label`
  ADD CONSTRAINT `disc_label_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`),
  ADD CONSTRAINT `disc_label_ibfk_1` FOREIGN KEY (`disc_id`) REFERENCES `disc` (`id`);

--
-- Constraints for table `relationship`
--
ALTER TABLE `relationship`
  ADD CONSTRAINT `relationship_ibfk_2` FOREIGN KEY (`historical_subject_id2`) REFERENCES `historical_subject` (`id`),
  ADD CONSTRAINT `relationship_ibfk_1` FOREIGN KEY (`historical_subject_id1`) REFERENCES `historical_subject` (`id`);

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`disc_id`) REFERENCES `disc` (`id`);

--
-- Constraints for table `track_genre`
--
ALTER TABLE `track_genre`
  ADD CONSTRAINT `track_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`),
  ADD CONSTRAINT `track_genre_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

--
-- Constraints for table `track_subject`
--
ALTER TABLE `track_subject`
  ADD CONSTRAINT `track_subject_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`),
  ADD CONSTRAINT `track_subject_ibfk_1` FOREIGN KEY (`historical_subject_id`) REFERENCES `historical_subject` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
