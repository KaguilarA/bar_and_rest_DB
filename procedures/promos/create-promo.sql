DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS CreatePromo$$

-- Create a new procedure to create a new promo
CREATE PROCEDURE CreatePromo(
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10,2),
    IN p_days_of_week SET('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'),
    IN p_specific_date DATE,
    IN p_state_id INT,
    IN p_product_ids JSON,
    IN p_quantities JSON
)
BEGIN
    DECLARE promo_id INT;
    DECLARE product_id INT;
    DECLARE quantity INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE product_cursor CURSOR FOR SELECT value FROM JSON_TABLE(p_product_ids, '$[*]' COLUMNS (value INT PATH '$'));
    DECLARE quantity_cursor CURSOR FOR SELECT value FROM JSON_TABLE(p_quantities, '$[*]' COLUMNS (value INT PATH '$'));
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Insert the new promo into the promos table
    INSERT INTO `promos` (`name`, `price`, `days_of_week`, `specific_date`, `state_id`)
    VALUES (p_name, p_price, p_days_of_week, p_specific_date, p_state_id);

    -- Get the ID of the newly created promo
    SET promo_id = LAST_INSERT_ID();

    -- Insert the products associated with the promo into the products_by_promos table
    IF p_product_ids IS NOT NULL AND p_quantities IS NOT NULL THEN
        OPEN product_cursor;
        OPEN quantity_cursor;

        read_loop: LOOP
            FETCH product_cursor INTO product_id;
            FETCH quantity_cursor INTO quantity;
            IF done THEN
                LEAVE read_loop;
            END IF;

            INSERT INTO `products_by_promos` (`promo_id`, `product_id`, `quantity`)
            VALUES (promo_id, product_id, quantity);
        END LOOP;

        CLOSE product_cursor;
        CLOSE quantity_cursor;
    END IF;
END$$

DELIMITER ;