DELIMITER $$

-- Drop the invoices table if it already exists 
DROP TABLE IF EXISTS `permissions_by_user`;

-- Create the permissions_by_user table
CREATE TABLE `permissions_by_user` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `user_id` INT UNSIGNED NOT NULL, -- Foreign key to the users table
    `permission_id` INT UNSIGNED NOT NULL, -- Foreign key to the permissions table
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`permission_id`) REFERENCES `permissions`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX (`user_id`), -- Index on the user_id column
    INDEX (`permission_id`) -- Index on the permission_id column
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DELIMITER ;