DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdateProductTypeById$$

-- Create a new procedure to update a product type by ID
CREATE PROCEDURE UpdateProductTypeById(
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_has_stock BOOLEAN
)
BEGIN
    -- Update the product type with the specified ID
    UPDATE `product_types`
    SET `name` = p_name, `has_stock` = p_has_stock
    WHERE `id` = p_id;
END$$

DELIMITER ;