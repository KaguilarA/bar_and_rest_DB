DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetProductsByType$$

-- Create a new procedure to get products by type
CREATE PROCEDURE GetProductsByType(IN p_type VARCHAR(50))
BEGIN
    -- Select products with the specified type
    SELECT 
        `id`, 
        `name`, 
        `type`, 
        `image_url`, 
        `stock`, 
        `price`, 
        `date_created`
    FROM 
        `products`
    WHERE 
        `type` = p_type;
END$$

DELIMITER ;