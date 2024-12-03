DELIMITER $$

DROP PROCEDURE IF EXISTS GetProductsByState$$

CREATE PROCEDURE GetProductsByState(IN p_state BOOLEAN)
BEGIN
    SELECT * FROM `products` WHERE `state` = p_state COLLATE;
END$$

DELIMITER ;