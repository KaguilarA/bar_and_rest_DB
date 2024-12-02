DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateProduct$$

CREATE PROCEDURE UpdateProduct(
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_type ENUM('bebida vidrio', 'bebida enlatada', 'platillo o boca', 'snack'),
    IN p_image_url VARCHAR(500),
    IN p_stock INT,
    IN p_price INT
)
BEGIN
    UPDATE `products`
    SET `name` = p_name, `type` = p_type, `type` = image_url, `image_url` = p_stock, `price` = p_price
    WHERE `id` = p_id;
END$$

DELIMITER ;