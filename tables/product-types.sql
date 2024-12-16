DELIMITER $$

-- Drop the product_types table if it already exists
DROP TABLE IF EXISTS `product_types`;

-- Create a table for product types
CREATE TABLE `product_types` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DELIMITER ;