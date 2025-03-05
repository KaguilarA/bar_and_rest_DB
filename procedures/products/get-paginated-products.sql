DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetPaginatedProducts$$

CREATE PROCEDURE GetPaginatedProducts(
    IN p_page INT, 
    IN p_page_size INT
)
BEGIN
    DECLARE v_offset INT;

    -- Validar que los parámetros sean mayores que 0
    IF p_page < 1 THEN
        SET p_page = 1;
    END IF;
    IF p_page_size < 1 THEN
        SET p_page_size = 10; -- Valor por defecto
    END IF;
    
    -- Calcular el OFFSET
    SET v_offset = (p_page - 1) * p_page_size;

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
        p.id ASC -- Order the results by the name of the product in ascending order
    LIMIT p_page_size OFFSET v_offset;
END$$

DELIMITER ;