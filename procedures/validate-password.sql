DELIMITER $$

DROP PROCEDURE IF EXISTS ValidateUserPassword$$

CREATE PROCEDURE ValidateUserPassword(
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(50),
    OUT is_valid BOOLEAN
)
BEGIN
    DECLARE hashed_password VARCHAR(64);

    SELECT `password_hash` INTO hashed_password
    FROM users
    WHERE username = p_username;

    IF hashed_password = SHA2(p_password, 256) THEN
        SET isValid = TRUE;
    ELSE
        SET isValid = FALSE;
    END IF;
END

DELIMITER ;
