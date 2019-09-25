-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2019 at 03:22 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dailyforum`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(3) UNSIGNED NOT NULL,
  `category_title` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `category_title`) VALUES
(3, 'Software Engineering'),
(4, 'Computer Network'),
(5, 'General forum');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `reply_id` int(3) UNSIGNED NOT NULL,
  `category_id` int(3) UNSIGNED NOT NULL,
  `subcategory_id` int(3) UNSIGNED NOT NULL,
  `topic_id` int(3) UNSIGNED NOT NULL,
  `author` varchar(16) NOT NULL,
  `comment` text NOT NULL,
  `date_posted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`reply_id`, `category_id`, `subcategory_id`, `topic_id`, `author`, `comment`, `date_posted`) VALUES
(1, 3, 1, 3, 'user1', 'this is a first reply.....', '2019-08-22'),
(2, 3, 1, 6, 'user3', 'test reply for topic 4', '2019-08-23'),
(3, 3, 1, 6, 'user3', 'test reply 2', '2019-08-23'),
(4, 3, 2, 5, 'trinal', 'la la la', '2019-08-26'),
(5, 3, 1, 6, '', 'Hello Trinal', '2019-08-28'),
(6, 3, 2, 7, 'vishwajith', 'Love it', '2019-08-28'),
(7, 3, 1, 6, 'eng-17-037', '', '2019-08-29'),
(8, 3, 1, 6, 'eng-17-037', 'Reply topic<br />\r\n', '2019-08-29'),
(9, 3, 1, 6, 'eng-17-037', 'Hello', '2019-08-30'),
(10, 3, 1, 6, 'eng-17-037', 'Example reply', '2019-08-30');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `subcat_id` int(3) UNSIGNED NOT NULL,
  `parent_id` int(3) UNSIGNED NOT NULL,
  `subcategory_title` varchar(128) NOT NULL,
  `subcategory_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`subcat_id`, `parent_id`, `subcategory_title`, `subcategory_desc`) VALUES
(1, 3, 'Python', '-Issues related to Python'),
(2, 3, 'Java', '-Issues related to Java'),
(3, 3, 'PHP', '-Issues related to PHP'),
(4, 4, 'SNMP', '-Issues related to SNMP'),
(5, 4, 'BGP', '-Issues related to BGP'),
(6, 4, 'Routing Protocols', '-Issues related to routing protocols '),
(7, 5, 'Regarding Lectures', '-Lecture changes'),
(8, 5, 'Admissions', '-Issues regarding admissions');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `topic_id` int(8) UNSIGNED NOT NULL,
  `category_id` int(3) UNSIGNED NOT NULL,
  `subcategory_id` int(3) UNSIGNED NOT NULL,
  `author` varchar(30) NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `date_posted` date NOT NULL,
  `views` int(5) UNSIGNED NOT NULL,
  `replies` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`topic_id`, `category_id`, `subcategory_id`, `author`, `title`, `content`, `date_posted`, `views`, `replies`) VALUES
(1, 3, 1, 'user1', 'this is a test topic', 'test content that has to be long', '2019-08-22', 9, 0),
(2, 3, 1, 'user1', 'this is a test topic', 'test content that has to be long', '2019-08-22', 11, 0),
(3, 3, 1, 'user1', 'this is from browser', 'browser test content for the sub cat', '2019-08-22', 21, 0),
(4, 3, 2, 'user2', 'test topic', 'blah blah blah', '2019-08-22', 2, 0),
(5, 3, 2, 'user2', 'test post', 'blah blah blah', '2019-08-22', 6, 0),
(6, 3, 1, 'user3', 'new topic 4', 'testing purpose', '2019-08-23', 141, 0),
(7, 3, 2, 'trinal', 'FC Barcelona', 'Why lional messi not leaving barcelona?', '2019-08-26', 3, 0),
(8, 3, 3, 'trinal', 'Some title', 'Some content', '2019-08-28', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(6) UNSIGNED NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`) VALUES
(1, 'user1', '24c9e15e52afc47c225b757e7bee1f9d', 'user1@gmail.com'),
(2, 'user2', '7e58d63b60197ceb55a1c487989a3720', 'user2@gmail.com'),
(5, 'user3', '92877af70a45fd6a2ed7fe81e1236b78', '123@gmail.com'),
(10, 'pirana', '81dc9bdb52d04dc20036dbd8313ed055', 'piranavan@gmail.com'),
(11, '', 'd41d8cd98f00b204e9800998ecf8427e', ''),
(12, '', 'd41d8cd98f00b204e9800998ecf8427e', ''),
(13, '', 'd41d8cd98f00b204e9800998ecf8427e', ''),
(14, 'trinal', '202cb962ac59075b964b07152d234b70', '123456789'),
(15, 'atvf', 'bbb8aae57c104cda40c93843ad5e6db8', 'fbfbfbfb'),
(16, 'ryryy', '44e6641f3ca0341724a1e46d2883529d', 'ryryry'),
(17, 'ryryy', '381be53a8ab2a137368a4ab3cd5892de', 'ryryry'),
(18, 'ryryy', 'd41d8cd98f00b204e9800998ecf8427e', 'ryryry@'),
(19, 'ryryy', 'd41d8cd98f00b204e9800998ecf8427e', 'ryryry@thth'),
(21, '', 'd41d8cd98f00b204e9800998ecf8427e', ''),
(22, '', 'd41d8cd98f00b204e9800998ecf8427e', ''),
(23, '', 'd41d8cd98f00b204e9800998ecf8427e', ''),
(24, 'pira boy', 'f917a925d5276b2b1c3e85756c3dc1d2', 'jyfjyfjyfjf@ihilih'),
(25, 'pira boy', '66f85c633f964686e67027de28b0aca7', 'jyfjyfjyfjf@ihilih.com'),
(26, '', '1606f4a508819c43ffd8b9f58bdef153', 'sgsgsd'),
(27, '', 'd41d8cd98f00b204e9800998ecf8427e', ''),
(28, '', 'd41d8cd98f00b204e9800998ecf8427e', ''),
(29, '', 'd41d8cd98f00b204e9800998ecf8427e', ''),
(30, '', 'd41d8cd98f00b204e9800998ecf8427e', ''),
(31, '', 'd41d8cd98f00b204e9800998ecf8427e', ''),
(32, '', 'd41d8cd98f00b204e9800998ecf8427e', ''),
(33, '', 'd41d8cd98f00b204e9800998ecf8427e', ''),
(34, 'eng-17-037', 'e10adc3949ba59abbe56e057f20f883e', 'trinal@hotmail.com'),
(35, 'trinal', 'e10adc3949ba59abbe56e057f20f883e', 'atv@gmail.com'),
(36, 'vishwajith', '81dc9bdb52d04dc20036dbd8313ed055', 'aeaetaetaet'),
(37, 'eng-17-037', 'e10adc3949ba59abbe56e057f20f883e', 'trinal@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`reply_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `subcategory_id` (`subcategory_id`),
  ADD KEY `subcategory_id_2` (`subcategory_id`),
  ADD KEY `topic_id_2` (`topic_id`),
  ADD KEY `subcategory_id_3` (`subcategory_id`),
  ADD KEY `subcategory_id_4` (`subcategory_id`),
  ADD KEY `topic_id_3` (`topic_id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`subcat_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`topic_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `subcategory_id` (`subcategory_id`),
  ADD KEY `subcategory_id_2` (`subcategory_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `reply_id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `subcat_id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `topic_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`cat_id`),
  ADD CONSTRAINT `replies_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`subcat_id`),
  ADD CONSTRAINT `replies_ibfk_3` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`);

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`cat_id`);

--
-- Constraints for table `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`cat_id`),
  ADD CONSTRAINT `topics_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`subcat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
