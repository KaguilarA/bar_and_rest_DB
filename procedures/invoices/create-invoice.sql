DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS CreateInvoice$$

-- Create a new procedure to create an invoice
CREATE PROCEDURE CreateInvoice(
    IN p_name VARCHAR(100),
    IN p_state_id INT
)
BEGIN
    -- Insert a new invoice into the invoices table
    INSERT INTO `invoices` (`name`, `state_id`)
    VALUES (p_name, p_state_id);
END$$

DELIMITER ;