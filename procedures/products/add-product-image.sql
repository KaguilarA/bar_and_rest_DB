DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS AddProductImage$$

-- Create a new procedure to add an image to a product
CREATE PROCEDURE AddProductImage(
    IN p_product_id INT,
    IN p_image_url VARCHAR(255)
)
BEGIN
    -- Insert the image into the images table
    INSERT INTO images (product_id, image_url, is_main)
    VALUES (p_product_id, p_image_url, p_is_main);
END$$