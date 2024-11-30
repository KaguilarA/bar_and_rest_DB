DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateProduct$$

CREATE PROCEDURE UpdateProduct(
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_type INT,
    IN p_stock INT,
    IN p_price DECIMAL(10,2)
)
BEGIN
    UPDATE `products`
    SET `name` = p_name, `type` = p_type, `stock` = p_stock, `price` = p_price
    WHERE `id` = p_id;
END$$

DELIMITER ;