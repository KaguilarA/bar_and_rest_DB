DELIMITER $$

-- Drop the trigger if it already exists
DROP TRIGGER IF EXISTS UpdateStockAfterUpdateItemByInvoice$$

-- Create a new trigger that updates the stock after an update on items_by_invoice
CREATE TRIGGER UpdateStockAfterUpdateItemByInvoice
AFTER UPDATE ON items_by_invoice
FOR EACH ROW
BEGIN
    DECLARE stock_difference INT;

    -- Calculate the difference in quantity between the new and old values
    SET stock_difference = NEW.quantity - OLD.quantity;

    -- Update the stock for the individual product
    UPDATE products
    SET stock = stock - stock_difference
    WHERE id = NEW.product_id;
END$$

DELIMITER ;