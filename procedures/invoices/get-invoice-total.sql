DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetInvoiceTotal$$

-- Create a new procedure to get the total amount of an invoice by its ID
CREATE PROCEDURE GetInvoiceTotal(IN p_invoice_id INT)
BEGIN
    DECLARE total INT DEFAULT 0;

    -- Calculate the total amount of the invoice
    SELECT SUM(P.price * PBI.quantity) INTO total
    FROM `products_by_invoice` PBI
    JOIN `products` P ON P.id = PBI.product_id
    WHERE PBI.invoice_id = p_invoice_id;

    -- Return the total amount
    SELECT total AS totalAmount;
END$$

DELIMITER ;