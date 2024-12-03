DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdateUserPassword$$

-- Create a new procedure to update a user's password
CREATE PROCEDURE UpdateUserPassword(
    IN p_username VARCHAR(50),
    IN p_new_password VARCHAR(255)
)
BEGIN
    DECLARE user_exists INT;

    -- Check if the user exists
    SELECT COUNT(*) INTO user_exists
    FROM users
    WHERE username = p_username COLLATE utf8mb4_unicode_ci;

    IF user_exists = 1 THEN
        -- Update the user's password
        UPDATE users
        SET password_hash = SHA2(p_new_password, 256)
        WHERE username = p_username COLLATE utf8mb4_unicode_ci;
    ELSE
        -- Signal an error if the user does not exist
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User does not exist';
    END IF;
END$$

DELIMITER ;