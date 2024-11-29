DELIMITER $$

DROP PROCEDURE IF EXISTS GetAllUsers$$

CREATE PROCEDURE GetAllUsers()
BEGIN
    SELECT `id`, `name`, `username`, `email`, `state` FROM `users`;
END$$

DELIMITER ;