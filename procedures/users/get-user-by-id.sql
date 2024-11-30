DELIMITER $$

DROP PROCEDURE IF EXISTS GetUserById$$

CREATE PROCEDURE GetUserById(IN p_id INT)
BEGIN
    SELECT `id`, `name`, `lastname`, `username`, `state`, `date_created`
    FROM `users`
    WHERE `id` = p_id;
END$$

DELIMITER ;