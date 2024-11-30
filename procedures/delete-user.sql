DELIMITER $$

DROP PROCEDURE IF EXISTS DeleteUser$$

CREATE PROCEDURE DeleteUser(IN p_id INT)
BEGIN
    UPDATE `users`
    SET `state` = FALSE
    WHERE `id` = p_id;
END$$

DELIMITER ;