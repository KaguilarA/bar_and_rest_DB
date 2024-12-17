DELIMITER $$

-- Drop the function if it already exists
DROP FUNCTION IF EXISTS UpdateProductStock$$

-- Create a new function to update the stock of a product
CREATE FUNCTION UpdateProductStock(
    p_product_id INT,
    p_quantity INT
) RETURNS BOOLEAN
READS SQL DATA
BEGIN
    DECLARE type_exists INT;
    DECLARE has_stock BOOLEAN;

    -- Check if the product type ID exists and has_stock is true
    SELECT COUNT(*), has_stock INTO type_exists, has_stock
    FROM product_types
    WHERE id = (SELECT type_id FROM products WHERE id = p_product_id);

    -- If the product type ID does not exist or has_stock is false, signal an error
    IF type_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid product type ID';
    ELSEIF has_stock = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Product type does not support stock';
    ELSE
        -- Update the stock in the products table based on the quantity
        UPDATE products
        SET stock = stock - p_quantity
        WHERE id = p_product_id;
        RETURN TRUE;
    END IF;
    RETURN FALSE;
END$$

DELIMITER ;