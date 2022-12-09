# ************************************************************
# Sequel Ace SQL dump
# Version 20042
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 5.7.39)
# Database: hepl_pet_care
# Generation Time: 2022-12-03 11:19:56 +0000
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
  `delete_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adoptions_animals_fk` (`animal_id`),
  KEY `adoptions_clients_fk` (`client_id`),
  CONSTRAINT `adoptions_animals_fk` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `adoptions_clients_fk` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `adoptions` WRITE;
/*!40000 ALTER TABLE `adoptions` DISABLE KEYS */;

INSERT INTO `adoptions` (`id`, `animal_id`, `client_id`, `cost_unit`, `cost_currency`, `adopted_at`, `created_at`, `updated_at`, `delete_at`)
VALUES
	(1,1,1,30000,'EUR',NULL,'2022-11-24 22:24:19','2022-11-24 22:24:19',NULL),
	(2,2,2,25000,'EUR',NULL,'2022-11-24 22:25:09','2022-11-24 22:25:09',NULL);

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
	(1,1,'images/animals/dog01.jpg','Photo d\'un chien',0,'2022-11-25 11:05:59','2022-11-25 11:05:59'),
	(2,2,'images/animals/dog02.jpg','Photo d\'un autre chien',0,'2022-11-25 11:06:16','2022-11-25 11:06:16'),
	(3,3,'images/animals/bunny01.jpg','Photo d\'un lapin',0,'2022-11-25 11:06:43','2022-11-25 11:06:43'),
	(4,4,'images/animals/cat01.jpg','Photo d\'un chat',0,'2022-11-25 11:06:59','2022-11-25 11:06:59'),
	(5,5,'images/animals/hamster01.jpg','Photo d\'un autre lapin',0,'2022-11-25 11:07:33','2022-11-25 11:07:33'),
	(7,7,'images/animals/tchoumy.jpg','photo de tchoumy',0,'2022-12-02 10:01:26','2022-12-02 10:01:26'),
	(8,8,'images/animals/nounouche.jpg','photo de nounouche',0,'2022-12-02 10:21:24','2022-12-02 10:21:24');

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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `animals_animal_pictures_fk` (`animal_picture_id`),
  KEY `animals_breeds_fk` (`breed_id`),
  CONSTRAINT `animals_animal_pictures_fk` FOREIGN KEY (`animal_picture_id`) REFERENCES `animal_pictures` (`id`) ON DELETE SET NULL,
  CONSTRAINT `animals_breeds_fk` FOREIGN KEY (`breed_id`) REFERENCES `breeds` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `animals` WRITE;
/*!40000 ALTER TABLE `animals` DISABLE KEYS */;

