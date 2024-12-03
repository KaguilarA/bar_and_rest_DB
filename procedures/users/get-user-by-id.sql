DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetUserById$$

-- Create a new procedure to get a user by ID
CREATE PROCEDURE GetUserById(IN p_id INT)
BEGIN
    -- Select the user with the specified ID
    SELECT 
        `id`, 
        `name`, 
        `lastname`, 
        `username`, 
        `state`, 
        `date_created`
    FROM 
        `users`
    WHERE 
        `id` = p_id;
END$$

DELIMITER ;