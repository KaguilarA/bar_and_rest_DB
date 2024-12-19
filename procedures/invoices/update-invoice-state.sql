DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdateInvoiceState$$

-- Create a new procedure to update the state of an invoice by ID
CREATE PROCEDURE UpdateInvoiceState(
    IN p_invoice_id INT,
    IN p_state_id INT
)
BEGIN
    DECLARE state_exists INT;

    -- Check if the state ID exists in the states table
    SELECT COUNT(*) INTO state_exists
    FROM `states`
    WHERE `id` = p_state_id;

    -- If the state ID does not exist, signal an error
    IF state_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid state ID';
    ELSE
        -- Update the state of the invoice in the invoices table
        UPDATE `invoices`
        SET `state_id` = p_state_id
        WHERE `id` = p_invoice_id;
    END IF;
END$$

DELIMITER ;