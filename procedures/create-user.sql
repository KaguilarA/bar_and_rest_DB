DELIMITER $$

DROP PROCEDURE IF EXISTS CreateUser$$

CREATE PROCEDURE CreateUser(
    IN p_name VARCHAR(100),
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(255),
    IN p_state INT
)
BEGIN
    IF EXISTS (SELECT 1 FROM `users` WHERE `username` = p_username) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Username already exists';
    ELSE
        INSERT INTO `users` (`name`, `username`, `password`, `state`)
        VALUES (p_name, p_username, SHA2(p_password, 256), p_state);
    END IF;
END$$

DELIMITER ;