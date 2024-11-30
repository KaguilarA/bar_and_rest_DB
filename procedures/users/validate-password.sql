DELIMITER $$

DROP PROCEDURE IF EXISTS ValidatePasswordHash$$

CREATE PROCEDURE ValidatePasswordHash(
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(255)
)
BEGIN
    DECLARE hashed_password VARCHAR(255);
    DECLARE is_valid BOOLEAN;

    SELECT password_hash INTO hashed_password
    FROM users
    WHERE username = p_username COLLATE utf8mb4_unicode_ci;

    IF hashed_password IS NOT NULL AND hashed_password = SHA2(p_password COLLATE utf8mb4_unicode_ci, 256) THEN
        SET is_valid = TRUE;
    ELSE
        SET is_valid = FALSE;
    END IF;

    SELECT is_valid AS is_valid;
END$$

DELIMITER ;