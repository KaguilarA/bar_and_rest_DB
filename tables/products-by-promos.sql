DELIMITER $$

-- Drop the products_by_promos table if it already exists
DROP TABLE IF EXISTS `products_by_promos`;

-- Create the products_by_promos table
CREATE TABLE `products_by_promos` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `promo_id` INT UNSIGNED NOT NULL, -- Foreign key to the promos table
    `product_id` INT UNSIGNED NOT NULL, -- Foreign key to the products table
    FOREIGN KEY (`promo_id`) REFERENCES `promos`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX (`promo_id`),
    INDEX (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DELIMITER ;