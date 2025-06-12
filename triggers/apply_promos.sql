DELIMITER $$

CREATE TRIGGER trg_call_apply_cart_promo
AFTER UPDATE ON carts
FOR EACH ROW
BEGIN
    DECLARE pending_id INT DEFAULT 1;
    DECLARE to_pay_id INT DEFAULT 2;

    IF OLD.state_id = pending_id AND NEW.state_id = to_pay_id THEN
        CALL apply_cart_promo_once(NEW.id);
    END IF;
END$$

DELIMITER ;
