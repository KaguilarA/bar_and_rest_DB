DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateUserState$$

CREATE PROCEDURE UpdateUserState(IN p_id INT, IN p_state BOOLEAN)
BEGIN
    UPDATE `users`
    SET `state` = p_state
    WHERE `id` = p_id;
END$$

DELIMITER ;