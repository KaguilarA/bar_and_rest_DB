DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS AddProductToPromo$$

-- Create a new procedure to get all landing promos along with their associated products
CREATE PROCEDURE AddProductToPromo(
    IN p_promo_id INT,
    IN p_product_id INT
)
BEGIN
    -- Insert the product associated with the promo into the products_by_promos table
    INSERT INTO `products_by_promos` (`promo_id`, `product_id`)
    VALUES (p_promo_id, p_product_id);
END$$

DELIMITER ;