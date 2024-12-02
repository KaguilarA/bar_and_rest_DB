DELIMITER $$

DROP PROCEDURE IF EXISTS GetUserByState$$

CREATE PROCEDURE GetUserByState(IN p_state BOOLEAN)
BEGIN
    SELECT `id`, `name`, `lastname`, `username`, `state`, `date_created`
    FROM `users`
    WHERE `state` = p_state;
END$$

DELIMITER ;