DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS AddPromoToInvoice$$

-- Create a new procedure to add a promo to an invoice
CREATE PROCEDURE AddPromoToInvoice(
    IN p_invoice_id INT,
    IN p_product_id INT,
    IN p_promo_id INT,
    IN p_quantity INT
)
BEGIN
    -- Insert the promo into the items_by_invoice table
    INSERT INTO `items_by_invoice` (`invoice_id`, `product_id`, `promo_id`, `quantity`, `price`)
    SELECT p_invoice_id, p_product_id, p_promo_id, p_quantity, pr.price
    FROM promos pr
    WHERE pr.id = p_promo_id;
END$$

DELIMITER ;