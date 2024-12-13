DELIMITER $$

-- Drop the trigger if it already exists
DROP TRIGGER IF EXISTS UpdateStockAfterInsert$$

-- Create a new trigger that updates the stock after an insert on items_by_invoice
CREATE TRIGGER UpdateStockAfterInsert
AFTER INSERT ON items_by_invoice
FOR EACH ROW
BEGIN
    DECLARE product_type ENUM('bebida vidrio', 'bebida enlatada', 'platillo o boca', 'snack', 'trago');

    -- Get the type of the product
    SELECT `type` INTO product_type
    FROM `products`
    WHERE `id` = NEW.product_id;

    -- Update the stock in the products table based on the inserted quantity
    -- Only if the product type is not 'platillo o boca'
    IF product_type != 'platillo o boca' THEN
        UPDATE `products`
        SET `stock` = `stock` - NEW.quantity
        WHERE `id` = NEW.product_id;
    END IF;
END$$

DELIMITER ;