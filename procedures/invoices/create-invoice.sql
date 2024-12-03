DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS CreateInvoice$$

-- Create a new procedure to create an invoice and add a product to the invoice
CREATE PROCEDURE CreateInvoice(
    IN p_name VARCHAR(100),
    IN p_product_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE invoice_id INT;

    -- Insert a new invoice into the invoices table
    INSERT INTO `invoices` (`name`)
    VALUES (p_name);

    -- Get the ID of the newly created invoice
    SET invoice_id = LAST_INSERT_ID();

    -- Insert the product into the products_by_invoice table
    INSERT INTO `products_by_invoice` (`invoice_id`, `product_id`, `quantity`)
    VALUES (invoice_id, p_product_id, p_quantity);
END$$

DELIMITER ;