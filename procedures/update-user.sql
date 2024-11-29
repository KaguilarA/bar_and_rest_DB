DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateUser$$

CREATE PROCEDURE UpdateUser(
    IN p_user_id INT,
    IN p_username VARCHAR(100),
    IN p_email VARCHAR(100)
)
BEGIN
    UPDATE `users`
    SET `username` = p_username, `email` = p_email
    WHERE `id` = p_user_id;
END$$

DELIMITER ;