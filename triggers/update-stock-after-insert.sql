DELIMITER $$

-- Drop the trigger if it already exists
DROP TRIGGER IF EXISTS UpdateStockAfterInsertItemByInvoice$$

-- Create a new trigger that updates the stock after an insert on items_by_invoice
CREATE TRIGGER UpdateStockAfterInsertItemByInvoice
AFTER INSERT ON items_by_invoice
FOR EACH ROW
BEGIN
    DECLARE promo_product_id INT;
    DECLARE promo_quantity INT;

    -- Check if the item is associated with a promo
    IF NEW.promo_id IS NOT NULL THEN
        -- Loop through each product associated with the promo
        DECLARE done INT DEFAULT FALSE;
        DECLARE cur CURSOR FOR 
            SELECT product_id, NEW.quantity
            FROM products_by_promos
            WHERE promo_id = NEW.promo_id;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

        OPEN cur;

        read_loop: LOOP
            FETCH cur INTO promo_product_id, promo_quantity;
            IF done THEN
                LEAVE read_loop;
            END IF;

            -- Update the stock using the function
            CALL UpdateProductStock(promo_product_id, promo_quantity);
        END LOOP;

        CLOSE cur;
    ELSE
        -- Update the stock using the function
        CALL UpdateProductStock(NEW.product_id, NEW.quantity);
    END IF;
END$$

DELIMITER ;