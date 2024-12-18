DELIMITER $$

-- Drop the trigger if it already exists
DROP TRIGGER IF EXISTS UpdateStockAfterUpdate$$

-- Create a new trigger that updates the stock after an update on items_by_invoice
CREATE TRIGGER UpdateStockAfterUpdate
AFTER UPDATE ON items_by_invoice
FOR EACH ROW
BEGIN
    DECLARE stock_difference INT;
    DECLARE promo_product_id INT;
    DECLARE promo_quantity INT;

    -- Calculate the difference in quantity between the new and old values
    SET stock_difference = NEW.quantity - OLD.quantity;

    -- Check if the item is associated with a promo
    IF NEW.promo_id IS NOT NULL THEN
        -- Loop through each product associated with the promo
        DECLARE done INT DEFAULT FALSE;
        DECLARE cur CURSOR FOR 
            SELECT product_id, stock_difference
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
        CALL UpdateProductStock(NEW.product_id, stock_difference);
    END IF;
END$$

DELIMITER ;