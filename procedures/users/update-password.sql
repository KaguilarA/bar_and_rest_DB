DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateUserPassword$$

CREATE PROCEDURE UpdateUserPassword(
    IN p_username VARCHAR(50),
    IN p_new_password VARCHAR(255)
)
BEGIN
    DECLARE user_exists INT;

    SELECT COUNT(*) INTO user_exists
    FROM users
    WHERE username = p_username;

    IF user_exists = 1 THEN
        UPDATE users
        SET password_hash = SHA2(p_new_password, 256)
        WHERE username = p_username;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User does not exist';
    END IF;
END$$

DELIMITER ;