DELIMITER $$

-- Drop the invoices table if it already exists
DROP TABLE IF EXISTS `invoices`;

-- Create the invoices table
CREATE TABLE `invoices` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `name` VARCHAR(100) NOT NULL, -- Name of the invoice
    `state_id` INT UNSIGNED NOT NULL, -- Foreign key to the states table
    `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Date when the invoice was created
    `created_by` INT UNSIGNED DEFAULT NULL, -- User who created this record
    `updated_by` INT UNSIGNED DEFAULT NULL, -- User who updated this record
    FOREIGN KEY (`state_id`) REFERENCES `states`(`id`),
    FOREIGN KEY (`created_by`) REFERENCES `users`(`id`),
    FOREIGN KEY (`updated_by`) REFERENCES `users`(`id`),
    INDEX (`date_created`),
    INDEX (`name`),
    INDEX (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DELIMITER ;