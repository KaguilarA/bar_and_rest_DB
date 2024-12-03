DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetProductById$$

-- Create a new procedure to get a product by ID
CREATE PROCEDURE GetProductById(IN p_id INT)
BEGIN
    -- Select the product with the specified ID
    SELECT * FROM `products`
    WHERE 
        `id` = p_id;
END$$

DELIMITER ;