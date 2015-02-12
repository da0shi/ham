-- vim: set ts=2 sw=2 expandtab:

CREATE DATABASE IF NOT EXISTS `ham` DEFAULT CHARACTER SET utf8;
/*
GRANT ALL PRIVILEGES
ON `ham`.*
TO `ham`@`localhost`
IDENTIFIED BY 'spamspamsham';
*/

USE `ham`;

DROP TABLE IF EXISTS `ham`.`item`;
DROP TABLE IF EXISTS `ham`.`receipt`;
DROP TABLE IF EXISTS `ham`.`category`;
DROP TABLE IF EXISTS `ham`.`shop`;
DROP TABLE IF EXISTS `ham`.`paidfrom`;

CREATE TABLE IF NOT EXISTS `ham`.`paidfrom` (
  `paidfrom_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`paidfrom_id`),
  UNIQUE (`name`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `ham`.`shop` (
  `shop_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`shop_id`),
  UNIQUE (`name`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `ham`.`category` (
  `category_id` bigint unsigned NOT NULL,
  `name` varchar (50) NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE (`category_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `ham`.`receipt` (
  `receipt_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchased_date` date NOT NULL,
  `purchased_time` time DEFAULT NULL,
  `shop_id` bigint unsigned NOT NULL,
  `total` int NOT NULL DEFAULT 0,
  `category_id` bigint unsigned DEFAULT NULL,
  `paidfrom_id` bigint unsigned NOT NULL DEFAULT 1,
  `notes` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`receipt_id`),
  FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`),
  FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  FOREIGN KEY (`paidfrom_id`) REFERENCES `paidfrom` (`paidfrom_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `ham`.`item` (
  `item_id` serial NOT NULL,
  `receipt_id` bigint unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `price` int NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`item_id`),
  FOREIGN KEY (`receipt_id`) REFERENCES `receipt` (`receipt_id`),
  FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
