DELIMITER $$

-- Drop the states table if it already exists
DROP TABLE IF EXISTS `states`;

-- Create a table for states (shared by users, products, invoices, etc.)
CREATE TABLE `states` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DELIMITER ;