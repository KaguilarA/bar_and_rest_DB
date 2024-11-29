DELIMITER $$

DROP TRIGGER IF EXISTS UpdateStockAfterInsert$$

CREATE TRIGGER UpdateStockAfterInsert
AFTER INSERT ON products_by_invoice
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE id = NEW.product_id;
END$$

DELIMITER ;