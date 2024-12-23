DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdateInvoiceProductQuantity$$

-- Create a new procedure to update the quantity of a product in an invoice
CREATE PROCEDURE UpdateInvoiceProductQuantity(
    IN p_invoice_id INT,
    IN p_product_id INT,
    IN p_quantity INT
)
BEGIN
    -- Update the quantity of the product in the invoice
    UPDATE items_by_invoice
    SET quantity = p_quantity
    WHERE invoice_id = p_invoice_id AND product_id = p_product_id;
END$$

DELIMITER ;