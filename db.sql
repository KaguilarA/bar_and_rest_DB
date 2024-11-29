CREATE DATABASE `bar_rest` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `bar_rest`;

CREATE TABLE `users` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `username` VARCHAR(50) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `state` TINYINT UNSIGNED NOT NULL,
    INDEX (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `products` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `type` ENUM('bebida botella de vidrio', 'bebida enlatada', 'platillo o boca', 'snack') 
        DEFAULT 'bebida botella de vidrio',
    `image_url` VARCHAR(500),
    `stock` INT UNSIGNED NOT NULL,
    `price` DECIMAL(10, 2) UNSIGNED NOT NULL,
    `state` BOOLEAN NOT NULL DEFAULT TRUE,
    `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX (`name`),
    INDEX (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `invoices` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `name` VARCHAR(100) NOT NULL,
    INDEX (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
