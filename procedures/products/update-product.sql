DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdateProduct$$

-- Create a new procedure to update a product's information
CREATE PROCEDURE UpdateProduct(
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_description VARCHAR(255),
    IN p_image_url VARCHAR(500),
    IN p_stock INT,
    IN p_price INT,
    IN p_state_id INT,
    IN p_type_id INT,
)
BEGIN
    -- Update the product's information in the products table
    UPDATE `products`
    SET 
        `name` = p_name, 
        `description` = p_description, 
        `image_url` = p_image_url, 
        `stock` = p_stock, 
        `price` = p_price, 
        `state_id` = p_state_id, 
        `type_id` = p_type_id
    WHERE 
        `id` = p_id;
END$$

DELIMITER ;