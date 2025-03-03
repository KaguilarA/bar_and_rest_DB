-- Use the newly created database
USE `bar_rest`;

-- Drop the states table if it already exists
DROP TABLE IF EXISTS `states`;

-- Create a table for states (shared by users, products, invoices, etc.)
CREATE TABLE `states` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `name` VARCHAR(50) NOT NULL UNIQUE -- Name of the state, must be unique
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;