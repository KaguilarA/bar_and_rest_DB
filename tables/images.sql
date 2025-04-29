-- Use the newly created database
USE `bar_rest`;

-- Drop the images table if it already exists
DROP TABLE IF EXISTS `images`;

-- Create the images table
CREATE TABLE `images` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `product_id` INT UNSIGNED DEFAULT NULL, -- Foreign key to the products table
    `promo_id` INT UNSIGNED DEFAULT NULL, -- Foreign key to the promos table
    `image_url` VARCHAR(255) NOT NULL, -- URL of the image
    `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Date when the image was uploaded
    `date_updated` DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP, -- Date when the image was updated
    INDEX (`image_url`), -- Index on the image_url column
    -- Foreign key constraints
    CONSTRAINT `fk_images_product` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_images_promo` FOREIGN KEY (`promo_id`) REFERENCES `promos`(`id`) ON DELETE CASCADE,
    -- Logical constraint to ensure only one of product_id or promo_id is set
    CONSTRAINT chk_product_or_promo CHECK (
        (`product_id` IS NOT NULL AND `promo_id` IS NULL) OR 
        (`promo_id` IS NOT NULL AND `product_id` IS NULL)
    )
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
