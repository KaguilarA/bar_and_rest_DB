DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdateInvoicePromoQuantity$$

-- Create a new procedure to update the quantity of a promo in an invoice
CREATE PROCEDURE UpdateInvoicePromoQuantity(
    IN p_invoice_id INT,
    IN p_promo_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE max_quantity INT;
    DECLARE total_quantity INT;

    -- Get the maximum quantity allowed for the promo
    SELECT p.products_quantity INTO max_quantity
    FROM promos p
    WHERE p.id = p_promo_id;

    -- Calculate the total quantity of the promo for the invoice
    SELECT SUM(ibi.quantity) INTO total_quantity
    FROM items_by_invoice ibi
    WHERE ibi.invoice_id = p_invoice_id AND ibi.promo_id = p_promo_id;

    -- Add the new quantity to the total
    SET total_quantity = total_quantity + p_quantity;

    -- Validate that the total quantity does not exceed the maximum allowed
    IF total_quantity > max_quantity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Total quantity of the promo exceeds the maximum allowed';
    END IF;

    -- Update the quantity of the promo in the invoice
    UPDATE items_by_invoice
    SET quantity = p_quantity
    WHERE invoice_id = p_invoice_id AND promo_id = p_promo_id;
END$$

DELIMITER ;