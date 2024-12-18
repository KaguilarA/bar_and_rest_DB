DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdateProductState$$

-- Create a new procedure to update a product's state
CREATE PROCEDURE UpdateProductState(
    IN p_id INT,
    IN p_state_id INT
)
BEGIN
    DECLARE state_exists INT;

    -- Check if the state ID exists in the states table
    SELECT COUNT(*) INTO state_exists
    FROM `states`
    WHERE `id` = p_state_id;

    -- If the state ID does not exist, signal an error
    IF state_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid state ID';
    ELSE
        -- Update the product's state in the products table
        UPDATE `products`
        SET `state_id` = p_state_id
        WHERE `id` = p_id;
    END IF;
END$$

DELIMITER ;