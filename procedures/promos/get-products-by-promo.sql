DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetProductsByPromo$$

-- Create a new procedure to get products by promo ID
CREATE PROCEDURE GetProductsByPromo(
    IN p_promo_id INT
)
BEGIN
    -- Select products associated with the given promo ID
    SELECT 
        p.id AS `id`,
        p.name AS `name`,
        p.description AS `description`,
        pt.name AS `type`,
        s.name AS `state`,
        p.date_created AS `date_created`,
        p.date_updated AS `date_updated`
    FROM 
        products p
    INNER JOIN 
        products_by_promos pbp ON p.id = pbp.product_id
    INNER JOIN 
        product_types pt ON p.type_id = pt.id
    INNER JOIN 
        states s ON p.state_id = s.id
    WHERE 
        pbp.promo_id = p_promo_id
        AND p.state_id = 1;
END$$

DELIMITER ;