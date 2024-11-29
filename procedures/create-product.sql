DELIMITER $$

DROP PROCEDURE IF EXISTS CreateProduct$$

CREATE PROCEDURE CreateProduct(
    IN p_name VARCHAR(100),
    IN p_type ENUM('bebida botella de vidrio', 'bebida enlatada', 'platillo o boca', 'snack'),
    IN p_image_url VARCHAR(500),
    IN p_stock INT,
    IN p_price DECIMAL(10, 2)
)
BEGIN
    INSERT INTO `products` (`name`, `type`, `image_url`, `stock`, `price`)
    VALUES (p_name, p_type, p_image_url, p_stock, p_price);
END$$

DELIMITER ;