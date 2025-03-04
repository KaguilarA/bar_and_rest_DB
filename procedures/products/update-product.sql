DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdateProduct$$

-- Create a new procedure to update a product's information
CREATE PROCEDURE UpdateProduct(
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_description VARCHAR(255),
    IN p_stock INT,
    IN p_price DECIMAL(10,2),
    IN p_state_id INT,
    IN p_type_id INT
)
BEGIN
    -- Update the product's information in the products table
    UPDATE `products`
    SET 
        `name` = p_name, 
        `description` = p_description, 
        `stock` = p_stock, 
        `price` = p_price, 
        `state_id` = p_state_id, 
        `type_id` = p_type_id,
        `date_updated` = CURRENT_TIMESTAMP -- Update the date_updated field
    WHERE 
        `id` = p_id;
END$$

DELIMITER ;