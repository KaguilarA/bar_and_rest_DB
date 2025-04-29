-- Use the newly created database
USE `bar_rest`;

-- Drop the products table if it already exists
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