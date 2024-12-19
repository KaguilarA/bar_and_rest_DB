DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdatePromoProductsQuantity$$

-- Create a new procedure to update the products_quantity in the promos table
CREATE PROCEDURE UpdatePromoProductsQuantity(
    IN p_promo_id INT,
    IN p_products_quantity INT
)
BEGIN
    -- Update the products_quantity in the promos table
    UPDATE `promos`
    SET `products_quantity` = p_products_quantity,
        `date_updated` = CURRENT_TIMESTAMP
    WHERE `id` = p_promo_id;
END$$

DELIMITER ;