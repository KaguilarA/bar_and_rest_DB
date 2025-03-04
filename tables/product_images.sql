-- Use the newly created database
USE `bar_rest`;

-- Drop the product_images table if it already exists
DROP TABLE IF EXISTS `product_images`;

-- Create a table for product images
CREATE TABLE `product_images` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `product_id` INT UNSIGNED NOT NULL, -- Foreign key to the products table
    `image_id` VARCHAR(255) NOT NULL, -- Image ID of the product
    `is_main` BOOLEAN DEFAULT FALSE, -- Indicates if the image is the main image
    FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE, -- Foreign key constraint
    INDEX (`product_id`) -- Index on the product_id column
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;