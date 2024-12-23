DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdateInvoicePromoProductQuantity$$

-- Create a new procedure to update the quantity of a product in a promo within an invoice
CREATE PROCEDURE UpdateInvoicePromoProductQuantity(
    IN p_invoice_id INT,
    IN p_promo_id INT,
    IN p_product_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE max_quantity INT;
    DECLARE total_quantity INT;

    -- Get the maximum quantity allowed for the promo
    SELECT p.products_quantity INTO max_quantity
    FROM promos p
    WHERE p.id = p_promo_id;

    -- Calculate the total quantity of products in the promo for the invoice
    SELECT SUM(ibi.quantity) INTO total_quantity
    FROM items_by_invoice ibi
    WHERE ibi.invoice_id = p_invoice_id AND ibi.promo_id = p_promo_id;

    -- Add the new quantity to the total
    SET total_quantity = total_quantity + p_quantity;

    -- Validate that the total quantity does not exceed the maximum allowed
    IF total_quantity > max_quantity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Total quantity of products in the promo exceeds the maximum allowed';
    END IF;

    -- Update the quantity of the product in the promo within the invoice
    UPDATE items_by_invoice
    SET quantity = p_quantity
    WHERE invoice_id = p_invoice_id AND promo_id = p_promo_id AND product_id = p_product_id;
END$$

DELIMITER ;