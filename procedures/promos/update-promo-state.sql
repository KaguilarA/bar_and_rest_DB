DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdatePromoState$$

-- Create a new procedure to update a promo's state
CREATE PROCEDURE UpdatePromoState(
    IN p_promo_id INT,
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
        -- Update the promo's state in the promos table
        UPDATE `promos`
        SET `state_id` = p_state_id
        WHERE `id` = p_promo_id;
    END IF;
END$$

DELIMITER ;