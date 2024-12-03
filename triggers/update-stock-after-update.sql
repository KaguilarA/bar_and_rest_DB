DELIMITER $$

-- Drop the trigger if it already exists
DROP TRIGGER IF EXISTS UpdateStockAfterUpdate$$

-- Create a new trigger that updates the stock after an update on products_by_invoice
CREATE TRIGGER UpdateStockAfterUpdate
AFTER UPDATE ON products_by_invoice
FOR EACH ROW
BEGIN
    -- Declare a variable to store the difference in stock
    DECLARE stock_difference INT;

    -- Calculate the difference in quantity between the new and old values
    SET stock_difference = NEW.quantity - OLD.quantity;

    -- Update the stock in the products table based on the stock difference
    UPDATE products
    SET stock = stock - stock_difference
    WHERE id = NEW.product_id;
END$$

DELIMITER ;