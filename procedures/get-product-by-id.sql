DELIMITER $$

CREATE PROCEDURE GetProductById(IN p_id INT)
BEGIN
    SELECT * FROM `products` WHERE `id` = p_id;
END$$

DELIMITER ;