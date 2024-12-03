DELIMITER $$

-- Drop the trigger if it already exists
DROP TRIGGER IF EXISTS UpdateStockAfterInsert$$

-- Create a new trigger that updates the stock after an insert on products_by_invoice
CREATE TRIGGER UpdateStockAfterInsert
AFTER INSERT ON products_by_invoice
FOR EACH ROW
BEGIN
    -- Update the stock in the products table based on the inserted quantity
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE id = NEW.product_id;
END$$

DELIMITER ;