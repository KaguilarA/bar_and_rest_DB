DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS AddProductImage$$

-- Create a new procedure to add an image to a product
CREATE PROCEDURE AddProductImage(
    IN p_product_id INT,
    IN p_image_id VARCHAR(255),
    IN p_is_main BOOLEAN
)
BEGIN
    -- Insert the image into the product_images table
    INSERT INTO product_images (product_id, image_id, is_main)
    VALUES (p_product_id, p_image_id, p_is_main);
END$$