DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetAllProductTypes$$

-- Create a new procedure to get all product types
CREATE PROCEDURE GetAllProductTypes()
BEGIN
    -- Select all product types
    SELECT * FROM `product_types` ORDER BY `id` ASC;
END$$

DELIMITER ;