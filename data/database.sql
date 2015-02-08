-- vim: set ts=2 sw=2 expandtab:
CREATE DATABASE IF NOT EXISTS `ham`;

GRANT ALL PRIVILEGES
ON `ham`.*
TO `ham`@`localhost`
IDENTIFIED BY `ham-manager`;

USE `ham`;

DROP TABLE IF EXISTS `ham`.`receipt`;
CREATE TABLE IF NOT EXISTS `ham`.`receipt` (
  `id` serial,
  `purchased_at` date NOT NULL,
  `purchased_time` time DEFAULT NULL,
  `shop_id` bigint NOT NULL,
  `total` int NOT NULL DEFAULT 0,
  `category_id` bigint DEFAULT NULL,
  `paidfrom_id` bigint NOT NULL DEFAULT 1,
  `memo` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`receipt_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `ham`.`item`;
CREATE TABLE IF NOT EXISTS `ham`.`item` (
  `id` serial NOT NULL,
  `receipt_id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` bigint NOT NULL,
  `price` int NOT NULL,
  `memo` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `ham`.`paidfrom`;
CREATE TABLE IF NOT EXISTS `ham`.`paidfrom` (
  `id` serial NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`paidfrom_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `ham`.`shop`;
CREATE TABLE IF NOT EXISTS `ham`.`shop` (
  `id` serial NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`shop_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `ham`.`category`;
CREATE TABLE IF NOT EXISTS `ham`.`category` (
  `id` serial NOT NULL,
  `name` varchar (50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `ham`.`tablename`;
CREATE TABLE IF NOT EXISTS `ham`.`tablename` (
  `id` serial NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
