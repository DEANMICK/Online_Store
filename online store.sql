CREATE DATABASE online_store;
USE online_store;

CREATE TABLE `category` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `title` char(20) NOT NULL
);

CREATE TABLE `product` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `title` char(20) NOT NULL,
  `description` text(1000)
);

CREATE TABLE `product_category` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `category_id` int,
  `product_id` int
);

CREATE TABLE `address` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `city` char(20) NOT NULL,
  `street` char(20) NOT NULL,
  `home` tinyint NOT NULL,
  `apartment_office` char(20) NOT NULL,
  `porch` tinyint,
  `floor` tinyint
);

CREATE TABLE `customer` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` char(20) NOT NULL,
  `surname` char(20) NOT NULL,
  `email` char(20) NOT NULL,
  `phone` tinyint(20) UNIQUE NOT NULL,
  `address_id` int NOT NULL
);

CREATE TABLE `basket` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `customer_id` int NOT NULL
);

CREATE TABLE `basket_item` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `product_count` int NOT NULL,
  `basket_id` int NOT NULL
);

CREATE TABLE `orders` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `status` char(10) NOT NULL,
  `orders_method` int NOT NULL,
  `payment_method` int NOT NULL,
  `customer_id` int NOT NULL
);

CREATE TABLE `orders_method` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `method` char(10) NOT NULL
);

CREATE TABLE `payment_method` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `method` char(10) NOT NULL
);

CREATE TABLE `orders_item` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `product_count` int NOT NULL,
  `orders_id` int NOT NULL
);

ALTER TABLE `product_category` ADD FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE;

ALTER TABLE `product_category` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

ALTER TABLE `customer` ADD FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE CASCADE;

ALTER TABLE `basket` ADD FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE;

ALTER TABLE `basket_item` ADD FOREIGN KEY (`basket_id`) REFERENCES `basket` (`id`) ON DELETE CASCADE;

ALTER TABLE `orders` ADD FOREIGN KEY (`orders_method`) REFERENCES `orders_method` (`id`) ON DELETE CASCADE;

ALTER TABLE `orders` ADD FOREIGN KEY (`payment_method`) REFERENCES `payment_method` (`id`) ON DELETE CASCADE;

ALTER TABLE `orders` ADD FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE;

ALTER TABLE `orders_item` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

ALTER TABLE `orders_item` ADD FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
