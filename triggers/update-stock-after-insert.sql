DELIMITER $$

-- Drop the trigger if it already exists
DROP TRIGGER IF EXISTS UpdateStockAfterInsertItemByInvoice$$

-- Create a new trigger that updates the stock after an insert on items_by_invoice
CREATE TRIGGER UpdateStockAfterInsertItemByInvoice
AFTER INSERT ON items_by_invoice
FOR EACH ROW
BEGIN
    -- Update the stock for the individual product
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE id = NEW.product_id;
END$$

DELIMITER ;