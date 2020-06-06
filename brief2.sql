-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 06 juin 2020 à 17:18
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `brief2`
--
CREATE DATABASE IF NOT EXISTS `brief2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `brief2`;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `phone_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id_client`, `first_name`, `last_name`, `gender`, `phone_number`) VALUES
(2, 'Chris', 'Martin', 'M', 1123147789),
(3, 'Emma', 'Law', 'F', 1123439899),
(4, 'Mark', 'Watkins', 'M', 1174592013),
(5, 'Daniel', 'Williams', 'M', NULL),
(6, 'Sarah', 'Taylor', 'F', 1176348290),
(7, 'Katie', 'Armstrong', 'F', 1145787353),
(8, 'Michael', 'Bluth', 'M', 1980289282),
(9, 'Kat', 'Nash', 'F', 1176987789),
(10, 'Buster', 'Bluth', 'M', 1173456782),
(11, 'Charlie', NULL, 'F', 1139287883),
(12, 'Lindsay', 'Bluth', 'F', 1176923804),
(13, 'Harry', 'Johnson', 'M', NULL),
(14, 'John', 'Smith', 'M', 1174987221),
(15, 'John', 'Taylor', 'M', NULL),
(16, 'Emma', 'Smith', 'F', 1176984116),
(17, 'Gob', 'Bluth', 'M', 1176985498),
(18, 'George', 'Bluth', 'M', 1176984303),
(19, 'Lucille', 'Bluth', 'F', 1198773214),
(20, 'George', 'Evans', 'M', 1174502933),
(21, 'Emily', 'Simmonds', 'F', 1899284352),
(22, 'John', 'Smith', 'M', 1144473330),
(23, 'Jennifer', NULL, 'F', NULL),
(24, 'Toby', 'West', 'M', 1176009822),
(25, 'Paul', 'Edmonds', 'M', 1966947113);

-- --------------------------------------------------------

--
-- Structure de la table `command`
--

DROP TABLE IF EXISTS `command`;
CREATE TABLE IF NOT EXISTS `command` (
  `id_products` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `order_time` datetime DEFAULT NULL,
  KEY `fk_prod` (`id_products`),
  KEY `fk_order` (`id_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `command`
--

INSERT INTO `command` (`id_products`, `id_order`, `order_time`) VALUES
(1, 1, '2017-01-01 08:02:11'),
(1, 2, '2017-01-01 08:05:16'),
(5, 12, '2017-01-01 08:44:34'),
(3, 4, '2017-01-01 09:20:02'),
(1, 9, '2017-01-01 11:51:56'),
(6, 22, '2017-01-01 13:07:10'),
(1, 1, '2017-01-02 08:03:41'),
(3, 10, '2017-01-02 09:15:22'),
(2, 2, '2017-01-02 10:10:10'),
(3, 13, '2017-01-02 12:07:23'),
(1, 1, '2017-01-03 08:13:50'),
(7, 16, '2017-01-03 08:47:09'),
(6, 21, '2017-01-03 09:12:11'),
(5, 22, '2017-01-03 11:05:33'),
(4, 3, '2017-01-03 11:08:55'),
(3, 11, '2017-01-03 12:02:14'),
(2, 23, '2017-01-03 13:41:22'),
(1, 1, '2017-01-04 08:08:56'),
(3, 10, '2017-01-04 11:23:43'),
(4, 12, '2017-01-05 08:30:09'),
(7, 1, '2017-01-06 09:02:47'),
(3, 18, '2017-01-06 13:23:34'),
(2, 16, '2017-01-07 09:12:39'),
(2, 14, '2017-01-07 11:24:15'),
(4, 5, '2017-01-08 08:54:11'),
(1, 1, '2017-01-09 08:03:11'),
(6, 20, '2017-01-10 10:34:12'),
(3, 3, '2017-01-10 11:02:11');

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id_order` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `fk_id_client` (`id_client`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id_order`, `id_client`) VALUES
(1, 2),
(2, 7),
(3, 5),
(4, 22),
(5, 16),
(6, 14),
(7, 2),
(8, 2),
(9, 1),
(10, 20),
(11, 10),
(12, 4),
(13, 20),
(14, 8);

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id_products` int(11) NOT NULL,
  `product_name` varchar(40) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `origin` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_products`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id_products`, `product_name`, `price`, `origin`) VALUES
(1, 'special coffee', '37.50', 'Brazil'),
(2, 'coffee family', '8.00', 'Cuba'),
(13, 'coffee 2.0', '8.50', 'Ethopia'),
(3, 'animal coffee', '6.00', 'Indonesia'),
(22, 'coffe plus', '9.50', 'EST europe'),
(14, 'coffee ++', '9.25', 'Maroc');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
