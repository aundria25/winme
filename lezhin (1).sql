-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2018 at 01:42 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lezhin`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `authorId` int(15) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `age` int(2) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `readerId` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `genreId` int(15) NOT NULL,
  `genreName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log-in`
--

CREATE TABLE `log-in` (
  `log-inId` int(3) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `readerId` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reader`
--

CREATE TABLE `reader` (
  `readerId` int(15) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `age` int(2) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `registerId` int(3) NOT NULL,
  `firstname` varchar(15) NOT NULL,
  `lastname` varchar(15) NOT NULL,
  `age` int(3) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`registerId`, `firstname`, `lastname`, `age`, `gender`, `username`, `password`) VALUES
(1, 'John', 'Doe', 12, 'Male', 'john123', 'hahaha'),
(2, 'winme', 'trespeces', 20, '', 'winme0126', 'yohoo'),
(3, 'chadra', 'genit', 17, '', 'cj123', 'hehehehe'),
(4, 'shane', 'sionillo', 20, 'Female', 'sionillopriti', 'sisantiagwapa'),
(5, 'shane', 'sionillo', 20, 'Female', 'sionillopriti', 'sisantiagwapa');

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE `stories` (
  `storyId` int(15) NOT NULL,
  `storyName` varchar(30) NOT NULL,
  `availability` tinyint(1) NOT NULL,
  `author` varchar(30) NOT NULL,
  `authorId` int(15) NOT NULL,
  `genreId` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subscribes`
--

CREATE TABLE `subscribes` (
  `subscribeId` int(15) NOT NULL,
  `readerId` int(15) NOT NULL,
  `storyId` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`authorId`),
  ADD KEY `readerId` (`readerId`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genreId`);

--
-- Indexes for table `log-in`
--
ALTER TABLE `log-in`
  ADD PRIMARY KEY (`log-inId`),
  ADD KEY `readerId` (`readerId`);

--
-- Indexes for table `reader`
--
ALTER TABLE `reader`
  ADD PRIMARY KEY (`readerId`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`registerId`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`storyId`),
  ADD KEY `authorId` (`authorId`),
  ADD KEY `genreId` (`genreId`);

--
-- Indexes for table `subscribes`
--
ALTER TABLE `subscribes`
  ADD PRIMARY KEY (`subscribeId`),
  ADD KEY `readerId` (`readerId`),
  ADD KEY `storyId` (`storyId`),
  ADD KEY `readerId_2` (`readerId`),
  ADD KEY `storyId_2` (`storyId`),
  ADD KEY `storyId_3` (`storyId`),
  ADD KEY `readerId_3` (`readerId`),
  ADD KEY `storyId_4` (`storyId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `registerId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `log-in`
--
ALTER TABLE `log-in`
  ADD CONSTRAINT `readerId` FOREIGN KEY (`log-inId`) REFERENCES `reader` (`readerId`);

--
-- Constraints for table `stories`
--
ALTER TABLE `stories`
  ADD CONSTRAINT `stories_ibfk_1` FOREIGN KEY (`authorId`) REFERENCES `author` (`authorId`),
  ADD CONSTRAINT `stories_ibfk_2` FOREIGN KEY (`genreId`) REFERENCES `genres` (`genreId`);

--
-- Constraints for table `subscribes`
--
ALTER TABLE `subscribes`
  ADD CONSTRAINT `subscribes_ibfk_1` FOREIGN KEY (`readerId`) REFERENCES `reader` (`readerId`),
  ADD CONSTRAINT `subscribes_ibfk_2` FOREIGN KEY (`storyId`) REFERENCES `stories` (`storyId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
