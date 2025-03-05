DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetProductsByState$$

-- Create a new procedure to get products by state
CREATE PROCEDURE GetProductsByState(IN p_state_id INT)
BEGIN
    -- Select products with the specified state along with their type, state, and images information
    SELECT 
        p.id, 
        p.name, 
        p.description, 
        p.stock, 
        p.price, 
        pt.name AS type, 
        s.name AS state, 
        p.date_created, 
        p.date_updated,
        (
            SELECT GetImagesByProductId(pi.product_id)
        ) AS images
    FROM 
        products p
    INNER JOIN 
        product_types pt ON p.type_id = pt.id
    INNER JOIN 
        states s ON p.state_id = s.id
    WHERE 
        p.state_id = p_state_id
    ORDER BY 
        p.id ASC; -- Order the results by the ID of the product in ascending order
END$$

DELIMITER ;