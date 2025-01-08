DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetProductByPromo$$

-- Create a new procedure to get all products associated with a promo
CREATE PROCEDURE GetProductByPromo(
    IN p_promo_id INT
)
BEGIN
    -- Get all products associated with the promo
    SELECT p.id, p.name, p.price, ibp.quantity
    FROM `items_by_promos` AS ibp
    JOIN `products` AS p
    ON ibp.product_id = p.id
    WHERE ibp.promo_id = p_promo_id;
END$$

DELIMITER ;