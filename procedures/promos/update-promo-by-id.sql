DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdatePromoById$$

-- Create a new procedure to update a promo by ID
CREATE PROCEDURE UpdatePromoById(
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10,2),
    IN p_days_of_week SET('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'),
    IN p_specific_date DATE,
    IN p_state_id INT,
    IN p_product_ids JSON,
    IN p_quantities JSON
)
BEGIN
    DECLARE product_id INT;
    DECLARE quantity INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE product_cursor CURSOR FOR 
        SELECT value FROM JSON_TABLE(p_product_ids, '$[*]' COLUMNS (value INT PATH '$')) AS jt_product;
    DECLARE quantity_cursor CURSOR FOR 
        SELECT value FROM JSON_TABLE(p_quantities, '$[*]' COLUMNS (value INT PATH '$')) AS jt_quantity;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Update the promo with the specified ID
    UPDATE `promos`
    SET 
        `name` = p_name, 
        `price` = p_price, 
        `days_of_week` = p_days_of_week, 
        `specific_date` = p_specific_date, 
        `state_id` = p_state_id,
        `date_updated` = CURRENT_TIMESTAMP
    WHERE `id` = p_id;

    -- Delete existing products associated with the promo
    DELETE FROM `products_by_promos` WHERE `promo_id` = p_id;

    -- Insert the new products associated with the promo into the products_by_promos table
    IF p_product_ids IS NOT NULL AND p_quantities IS NOT NULL THEN
        OPEN product_cursor;

        read_loop: LOOP
            FETCH product_cursor INTO product_id;
            IF done THEN
                LEAVE read_loop;
            END IF;

            INSERT INTO `products_by_promos` (`promo_id`, `product_id`)
            VALUES (p_id, product_id);
        END LOOP;

        CLOSE product_cursor;
    END IF;
END$$

DELIMITER ;