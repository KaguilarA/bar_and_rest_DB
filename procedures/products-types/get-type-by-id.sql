DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetProductTypeById$$

-- Create a new procedure to get a product type by ID
CREATE PROCEDURE GetProductTypeById(IN p_id INT)
BEGIN
    -- Select the product type with the specified ID
    SELECT * FROM `product_types` WHERE `id` = p_id;
END$$

DELIMITER ;