INSERT INTO `animals` (`id`, `animal_picture_id`, `breed_id`, `name`, `sex`, `weight`, `height`, `hair`, `sterilized`, `birthdate`, `description`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,1,2,'Emicha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-18 11:29:03','2022-11-18 11:29:03',NULL),
	(2,2,1,'Francis',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-18 11:30:14','2022-11-18 11:30:14',NULL),
	(3,3,7,'Stan',NULL,NULL,NULL,NULL,1,NULL,NULL,'2022-11-18 11:30:50','2022-11-18 11:30:50',NULL),
	(4,4,4,'blanc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-18 11:31:25','2022-11-18 11:31:25',NULL),
	(5,5,9,'Ange',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-18 11:32:14','2022-11-18 11:32:14',NULL),
	(7,7,10,'Tchoumy',NULL,NULL,NULL,NULL,1,NULL,NULL,'2022-12-02 09:58:47','2022-12-02 09:58:47',NULL),
	(8,8,11,'Nounouche',NULL,NULL,NULL,NULL,1,NULL,NULL,'2022-12-02 10:20:58','2022-12-02 10:20:58',NULL);

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
	(1,1,'Akita Inu','2022-11-18 11:12:15','2022-11-18 11:12:15'),
	(2,1,'Berger Allemand','2022-11-18 11:13:13','2022-11-18 11:13:13'),
	(3,1,'Eurasier','2022-11-18 11:14:21','2022-11-18 11:14:21'),
	(4,2,'Bombay','2022-11-18 11:15:52','2022-11-18 11:15:52'),
	(5,2,'Ocicat','2022-11-18 11:16:12','2022-11-18 11:16:12'),
	(6,3,'Lapin nain','2022-11-18 11:18:38','2022-11-18 11:18:38'),
	(7,3,'Blanc bélier','2022-11-18 11:26:09','2022-11-18 11:26:09'),
	(8,4,'Hamster chinois','2022-11-18 11:27:46','2022-11-18 11:27:46'),
	(9,4,'hamster doré','2022-11-18 11:27:55','2022-11-18 11:27:55'),
	(10,1,'Border Collie','2022-12-02 10:04:35','2022-12-02 10:04:35'),
	(11,2,'Chat de gouttiere','2022-12-02 10:28:33','2022-12-02 10:28:33');

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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_unique` (`user_id`),
  CONSTRAINT `clients_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;

INSERT INTO `clients` (`id`, `user_id`, `phone`, `street`, `house_number`, `house_complement`, `postal`, `city`, `country`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,1,NULL,'ananas','3',NULL,'4000','bikini','bottom','2022-11-24 21:57:23','2022-11-24 21:57:23',NULL),
	(2,2,NULL,'piere','2',NULL,'4000','bikini','bottom','2022-11-24 21:58:26','2022-11-24 21:58:26',NULL);

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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_unique` (`user_id`),
  CONSTRAINT `employees_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;

INSERT INTO `employees` (`id`, `user_id`, `src`, `color`, `job`, `order`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,1,'images/employees/person1.jpg','warning','Vétérinaire',1,'2022-11-18 11:39:43','2022-11-18 11:39:43',NULL),
	(2,2,'images/employees/person2.jpg','success','Receptionniste',2,'2022-11-18 11:40:27','2022-11-18 11:40:27',NULL),
	(3,5,'images/employees/person3.jpg','danger','Directeur',0,'2022-11-18 11:40:38','2022-11-18 11:40:38',NULL),
	(4,4,'images/employees/person4.jpg','info','Vigile',3,'2022-11-18 11:42:04','2022-11-18 11:42:04',NULL);

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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;

INSERT INTO `menus` (`id`, `location`, `title`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'header','home','2022-11-24 22:06:35','2022-11-24 22:06:35',NULL),
	(2,'introduction','introduction','2022-11-24 22:06:58','2022-11-24 22:06:58',NULL),
	(3,'employees','employees','2022-11-24 22:07:12','2022-11-24 22:07:12',NULL),
	(4,'animals','animals','2022-11-24 22:08:10','2022-11-24 22:08:10',NULL),
	(5,'news','news','2022-11-24 22:08:55','2022-11-24 22:08:55',NULL),
	(6,'messages','messages','2022-11-24 22:09:05','2022-11-24 22:09:05',NULL);

/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;


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
  `deleted_at` timestamp NULL DEFAULT NULL,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_unique` (`slug`),
  KEY `name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;

INSERT INTO `pages` (`id`, `name`, `title`, `slug`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'homepage','homepage','homepage','2022-11-24 22:22:08','2022-11-24 22:22:08',NULL);

/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;


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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_unique` (`slug`),
  KEY `posts_users_fk` (`user_id`),
  KEY `posts_species_fk` (`species_id`),
  CONSTRAINT `posts_species_fk` FOREIGN KEY (`species_id`) REFERENCES `species` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;

INSERT INTO `posts` (`id`, `user_id`, `species_id`, `src`, `type`, `title`, `slug`, `content`, `location`, `occurred_at`, `published_at`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,1,1,'images/posts/post1.jpeg','News','Comment gary m\'a sauvé la vie','comment-gary-a-m-a-sauve-la-vie','Je me fesais attaquais par un chien assez imposant quand gary, sorti de nulle part, l\'a mordu la queue. Il s\'en est suivi un combat féroce entre les 2 chiens. Malgrès la différence de taille, Gary su s\'imposé comme le vainqueur de ce combat. Cependant il était amoché j\'ai du l\'emenait chez le véto. les chances de survis était faible mais M. Benson (mon véto) avait déjà reussi à créer des miracles. Après 13 heures et 47 min, il sort du bloc opératoire. Il marche vers moi et me dit que \"Gary est mort\". FIN ','Namur, Belgique',NULL,'2022-12-02 13:24:13','2022-11-24 22:15:02','2022-11-24 22:15:02',NULL),
	(2,2,2,'images/posts/post2.jpeg','News','Vive les chats','vive-les-chats','J\'ai toujours adoré les chat depuis mon enfance ils sont faciles à entretenir et  donne aussi de l\'affection malgrès ce que les gens pensent. C\'est toujours mieux que les chiens qui sont bruyant, gaffeur et sales. Bref les chats sont meilleurs que les chiens #TeamChat','Anvers, Belgique',NULL,'2022-12-02 13:24:14','2022-11-24 22:18:20','2022-11-24 22:18:20',NULL),
	(4,3,1,'images/posts/post3.jpeg','Tips','vive les hamsters','vive-les-hamsters','lalala le tete haha dzjizd kjand azdinezd ide\"berfifdenjznéz ibzedf ibdez ibzed iazn','Liege, Belgique',NULL,'2022-12-02 13:24:16','2022-12-02 13:21:14','2022-12-02 13:21:14',NULL);

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
	(1,'chien','#7AF600','2022-11-18 10:59:18','2022-11-18 10:59:18'),
	(2,'chat','#25F7C2','2022-11-18 10:59:49','2022-11-18 10:59:49'),
	(3,'lapin','#2D4BE0','2022-11-18 11:06:04','2022-11-18 11:06:04'),
	(4,'hamster','#ED5924','2022-11-18 11:08:35','2022-11-18 11:08:35');

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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Bob','Eponge','BobEponge@gmail.com','2022-11-18 11:35:19','2022-11-18 11:35:19',NULL),
	(2,'Carlo','Calamar','CarloCalamar@gmail.com','2022-11-18 11:36:02','2022-11-18 11:36:02',NULL),
	(3,'Patrick','Etoile','PatrickEtoile@gmail.com','2022-11-18 11:36:33','2022-11-18 11:36:33',NULL),
	(4,'Sandy','Ecureuil','SandyEcureuil@gmail.com','2022-11-18 11:37:39','2022-11-18 11:37:39',NULL),
	(5,'Krabs','Crabe','KrabsCrabes@gmail.com','2022-11-18 11:39:01','2022-11-18 11:39:01',NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
