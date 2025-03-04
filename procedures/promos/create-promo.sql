DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS CreatePromo$$

-- Create a new procedure to create a new promo
CREATE PROCEDURE CreatePromo(
    IN p_name VARCHAR(100),
    IN p_description VARCHAR(255),
    IN p_price DECIMAL(10,2),
    IN p_days_of_week SET('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'),
    IN p_products_quantity INT,
    IN p_specific_date DATE,
    IN p_state_id INT,
    IN p_author_id INT,
    IN p_product_ids JSON
)
BEGIN
    DECLARE promo_id INT;
    DECLARE product_id INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE product_cursor CURSOR FOR SELECT value FROM JSON_TABLE(p_product_ids, '$[*]' COLUMNS (value INT PATH '$')) AS jt_product;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Insert the new promo into the promos table
    INSERT INTO `promos` (`name`, `description`, `price`, `days_of_week`, `products_quantity`, `specific_date`, `state_id`, `author_id`)
    VALUES (p_name, p_description, p_price, p_days_of_week, p_products_quantity, p_specific_date, p_state_id, p_author_id);

    -- Get the ID of the newly created promo
    SET promo_id = LAST_INSERT_ID();

    -- Insert the products associated with the promo into the products_by_promos table
    IF p_product_ids IS NOT NULL THEN
        OPEN product_cursor;

        read_loop: LOOP
            FETCH product_cursor INTO product_id;
            IF done THEN
                LEAVE read_loop;
            END IF;

            INSERT INTO `products_by_promos` (`promo_id`, `product_id`)
            VALUES (promo_id, product_id);
        END LOOP;

        CLOSE product_cursor;
    END IF;
END$$

DELIMITER ;