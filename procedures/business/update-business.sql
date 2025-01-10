DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdateBusiness$$

-- Create a new procedure to update business data by ID
CREATE PROCEDURE UpdateBusiness(
    IN p_id INT,
    IN p_name VARCHAR(255),
    IN p_description TEXT,
    IN p_email VARCHAR(255),
    IN p_phone VARCHAR(20),
    IN p_instagram_url TEXT,
    IN p_facebook_url TEXT,
    IN p_whatsapp_url TEXT,
    IN p_twitter_url TEXT,
    IN p_state_id INT
)
BEGIN
    -- Update the business data with the specified ID
    UPDATE business
    SET 
        `name` = p_name,
        `description` = p_description,
        `email` = p_email,
        `phone` = p_phone,
        `instagram_url` = p_instagram_url,
        `facebook_url` = p_facebook_url,
        `whatsapp_url` = p_whatsapp_url,
        `twitter_url` = p_twitter_url,
        `state_id` = p_state_id
    WHERE 
        id = p_id;
END$$

DELIMITER ;