-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Dim 26 Mars 2017 à 16:22
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gamus`
--

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

CREATE TABLE `membres` (
  `id` int(11) NOT NULL,
  `admin` int(255) NOT NULL,
  `restricted` int(11) NOT NULL,
  `restricted_raison` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pseudo` varchar(255) CHARACTER SET latin1 NOT NULL,
  `mail` varchar(255) CHARACTER SET latin1 NOT NULL,
  `motdepasse` text CHARACTER SET latin1 NOT NULL,
  `confirmkey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `confirme` int(11) NOT NULL,
  `avatar` varchar(255) CHARACTER SET latin1 NOT NULL,
  `score` int(11) NOT NULL,
  `achiev_nb` int(255) NOT NULL,
  `achiev_beta` int(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `membres`
--

INSERT INTO `membres` (`id`, `admin`, `restricted`, `restricted_raison`, `pseudo`, `mail`, `motdepasse`, `confirmkey`, `confirme`, `avatar`, `score`, `achiev_nb`, `achiev_beta`) VALUES
(1, 1, 0, '', 'Admin', 'admin@gmail.com', '33380225b59d05e6a00106c1de0ebb6df0399ecb', '', 0, '1.gif', 0, 0, 0),
(5, 1, 0, '', 'LemonAdd', 'lemon.add@gmail.com', 'ce3e5113245bf2c1eb4b7f8e5364f054cb60af96', '', 0, '5.gif', 0, 1, 1),
(6, 1, 0, '', 'Galmadus', 'clemillard@gmail.com', '3ed90a36b310cb3873d5413363befd810490a813', '', 0, '6.gif', 0, 1, 1),
(7, 1, 0, '', 'Genesis', 'nico51200@laposte.net', '4f14c5904b5d62eb2be50423cd866e9dd2bda03e', '', 0, '7.jpg', 0, 1, 1),
(8, 0, 0, '', 'Hercule', 'azeaze@gmail.com', '0e8112bea8d055e8fbb3e61a65d9b270788f059a', '', 0, '', 0, 0, 0),
(9, 0, 0, '', 'Vénus', 'venus@gmail.com', '804704a80d99e057375b10cb1128493034789db0', '', 0, '', 0, 0, 0),
(10, 0, 0, '', 'Prométhée', 'promethee@gmail.com', '5862ef9069f106db0a7f28c27eda2c6c36815940', '', 0, '', 0, 0, 0),
(11, 0, 0, '', 'Hermès', 'hermes@gmail.com', '5d7953a75fa4e3482d5b7fd57c49a064aef99a78', '', 0, '', 0, 0, 0),
(12, 0, 0, '', 'Athéna', 'athena@gmail.com', '8dccd2945cd5a5bb2ae6eee25445ad4649aa947d', '', 0, '', 0, 0, 0);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `membres`
--
ALTER TABLE `membres`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `membres`
--
ALTER TABLE `membres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
