DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdateProductQuantityInvoice$$

-- Create a new procedure to update the quantity of a product in an invoice
CREATE PROCEDURE UpdateProductQuantityInvoice(
    IN p_invoice_id INT,
    IN p_product_id INT,
    IN p_new_quantity INT
)
BEGIN
    DECLARE current_quantity INT;

    -- Get the current quantity of the product in the invoice
    SELECT `quantity` INTO current_quantity
    FROM `items_by_invoice`
    WHERE `invoice_id` = p_invoice_id AND `product_id` = p_product_id;

    -- Check if the product in the invoice exists
    IF current_quantity IS NOT NULL THEN
        -- Update the quantity of the product in the invoice
        UPDATE `items_by_invoice`
        SET `quantity` = p_new_quantity
        WHERE `invoice_id` = p_invoice_id AND `product_id` = p_product_id;
    ELSE
        -- Insert the product into the invoice if it does not exist
        INSERT INTO `items_by_invoice` (`invoice_id`, `product_id`, `quantity`)
        VALUES (p_invoice_id, p_product_id, p_new_quantity);
    END IF;
END$$

DELIMITER ;