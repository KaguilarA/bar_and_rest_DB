DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdateProductStock$$

-- Create a new procedure to update the stock of a product
CREATE PROCEDURE UpdateProductStock(
    IN p_product_id INT,
    IN p_stock_change INT
)
BEGIN
    DECLARE current_stock INT;

    -- Get the current stock of the product
    SELECT `stock` INTO current_stock
    FROM `products`
    WHERE `id` = p_product_id;

    -- Check if the new stock level is non-negative
    IF current_stock + p_stock_change >= 0 THEN
        -- Update the stock of the product
        UPDATE `products`
        SET `stock` = `stock` + p_stock_change
        WHERE `id` = p_product_id;
    ELSE
        -- Signal an error if the new stock level would be negative
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock cannot be negative';
    END IF;
END$$

DELIMITER ;