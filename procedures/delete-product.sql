DELIMITER $$

DROP PROCEDURE IF EXISTS DeleteProduct$$

CREATE PROCEDURE DeleteProduct(IN p_id INT)
BEGIN
    UPDATE `products`
    SET `state` = FALSE
    WHERE `id` = p_id;
END$$

DELIMITER ;