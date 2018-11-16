-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 15 nov. 2018 à 07:54
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `nfactoryblog`
--

-- --------------------------------------------------------

--
-- Structure de la table `t_articles`
--

DROP TABLE IF EXISTS `t_articles`;
CREATE TABLE IF NOT EXISTS `t_articles` (
  `ID_ARTICLE` int(11) NOT NULL AUTO_INCREMENT,
  `ARTDATE` datetime NOT NULL,
  `ARTCONTENU` text NOT NULL,
  `ARTTITRE` varchar(240) NOT NULL,
  `ARTCHAPO` varchar(255) NOT NULL,
  `ARTNBVIEWS` int(11) NOT NULL,
  PRIMARY KEY (`ID_ARTICLE`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `t_articles`
--

INSERT INTO `t_articles` (`ID_ARTICLE`, `ARTDATE`, `ARTCONTENU`, `ARTTITRE`, `ARTCHAPO`, `ARTNBVIEWS`) VALUES
(1, '2018-11-14 00:00:00', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.', 'Qu\'est-ce que le Lorem Ipsum?', '', 0),
(2, '2018-11-13 00:00:00', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.', 'Qu\'est-ce que le Lorem Ipsum?', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `t_articles_has_t_users`
--

DROP TABLE IF EXISTS `t_articles_has_t_users`;
CREATE TABLE IF NOT EXISTS `t_articles_has_t_users` (
  `t_users_id_user` int(11) NOT NULL AUTO_INCREMENT,
  `t_articles_id_article` int(11) NOT NULL,
  `t_comments_id_comment` int(11) NOT NULL,
  PRIMARY KEY (`t_users_id_user`,`t_articles_id_article`,`t_comments_id_comment`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_categories`
--

DROP TABLE IF EXISTS `t_categories`;
CREATE TABLE IF NOT EXISTS `t_categories` (
  `ID_CATEGORIE` int(11) NOT NULL AUTO_INCREMENT,
  `CATLIBELLE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_CATEGORIE`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `t_categories`
--

INSERT INTO `t_categories` (`ID_CATEGORIE`, `CATLIBELLE`) VALUES
(1, 'sport'),
(2, 'technologie'),
(3, 'science'),
(4, 'histoire'),
(5, 'nourriture'),
(6, 'religion'),
(7, 'geographie');

-- --------------------------------------------------------

--
-- Structure de la table `t_categories_has_t_articles`
--

DROP TABLE IF EXISTS `t_categories_has_t_articles`;
CREATE TABLE IF NOT EXISTS `t_categories_has_t_articles` (
  `T_CATEGORIES_ID_CATEGORIE` int(11) NOT NULL,
  `T_ARTICLES_ID_ARTICLE` int(11) NOT NULL,
  PRIMARY KEY (`T_CATEGORIES_ID_CATEGORIE`,`T_ARTICLES_ID_ARTICLE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `t_categories_has_t_articles`
--

INSERT INTO `t_categories_has_t_articles` (`T_CATEGORIES_ID_CATEGORIE`, `T_ARTICLES_ID_ARTICLE`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `t_roles`
--

DROP TABLE IF EXISTS `t_roles`;
CREATE TABLE IF NOT EXISTS `t_roles` (
  `ID_ROLE` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_ROLE`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `t_roles`
--

INSERT INTO `t_roles` (`ID_ROLE`, `name`) VALUES
(1, 'sdfsdfsdfsdfsdf'),
(2, 'sdfsdfsdfsdf'),
(3, 'sdfsdgg'),
(4, 'sdfsdf'),
(5, 'sfgsd');

-- --------------------------------------------------------

--
-- Structure de la table `t_users`
--

DROP TABLE IF EXISTS `t_users`;
CREATE TABLE IF NOT EXISTS `t_users` (
  `ID_USER` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(45) NOT NULL,
  `USERFNAME` varchar(45) DEFAULT NULL,
  `PSEUDO` varchar(255) NOT NULL,
  `USERMAIL` varchar(255) NOT NULL,
  `USERPASSWORD` char(40) NOT NULL,
  `USERDATEINS` datetime DEFAULT NULL,
  `T_ROLES_ID_ROLE` int(11) NOT NULL,
  `ACTIVE` int(1) NOT NULL DEFAULT '1',
  `reset_token` varchar(60) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(80) NOT NULL,
  PRIMARY KEY (`ID_USER`,`T_ROLES_ID_ROLE`),
  KEY `fk_T_USERS_T_ROLES_idx` (`T_ROLES_ID_ROLE`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_users`
--

INSERT INTO `t_users` (`ID_USER`, `USERNAME`, `USERFNAME`, `PSEUDO`, `USERMAIL`, `USERPASSWORD`, `USERDATEINS`, `T_ROLES_ID_ROLE`, `ACTIVE`, `reset_token`, `reset_at`, `confirmation_token`) VALUES
(31, 'aze', 'aze', 'aze', 'aze@aze.fr', 'de271790913ea81742b7d31a70d85f50a3d3e5ae', '2018-01-11 23:01:43', 5, 1, 'KdUDfr1YYHSEyMaOlLwrv6y9150uEexGgAY9Tew1hu8znfth2KShyjENIbf9', '2018-01-26 00:19:43', ''),
(32, 'alili', 'hocine', 'alilihoc', 'hocine.alili@gmail.com', '9e0ef5325e76ab778bbd0865b8ed891ddecda57c', '2018-01-11 23:01:38', 5, 1, NULL, NULL, ''),
(33, 'ali', 'kj', 'ij', 'ij@j.com', '4cfa380a7a05ae26270f5ea888009520ab54b677', '2018-01-12 13:01:54', 5, 0, NULL, NULL, ''),
(34, 'tre', 'tre', 'tre', 'tre@t.fr', '46fd535bbf9187b13dbcf7c26328c9b8479612d4', '2018-01-12 19:01:15', 5, 1, NULL, NULL, ''),
(35, 'a', 'aze', 'azert', 'az@azazz.fr', '6dab20c0f365dbcea9c4d26f7396f70fc5196bac', '2018-01-12 19:01:53', 5, 1, NULL, NULL, ''),
(36, 'tez', 'ze', 'ze', 'ze@ze.fr', '90283840d90de49b8e7984bd99b47fee0d4bd50d', '2018-01-12 23:01:20', 5, 1, NULL, NULL, ''),
(40, '', NULL, 'JC', 'jc@gmail.com', 'f9ae8604de015e6fc12a1ebdbe72f262b981a2f6', '2018-01-21 18:01:28', 2, 1, NULL, NULL, ''),
(52, 'alili', 'hocine', 'alilihoc', 'hocine.alili@gmail.com', '', '2018-01-21 20:01:53', 5, 1, NULL, NULL, ''),
(64, 'aze', 'aze', 'aze', 'aze@aze.fr', '', '2018-01-21 20:01:57', 2, 1, NULL, NULL, ''),
(65, 'aze', 'aze', 'aze', 'aze@aze.fr', '', '2018-01-21 20:01:58', 1, 1, NULL, NULL, ''),
(80, 'aze', 'aze', 'aze', 'aze@aze.fr', '', '2018-01-21 21:01:34', 3, 1, NULL, NULL, ''),
(82, 'a', 'aze', 'azert', 'az@azazz.fr', '', '2018-01-21 22:01:11', 4, 1, NULL, NULL, ''),
(83, '', NULL, 'aa', 'aa@aa.fr', 'e0c9035898dd52fc65c41454cec9c4d2611bfb37', '2018-01-28 21:01:55', 2, 1, NULL, NULL, ''),
(84, 'aze', 'aze', 'aze', 'aze@aze.fr', '', '2018-01-28 23:01:49', 4, 1, NULL, NULL, ''),
(85, 'azeee', 'azeeee', 'jean', 'aze@azeeeee.fr', '51f8b1fa9b424745378826727452997ee2a7c3d7', '2018-01-28 23:01:40', 3, 1, NULL, NULL, ''),
(86, 'superhardis', 'Alili', 'alilihoc8979676', 'lucas.rossetto@hardis.fra', '2db6f2ada6252146a1d690d3f1110eae2b33f9ff', '2018-11-15 07:46:34', 5, 1, NULL, NULL, 'lZXQsGU84TWr0qgTyeDBnz4NBaCiNbvAfTHlQk6acyItw5fJdRGVWSYSFlsA');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
