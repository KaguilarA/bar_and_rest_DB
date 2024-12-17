DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS CreateProductType$$

-- Create a new procedure to create a new product type
CREATE PROCEDURE CreateProductType(
    IN p_name VARCHAR(100)
)
BEGIN
    INSERT INTO `product_types` (`name`)
    VALUES (p_name);
END$$

DELIMITER ;