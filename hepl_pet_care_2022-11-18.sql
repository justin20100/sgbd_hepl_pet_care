# ************************************************************
# Sequel Ace SQL dump
# Version 20035
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 5.7.39)
# Database: hepl_pet_care
# Generation Time: 2022-11-18 10:53:41 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table adoptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `adoptions`;

CREATE TABLE `adoptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `animal_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `cost_unit` int(10) unsigned NOT NULL,
  `cost_currency` varchar(255) NOT NULL,
  `adopted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `adoptions_animals_fk` (`animal_id`),
  KEY `adoptions_clients_fk` (`client_id`),
  CONSTRAINT `adoptions_animals_fk` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `adoptions_clients_fk` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `adoptions` WRITE;
/*!40000 ALTER TABLE `adoptions` DISABLE KEYS */;

INSERT INTO `adoptions` (`id`, `animal_id`, `client_id`, `cost_unit`, `cost_currency`, `adopted_at`, `created_at`, `updated_at`)
VALUES
	(1,1,1,20000,'euros','2022-11-19 00:00:00','2022-11-18 11:35:49','2022-11-18 11:35:49'),
	(2,2,2,30000,'euros','2022-12-01 00:00:00','2022-11-18 11:36:55','2022-11-18 11:36:55');

/*!40000 ALTER TABLE `adoptions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table animal_pictures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `animal_pictures`;

CREATE TABLE `animal_pictures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `animal_id` int(10) unsigned NOT NULL,
  `src` varchar(255) NOT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `order` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `animal_pictures_animals_fk` (`animal_id`),
  CONSTRAINT `animal_pictures_animals_fk` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `animal_pictures` WRITE;
/*!40000 ALTER TABLE `animal_pictures` DISABLE KEYS */;

INSERT INTO `animal_pictures` (`id`, `animal_id`, `src`, `alt`, `order`, `created_at`, `updated_at`)
VALUES
	(1,1,'/images/animals/felix.jpeg','photo de Felix dans un jardin',0,'2022-11-18 11:05:41','2022-11-18 11:05:41'),
	(2,2,'/images/animals/tchoumy.jpeg','Photo de  profile de Tchoumy',0,'2022-11-18 11:22:11','2022-11-18 11:22:11');

/*!40000 ALTER TABLE `animal_pictures` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table animals
# ------------------------------------------------------------

DROP TABLE IF EXISTS `animals`;

CREATE TABLE `animals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `animal_picture_id` int(10) unsigned DEFAULT NULL,
  `breed_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `weight` float(10,2) DEFAULT NULL,
  `height` float(10,2) DEFAULT NULL,
  `hair` varchar(255) DEFAULT NULL,
  `sterilized` tinyint(1) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `animals_animal_pictures_fk` (`animal_picture_id`),
  KEY `animals_breeds_fk` (`breed_id`),
  CONSTRAINT `animals_animal_pictures_fk` FOREIGN KEY (`animal_picture_id`) REFERENCES `animal_pictures` (`id`) ON DELETE SET NULL,
  CONSTRAINT `animals_breeds_fk` FOREIGN KEY (`breed_id`) REFERENCES `breeds` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `animals` WRITE;
/*!40000 ALTER TABLE `animals` DISABLE KEYS */;

INSERT INTO `animals` (`id`, `animal_picture_id`, `breed_id`, `name`, `sex`, `weight`, `height`, `hair`, `sterilized`, `birthdate`, `description`, `created_at`, `updated_at`)
VALUES
	(1,1,3,'Felix','male',22.00,1.10,'brun',1,'2020-01-02','Jeune chien qui a perdu son mettre. Il est tres joueur et cherche une famille pour s\'occuper de lui','2022-11-18 11:00:01','2022-11-18 11:00:01'),
	(2,1,2,'Tchoumy','male',19.00,1.00,'noir et blanc',1,'2020-04-17','Tchoumy est un chien hyperactif toujours pret a jouer. Il obéit tres bien','2022-11-18 11:13:10','2022-11-18 11:13:10');

/*!40000 ALTER TABLE `animals` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table breeds
# ------------------------------------------------------------

DROP TABLE IF EXISTS `breeds`;

CREATE TABLE `breeds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `species_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `breeds_species_fk` (`species_id`),
  CONSTRAINT `breeds_species_fk` FOREIGN KEY (`species_id`) REFERENCES `species` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `breeds` WRITE;
/*!40000 ALTER TABLE `breeds` DISABLE KEYS */;

INSERT INTO `breeds` (`id`, `species_id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,1,'Border collie','2022-11-18 11:09:39','2022-11-18 11:09:39'),
	(2,1,'golden retriever','2022-11-18 11:10:14','2022-11-18 11:10:14'),
	(3,1,'shiba inu','2022-11-18 11:11:20','2022-11-18 11:11:20'),
	(4,1,'berger australien','2022-11-18 11:11:59','2022-11-18 11:11:59');

