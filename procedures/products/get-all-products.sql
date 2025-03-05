DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetAllProducts$$

-- Create a new procedure to get all products
CREATE PROCEDURE GetAllProducts()
BEGIN
    -- Select all products with their type, state, and images information
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
            SELECT GetImagesByProductId(p.id)
        ) AS images
    FROM 
        products p
    INNER JOIN 
        product_types pt ON p.type_id = pt.id
    INNER JOIN 
        states s ON p.state_id = s.id
    ORDER BY 
        p.id ASC; -- Order the results by the ID of the product in ascending order
END$$

DELIMITER ;