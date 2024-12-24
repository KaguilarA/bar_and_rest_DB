DELIMITER $$

-- Drop the states table if it already exists
DROP TABLE IF EXISTS `permissions`;

-- Create a table for user permissions
CREATE TABLE `permissions` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `name` VARCHAR(50) NOT NULL UNIQUE, -- Name of the roles, must be unique
    `description` VARCHAR(255) DEFAULT NULL -- Description of the product
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DELIMITER ;