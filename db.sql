-- Drop the database if it already exists
DROP DATABASE IF EXISTS `bar_rest`;

-- Create the database with the specified character set and collation
CREATE DATABASE `bar_rest` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Use the newly created database
USE `bar_rest`;

--! Drop the states table if it already exists
DROP TABLE IF EXISTS `states`;

-- Create a table for states (shared by users, products, invoices, etc.)
CREATE TABLE `states` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `name` VARCHAR(50) NOT NULL UNIQUE -- Name of the state, must be unique
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--! Drop the business table if it already exists
DROP TABLE IF EXISTS `business`;

-- Create a table for the business information
CREATE TABLE `business` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `name` VARCHAR(100) NOT NULL UNIQUE, -- Name of the business, must be unique
    `description` VARCHAR(255) DEFAULT NULL, -- Description of the business
    `email` VARCHAR(100) NOT NULL UNIQUE, -- Email of the business, must be unique
    `phone` VARCHAR(20) NOT NULL, -- Phone number of the business
    `images_base_url` VARCHAR(255) DEFAULT NULL, -- URL of the Instagram page
    `instagram_url` TEXT DEFAULT NULL, -- URL of the Instagram page
    `facebook_url` TEXT DEFAULT NULL, -- URL of the Facebook page
    `whatsapp_url` TEXT DEFAULT NULL, -- URL of the Whatsapp page
    `twitter_url` TEXT DEFAULT NULL, -- URL of the Twitter page
    `state_id` INT UNSIGNED NOT NULL, -- Foreign key to the states table
    FOREIGN KEY (`state_id`) REFERENCES `states`(`id`),
    INDEX (`name`), -- Index on the name column
    INDEX (`state_id`) -- Index on the state_id column
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--! Drop the product_types table if it already exists
DROP TABLE IF EXISTS `product_types`;

-- Create a table for product types
CREATE TABLE `product_types` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `name` VARCHAR(100) NOT NULL UNIQUE, -- Name of the product type, must be unique
    `has_stock` BOOLEAN DEFAULT TRUE -- Indicates if the product type has stock
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--! Drop the states table if it already exists
DROP TABLE IF EXISTS `permissions`;

-- Create a table for user permissions
CREATE TABLE `permissions` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `name` VARCHAR(50) NOT NULL UNIQUE, -- Name of the roles, must be unique
    `description` VARCHAR(255) DEFAULT NULL -- Description of the product
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--! Drop the users table if it already exists
DROP TABLE IF EXISTS `users`;

-- Create the users table
CREATE TABLE `users` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `name` VARCHAR(100) NOT NULL, -- Full name of the user
    `lastname` VARCHAR(100) DEFAULT NULL, -- Last name of the user
    `username` VARCHAR(50) NOT NULL UNIQUE, -- Username of the user, must be unique
    `password_hash` VARCHAR(255) NOT NULL, -- Hashed password of the user
    `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Date when the user was created
    `state_id` INT UNSIGNED NOT NULL, -- Foreign key to the states table
    FOREIGN KEY (`state_id`) REFERENCES `states`(`id`),
    INDEX (`username`), -- Index on the username column
    INDEX (`state_id`) -- Index on the state_id column
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--! Drop the invoices table if it already exists 
DROP TABLE IF EXISTS `permissions_by_user`;

-- Create the permissions_by_user table
CREATE TABLE `permissions_by_user` (
    `user_id` INT UNSIGNED NOT NULL,
    `permission_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`user_id`, `permission_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`permission_id`) REFERENCES `permissions`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--! Drop the products table if it already exists
DROP TABLE IF EXISTS `products`;

-- Create the products table
CREATE TABLE `products` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `name` VARCHAR(100) NOT NULL, -- Name of the product
    `description` VARCHAR(255) DEFAULT NULL, -- Description of the product
    `stock` INT UNSIGNED NOT NULL DEFAULT 0, -- Stock of the product
    `on_landing` BOOLEAN DEFAULT FALSE, -- Value indicating if the product is on the landing page
    `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Date when the product was created
    `date_updated` DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP, -- Date when the product was updated
    `state_id` INT UNSIGNED NOT NULL, -- Foreign key to the states table
    `type_id` INT UNSIGNED NOT NULL, -- Foreign key to the product_types table
    `author_id` INT UNSIGNED NOT NULL, -- Foreign key to the users table
    FOREIGN KEY (`type_id`) REFERENCES `product_types`(`id`),
    FOREIGN KEY (`state_id`) REFERENCES `states`(`id`),
    FOREIGN KEY (`author_id`) REFERENCES `users`(`id`),
    INDEX (`name`), -- Index on the name column
    INDEX (`type_id`), -- Index on the type_id column
    INDEX (`state_id`), -- Index on the state_id column
    INDEX (`author_id`) -- Index on the author_id column
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--! Drop the promos table if it already exists
DROP TABLE IF EXISTS `promos`;

