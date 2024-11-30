DELIMITER $$

DROP PROCEDURE IF EXISTS ValidatePasswordHash$$

CREATE PROCEDURE ValidatePasswordHash(
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(255),
    OUT is_valid BOOLEAN
)
BEGIN
    DECLARE hashed_password VARCHAR(255);

    SELECT `password` INTO hashed_password
    FROM users
    WHERE username = p_username;

    IF hashed_password IS NOT NULL AND hashed_password = SHA2(p_password, 256) THEN
        SET is_valid = TRUE;
    ELSE
        SET is_valid = FALSE;
    END IF;
END$$

DELIMITER ;
