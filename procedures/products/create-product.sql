DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS CreateProduct$$

-- Create a new procedure to create a new product
CREATE PROCEDURE CreateProduct(
    IN p_name VARCHAR(100),
    IN p_description VARCHAR(255),
    IN p_image_url VARCHAR(500),
    IN p_stock INT,
    IN p_price DECIMAL(10, 2),
    IN p_state_id INT,
    IN p_type_id INT,
    IN p_author_id INT
)
BEGIN
    -- Insert the new product into the products table
    INSERT INTO `products` (`name`, `description`, `image_url`, `stock`, `price`, `state_id`, `type_id`, `author_id`)
    VALUES (p_name, p_description, p_image_url, p_stock, p_price, p_state_id, p_type_id, p_author_id);
END$$

DELIMITER ;