-- Elimina si ya existe
DROP PROCEDURE IF EXISTS add_price;

DELIMITER $$

CREATE PROCEDURE add_price (
    IN p_product_id INT UNSIGNED,
    IN p_promo_id INT UNSIGNED,
    IN p_amount DECIMAL(10,2),
    IN p_is_current BOOLEAN
)
BEGIN
    DECLARE v_exists INT DEFAULT 0;
    
    -- Verificar que product_id o promo_id no sean ambos nulos o ambos llenos
    IF (p_product_id IS NULL AND p_promo_id IS NULL) OR (p_product_id IS NOT NULL AND p_promo_id IS NOT NULL) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Must provide either product_id or promo_id, but not both.';
    END IF;

    -- Validar existencia del producto
    IF p_product_id IS NOT NULL THEN
        SELECT COUNT(*) INTO v_exists FROM products WHERE id = p_product_id;
        
        IF v_exists = 0 THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Product does not exist.';
        END IF;
    END IF;
    
    -- Validar existencia de la promo
    IF p_promo_id IS NOT NULL THEN
        SELECT COUNT(*) INTO v_exists FROM promos WHERE id = p_promo_id;
        
        IF v_exists = 0 THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Promo does not exist.';
        END IF;
    END IF;
    
    -- Insertar el precio
    INSERT INTO prices (product_id, promo_id, amount, is_current)
    VALUES (p_product_id, p_promo_id, p_amount, p_is_current);
END$$

DELIMITER ;
