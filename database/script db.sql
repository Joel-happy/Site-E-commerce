-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 16 avr. 2024 à 14:30
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ycrossdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `IdAdresse` int NOT NULL,
  `AdresseDeFacturation` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AdresseDeLivraison` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NomDuDestinataire` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Adresse` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Ville` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumeroDeTelephone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CodePostal` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Pays` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdClient` int NOT NULL,
  PRIMARY KEY (`IdAdresse`),
  KEY `IdClient` (`IdClient`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `choisit`
--

DROP TABLE IF EXISTS `choisit`;
CREATE TABLE IF NOT EXISTS `choisit` (
  `IdClient` int NOT NULL,
  `IdMoto` int NOT NULL,
  PRIMARY KEY (`IdClient`,`IdMoto`),
  KEY `IdMoto` (`IdMoto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `IdClient` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Prenom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AddresseMail` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MotDePasse` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateDeNaissance` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NumeroDeTelephone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Anciennete` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `role` int NOT NULL,
  PRIMARY KEY (`IdClient`),
  UNIQUE KEY `client_AddresseMail_key` (`AddresseMail`),
  UNIQUE KEY `client_NumeroDeTelephone_key` (`NumeroDeTelephone`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`IdClient`, `Nom`, `Prenom`, `AddresseMail`, `MotDePasse`, `DateDeNaissance`, `NumeroDeTelephone`, `Anciennete`, `role`) VALUES
(3, 'jimmuy', 'conrad', 'conrad@yahoo.com', '$2b$10$24jrFlpgK9juWsTSqjehdumD2z7X8ajioKEOaytbG7.', '01/04/2004', '23584961', '09/04/2024', 0),
(4, 'yann', 'fingaz', 'yan.ynov@mail.com', '$2b$10$q3/Oy4cbi3AaXNaJ5wwuVuwMOnLtdSnw8Few7rW5P7C', '01/04/2007', '235849785', '10/04/2024', 0),
(5, 'curtis', 'jack', 'curtis@mail.com', '$2b$10$HLHsaU9ELlvcbjE3vuW.QOZNvFyZH0o0Ms8HmXtKALa', '01/04/2000', '525849785', '10/04/2024', 0),
(6, 'curtis', 'jack', 'curtis@mail.comc', '$2b$10$IOc2ZlnzOsgvkNOYyCYIseT.mhYcDngHoBJw8/q7.RL', '01/04/2000', '5258497585', '10/04/2024', 0),
(7, 'bertrand', 'maxime', 'maxs@mail.com', '$2b$10$LFIgq7Rty6LYvT1DwCMI9u3gqPyYjuudt8qv1QK73UL5fQPz0I5Ii', '01/04/2002', '5258579685', '10/04/2024', 0);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `IdCommandes` int NOT NULL AUTO_INCREMENT,
  `DatedeCommande` datetime NOT NULL,
  `StatusDeLaCommande` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdAdresse` int NOT NULL,
  `IdClient` int NOT NULL,
  PRIMARY KEY (`IdCommandes`),
  KEY `IdAdresse` (`IdAdresse`),
  KEY `IdClient` (`IdClient`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `IdFactures` int NOT NULL,
  `DatedeFacturation` datetime NOT NULL,
  `MontantTotal` decimal(10,2) NOT NULL,
  `IdClient` int NOT NULL,
  PRIMARY KEY (`IdFactures`),
  KEY `IdClient` (`IdClient`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inclut`
--

DROP TABLE IF EXISTS `inclut`;
CREATE TABLE IF NOT EXISTS `inclut` (
  `IdMoto` int NOT NULL,
  `IdCommandes` int NOT NULL,
  PRIMARY KEY (`IdMoto`,`IdCommandes`),
  KEY `IdCommandes` (`IdCommandes`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `methodedepaiement`
--

DROP TABLE IF EXISTS `methodedepaiement`;
CREATE TABLE IF NOT EXISTS `methodedepaiement` (
  `IdPaiement` int NOT NULL,
  `TypePaiement` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `InformationsDePaiement` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IdPaiement`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `motos`
--

DROP TABLE IF EXISTS `motos`;
CREATE TABLE IF NOT EXISTS `motos` (
  `IdMoto` int NOT NULL AUTO_INCREMENT,
  `NomMoto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Constructeur` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Modele` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DescriptionDuProduit` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Prix` decimal(10,2) NOT NULL,
  `Stock` int NOT NULL,
  PRIMARY KEY (`IdMoto`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `motos`
--

INSERT INTO `motos` (`IdMoto`, `NomMoto`, `Constructeur`, `Modele`, `DescriptionDuProduit`, `Prix`, `Stock`) VALUES
(1, 'Honda y5', 'HONDA', 'HmY5S', 'Moto très robuste', 650000.00, 2),
(6, 'Yamaha H5', 'Yamaha', 'YmH5S', 'Moto super performante', 250000.00, 3),
(7, 'Yamaha H5', 'Yamaha', 'YmH5S', 'Moto super performante', 250000.00, 3),
(8, 'Yamaha H5', 'Yamaha', 'YmH5S', 'Moto super performante', 250000.00, 3),
(9, 'Yamaha H5', 'Yamaha', 'YmH5S', 'Moto super performante', 250000.00, 3);

-- --------------------------------------------------------

--
-- Structure de la table `motossurcommande`
--

DROP TABLE IF EXISTS `motossurcommande`;
CREATE TABLE IF NOT EXISTS `motossurcommande` (
  `commandeId` int NOT NULL,
  `motoId` int NOT NULL,
  PRIMARY KEY (`commandeId`,`motoId`),
  KEY `MotosSurCommande_motoId_fkey` (`motoId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

DROP TABLE IF EXISTS `panier`;
CREATE TABLE IF NOT EXISTS `panier` (
  `IdPanier` int NOT NULL,
  `Quantite` bigint NOT NULL,
  `IdClient` int NOT NULL,
  PRIMARY KEY (`IdPanier`),
  KEY `IdClient` (`IdClient`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilise`
--

DROP TABLE IF EXISTS `utilise`;
CREATE TABLE IF NOT EXISTS `utilise` (
  `IdPaiement` int NOT NULL,
  `IdClient` int NOT NULL,
  PRIMARY KEY (`IdPaiement`,`IdClient`),
  KEY `IdClient` (`IdClient`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
