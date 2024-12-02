DROP DATABASE IF EXISTS `bar_rest`;

CREATE DATABASE `bar_rest` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `bar_rest`;

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `lastname` VARCHAR(100) NOT NULL,
    `username` VARCHAR(50) NOT NULL UNIQUE,
    `password_hash` VARCHAR(255) NOT NULL,
    `state` BOOLEAN NOT NULL DEFAULT TRUE,
    `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX (`username`),
    INDEX (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `type` ENUM('bebida vidrio', 'bebida enlatada', 'platillo o boca', 'snack') 
        NOT NULL DEFAULT 'bebida vidrio',
    `image_url` VARCHAR(500) NOT NULL,
    `stock` INT UNSIGNED NOT NULL,
    `price` INT UNSIGNED NOT NULL,
    `state` BOOLEAN NOT NULL DEFAULT TRUE,
    `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX (`name`),
    INDEX (`type`),
    INDEX (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `invoices`;

CREATE TABLE `invoices` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `date` DATETIME NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `state` ENUM('pendiente', 'cancelada', 'anulada') NOT NULL DEFAULT 'pendiente',
    INDEX (`date`),
    INDEX (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `products_by_invoice`;

CREATE TABLE `products_by_invoice` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `invoice_id` INT UNSIGNED NOT NULL,
    `product_id` INT UNSIGNED NOT NULL,
    `quantity` INT UNSIGNED NOT NULL,
    FOREIGN KEY (`invoice_id`) REFERENCES `invoices`(`id`) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX (`invoice_id`),
    INDEX (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
