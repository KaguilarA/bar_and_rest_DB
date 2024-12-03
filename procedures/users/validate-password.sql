DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS ValidatePasswordHash$$

-- Create a new procedure to validate a user's password
CREATE PROCEDURE ValidatePasswordHash(
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(255)
)
BEGIN
    DECLARE hashed_password VARCHAR(255);
    DECLARE is_valid BOOLEAN;

    -- Get the hashed password of the user
    SELECT password_hash INTO hashed_password
    FROM users
    WHERE username = p_username COLLATE utf8mb4_unicode_ci;

    -- Validate the password
    IF hashed_password IS NOT NULL AND hashed_password = SHA2(p_password, 256) THEN
        SET is_valid = TRUE;
    ELSE
        SET is_valid = FALSE;
    END IF;

    -- Return the validation result
    SELECT is_valid AS is_valid;
END$$

DELIMITER ;