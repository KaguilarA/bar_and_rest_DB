-- Drop the invoices table if it already exists
DROP TABLE IF EXISTS `products_by_promos`;

-- Create the products_by_promos table
CREATE TABLE `products_by_promos` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Primary key with auto-increment
    `product_id` INT UNSIGNED NOT NULL, -- Foreign key to the products table
    `promo_id` INT UNSIGNED NOT NULL, -- Foreign key to the promos table
    FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`promo_id`) REFERENCES `promos`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX (`product_id`), -- Index on the product_id column
    INDEX (`promo_id`) -- Index on the promo_id column
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;