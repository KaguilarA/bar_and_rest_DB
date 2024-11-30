DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateUser$$

CREATE PROCEDURE UpdateUser(
    IN p_user_id INT,
    IN p_name VARCHAR(100),
    IN p_lastname VARCHAR(100),
    IN p_username VARCHAR(100)
)
BEGIN
    UPDATE `users`
    SET `username` = p_username, `name` = p_name, `lastname` = p_lastname
    WHERE `id` = p_user_id;
END$$

DELIMITER ;