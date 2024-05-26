-- phpMyAdmin SQL Dump
-- version 3.3.8.1
-- http://www.phpmyadmin.net
--

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `grcc`
--

-- Drop existing tables

DROP TABLE IF EXISTS grade;
DROP TABLE IF EXISTS  student;
DROP TABLE IF EXISTS  advisor;
DROP TABLE IF EXISTS  class;

-- --------------------------------------------------------

--
-- Table structure for table `advisor`
--

CREATE TABLE IF NOT EXISTS `advisor` (
  `advisor_id` int(1) NOT NULL DEFAULT '0',
  `advisor_first` varchar(30) DEFAULT NULL,
  `advisor_last` varchar(30) DEFAULT NULL,
  `office` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`advisor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advisor`
--

INSERT INTO `advisor` (`advisor_id`, `advisor_first`, `advisor_last`, `office`) VALUES
(1, 'Tina', 'Ostrich', 'TC 218'),
(2, 'Ken', 'Hang', 'TC 218'),
(3, 'Alan', 'Carter', 'TC 217'),
(5, 'Krish', 'Mahadevan', 'TC 210');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `classid` int(11) NOT NULL AUTO_INCREMENT,
  `abbrev` varchar(9) NOT NULL,
  `title` varchar(30) NOT NULL,
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=450215449 ;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`classid`, `abbrev`, `title`) VALUES
(1, 'IT 102', 'Intro to Scripting'),
(2, 'IT 135', 'Intro to Network Security'),
(3, 'IT 121', 'Intro to HTML'),
(4, 'IT 190', 'Linux Administration'),
(5, 'IT 305', 'Full Stack Web Development');

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE IF NOT EXISTS `grade` (
  `sid` varchar(11) NOT NULL,
  `classid` int(11) NOT NULL,
  `grade` decimal(10,1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`sid`, `classid`, `grade`) VALUES
('123-43-6554', 4, 3.5),
('123-45-6789', 3, 0.0),
('123-77-8856', 2, 0.0),
('221-54-8997', 2, 2.3),
('323-54-7677', 4, 2.0),
('123-45-6789', 4, 4.0),
('123-45-6789', 5, 1.7),
('123-43-6554', 1, 3.2),
('123-43-6554', 3, 4.0),
('123-77-8856', 1, 2.1),
('221-54-8997', 1, 4.0),
('221-54-8997', 4, 3.0),
('221-54-8997', 3, 4.0),
('323-54-7677', 1, 3.2),
('323-54-7677', 2, 4.0),
('323-76-4532', 2, 3.6),
('343-66-0000', 2, 3.5),
('343-66-0000', 3, 0.9),
('343-66-0000', 4, 4.0),
('343-66-2222', 1, 3.0),
('343-66-2222', 2, 4.0);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `sid` varchar(11) NOT NULL,
  `last` varchar(30) NOT NULL,
  `first` varchar(30) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `gpa` double DEFAULT NULL,
  `advisor` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`sid`, `last`, `first`, `birthdate`, `gpa`, `advisor`) VALUES
('123-43-6554', 'Powell', 'Herbert', '1963-11-04', NULL, 1),
('123-45-6789', 'Simpson', 'Homer', '1947-05-05', 3.2, 1),
('123-77-8856', 'Flanders', 'Rod', '1987-01-28', 1.5, 2),
('221-54-8997', 'Simpson', 'Abraham', '1967-06-23', 4, 2),
('323-54-7677', 'Van Houten', 'Kirk', '1957-02-15', 0.7, 2),
('323-76-4532', 'Van Houten', 'Luann', '1959-03-16', 4, 2),
('343-66-0000', 'Muntz', 'Nelson', NULL, 2.7, 2),
('343-66-2222', 'Nahasapeemapetilon', 'Apu', '1942-05-18', 2.8, 2),
('343-66-2323', 'Spuckler', 'Brandine', NULL, 3.9, 2),
('343-66-3333', 'Nahasapeemapetilon', 'Manjula', '1944-05-19', NULL, 2),
('343-66-3434', 'Spuckler', 'Cletus', '1987-12-27', 3, 3),
('343-66-3444', 'Hibbert', 'Julius', '1957-07-20', NULL, 2),
('343-66-5555', 'Hibbert', 'Bernice', '1958-06-21', 3.6, 2),
('343-66-6666', 'Prince', 'Martin', '1952-08-11', 4, 2),
('343-66-7777', 'Prince', 'Martha', '1955-09-22', 2.5, 2),
('343-66-8888', 'Lovejoy', 'Timothy', '1967-10-23', 1.9, 2),
('343-66-9999', 'Lovejoy', 'Helen', '1967-11-24', 2.9, 2),
('343-67-7765', 'Flanders', 'Nedward', '1966-12-05', 2.7, 2),
('343-87-9987', 'Simpson', 'Marjorie', '1949-04-07', 2.8, 2),
('343-99-3434', 'Spuckler', 'Cletus', '1987-12-27', 3, 2),
('656-88-0098', 'Wiggum', 'Sarah', '1950-02-28', 0.6, 2),
('769-54-8876', 'Wiggum', 'Ralph', '1955-01-22', 2.5, 2),
('880-11-2323', 'Terikov', 'Alex', '1985-01-01', 3.5, 0),
('880-12-2121', 'Dole', 'Bob', '1923-07-22', 3.5, 3),
('880-22-3333', 'Moore', 'Jason', '1980-09-29', 3.9, 3),
('880-23-4569', 'Warhol', 'Andy', NULL, 4, 0),
('880-34-3456', 'Baggins', 'Frodo', '1988-09-26', 0, 3),
('880-34-9875', 'Ostrich', 'Tuna', '1978-10-28', 0, 2),
('880-38-8692', 'Moore', 'Jason', '1980-09-29', 3.5, 2),
('880-39-4587', 'Doe', 'John', '1953-10-12', 4, 2),
('880-880-880', 'Brown', 'Charlie', '1945-01-01', 3, 2),
('890-76-4553', 'Bouvier', 'Clancy', '1961-08-01', 2.4, 3),
('890-88-9987', 'Bouvier', 'Jacqueline', '1960-08-25', 1.6, 3),
('955-76-4401', 'Wiggum', 'Clancy', '1953-03-11', 1.4, 3),
('955-77-4532', 'Flanders', 'Maude', '1947-12-27', 2.8, 3),
('955-87-8845', 'Bouvier Terwilliger', 'Selma', '1947-10-03', 2.9, 3),
('987-09-6657', 'Bouvier', 'Patricia', '1962-09-02', 3.5, 3),
('987-65-4455', 'Simpson', 'Mona', '1968-07-15', 3.8, 3),
('987-65-7890', 'Van Houten', 'Sophie', '1939-04-17', 1.2, 3),
('990-58-9374', 'Arndt', 'Cameron', '1995-01-07', 4, 2);

