DELIMITER $$

CREATE PROCEDURE get_products_paginated(
    IN p_limit INT,
    IN p_offset INT
)
BEGIN
    SELECT 
        p.id,
        p.name,
        p.description,
        p.stock,
        p.on_landing,
        p.date_created,
        p.date_updated,
        pt.id AS product_type_id,
        pt.name AS product_type_name,
        pt.has_stock,
        s.id AS state_id,
        s.name AS state_name,
        (
            SELECT pr.amount
            FROM prices pr
            WHERE pr.product_id = p.id AND pr.is_current = TRUE
            LIMIT 1
        ) AS current_price
    FROM products p
    INNER JOIN product_types pt ON p.type_id = pt.id
    INNER JOIN states s ON p.state_id = s.id
    WHERE s.id = 1 -- opcional: filtra solo activos
    LIMIT p_limit OFFSET p_offset;
END $$

DELIMITER ;
