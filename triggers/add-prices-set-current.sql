-- Primero elimina el trigger si ya existe
DROP TRIGGER IF EXISTS trg_prices_set_current;

-- Ahora crea el trigger
DELIMITER $$

CREATE TRIGGER trg_prices_set_current
BEFORE INSERT ON prices
FOR EACH ROW
BEGIN
    -- Si el nuevo precio es is_current = TRUE
    IF NEW.is_current = TRUE THEN
        -- Si está relacionado a un producto
        IF NEW.product_id IS NOT NULL THEN
            UPDATE prices
            SET is_current = FALSE
            WHERE product_id = NEW.product_id;
        
        -- Si está relacionado a una promo
        ELSEIF NEW.promo_id IS NOT NULL THEN
            UPDATE prices
            SET is_current = FALSE
            WHERE promo_id = NEW.promo_id;
        END IF;
    END IF;
END$$

DELIMITER ;
