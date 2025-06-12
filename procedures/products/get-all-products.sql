DELIMITER $$

CREATE PROCEDURE `GetAllProducts`()
BEGIN
    SELECT 
        p.id,
        p.name,
        p.description,
        CASE WHEN pt.has_stock = TRUE THEN p.stock ELSE NULL END AS stock,
        p.on_landing,
        p.date_created,
        p.date_updated,
        p.state_id,
        s.name AS state_name,
        p.type_id,
        pt.name AS type_name,
        pt.has_stock,
        p.author_id,
        u.name AS author_name,
        u.lastname AS author_lastname,
        pr.amount AS current_price
    FROM products p
    INNER JOIN states s ON p.state_id = s.id
    INNER JOIN product_types pt ON p.type_id = pt.id
    INNER JOIN users u ON p.author_id = u.id
    LEFT JOIN prices pr ON pr.product_id = p.id AND pr.is_current = TRUE;
END$$

DELIMITER ;
