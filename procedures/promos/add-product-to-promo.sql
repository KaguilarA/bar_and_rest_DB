DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS AddProductToPromo$$

-- Create a new procedure to add a product to a promo
CREATE PROCEDURE AddProductToPromo(
    IN p_promo_id INT,
    IN p_product_id INT
)
BEGIN
    -- Insert the product associated with the promo into the products_by_promos table
    INSERT INTO `products_by_promos` (`promo_id`, `product_id`)
    VALUES (p_promo_id, p_product_id);

    -- Update the date_updated field of the promo
    UPDATE `promos`
    SET `date_updated` = CURRENT_TIMESTAMP
    WHERE `id` = p_promo_id;
END$$

DELIMITER ;