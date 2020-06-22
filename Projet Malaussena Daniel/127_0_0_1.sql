-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 22 juin 2020 à 08:56
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet`
--
CREATE DATABASE IF NOT EXISTS `projet` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `projet`;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(8) UNSIGNED NOT NULL,
  `total` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `user_id`, `total`) VALUES
(1, 1, NULL),
(2, 1, NULL),
(3, 1, NULL),
(4, 1, NULL),
(5, 1, NULL),
(6, 1, NULL),
(7, 1, NULL),
(8, 1, NULL),
(9, 1, NULL),
(10, 1, NULL),
(11, 1, NULL),
(12, 1, NULL),
(13, 1, NULL),
(14, 1, NULL),
(15, 1, NULL),
(16, 1, NULL),
(17, 1, NULL),
(18, 1, NULL),
(19, 1, NULL),
(20, 1, NULL),
(21, 1, NULL),
(22, 1, NULL),
(23, 1, NULL),
(24, 1, NULL),
(25, 1, NULL),
(26, 1, NULL),
(27, 1, NULL),
(28, 1, NULL),
(29, 1, NULL),
(30, 1, NULL),
(31, 18, NULL),
(32, 18, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `picture` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` decimal(6,2) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `picture`, `description`, `category`, `price`, `name`) VALUES
(1, 'nemsboeuf.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'nems', '9.00', 'Nems au boeuf'),
(2, 'nemscrabe.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'nems', '7.00', 'Nems au crabe'),
(3, 'nemsporc.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'nems', '5.00', 'Nems au porc'),
(4, 'nemspoulet.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'nems', '2.00', 'Nems au poulet'),
(5, 'curry_poulet.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'plats', '10.00', 'Curry au poulet'),
(6, 'pad_thai.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'plats', '11.00', 'Pad Thai'),
(7, 'som_tam.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'plats', '9.00', 'Som Tam'),
(8, 'tom_kha_kai.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'plats', '20.00', 'Tom Kha Kai'),
(9, 'sushi_crevette.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'sushis', '6.00', 'Sushi au crevette'),
(10, 'sushi_saumon.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'sushis', '9.00', 'Sushi au saumon'),
(11, 'sushi_thon_rouge.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'sushis', '5.00', 'Sushi au ton rouge');

-- --------------------------------------------------------

--
-- Structure de la table `products_order`
--

DROP TABLE IF EXISTS `products_order`;
CREATE TABLE IF NOT EXISTS `products_order` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `cost` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `products_order`
--

INSERT INTO `products_order` (`product_id`, `order_id`, `quantity`, `cost`) VALUES
(4, 5, '5', '11'),
(1, 5, '1', '9'),
(1, 6, '6', '54'),
(2, 6, '3', '21'),
(1, 7, '1', '9'),
(2, 7, '1', '7'),
(3, 7, '1', '5'),
(2, 8, '2', '14'),
(10, 3, '1', '9'),
(9, 8, '1', '6.2'),
(2, 1, '2', '14'),
(3, 1, '1', '5'),
(9, 2, '1', '6'),
(11, 2, '3', '15'),
(1, 2, '2', '18'),
(6, 3, '1', '11');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tel` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `adresse`, `email`, `nom`, `prenom`, `password`, `tel`) VALUES
(18, 'rfzaqftqzrf', 'malaussena.daniel@liv.fr', 'Malaussena', 'Daniel', 'azerty12345', 663349256);
--
-- Base de données :  `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `content` text NOT NULL,
  `picture` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `content`, `picture`, `type`) VALUES
(1, 'Thé noir', 'Le thé noir, que les chinois appellent thé rouge en référence à la couleur cuivrée de son infusion, est un thé complètement oxydé. La fabrication du thé noir se fait en cinq étapes : le flétrissage, le roulage, l\'oxydation, la torréfaction et le triage. Cette dernière opération permet de différencier les différents grades.', 'thenoir.jpg', 'thé'),
(2, 'Thé vert', 'Réputé pour ses nombreuses vertus grâce à sa richesse en antioxydants, le thé vert désaltère, tonifie, apaise, fortifie, et procure une incontestable sensation de bien-être. Délicat et peu amer, il est apprécié à tout moment de la journée et propose une palette d\'arômes très variés : végétal, minéral, floral, fruité.', 'thevert.jpg', 'thé'),
(3, 'Oolong', 'Les Oolong, que les chinois appellent thés bleu-vert en référence à la couleur de leurs feuilles infusées, sont des thés semi-oxydés : leur oxydation n\'a pas été menée à son terme. Spécialités de Chine et de Taïwan, il en existe une grande variété, en fonction de la région de culture, de l\'espèce du théier ou encore du processus de fabrication.', 'oolong.jpg', 'thé'),
(4, 'Thé blanc', 'Le thé blanc est une spécialité de la province chinoise du Fujian. De toutes les familles de thé, c\'est celle dont la feuille est la moins transformée par rapport à son état naturel. Non oxydé, le thé blanc ne subit que deux opérations : un flétrissage et une dessiccation. Il existe deux grands types de thés blancs : les Aiguilles d\'Argent et les Bai Mu Dan.', 'theblanc.jpg', 'thé'),
(5, 'Rooibos', 'Le Rooibos (appelé thé rouge bien qu\'il ne s\'agisse pas de thé) est une plante poussant uniquement en Afrique du Sud et qui ne contient pas du tout de théine. Son infusion donne une boisson très agréable, ronde et légèrement sucrée. Riche en antioxydants, faible en tanins et dénué de théine, le Rooibos peut être dégusté en journée comme en soirée.', 'rooibos.jpg', 'thé'),
(6, 'Accessoire', '', '', ''),
(7, 'Épicerie', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `payment_validate` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `user_id`, `date`, `payment_validate`) VALUES
(1, 17, '2020-01-24 10:31:53', 0),
(2, 17, '2020-01-24 10:57:28', 0),
(3, 17, '2020-01-24 11:11:10', 0),
(4, 17, '2020-01-24 11:11:15', 0),
(5, 17, '2020-01-24 11:12:06', 0),
(6, 17, '2020-01-24 11:19:41', 0),
(7, 17, '2020-01-24 11:29:42', 0),
(8, 17, '2020-01-24 11:36:59', 0),
(9, 17, '2020-01-24 11:41:33', 0);

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` tinyint(3) UNSIGNED NOT NULL,
  `product_id` tinyint(3) UNSIGNED NOT NULL,
  `packaging_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `quantity_ordered` int(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `order_id` (`order_id`),
  KEY `packaging_id` (`packaging_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `packaging_id`, `quantity_ordered`) VALUES
(13, 5, 1, 1, 1),
(14, 5, 1, 3, 1),
(15, 5, 1, 2, 1),
(16, 5, 8, NULL, 1),
(17, 6, 1, 1, 1),
(18, 6, 1, 3, 1),
(19, 6, 1, 2, 1),
(20, 6, 8, NULL, 1),
(21, 7, 1, 1, 1),
(22, 7, 1, 3, 1),
(23, 7, 1, 2, 1),
(24, 7, 8, NULL, 1),
(25, 8, 1, 1, 2),
(26, 9, 1, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `packaging`
--

DROP TABLE IF EXISTS `packaging`;
CREATE TABLE IF NOT EXISTS `packaging` (
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `packaging`
--

INSERT INTO `packaging` (`id`, `name`) VALUES
(1, 'Pochette de 100gr'),
(2, 'Pochette de 500gr'),
(3, 'Pochette de 1kg');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `content` text NOT NULL,
  `price` decimal(6,2) UNSIGNED NOT NULL,
  `sub_title` varchar(120) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `premium` tinyint(1) NOT NULL DEFAULT 0,
  `category_id` tinyint(3) UNSIGNED NOT NULL,
  `size` varchar(60) DEFAULT NULL,
  `rate` tinyint(1) NOT NULL DEFAULT 0,
  `ref` smallint(6) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `crush` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `content`, `price`, `sub_title`, `picture`, `quantity`, `premium`, `category_id`, `size`, `rate`, `ref`, `weight`, `created_at`, `crush`) VALUES
(1, 'Blue of London', 'Blue of London est un Earl Grey d\'exception qui associe l\'un des meilleurs thés noirs au monde, le Yunnan, à une bergamote fraîche et délicate. Un mélange remarquable d\'équilibre et de finesse. \r\n\r\nLe Earl Grey est un grand classique anglais, depuis que Charles Grey, comte (earl en anglais) de Falodon et Ministre des Affaires étrangères du Royaume britannique au milieu du XIX ème siècle, reçut d\'un mandarin chinois une vieille recette consistant à aromatiser son thé avec de la bergamote.\r\n', '9.00', 'Thé noir à la bergamote', 'blueoflondon.jpg', 150, 0, 1, NULL, 2, 5698, NULL, '2020-01-13 10:44:11', 0),
(2, 'Thé des Lords', 'Un grand classique des thés anglais : un « Lord » très distingué, le plus bergamoté de nos Earl Grey\r\n', '8.20', 'Thé noir parfumé - Agrumes', 'thedeslords.jpg', 140, 0, 1, NULL, 0, 5201, NULL, '2020-01-13 10:44:11', 0),
(3, 'Thé des vahinés', 'Appel à l\'évasion dans des îles exotiques, un thé vert qui associe vanille, amande et boutons de rose\r\n', '9.40', 'Thé vert parfumé - Gourmand', 'thedesvahines.jpg', 100, 0, 1, NULL, 5, 5478, NULL, '2020-01-13 10:44:11', 0),
(4, 'Thé du hammam', 'Ce thé vert, gourmand et fruité, évoque la datte verte, la fleur d’oranger, la rose et les fruits rouges\r\n', '8.40', 'Thé vert parfumé - Fruité & Floral', 'theduhammam.jpg', 300, 0, 2, NULL, 0, 6530, NULL, '2020-01-13 10:44:14', 1),
(5, 'Vive le thé !\r\n', 'Ce bouquet d’agrumes délicatement parfumé avec du gingembre est une ode à la bonne humeur et à la joie de vivre !', '6.80', 'Thé vert parfumé - Agrumes & Épices', 'vivelethe.jpg', 500, 0, 2, NULL, 0, 3214, NULL, '2020-01-13 10:44:11', 0),
(6, 'Thé des alizés', 'Ses notes fraîches de pêche blanche, kiwi et pastèque vous transportent vers les mers turquoises du Sud', '9.30', 'Thé vert parfumé - Fruité', 'thedesalizes.jpg', 10, 0, 2, NULL, 0, 5687, NULL, '2020-01-13 10:44:11', 1),
(7, 'Vive les fetes', 'Mélange de thé vert et Oolong aux amandes et épices\r\n\r\n', '11.10', 'Thé vert et Oolong parfumés - Gourmand & Épicé', 'vivelesfetes.jpg', 40, 0, 3, NULL, 0, 7598, NULL, '2020-01-13 10:44:11', 1),
(8, 'Mug For Life', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deleniti consequuntur nobis corporis, aperiam, odit quaerat a possimus iusto temporibus maxime corrupti. Dolorum explicabo eligendi voluptas fugiat odio sunt maiores sequi, hic reprehenderit animi debitis quae similique culpa repellat ducimus eveniet enim, corrupti magnam nihil adipisci saepe suscipit aliquam? Aliquid, odit?', '12.00', NULL, 'mug_dino.jpg', 20, 0, 6, '12*8', 0, 1234, 180, '2020-01-13 00:00:00', 0),
(9, 'Théière bean bodum', '', '30.00', NULL, 'théière_bean_bodum.jpg', 35, 0, 6, '20*14', 0, 5454, 230, '2020-01-12 00:00:00', 0),
(10, 'Oolong 7 Agrumes', 'Une délicieuse recette où le caractère boisé du oolong se marie à la perfection aux notes hespéridées des agrumes', '13.20', NULL, 'oolong7agrumes.jpg', 150, 0, 3, NULL, 0, 9654, NULL, '2020-01-15 17:11:00', 0),
(13, 'Tie Guan Yin', 'Le Tie Guan Yin est un oolong roulé en perles, d\'oxydation intermédiaire, provenant du Fujian. La torréfaction finale développe des notes boisées, épicées et pyrogénées. Son nom signifie \"Déesse en fer de la miséricorde\" en référence à la célèbre légende selon laquelle la déesse Guan Yin aurait offert un théier aux hommes.\r\n\r\nLe oolong est un thé semi-oxydé sans amertume. Spécialité de Chine et de Taïwan, il en existe une grande variété, en fonction de la région de culture, de l\'espèce du théier ou encore du processus de fabrication. Il est idéal en dégustation du soir.', '7.40', NULL, 'tieguanyin.jpg', 150, 0, 3, NULL, 0, 3698, NULL, '2020-01-17 11:16:00', 0),
(14, 'Aiguilles d\'Argent', 'Très réputé sous la dynastie Song, le Yin Zen (Aiguilles d’Argent) est un thé blanc sujet à de nombreuses légendes telles que sa récolte les nuits de pleine lune ou qu’une partie de celle-ci était réservée exclusivement à l’empereur.\r\nCe thé de Chine jouit d’un grand prestige tant par les soins apportés à sa cueillette que par la finesse unique des parfums de ses bourgeons argentés.\r\nD’une grande subtilité, ce thé spectaculaire est à préparer avec la plus grande attention pour en apprécier toutes ses qualités gustatives.', '47.00', NULL, 'aiguillesdargent.jpg', 100, 1, 4, NULL, 0, 8569, NULL, '2020-01-17 11:23:00', 0),
(16, 'Smoking', 'Smoking est un thé parfumé aux notes fumées intenses. Les feuilles et bourgeons de ce thé, noirs et blancs, sont un clin d’oeil à l’élégance des Smoking.\r\n\r\nCe thé est conforme aux réglementations phytosanitaires européennes.', '8.90', NULL, 'smoking.jpg', 100, 0, 4, NULL, 0, 8741, NULL, '2020-01-17 11:25:00', 0),
(17, 'Bai Mu Dan', 'Le Bai Mu Dan, littéralement « Pivoine blanche » est un célèbre thé blanc de Chine. D’une grande finesse, il est composé de morceaux de feuilles de toutes sortes à l\'état naturel : bourgeons argentés, Souchong, premières et deuxièmes feuilles, tiges.\r\n\r\nSon goût boisé rappelle les fruits mûrs de l\'automne comme la noisette et la châtaigne.', '9.90', NULL, 'baimudan.jpg', 150, 0, 4, NULL, 0, 8925, NULL, '2020-01-17 11:27:00', 0),
(18, 'Thé des Etoiles', 'Fort de son succès, le Thé des Étoiles est de retour en édition permanente.\r\n\r\nInspiré par la magie des nuits étoilées, le Thé des Étoiles est une création originale et savoureuse. Il associe du thé vert aux notes gourmandes et chaleureuses de marron et de fève tonka.\r\n\r\nUne vraie gourmandise, agrémentée de fèves de cacao et de délicats pétales de rose, à déguster toute l\'année !', '8.70', NULL, 'thedesetoiles.jpg', 100, 0, 5, NULL, 0, 6301, NULL, '2020-01-17 11:39:00', 0),
(19, 'Perles de Jasmin', 'Les meilleurs bourgeons de thé vert ont été façonnés en petites perles et parfumés à 7 reprises avec des fleurs fraîchement cueillies, qui ont été ensuite retirées une à une à la main.\r\n\r\nLe must du thé au jasmin.', '32.00', NULL, 'perlesdejasmin.jpg', 150, 1, 5, NULL, 0, 1245, NULL, '2020-01-17 11:41:00', 0),
(20, 'Earl Grey Bio', 'Le Earl Grey bio est un mélange de deux thés noirs d’Inde et de Chine. Parfumé avec une essence naturelle de bergamote issue de l\'agriculture biologique, il ravira les amateurs de Earl Grey, et sera le compagnon idéal des petits déjeuners savoureux.\r\n\r\nCe thé est issu de l’agriculture biologique et a été certifié par Ecocert, organisme de contrôle indépendant agréé.', '8.70', NULL, 'earlgreybio.jpg', 100, 0, 5, NULL, 0, 1698, NULL, '2020-01-17 11:43:00', 0),
(22, 'PCf', 'jhfdgjfdgfkifgj', '10.00', 'CG', 'Time Spy - RPM FAN 1 (Configuration 1).PNG', 1, 1, 6, '', 0, 14525, NULL, '2020-01-27 10:07:19', 0);

-- --------------------------------------------------------

--
-- Structure de la table `product_variant`
--

DROP TABLE IF EXISTS `product_variant`;
CREATE TABLE IF NOT EXISTS `product_variant` (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_product` tinyint(3) UNSIGNED NOT NULL,
  `id_packaging` tinyint(3) UNSIGNED NOT NULL,
  `price` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  KEY `id_packaging` (`id_packaging`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `product_variant`
--

INSERT INTO `product_variant` (`id`, `id_product`, `id_packaging`, `price`) VALUES
(1, 1, 1, '9.00'),
(2, 1, 2, '16.00'),
(3, 1, 3, '25.00');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) NOT NULL,
  `last_name` varchar(120) NOT NULL,
  `birth_date` date NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(64) NOT NULL,
  `address_line` varchar(255) NOT NULL,
  `zip_code` varchar(5) NOT NULL,
  `city` varchar(100) NOT NULL,
  `nb_order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `creation_date` datetime NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `birth_date`, `email`, `password`, `address_line`, `zip_code`, `city`, `nb_order`, `creation_date`, `last_login`, `is_admin`) VALUES
(17, 'John', 'Doe', '2020-01-04', 'JohnDoe@inconnu.fr', '$2y$10$XqVduAX2LeKbIVXBUKd2e.Nnm9PgAN4BAdCEAv8BcwogEhGY2.p4a', '2 rue JhonDoe', '14951', 'Nantes', 0, '2020-01-23 10:00:37', NULL, 1),
(18, 'John1', 'Doe', '2020-01-04', 'JohnDoe1@inconnu.fr', '$2y$10$C1n2d8RnoAEHNRe5nJDSE.KlokBoSeOG4KeiyduFQLzQ4X2Gm0aF2', '2 rue JhonDoe1', '14952', 'Nantes', 0, '2020-01-24 12:27:57', NULL, 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_details_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_packaging_packaging_id` FOREIGN KEY (`packaging_id`) REFERENCES `packaging` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product_variant`
--
ALTER TABLE `product_variant`
  ADD CONSTRAINT `product_variant_ibfk_1` FOREIGN KEY (`id_packaging`) REFERENCES `packaging` (`id`),
  ADD CONSTRAINT `product_variant_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
