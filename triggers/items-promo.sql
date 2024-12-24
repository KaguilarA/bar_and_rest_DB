DELIMITER $$

-- Drop the trigger if it already exists
DROP TRIGGER IF EXISTS BeforeUpdateInvoiceState$$

-- Create a new trigger to validate promotions before updating the invoice state
CREATE TRIGGER BeforeUpdateInvoiceState
BEFORE UPDATE ON invoices
FOR EACH ROW
BEGIN
    DECLARE promo_id INT;
    DECLARE product_id INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cursor_products CURSOR FOR 
        SELECT ibi.product_id, pr.promo_id
        FROM items_by_invoice ibi
        LEFT JOIN items_by_promos pr ON ibi.product_id = pr.product_id
        WHERE ibi.invoice_id = NEW.id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Only check if the state is being updated to 4
    IF NEW.state_id = 4 THEN
        -- Open the cursor
        OPEN cursor_products;

        -- Loop through the products in the invoice
        read_loop: LOOP
            FETCH cursor_products INTO product_id, promo_id, quantity;
            IF done THEN
                LEAVE read_loop;
            END IF;

            -- If a product is part of a promo, apply the promo
            IF promo_id IS NOT NULL THEN
                -- Return the products to stock
                UPDATE products
                SET stock = stock + quantity
                WHERE id = product_id;

                -- Delete the products from items_by_invoice
                UPDATE items_by_invoice
                SET promo_id = promo_id
                WHERE invoice_id = NEW.id AND product_id = product_id;

                -- Continue the loop
                ITERATE read_loop;
            END IF;
        END LOOP;

        -- Close the cursor
        CLOSE cursor_products;
    END IF;
END$$

DELIMITER ;