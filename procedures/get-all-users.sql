DELIMITER $$

DROP PROCEDURE IF EXISTS GetAllUsers$$

CREATE PROCEDURE GetAllUsers()
BEGIN
    SELECT `id`, `name`, `lastname`, `username`, `state`, `date_created` FROM `users`;
END$$

DELIMITER ;