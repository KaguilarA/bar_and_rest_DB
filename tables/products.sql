DELIMITER $$

-- Drop the products table if it already exists
DROP TABLE IF EXISTS `products`;

-- Create the products table
CREATE TABLE `products` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `name` VARCHAR(100) NOT NULL, -- Name of the product
    `description` VARCHAR(255) DEFAULT NULL, -- Description of the product
    `type_id` INT UNSIGNED NOT NULL, -- Foreign key to the product_types table
    `image_url` TEXT NOT NULL, -- URL of the product image
    `stock` INT UNSIGNED NOT NULL DEFAULT 0, -- Stock of the product
    `price` DECIMAL(10,2) NOT NULL CHECK (`price` >= 0.01 AND `price` <= 1000000.00), -- Price with decimal values
    `state_id` INT UNSIGNED NOT NULL, -- Foreign key to the states table
    `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Date when the product was created
    `date_updated` DATETIME DEFAULT NULL, -- Date when the product was updated
    `created_by` INT UNSIGNED DEFAULT NULL, -- User who created this record
    `updated_by` INT UNSIGNED DEFAULT NULL, -- User who updated this record
    FOREIGN KEY (`type_id`) REFERENCES `product_types`(`id`),
    FOREIGN KEY (`state_id`) REFERENCES `states`(`id`),
    FOREIGN KEY (`created_by`) REFERENCES `users`(`id`),
    FOREIGN KEY (`updated_by`) REFERENCES `users`(`id`),
    INDEX (`name`),
    INDEX (`type_id`),
    INDEX (`state_id`),
    INDEX (`price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DELIMITER ;