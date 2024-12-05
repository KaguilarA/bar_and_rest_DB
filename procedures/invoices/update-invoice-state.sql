DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdateInvoiceState$$

-- Create a new procedure to update the state of an invoice by ID
CREATE PROCEDURE UpdateInvoiceState(
    IN p_invoice_id INT,
    IN p_state ENUM('pendiente', 'cancelada', 'anulada')
)
BEGIN
    -- Update the state of the invoice in the invoices table
    UPDATE `invoices`
    SET `state` = p_state
    WHERE `id` = p_invoice_id;
END$$

DELIMITER ;