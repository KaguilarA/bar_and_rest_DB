DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdateProductState$$

-- Create a new procedure to update a product's state
CREATE PROCEDURE UpdateProductState(
    IN p_id INT,
    IN p_state BOOLEAN
)
BEGIN
    -- Update the product's state in the products table
    UPDATE `products`
    SET `state` = p_state
    WHERE `id` = p_id;
END$$

DELIMITER ;