-- Create the promos table
CREATE TABLE `promos` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `name` VARCHAR(100) NOT NULL, -- Name of the promo
    `description` VARCHAR(255) DEFAULT NULL, -- Description of the promo
    `days_of_week` SET('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') DEFAULT NULL, -- Days of the week when the promo is applicable
    `products_quantity` INT DEFAULT 1, -- URL of the promo image
    `on_landing` BOOLEAN DEFAULT FALSE, -- Value indicating if the promo is on the landing page
    `specific_date` DATETIME DEFAULT NULL, -- Specific date when the promo is applicable
    `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Date when the promo was created
    `date_updated` DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP, -- Date when the promo was updated
    `state_id` INT UNSIGNED NOT NULL, -- Foreign key to the states table
    `author_id` INT UNSIGNED NOT NULL, -- Foreign key to the users table
    FOREIGN KEY (`state_id`) REFERENCES `states`(`id`),
    INDEX (`name`), -- Index on the name column
    INDEX (`days_of_week`), -- Index on the days_of_week column
    INDEX (`specific_date`), -- Index on the specific_date column
    INDEX (`state_id`) -- Index on the state_id column
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--! Drop the invoices table if it already exists
DROP TABLE IF EXISTS `products_by_promos`;

-- Create the products_by_promos table
CREATE TABLE `products_by_promos` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `product_id` INT UNSIGNED NOT NULL, -- Foreign key to the products table
    `promo_id` INT UNSIGNED NOT NULL, -- Foreign key to the promos table
    FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`promo_id`) REFERENCES `promos`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX (`product_id`), -- Index on the product_id column
    INDEX (`promo_id`) -- Index on the promo_id column
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--! Drop the prices table if it already exists
DROP TABLE IF EXISTS `prices`;

-- Create the prices table
CREATE TABLE `prices` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `product_id` INT UNSIGNED DEFAULT NULL, -- Foreign key to the products table
    `promo_id` INT UNSIGNED DEFAULT NULL, -- Foreign key to the promos table
    `amount` DECIMAL(10,2) NOT NULL CHECK (`amount` >= 0.01 AND `amount` <= 1000000.00), -- Price of the item
    `is_current` BOOLEAN DEFAULT FALSE, -- Determines if it is the current selected price
    INDEX (`amount`), -- Index on the amount column
    -- Foreign key constraints
    CONSTRAINT `fk_prices_product` FOREIGN KEY (`product_id`) REFERENCES products(`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_prices_promo` FOREIGN KEY (`promo_id`) REFERENCES promos(`id`) ON DELETE CASCADE,
    -- Logical constraint to ensure only one of product_id or promo_id is set
    CONSTRAINT chk_product_or_promo CHECK (
        (`product_id` IS NOT NULL AND `promo_id` IS NULL) OR 
        (`promo_id` IS NOT NULL AND `product_id` IS NULL)
    )
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;