-- Drop the business table if it already exists
DROP TABLE IF EXISTS `business`;

-- Create a table for the business information
CREATE TABLE `business` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `name` VARCHAR(100) NOT NULL UNIQUE, -- Name of the business, must be unique
    `description` VARCHAR(255) DEFAULT NULL, -- Description of the business
    `email` VARCHAR(100) NOT NULL UNIQUE, -- Email of the business, must be unique
    `phone` VARCHAR(20) NOT NULL, -- Phone number of the business
    `instagram_url` TEXT DEFAULT NULL, -- URL of the Instagram page
    `facebook_url` TEXT DEFAULT NULL, -- URL of the Facebook page
    `whatsapp_url` TEXT DEFAULT NULL, -- URL of the Whatsapp page
    `twitter_url` TEXT DEFAULT NULL, -- URL of the Twitter page
    `state_id` INT UNSIGNED NOT NULL, -- Foreign key to the states table
    FOREIGN KEY (`state_id`) REFERENCES `states`(`id`),
    INDEX (`name`), -- Index on the name column
    INDEX (`state_id`) -- Index on the state_id column
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;