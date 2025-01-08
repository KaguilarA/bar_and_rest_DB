DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS RemoveProductToPromo$$

-- Create a new procedure to remove a product from a promo
CREATE PROCEDURE RemoveProductToPromo(
    IN p_promo_id INT,
    IN p_product_id INT
)
BEGIN
    -- Delete the product associated with the promo from the items_by_promos table
    DELETE FROM `items_by_promos`
    WHERE `promo_id` = p_promo_id
    AND `product_id` = p_product_id;
END$$

DELIMITER ;