DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS CreateBusiness$$

-- Create a new procedure to create a business
CREATE PROCEDURE CreateBusiness(
    IN p_name VARCHAR(100),
    IN p_description VARCHAR(255),
    IN p_email VARCHAR(100),
    IN p_phone VARCHAR(20),
    IN p_instagram_url TEXT,
    IN p_facebook_url TEXT,
    IN p_whatsapp_url TEXT,
    IN p_twitter_url TEXT,
    IN p_state_id INT
)
BEGIN
    -- Insert the business data
    INSERT INTO business(
        `name`,
        `description`,
        `email`,
        `phone`,
        `instagram_url`,
        `facebook_url`,
        `whatsapp_url`,
        `twitter_url`,
        `state_id`
    )
    VALUES(
        p_name,
        p_description,
        p_email,
        p_phone,
        p_instagram_url,
        p_facebook_url,
        p_whatsapp_url,
        p_twitter_url,
        p_state_id
    );
END$$

DELIMITER ;