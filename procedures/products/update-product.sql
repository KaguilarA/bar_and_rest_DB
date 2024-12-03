DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdateProduct$$

-- Create a new procedure to update a product's information
CREATE PROCEDURE UpdateProduct(
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_type ENUM('bebida vidrio', 'bebida enlatada', 'platillo o boca', 'snack'),
    IN p_image_url VARCHAR(500),
    IN p_stock INT,
    IN p_price INT
)
BEGIN
    -- Update the product's information in the products table
    UPDATE `products`
    SET 
        `name` = p_name, 
        `type` = p_type, 
        `image_url` = p_image_url, 
        `stock` = p_stock, 
        `price` = p_price
    WHERE 
        `id` = p_id;
END$$

DELIMITER ;