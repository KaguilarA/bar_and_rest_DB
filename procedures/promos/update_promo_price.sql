DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdatePromoPrice$$

-- Create a new procedure to update the price in the promos table
CREATE PROCEDURE UpdatePromoPrice(
    IN p_promo_id INT,
    IN p_price INT
)
BEGIN
    -- Update the price in the promos table
    UPDATE `promos`
    SET `price` = p_price,
        `date_updated` = CURRENT_TIMESTAMP
    WHERE `id` = p_promo_id;
END$$

DELIMITER ;