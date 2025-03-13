DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS AddPromoImage$$

-- Create a new procedure to add an image to a promo
CREATE PROCEDURE AddPromoImage(
    IN p_promo_id INT,
    IN p_image_id VARCHAR(255),
    IN p_is_main BOOLEAN
)
BEGIN
    -- Insert the image into the promos_images table
    INSERT INTO promos_images (promo_id, image_id, is_main)
    VALUES (p_promo_id, p_image_id, p_is_main);
END$$