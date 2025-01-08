DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdatePromoState$$

-- Create a new procedure to update a promo's state
CREATE PROCEDURE UpdatePromoState(
    IN p_promo_id INT,
    IN p_state_id INT
)
BEGIN
    -- Update the promo's state in the promos table
    UPDATE `promos`
    SET `state_id` = p_state_id,
        `date_updated` = CURRENT_TIMESTAMP
    WHERE `id` = p_promo_id;
END$$

DELIMITER ;