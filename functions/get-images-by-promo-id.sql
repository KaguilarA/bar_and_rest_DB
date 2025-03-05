DELIMITER $$

-- Drop the function if it already exists
DROP FUNCTION IF EXISTS GetImagesByPromoId$$

-- Create a new function to get images by promo ID
CREATE FUNCTION GetImagesByPromoId(p_promo_id INT)
RETURNS JSON
READS SQL DATA
BEGIN
    DECLARE images_json JSON;

    -- Select images associated with the product and aggregate them into a JSON array
    SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'id', pi.id,
            'image_id', pi.image_id,
            'is_main', pi.is_main
        )
    ) INTO images_json
    FROM promos_images pi
    WHERE pi.promo_id = p_promo_id;

    RETURN images_json;
END$$

DELIMITER ;