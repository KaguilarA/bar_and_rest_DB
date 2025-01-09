DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS AddPromoToInvoice$$

-- Create a new procedure to add a promo to an invoice
CREATE PROCEDURE AddPromoToInvoice(
    IN p_invoice_id INT,
    IN p_promo_id INT,
    IN p_quantity INT,
    IN p_product_ids JSON
)
BEGIN
    DECLARE max_quantity INT;
    DECLARE current_quantity INT;
    DECLARE product_id INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE product_cursor CURSOR FOR 
        SELECT value FROM JSON_TABLE(p_product_ids, '$[*]' COLUMNS (value INT PATH '$')) AS jt_product;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Get the maximum quantity allowed for the promo
    SELECT products_quantity INTO max_quantity
    FROM promos
    WHERE id = p_promo_id;

    -- Calculate the current total quantity of the promo in the invoice
    SELECT IFNULL(SUM(quantity), 0) INTO current_quantity
    FROM items_by_invoice
    WHERE invoice_id = p_invoice_id AND promo_id = p_promo_id;

    -- Add the new quantity to the current total
    SET current_quantity = current_quantity + p_quantity;

    -- Validate that the total quantity does not exceed the maximum allowed
    IF current_quantity > max_quantity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Total quantity of products in the promo exceeds the maximum allowed';
    ELSE
        -- Open the cursor
        OPEN product_cursor;

        -- Loop through each product ID in the JSON array
        read_loop: LOOP
            FETCH product_cursor INTO product_id;
            IF done THEN
                LEAVE read_loop;
            END IF;

            -- Insert each product associated with the promo into the items_by_invoice table
            INSERT INTO `items_by_invoice` (`invoice_id`, `product_id`, `promo_id`, `quantity`, `price`)
            SELECT p_invoice_id, product_id, p_promo_id, p_quantity, pr.price
            FROM promos pr
            WHERE pr.id = p_promo_id;
        END LOOP;

        -- Close the cursor
        CLOSE product_cursor;
    END IF;
END$$

DELIMITER ;