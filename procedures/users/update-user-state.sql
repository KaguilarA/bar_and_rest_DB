DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdateUserState$$

-- Create a new procedure to update a user's state
CREATE PROCEDURE UpdateUserState(
    IN p_id INT,
    IN p_state BOOLEAN
)
BEGIN
    -- Update the user's state in the users table
    UPDATE `users`
    SET `state` = p_state
    WHERE `id` = p_id;
END$$

DELIMITER ;