DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdateUser$$

-- Create a new procedure to update a user's information
CREATE PROCEDURE UpdateUser(
    IN p_user_id INT,
    IN p_name VARCHAR(100),
    IN p_lastname VARCHAR(100),
    IN p_username VARCHAR(100)
)
BEGIN
    -- Update the user's information in the users table
    UPDATE `users`
    SET 
        `username` = p_username, 
        `name` = p_name, 
        `lastname` = p_lastname
    WHERE 
        `id` = p_user_id;
END$$

DELIMITER ;