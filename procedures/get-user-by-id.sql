DELIMITER $$

DROP PROCEDURE IF EXISTS GetUserById$$

CREATE PROCEDURE GetUserById(IN p_id INT)
BEGIN
    SELECT `id`, `name`, `username`, `email`, `state` FROM `users` WHERE `id` = p_id;
END$$

DELIMITER ;