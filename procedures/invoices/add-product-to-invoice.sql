DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS AddProductToInvoice$$

-- Create a new procedure to add a product to an invoice
CREATE PROCEDURE AddProductToInvoice(
    IN p_invoice_id INT,
    IN p_product_id INT,
    IN p_quantity INT
)
BEGIN
    -- Insert the product into the items_by_invoice table
    INSERT INTO `items_by_invoice` (`invoice_id`, `product_id`, `quantity`, `price`)
    SELECT p_invoice_id, p_product_id, p_quantity, p.price
    FROM products p
    WHERE p.id = p_product_id;
END$$

DELIMITER ;