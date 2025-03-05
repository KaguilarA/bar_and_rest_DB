DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetProductById$$

-- Create a new procedure to get a product by ID
CREATE PROCEDURE GetProductById(IN p_id INT)
BEGIN
    -- Select products with the specified id along with their type, state, and images information
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
        p.id = p_id;
END$$

DELIMITER ;