-- Use the newly created database
USE `bar_rest`;

-- Drop the invoices table if it already exists
DROP TABLE IF EXISTS `invoices`;

-- Create the invoices table
CREATE TABLE `invoices` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `name` VARCHAR(100) NOT NULL, -- Name of the invoice
    `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Date when the invoice was created
    `state_id` INT UNSIGNED NOT NULL, -- Foreign key to the states table
    `author_id` INT UNSIGNED NOT NULL, -- Foreign key to the users table
    FOREIGN KEY (`state_id`) REFERENCES `states`(`id`),
    FOREIGN KEY (`author_id`) REFERENCES `users`(`id`),
    INDEX (`name`), -- Index on the name column
    INDEX (`date_created`), -- Index on the date_created column
    INDEX (`state_id`), -- Index on the state_id column
    INDEX (`author_id`) -- Index on the author_id column
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;