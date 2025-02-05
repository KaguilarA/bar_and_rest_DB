-- Drop the users table if it already exists
DROP TABLE IF EXISTS `users`;

-- Create the users table
CREATE TABLE `users` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `name` VARCHAR(100) NOT NULL, -- Full name of the user
    `lastname` VARCHAR(100) DEFAULT NULL, -- Last name of the user
    `username` VARCHAR(50) NOT NULL UNIQUE, -- Username of the user, must be unique
    `password_hash` VARCHAR(255) NOT NULL, -- Hashed password of the user
    `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Date when the user was created
    `state_id` INT UNSIGNED NOT NULL, -- Foreign key to the states table
    FOREIGN KEY (`state_id`) REFERENCES `states`(`id`),
    INDEX (`username`), -- Index on the username column
    INDEX (`state_id`) -- Index on the state_id column
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;