DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetBusinessById$$

-- Create a new procedure to get business data by ID
CREATE PROCEDURE GetBusinessById(
    IN p_id INT
)
BEGIN
    -- Select the business data with the specified ID
    SELECT 
        b.id,
        b.name,
        b.description,
        b.email,
        b.phone,
        b.instagram_url,
        b.facebook_url,
        b.whatsapp_url,
        b.twitter_url,
        s.name AS `state`
    FROM 
        business b
    JOIN 
        states s ON b.state_id = s.id
    WHERE 
        b.id = p_id;
END$$

DELIMITER ;