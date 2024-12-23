DELIMITER $$

-- Drop the trigger if it already exists
DROP TRIGGER IF EXISTS BeforeUpdateInvoicePromoQuantity$$

-- Create a new trigger to validate promo quantities before updating items in an invoice
CREATE TRIGGER BeforeUpdateInvoicePromoQuantity
BEFORE UPDATE ON items_by_invoice
FOR EACH ROW
BEGIN
    DECLARE max_quantity INT;
    DECLARE total_quantity INT;

    -- Check if the item is part of a promo
    IF NEW.promo_id IS NOT NULL THEN
        -- Get the maximum quantity allowed for the promo
        SELECT p.products_quantity INTO max_quantity
        FROM promos p
        WHERE p.id = NEW.promo_id;

        -- Calculate the total quantity of the promo for the invoice
        SELECT SUM(ibi.quantity) INTO total_quantity
        FROM items_by_invoice ibi
        WHERE ibi.invoice_id = NEW.invoice_id AND ibi.promo_id = NEW.promo_id;

        -- Add the new quantity to the total
        SET total_quantity = total_quantity + NEW.quantity;

        -- Validate that the total quantity does not exceed the maximum allowed
        IF total_quantity > max_quantity THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Total quantity of the promo exceeds the maximum allowed';
        END IF;
    END IF;
END$$

DELIMITER ;