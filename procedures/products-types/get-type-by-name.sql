DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetProductTypeByName$$

-- Create a new procedure to get a product type by Name
CREATE PROCEDURE GetProductTypeByName(IN p_name VARCHAR(100))
BEGIN
    -- Select the product type with the specified ID
    SELECT * FROM `product_types` WHERE `name` = p_name;
END$$

DELIMITER ;