-- Drop the database if it already exists
DROP DATABASE IF EXISTS `bar_rest`;

-- Create the database with the specified character set and collation
CREATE DATABASE `bar_rest` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Use the newly created database
USE `bar_rest`;

-- Drop the users table if it already exists
DROP TABLE IF EXISTS `users`;

-- Create the users table
CREATE TABLE `users` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `name` VARCHAR(100) NOT NULL, -- Name of the user
    `lastname` VARCHAR(100) NOT NULL, -- Last name of the user
    `username` VARCHAR(50) NOT NULL UNIQUE, -- Username of the user, must be unique
    `password_hash` VARCHAR(255) NOT NULL, -- Hashed password of the user
    `state` BOOLEAN NOT NULL DEFAULT TRUE, -- State of the user with default value
    `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Date when the user was created
    INDEX (`username`), -- Index on the username column
    INDEX (`state`) -- Index on the state column
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Drop the products table if it already exists
DROP TABLE IF EXISTS `products`;

-- Create the products table
CREATE TABLE `products` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `name` VARCHAR(100) NOT NULL, -- Name of the product
    `type` ENUM('bebida vidrio', 'bebida enlatada', 'platillo o boca', 'snack') 
        NOT NULL DEFAULT 'bebida vidrio', -- Type of the product with default value
    `image_url` VARCHAR(500) NOT NULL, -- URL of the product image
    `stock` INT UNSIGNED,
    `price` INT UNSIGNED NOT NULL CHECK (`price` >= 1 AND `price` <= 1000000), -- Price of the product with constraints
    `state` BOOLEAN NOT NULL DEFAULT TRUE, -- State of the product with default value
    `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Date when the product was created
    INDEX (`name`), -- Index on the name column
    INDEX (`type`), -- Index on the type column
    INDEX (`state`) -- Index on the state column
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Drop the invoices table if it already exists
DROP TABLE IF EXISTS `invoices`;

-- Create the invoices table
CREATE TABLE `invoices` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Date when the invoice was created
    `name` VARCHAR(100) NOT NULL, -- Name of the invoice
    `state` ENUM('pendiente', 'cancelada', 'anulada') NOT NULL DEFAULT 'pendiente', -- State of the invoice with default value
    INDEX (`date_created`), -- Index on the date_created column
    INDEX (`state`) -- Index on the state column
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Drop the products_by_invoice table if it already exists
DROP TABLE IF EXISTS `products_by_invoice`;

-- Create the products_by_invoice table
CREATE TABLE `products_by_invoice` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `invoice_id` INT UNSIGNED NOT NULL, -- Foreign key to the invoices table
    `product_id` INT UNSIGNED NOT NULL, -- Foreign key to the products table
    `quantity` INT UNSIGNED NOT NULL, -- Quantity of the product in the invoice
    FOREIGN KEY (`invoice_id`) REFERENCES `invoices`(`id`) 
        ON DELETE CASCADE ON UPDATE CASCADE, -- Cascade delete and update for invoice_id
    FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) 
        ON DELETE CASCADE ON UPDATE CASCADE, -- Cascade delete and update for product_id
    INDEX (`invoice_id`), -- Index on the invoice_id column
    INDEX (`product_id`) -- Index on the product_id column
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;