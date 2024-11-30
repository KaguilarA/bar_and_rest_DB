DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateProductStock$$

CREATE PROCEDURE UpdateProductStock(
    IN p_product_id INT,
    IN p_stock_change INT
)
BEGIN
    DECLARE current_stock INT;

    SELECT `stock` INTO current_stock
    FROM `products`
    WHERE `id` = p_product_id;

    IF current_stock + p_stock_change >= 0 THEN
        UPDATE `products`
        SET `stock` = `stock` + p_stock_change
        WHERE `id` = p_product_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock cannot be negative';
    END IF;
END$$

DELIMITER ;