/*!40000 ALTER TABLE `breeds` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `clients`;

CREATE TABLE `clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `street` varchar(255) NOT NULL,
  `house_number` varchar(255) NOT NULL,
  `house_complement` varchar(255) DEFAULT NULL,
  `postal` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_unique` (`user_id`),
  CONSTRAINT `clients_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;

INSERT INTO `clients` (`id`, `user_id`, `phone`, `street`, `house_number`, `house_complement`, `postal`, `city`, `country`, `created_at`, `updated_at`)
VALUES
	(1,1,'0456745678','rue des fleures','9',NULL,'4827','esneux','belgique','2022-11-18 11:33:20','2022-11-18 11:33:20'),
	(2,2,'0478752409','rue des animaux','29',NULL,'2738','sprimont','belgique','2022-11-18 11:34:31','2022-11-18 11:34:31');

/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table employees
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `src` varchar(255) DEFAULT NULL,
  `color` varchar(255) NOT NULL,
  `job` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_unique` (`user_id`),
  CONSTRAINT `employees_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;

INSERT INTO `employees` (`id`, `user_id`, `src`, `color`, `job`, `order`, `created_at`, `updated_at`)
VALUES
	(1,6,'/images/employees/victor.jpeg','#2F88DE','homme d\'entretien',2,'2022-11-18 11:27:38','2022-11-18 11:27:38'),
	(2,5,'/images/employees/charlotte.jpeg','#FF41FF','secretaire',1,'2022-11-18 11:29:56','2022-11-18 11:29:56'),
	(4,4,'/images/employees/lucia.jpeg','#FF6636','soigneuse',0,'2022-11-18 11:31:59','2022-11-18 11:31:59');

/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `links`;

CREATE TABLE `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `page_section_id` int(10) unsigned DEFAULT NULL,
  `order` int(10) unsigned NOT NULL,
  `label` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `target_page_id` int(10) unsigned DEFAULT NULL,
  `target_page_section_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `links_menus_fk` (`menu_id`),
  KEY `links_page_sections_fk` (`page_section_id`),
  KEY `links_pages_target_fk` (`target_page_id`),
  KEY `links_page_sections_target_fk` (`target_page_section_id`),
  CONSTRAINT `links_menus_fk` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `links_page_sections_fk` FOREIGN KEY (`page_section_id`) REFERENCES `page_sections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `links_page_sections_target_fk` FOREIGN KEY (`target_page_section_id`) REFERENCES `page_sections` (`id`) ON DELETE SET NULL,
  CONSTRAINT `links_pages_target_fk` FOREIGN KEY (`target_page_id`) REFERENCES `pages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table message_message_subject
# ------------------------------------------------------------

DROP TABLE IF EXISTS `message_message_subject`;

CREATE TABLE `message_message_subject` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL,
  `message_subject_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message_message_subject_messages_fk` (`message_id`),
  KEY `message_message_subject_message_subject_fk` (`message_subject_id`),
  CONSTRAINT `message_message_subject_message_subject_fk` FOREIGN KEY (`message_subject_id`) REFERENCES `message_subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `message_message_subject_messages_fk` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table message_subjects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `message_subjects`;

CREATE TABLE `message_subjects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table page_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `page_sections`;

CREATE TABLE `page_sections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` json NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_unique` (`page_id`,`slug`),
  CONSTRAINT `page_sections_pages_fk` FOREIGN KEY (`id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_unique` (`slug`),
  KEY `name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `species_id` int(10) unsigned DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `occurred_at` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_unique` (`slug`),
  KEY `posts_users_fk` (`user_id`),
  KEY `posts_species_fk` (`species_id`),
  CONSTRAINT `posts_species_fk` FOREIGN KEY (`species_id`) REFERENCES `species` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;

INSERT INTO `posts` (`id`, `user_id`, `species_id`, `src`, `type`, `title`, `slug`, `content`, `location`, `occurred_at`, `published_at`, `created_at`, `updated_at`)
VALUES
	(1,1,1,'/images/posts/post1.jpeg','feedback','adoption de felix','adoption-de-felix','nous avons adopté felix et il va tres bien','esneux',NULL,'2018-11-18 00:00:00','2022-11-18 11:38:49','2022-11-18 11:38:49'),
	(3,2,1,'/images/posts/post2.jpeg','information','Beaucoup de chien abandonné','beaucoup-de-chien-abandonné','Il y a beaucoup de chien que sont bandonne a cette periode et les centres qui sont aptes a les accueillir se remplissent tres vite aussi.','Aywaille',NULL,'2022-11-17 00:00:00','2022-11-18 11:46:56','2022-11-18 11:46:56');

/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table species
# ------------------------------------------------------------

DROP TABLE IF EXISTS `species`;

CREATE TABLE `species` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `species` WRITE;
/*!40000 ALTER TABLE `species` DISABLE KEYS */;

INSERT INTO `species` (`id`, `name`, `color`, `created_at`, `updated_at`)
VALUES
	(1,'chien','#39DE2F','2022-11-18 11:09:18','2022-11-18 11:09:18'),
	(2,'chat','#35FAD3','2022-11-18 11:23:04','2022-11-18 11:23:04'),
	(3,'lapin','#DECE2F','2022-11-18 11:23:27','2022-11-18 11:23:27');

/*!40000 ALTER TABLE `species` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `created_at`, `updated_at`)
VALUES
	(1,'jeremy','Dubis','jeremydubois@gmail.com','2022-11-18 11:24:30','2022-11-18 11:24:30'),
	(2,'Lucas','louons ','lucaslouons@gmail.com','2022-11-18 11:25:16','2022-11-18 11:25:16'),
	(3,'carla','thonon','carlathonon@gmail.com','2022-11-18 11:26:00','2022-11-18 11:26:00'),
	(4,'lucia','marlier','luciamarlier@gmail.com','2022-11-18 11:26:26','2022-11-18 11:26:26'),
	(5,'Charlotte','dupont','charlottedupont@gmail.com','2022-11-18 11:26:53','2022-11-18 11:26:53'),
	(6,'victor','open','victoropen@gmail.com','2022-11-18 11:27:19','2022-11-18 11:27:19');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
