DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdateOnLandingPromo$$

CREATE PROCEDURE UpdateOnLandingPromo(
    IN p_promo_id INT,
    IN p_on_landing BOOLEAN
)
BEGIN
    -- Update the on_landing field of the promo
    UPDATE `promos`
    SET `on_landing` = p_on_landing,
        `date_updated` = CURRENT_TIMESTAMP
    WHERE `id` = p_promo_id;
END$$

DELIMITER ;