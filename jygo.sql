-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 14 Avril 2015 à 10:31
-- Version du serveur :  5.6.16
-- Version de PHP :  5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `jygo`
--

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE IF NOT EXISTS `evenement` (
  `idEvent` int(11) NOT NULL AUTO_INCREMENT,
  `nomEvent` varchar(64) NOT NULL,
  `dateEvent` datetime NOT NULL,
  `description` text NOT NULL,
  `villeEvent` varchar(64) NOT NULL,
  `adresseEvent` varchar(64) NOT NULL,
  `categorie` varchar(64) NOT NULL,
  `nbParticipantMax` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idEvent`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `evenement`
--

INSERT INTO `evenement` (`idEvent`, `nomEvent`, `dateEvent`, `description`, `villeEvent`, `adresseEvent`, `categorie`, `nbParticipantMax`) VALUES
(1, 'La fête de tous les Robert', '2015-04-29 14:00:00', 'Tous les Robert sont invité pour une méga fête.', 'Reims', 'place d''Erlon', 'Fête', 256000),
(2, 'Anniversaire de John', '2015-03-01 00:00:00', 'Anniversaire de John', 'Reims', '23 rue Jean Moulin', 'Anniversaire', 10),
(3, 'Un événement quelconque ', '2015-03-02 00:00:00', '', 'Reims', '1 rue des boulets', 'OSef', 256000);

-- --------------------------------------------------------

--
-- Structure de la table `organiser`
--

CREATE TABLE IF NOT EXISTS `organiser` (
  `mailOrganisateur` varchar(64) NOT NULL,
  `eventOrganiser` int(11) NOT NULL,
  PRIMARY KEY (`mailOrganisateur`,`eventOrganiser`),
  KEY `FK_organiser_eventOrganiser` (`eventOrganiser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `organiser`
--

INSERT INTO `organiser` (`mailOrganisateur`, `eventOrganiser`) VALUES
('bob.bobson@live.fr', 1),
('john.johnson@gmail.com', 2),
('john.johnson@gmail.com', 3);

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

CREATE TABLE IF NOT EXISTS `participer` (
  `mailParticipant` varchar(64) NOT NULL,
  `event` int(11) NOT NULL,
  `note` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`mailParticipant`,`event`),
  KEY `FK_participer_event` (`event`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `participer`
--

INSERT INTO `participer` (`mailParticipant`, `event`, `note`) VALUES
('bob.bobson@live.fr', 2, 4),
('bob.bobson@live.fr', 3, 1),
('jean.neige@hotmail.fr', 1, NULL),
('jean.neige@hotmail.fr', 2, 5),
('jean.neige@hotmail.fr', 3, 1),
('john.johnson@gmail.com', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `email` varchar(64) NOT NULL,
  `nom` varchar(64) NOT NULL,
  `prenom` varchar(64) NOT NULL,
  `login` varchar(64) NOT NULL,
  `mdp` varchar(64) NOT NULL,
  `adresse` varchar(64) NOT NULL,
  `ville` varchar(64) NOT NULL,
  `date_naissance` date NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`email`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `ville`, `date_naissance`) VALUES
('bob.bobson@live.fr', 'Bobson', 'Bob', 'bob', '029d9a64ac2b52de0a7288e660cd7ad0c8cef43d03d34c8bd111b90d677a8715', '32 rue des Roberts', 'OsefVille', '1991-09-11'),
('jean.neige@hotmail.fr', 'Neige', 'Jean', 'jeanjean', 'a746222f09d85605c52d4e636788d6ffdc274698b98b8c5f3244c06958683a69', '243 avenue de Laon', 'Reims', '1980-03-01'),
('john.johnson@gmail.com', 'Johnson', 'John', 'johnnny08', 'ea299c775477a5dd08c85ca833525d4def9c01bc1c9f9e5a05eb840d66f740f2', '23 rue Jean Moulin', 'Reims', '2000-03-03'),
('uneadresseemail@hotmail.fr', 'Osef', 'John', 'uneadresseemail@hotmail.fr', '8df065ae9645a22c6b2444e9336088597daf8dd07d666b3607ae6a82e38ce219', '1 rue des développeurs android', 'Quelque part', '1915-01-01');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `organiser`
--
ALTER TABLE `organiser`
  ADD CONSTRAINT `FK_organiser_eventOrganiser` FOREIGN KEY (`eventOrganiser`) REFERENCES `evenement` (`idEvent`),
  ADD CONSTRAINT `FK_organiser_mailOrganisateur` FOREIGN KEY (`mailOrganisateur`) REFERENCES `utilisateur` (`email`);

--
-- Contraintes pour la table `participer`
--
ALTER TABLE `participer`
  ADD CONSTRAINT `FK_participer_event` FOREIGN KEY (`event`) REFERENCES `evenement` (`idEvent`),
  ADD CONSTRAINT `FK_participer_mailParticipant` FOREIGN KEY (`mailParticipant`) REFERENCES `utilisateur` (`email`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
