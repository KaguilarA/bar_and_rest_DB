DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS AddProductToPromo$$

-- Create a new procedure to get all landing promos along with their associated products
CREATE PROCEDURE AddProductToPromo(
    IN p_promo_id INT,
    IN p_product_id INT,
    IN p_products_quantity INT
)
BEGIN
    -- Insert the product associated with the promo into the items_by_promos table
    INSERT INTO `items_by_promos` (`promo_id`, `product_id`, `quantity`)
    VALUES (p_promo_id, p_product_id, p_products_quantity);
END$$

DELIMITER ;