DELIMITER $$

-- Drop the promos table if it already exists
DROP TABLE IF EXISTS `promos`;

-- Create the promos table
CREATE TABLE `promos` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `name` VARCHAR(100) NOT NULL, -- Name of the promo
    `price` DECIMAL(10,2) NOT NULL CHECK (`price` >= 0.01 AND `price` <= 1000000.00), -- Price with decimal values
    `days_of_week` SET('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') DEFAULT NULL, -- Days of the week when the promo is applicable
    `image_url` TEXT, -- URL of the promo image
    `specific_date` DATETIME DEFAULT NULL, -- Specific date when the promo is applicable
    `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Date when the promo was created
    `date_updated` DATETIME DEFAULT NULL, -- Date when the promo was updated
    INDEX (`name`),
    INDEX (`days_of_week`),
    INDEX (`specific_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DELIMITER ;