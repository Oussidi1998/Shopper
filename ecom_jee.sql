-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  jeu. 02 jan. 2020 à 02:10
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP :  7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ecom_jee`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `category` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id_category`, `category`) VALUES
(1, 'MULTIMEDIA'),
(2, 'IMAGES & SON'),
(3, 'VETEMENTS'),
(4, 'ELECTROMENAGER'),
(5, 'LAVAGE');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `civil` varchar(5) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `pays` varchar(40) NOT NULL,
  `ville` varchar(40) NOT NULL,
  `zipcode` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom`, `prenom`, `civil`, `email`, `password`, `adresse`, `pays`, `ville`, `zipcode`) VALUES
(1, 'Oussidi', 'Mohamed', 'homme', 'osidi1998@gmail.com', '123456789', '14 street 8  boulili ', 'Maroc', 'Rich', 52400),
(2, 'Assofi', 'Salah', 'homme', 'salah.dev@gmail.com', '123456789', '12 rue tajdin quartier tahmidant', 'Maroc', 'rich', 52400),
(3, 'Kourmou', 'omar', 'homme', 'omar.dev@gmail.com', '123456789', '45 rue quds quartier taznakht', 'Maroc', 'ouarzazat', 52000);

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id_command` int(11) NOT NULL,
  `date_command` date NOT NULL,
  `id_client` int(11) NOT NULL,
  `adress_livraison` varchar(120) NOT NULL,
  `frais` int(11) NOT NULL,
  `etat` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `quantite` int(11) NOT NULL,
  `prix` double NOT NULL,
  `id_produit` int(11) NOT NULL,
  `id_command` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id_produit` int(11) NOT NULL,
  `label` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `prix` double NOT NULL,
  `image` blob NOT NULL,
  `promo` double NOT NULL DEFAULT 0,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id_produit`, `label`, `description`, `prix`, `image`, `promo`, `id_category`) VALUES
(1, 'Asus i5', 'Lorem ipsum dolor', 6000, '', 0, 1),
(2, 'lenovo core i5', 'Pc gamer 2017', 1000, '', 10, 1),
(3, 'Lenovo core i5 pc gamer', 'Lenovo PC gamer  ', 8000, '', 5, 1),
(4, 'T-shirt', 't-shirt pour les jeune taille 42 ', 70, '', 0, 3),
(5, 'T-shirt  irish', 'T-shirt pour les  femme avec tous les tailes', 50, '', 0, 3),
(6, 'CLAVIER USB', 'Simple clavier pour les gamers avec le mode azerty', 30, '', 15, 1),
(7, 'Chargeur notebook', 'Chargeur pour des ordinateurs hp notebook  ', 150, '', 20, 1),
(8, 'micro-onde samsung', 'micro-onde samsung ', 1000, '', 0, 4),
(9, 'smart tv ultra', '', 7000, '', 15, 1),
(10, 'aspirateur', 'aspirateur sans sac rouge', 1000, '', 0, 4),
(14, 'hoodie Nike', 'hoodie nike for youngs', 200, '', 30, 3),
(20, 'camera Nikon', '', 4000, '', 16, 2),
(21, 'Batteur moulinex', 'Batteur moulinex avec explication', 50, '', 10, 4),
(22, 'LAVE LINGE WHRIPOOL 5KG 900 TR AWE 5090', '', 3000, '', 12, 5);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id_command`),
  ADD KEY `FKch50ykbl0vymmw65qfbb3hwxf` (`id_client`);

--
-- Index pour la table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD KEY `FK9i0g66qicel93vrhre95xyohk` (`id_produit`),
  ADD KEY `FKhki6yip25twvlb1kg7yck96i2` (`id_command`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `FK605rywsssynyyl79wv7q8tj02` (`id_category`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id_command` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FKch50ykbl0vymmw65qfbb3hwxf` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `FK9i0g66qicel93vrhre95xyohk` FOREIGN KEY (`id_produit`) REFERENCES `product` (`id_produit`),
  ADD CONSTRAINT `FKhki6yip25twvlb1kg7yck96i2` FOREIGN KEY (`id_command`) REFERENCES `order` (`id_command`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK605rywsssynyyl79wv7q8tj02` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
