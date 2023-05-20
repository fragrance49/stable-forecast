/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.1.39-MariaDB : Database - pytest
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`stablesite` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `stablesite`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add content type',4,'add_contenttype'),
(14,'Can change content type',4,'change_contenttype'),
(15,'Can delete content type',4,'delete_contenttype'),
(16,'Can view content type',4,'view_contenttype'),
(17,'Can add session',5,'add_session'),
(18,'Can change session',5,'change_session'),
(19,'Can delete session',5,'delete_session'),
(20,'Can view session',5,'view_session'),
(21,'Can add custom user',6,'add_customuser'),
(22,'Can change custom user',6,'change_customuser'),
(23,'Can delete custom user',6,'delete_customuser'),
(24,'Can view custom user',6,'view_customuser');

/*Table structure for table `auth_user_customuser` */

DROP TABLE IF EXISTS `auth_user_customuser`;

CREATE TABLE `auth_user_customuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `find_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_user_customuser` */

insert  into `auth_user_customuser`(`id`,`password`,`last_login`,`is_superuser`,`username`,`email`,`find_id`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$120000$1VhWTKYFYdlr$A2X49QFXjoczOHI0KcDy0XlGKUol3f3uMAj5YP5t0Io=','2020-07-19 15:49:01.417480',1,'admin','admin@gmail.com','KORD',0,1,'2020-07-15 07:13:02.639448'),
(2,'pbkdf2_sha256$120000$0mH76h5GeHwE$rQthBj2N/96qT2Lv0yTMH7S3h/QR5uQSx85CqkmxgJo=','2020-07-19 15:51:22.832594',0,'test1','test1@gmail.com','KORD',0,1,'2020-07-15 08:26:41.098226'),
(3,'pbkdf2_sha256$120000$BXi71wAS261I$nnDPTBWSTAQNa3Ut/9eiqi7Qf/ttZAvs2iEpYbxwftM=',NULL,0,'test2','test2@gmail.com','KORP',0,1,'2020-07-16 16:15:33.540236');

/*Table structure for table `auth_user_customuser_groups` */

DROP TABLE IF EXISTS `auth_user_customuser_groups`;

CREATE TABLE `auth_user_customuser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_customuser_groups_customuser_id_group_id_26f1d778_uniq` (`customuser_id`,`group_id`),
  KEY `auth_user_customuser_groups_group_id_a38b3e47_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_customuser_customuser_id_506725bb_fk_auth_user` FOREIGN KEY (`customuser_id`) REFERENCES `auth_user_customuser` (`id`),
  CONSTRAINT `auth_user_customuser_groups_group_id_a38b3e47_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_user_customuser_groups` */

/*Table structure for table `auth_user_customuser_user_permissions` */

DROP TABLE IF EXISTS `auth_user_customuser_user_permissions`;

CREATE TABLE `auth_user_customuser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_customuser_use_customuser_id_permission_17be9d48_uniq` (`customuser_id`,`permission_id`),
  KEY `auth_user_customuser_permission_id_c392f727_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_customuser_customuser_id_ebfc37f2_fk_auth_user` FOREIGN KEY (`customuser_id`) REFERENCES `auth_user_customuser` (`id`),
  CONSTRAINT `auth_user_customuser_permission_id_c392f727_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `auth_user_customuser_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(6,'auth_user','customuser'),
(4,'contenttypes','contenttype'),
(5,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2020-07-15 06:54:50.303987'),
(2,'contenttypes','0002_remove_content_type_name','2020-07-15 06:54:50.843957'),
(3,'auth','0001_initial','2020-07-15 06:54:53.129212'),
(4,'auth','0002_alter_permission_name_max_length','2020-07-15 06:54:53.519414'),
(5,'auth','0003_alter_user_email_max_length','2020-07-15 06:54:53.550331'),
(6,'auth','0004_alter_user_username_opts','2020-07-15 06:54:53.583276'),
(7,'auth','0005_alter_user_last_login_null','2020-07-15 06:54:53.684002'),
(8,'auth','0006_require_contenttypes_0002','2020-07-15 06:54:53.788439'),
(9,'auth','0007_alter_validators_add_error_messages','2020-07-15 06:54:53.883217'),
(10,'auth','0008_alter_user_username_max_length','2020-07-15 06:54:54.027896'),
(11,'auth','0009_alter_user_last_name_max_length','2020-07-15 06:54:54.193452'),
(12,'auth_user','0001_initial','2020-07-15 06:54:57.379021'),
(13,'admin','0001_initial','2020-07-15 06:54:58.437017'),
(14,'admin','0002_logentry_remove_auto_add','2020-07-15 06:54:58.469023'),
(15,'admin','0003_logentry_add_action_flag_choices','2020-07-15 06:54:58.501110'),
(16,'sessions','0001_initial','2020-07-15 06:54:58.963957');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('ajfhfimliworwtphhz9ao2nlghphtuw9','NWYwMmMxNDdiOWI0Y2Y1ZjQwYWUwNjAyNmE2NjI3YmU3NGY0Y2EzNzp7fQ==','2020-07-29 07:13:16.818998');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
