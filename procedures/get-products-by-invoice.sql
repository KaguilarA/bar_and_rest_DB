DELIMITER $$

DROP PROCEDURE IF EXISTS GetProductsByInvoiceId$$

CREATE PROCEDURE GetProductsByInvoiceId(
    IN p_invoice_id INT
)
BEGIN
    SELECT 
        i.id AS invoice_id,
        i.date AS invoice_date,
        i.name AS invoice_name,
        p.id AS product_id,
        p.name AS product_name,
        p.type AS product_type,
        pbi.quantity AS quantity,
        p.price AS price,
        (p.price * pbi.quantity) AS total_price
    FROM 
        products_by_invoice pbi
    INNER JOIN 
        products p ON pbi.product_id = p.id
    INNER JOIN
        invoices i ON pbi.invoice_id = i.id
    WHERE 
        pbi.invoice_id = p_invoice_id;
END$$

DELIMITER ;