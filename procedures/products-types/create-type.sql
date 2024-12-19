DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS CreateProductType$$

-- Create a new procedure to create a new product type
CREATE PROCEDURE CreateProductType(
    IN p_name VARCHAR(100),
    IN p_has_stock BOOLEAN
)
BEGIN
    INSERT INTO `product_types` (`name`, `has_stock`)
    VALUES (p_name, p_has_stock);
END$$

DELIMITER ;