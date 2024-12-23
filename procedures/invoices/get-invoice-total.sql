DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetInvoiceTotal$$

-- Create a new procedure to get the total amount of an invoice by its ID
CREATE PROCEDURE GetInvoiceTotal(IN p_invoice_id INT)
BEGIN
    DECLARE total DECIMAL(10, 2) DEFAULT 0;

    -- Calculate the total amount of the invoice
    SELECT SUM(
        CASE
            WHEN ibi.promo_id IS NOT NULL THEN ibi.price * ibi.quantity
            ELSE ibi.price * ibi.quantity
        END
    ) INTO total
    FROM `items_by_invoice` ibi
    LEFT JOIN promos pr ON ibi.promo_id = pr.id
    WHERE ibi.invoice_id = p_invoice_id;

    -- Return the total amount
    SELECT total AS totalAmount;
END$$

DELIMITER ;