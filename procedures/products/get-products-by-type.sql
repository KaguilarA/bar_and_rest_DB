DELIMITER $$

DROP PROCEDURE IF EXISTS GetProductsByType$$

CREATE PROCEDURE GetProductsByType(IN p_type VARCHAR(50))
BEGIN
    SELECT `id`, `name`, `type`, `image_url`, `stock`, `price`, `date_created`
    FROM `products`
    WHERE `type` = p_type COLLATE utf8mb4_unicode_ci;
END$$

DELIMITER ;