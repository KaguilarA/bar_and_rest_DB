-- Use the newly created database
USE `bar_rest`;

-- Drop the promos_images table if it already exists
DROP TABLE IF EXISTS `promos_images`;

-- Create a table for product images
CREATE TABLE `promos_images` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `promo_id` INT UNSIGNED NOT NULL, -- Foreign key to the promos table
    `image_id` VARCHAR(255) NOT NULL, -- Image ID of the product
    `is_main` BOOLEAN DEFAULT FALSE, -- Indicates if the image is the main image
    FOREIGN KEY (`promo_id`) REFERENCES `promos`(`id`) ON DELETE CASCADE, -- Foreign key constraint
    INDEX (`promo_id`) -- Index on the promo_id column
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;