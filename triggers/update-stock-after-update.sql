DELIMITER $$

-- Drop the trigger if it already exists
DROP TRIGGER IF EXISTS UpdateStockAfterUpdate$$

-- Create a new trigger that updates the stock after an update on products_by_invoice
CREATE TRIGGER UpdateStockAfterUpdate
AFTER UPDATE ON products_by_invoice
FOR EACH ROW
BEGIN
    DECLARE stock_difference INT;
    DECLARE product_type ENUM('bebida vidrio', 'bebida enlatada', 'platillo o boca', 'snack');

    -- Get the type of the product
    SELECT `type` INTO product_type
    FROM `products`
    WHERE `id` = NEW.product_id;

    -- Calculate the difference in quantity between the new and old values
    SET stock_difference = NEW.quantity - OLD.quantity;

    -- Update the stock in the products table based on the stock difference
    -- Only if the product type is not 'platillo o boca'
    IF product_type != 'platillo o boca' THEN
        UPDATE `products`
        SET `stock` = `stock` - stock_difference
        WHERE `id` = NEW.product_id;
    END IF;
END$$

DELIMITER ;