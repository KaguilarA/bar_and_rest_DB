DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS CreateProduct$$

-- Create a new procedure to create a new product
CREATE PROCEDURE CreateProduct(
    IN p_name VARCHAR(100),
    IN p_type ENUM('bebida vidrio', 'bebida enlatada', 'platillo o boca', 'snack'),
    IN p_image_url VARCHAR(500),
    IN p_stock INT,
    IN p_price INT
)
BEGIN
    -- Insert the new product into the products table
    INSERT INTO `products` (`name`, `type`, `image_url`, `stock`, `price`)
    VALUES (p_name, p_type, p_image_url, p_stock, p_price);
END$$

DELIMITER ;