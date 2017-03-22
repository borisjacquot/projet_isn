
-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mer 22 Mars 2017 à 17:03
-- Version du serveur: 10.0.28-MariaDB
-- Version de PHP: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `u154661693_gamus`
--

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

CREATE TABLE IF NOT EXISTS `membres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `motdepasse` text NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `achiev_nb` int(255) NOT NULL,
  `achiev_beta` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `membres`
--

INSERT INTO `membres` (`id`, `pseudo`, `mail`, `motdepasse`, `avatar`, `achiev_nb`, `achiev_beta`) VALUES
(1, 'Admin', 'admin@gmail.com', '33380225b59d05e6a00106c1de0ebb6df0399ecb', '1.png', 0, 0),
(5, 'LemonAdd', 'lemon.add0@gmail.com', 'ce3e5113245bf2c1eb4b7f8e5364f054cb60af96', '5.png', 1, 1),
(6, 'Galmadus', 'clemillard@gmail.com', '3ed90a36b310cb3873d5413363befd810490a813', '6.gif', 1, 1),
(7, 'Genesis', 'nico51200@laposte.net', '4f14c5904b5d62eb2be50423cd866e9dd2bda03e', '7.jpg', 1, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
