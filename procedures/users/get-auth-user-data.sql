DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetAuthUserData$$

-- Create a new procedure to get an user by ID
CREATE PROCEDURE GetAuthUserData(IN p_id INT)
BEGIN
    -- Select the user with the specified ID and their state information
    SELECT 
        `users`.`id`, 
        `users`.`username`
    FROM 
        `users`
    WHERE 
        `users`.`id` = p_id;
END$$

DELIMITER ;