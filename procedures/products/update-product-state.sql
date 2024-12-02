DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateProductState$$

CREATE PROCEDURE UpdateProductState(
    IN p_id INT,
    IN p_state BOOLEAN
)
BEGIN
    UPDATE `products`
    SET `state` = p_state
    WHERE `id` = p_id;
END$$

DELIMITER ;