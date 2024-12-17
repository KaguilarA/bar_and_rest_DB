DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS CreateUser$$

-- Create a new procedure to create a new user
CREATE PROCEDURE CreateUser(
    IN p_name VARCHAR(100),
    IN p_lastname VARCHAR(100),
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(255),
    IN p_state_id INT UNSIGNED
)
BEGIN
    -- Check if the username already exists
    IF EXISTS (SELECT 1 FROM `users` WHERE `username` = p_username) THEN
        -- Signal an error if the username already exists
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User already exists';
    ELSE
        -- Insert the new user into the users table
        INSERT INTO `users` (`name`, `lastname`, `username`, `state_id`, `password_hash`)
        VALUES (p_name, p_lastname, p_username, p_state_id, SHA2(p_password, 256));
    END IF;
END$$

DELIMITER ;