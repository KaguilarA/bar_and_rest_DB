DELIMITER $$

DROP PROCEDURE IF EXISTS DeleteUser$$

CREATE PROCEDURE DeleteUser(IN p_id INT)
BEGIN
    UPDATE `users`
    SET `state` = 0
    WHERE `id` = p_id;
END$$

DELIMITER ;