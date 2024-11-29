DELIMITER $$

CREATE PROCEDURE GetAllUsers()
BEGIN
    SELECT `id`, `name`, `username`, `email`, `state` FROM `users`;
END$$

CREATE PROCEDURE GetUserById(IN p_id INT)
BEGIN
    SELECT `id`, `name`, `username`, `email`, `state` FROM `users` WHERE `id` = p_id;
END$$

DELIMITER ;