DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdateProductTypeById$$

-- Create a new procedure to update a product type by ID
CREATE PROCEDURE UpdateProductTypeById(
    IN p_id INT,
    IN p_name VARCHAR(100)
)
BEGIN
    -- Update the product type with the specified ID
    UPDATE `product_types`
    SET `name` = p_name
    WHERE `id` = p_id;
END$$

DELIMITER ;