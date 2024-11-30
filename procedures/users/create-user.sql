DELIMITER $$

DROP PROCEDURE IF EXISTS CreateUser$$

CREATE PROCEDURE CreateUser(
    IN p_name VARCHAR(100),
    IN p_lastname VARCHAR(100),
    IN p_username VARCHAR(50),
    IN p_password_hash VARCHAR(255)
)
BEGIN
    IF EXISTS (SELECT 1 FROM `users` WHERE `username` = p_username) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Username already exists';
    ELSE
        INSERT INTO `users` (`name`, `lastname`, `username`, `password_hash`)
        VALUES (p_name, p_lastname, p_username, SHA2(p_password_hash COLLATE utf8mb4_unicode_ci, 256));
    END IF;
END$$

DELIMITER ;