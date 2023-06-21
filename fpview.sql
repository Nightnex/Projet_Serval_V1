-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 21 juin 2023 à 11:33
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `fpview`
--

-- --------------------------------------------------------

--
-- Structure de la table `action`
--

DROP TABLE IF EXISTS `action`;
CREATE TABLE IF NOT EXISTS `action` (
  `id` int NOT NULL AUTO_INCREMENT,
  `map_id` int NOT NULL,
  `action` varchar(155) NOT NULL,
  `item_id` int NOT NULL,
  `requis` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `action`
--

INSERT INTO `action` (`id`, `map_id`, `action`, `item_id`, `requis`, `status`) VALUES
(1, 3, 'use', 1, 1, 0),
(2, 14, 'take', 1, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `compass`
--

DROP TABLE IF EXISTS `compass`;
CREATE TABLE IF NOT EXISTS `compass` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orientation` varchar(155) NOT NULL,
  `map_direction` varchar(155) NOT NULL,
  `c_path` varchar(155) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `compass`
--

INSERT INTO `compass` (`id`, `orientation`, `map_direction`, `c_path`) VALUES
(1, 'east', '0', 'compass-0.png'),
(2, 'north', '90', 'compass-90.png'),
(3, 'west', '180', 'compass-180.png'),
(4, 'south', '270', 'compass-270.png');

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `map_id` int NOT NULL,
  `path` varchar(250) NOT NULL,
  `status_action` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id`, `map_id`, `path`, `status_action`) VALUES
(3, 1, '01-0.jpg', 0),
(4, 2, '01-90.jpg', 0),
(5, 3, '01-180.jpg', 0),
(6, 4, '01-270.jpg', 0),
(7, 5, '11-0.jpg', 0),
(8, 6, '11-90.jpg', 0),
(9, 7, '11-180.jpg', 0),
(10, 8, '11-270.jpg', 0),
(11, 9, '10-0.jpg', 0),
(12, 10, '10-90.jpg', 0),
(13, 11, '10-180.jpg', 0),
(14, 12, '10-270.jpg', 0),
(15, 13, '12-0.jpg', 0),
(16, 14, '12-90.jpg', 0),
(17, 15, '12-180.jpg', 0),
(18, 16, '12-270.jpg', 0),
(19, 14, '12-90-1.jpg', 1),
(20, 3, '01-180-win.jpg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` int NOT NULL,
  `description` varchar(155) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`id`, `description`) VALUES
(1, 'une clé dorée');

-- --------------------------------------------------------

--
-- Structure de la table `map`
--

DROP TABLE IF EXISTS `map`;
CREATE TABLE IF NOT EXISTS `map` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coordX` int NOT NULL,
  `coordY` int NOT NULL,
  `direction` int NOT NULL,
  `status_action` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `map`
--

INSERT INTO `map` (`id`, `coordX`, `coordY`, `direction`, `status_action`) VALUES
(1, 0, 1, 0, 0),
(2, 0, 1, 90, 0),
(3, 0, 1, 180, 0),
(4, 0, 1, 270, 0),
(5, 1, 1, 0, 0),
(6, 1, 1, 90, 0),
(7, 1, 1, 180, 0),
(8, 1, 1, 270, 0),
(9, 1, 0, 0, 0),
(10, 1, 0, 90, 0),
(11, 1, 0, 180, 0),
(12, 1, 0, 270, 0),
(13, 1, 2, 0, 0),
(14, 1, 2, 90, 1),
(15, 1, 2, 180, 0),
(16, 1, 2, 270, 0);

-- --------------------------------------------------------

--
-- Structure de la table `text`
--

DROP TABLE IF EXISTS `text`;
CREATE TABLE IF NOT EXISTS `text` (
  `id` int NOT NULL AUTO_INCREMENT,
  `map_id` int NOT NULL,
  `text` varchar(250) NOT NULL,
  `status_action` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `text`
--

INSERT INTO `text` (`id`, `map_id`, `text`, `status_action`) VALUES
(1, 1, 'Je dois trouver une clé pour sortir d\'ici...', 0),
(2, 2, 'Un mur m\'empêche de passer...', 0),
(3, 3, 'Je dois trouver une clé pour sortir d\'ici...', 0),
(7, 9, 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia vo', 0),
(6, 4, 'Rien par ici', 0),
(11, 14, 'Voici un bien joli vase !', 0),
(8, 10, 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia vo', 0),
(9, 11, 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia vo', 0),
(10, 12, 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia vo', 0),
(12, 14, 'Tu récupères le vase et la clé dorée qui se trouve à l\'intérieur !', 1),
(13, 3, 'Gagné !!', 1),
(4, 6, 'Tiens qu\'est-ce qu\'il y a là-bas !?', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
