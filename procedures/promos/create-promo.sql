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

    -- Insert the new promo into the promos table
    INSERT INTO `promos` (`name`, `price`, `days_of_week`, `specific_date`, `state_id`)
    VALUES (p_name, p_price, p_days_of_week, p_specific_date, p_state_id);

    -- Get the ID of the newly created promo
    SET promo_id = LAST_INSERT_ID();

    -- Insert the products associated with the promo into the products_by_promos table
    IF p_product_ids IS NOT NULL AND p_quantities IS NOT NULL THEN
        CALL AddProductsToPromo(promo_id, p_product_ids, p_quantities);
    END IF;
END$$

DELIMITER ;