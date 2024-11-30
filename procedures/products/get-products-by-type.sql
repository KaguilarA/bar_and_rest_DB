DELIMITER $$

DROP PROCEDURE IF EXISTS GetProductsByType$$

CREATE PROCEDURE GetProductsByType(IN p_type ENUM('bebida botella de vidrio', 'bebida enlatada', 'platillo o boca', 'snack'))
BEGIN
    SELECT `id`, `name`, `type`, `stock`, `price`
    FROM `products`
    WHERE `type` = p_type;
END$$

DELIMITER ;
