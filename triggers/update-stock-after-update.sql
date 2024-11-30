DELIMITER $$

DROP TRIGGER IF EXISTS UpdateStockAfterUpdate$$

CREATE TRIGGER UpdateStockAfterUpdate
AFTER UPDATE ON products_by_invoice
FOR EACH ROW
BEGIN
    DECLARE stock_difference INT;

    SET stock_difference = NEW.quantity - OLD.quantity;

    UPDATE products
    SET stock = stock - stock_difference
    WHERE id = NEW.product_id;
END$$

DELIMITER ;