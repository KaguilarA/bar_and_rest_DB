-- Elimina si ya existe
DROP PROCEDURE IF EXISTS set_current_price;

DELIMITER $$

CREATE PROCEDURE set_current_price (
    IN p_price_id INT UNSIGNED
)
BEGIN
    DECLARE v_exists INT DEFAULT 0;
    
    -- Validar que el price_id exista
    SELECT COUNT(*) INTO v_exists FROM prices WHERE id = p_price_id;
    
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Price ID does not exist.';
    END IF;
    
    -- Actualizar el precio a current
    UPDATE prices
    SET is_current = TRUE
    WHERE id = p_price_id;
END$$

DELIMITER ;
