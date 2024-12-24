DELIMITER $$

-- Drop the items_by_invoice table if it already exists
DROP TABLE IF EXISTS `items_by_invoice`;

-- Create the items_by_invoice table
CREATE TABLE `items_by_invoice` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `invoice_id` INT UNSIGNED NOT NULL, -- Foreign key to the invoices table
    `product_id` INT UNSIGNED DEFAULT NULL, -- Foreign key to the products table
    `promo_id` INT UNSIGNED DEFAULT NULL, -- Foreign key to the promos table
    `quantity` INT UNSIGNED NOT NULL, -- Quantity of the item
    `price` DECIMAL(10,2) NOT NULL, -- Price of the item
    FOREIGN KEY (`invoice_id`) REFERENCES `invoices`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`promo_id`) REFERENCES `promos`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX (`invoice_id`),
    INDEX (`product_id`),
    INDEX (`promo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DELIMITER ;


DELIMITER $$

DELIMITER ;