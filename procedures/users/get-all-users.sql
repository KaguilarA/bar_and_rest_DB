DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetAllUsers$$

-- Create a new procedure to get a user by ID
CREATE PROCEDURE GetAllUsers()
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
        `users`;
END$$

DELIMITER ;