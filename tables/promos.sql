-- Drop the promos table if it already exists
DROP TABLE IF EXISTS `promos`;

-- Create the promos table
CREATE TABLE `promos` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `name` VARCHAR(100) NOT NULL, -- Name of the promo
    `description` VARCHAR(255) DEFAULT NULL, -- Description of the promo
    `price` DECIMAL(10,2) NOT NULL CHECK (`price` >= 0.01 AND `price` <= 1000000.00), -- Price with decimal values
    `days_of_week` SET('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') DEFAULT NULL, -- Days of the week when the promo is applicable
    `image_url` TEXT DEFAULT NULL, -- URL of the promo image
    `products_quantity` INT DEFAULT 1, -- URL of the promo image
    `on_landing` BOOLEAN DEFAULT FALSE, -- Value indicating if the product is on the landing page
    `specific_date` DATETIME DEFAULT NULL, -- Specific date when the promo is applicable
    `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Date when the promo was created
    `date_updated` DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP, -- Date when the promo was updated
    `state_id` INT UNSIGNED NOT NULL, -- Foreign key to the states table
    `author_id` INT UNSIGNED NOT NULL, -- Foreign key to the users table
    FOREIGN KEY (`state_id`) REFERENCES `states`(`id`),
    INDEX (`name`), -- Index on the name column
    INDEX (`days_of_week`), -- Index on the days_of_week column
    INDEX (`specific_date`), -- Index on the specific_date column
    INDEX (`state_id`) -- Index on the state_id column
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;