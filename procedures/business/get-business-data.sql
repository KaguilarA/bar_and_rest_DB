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
        `id`,
        `name`,
        `description`,
        `email`,
        `phone`,
        `instagram_url`,
        `facebook_url`,
        `whatsapp_url`,
        `twitter_url`,
        `state_id`,
        `date_created`,
        `date_updated`
    FROM 
        business
    WHERE 
        id = p_id;
END$$

DELIMITER ;