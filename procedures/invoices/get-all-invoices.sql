DELIMITER $$

DROP PROCEDURE IF EXISTS GetAllInvoices$$

CREATE PROCEDURE GetAllInvoices()
BEGIN
    SELECT 
        i.id AS invoice_id,
        i.name AS invoice_name,
        i.date_created AS invoice_date,
        (
            SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'product_id', p.id,
                    'product_name', p.name,
                    'quantity', pbi.quantity,
                    'price', p.price,
                    'total', p.price * pbi.quantity
                )
            )
            FROM products_by_invoice pbi
            JOIN products p ON pbi.product_id = p.id
            WHERE pbi.invoice_id = i.id
        ) AS products,
        (
            SELECT SUM(p.price * pbi.quantity)
            FROM products_by_invoice pbi
            JOIN products p ON pbi.product_id = p.id
            WHERE pbi.invoice_id = i.id
        ) AS total_amount
    FROM 
        invoices i
    ORDER BY 
        i.date_created DESC;
END$$

DELIMITER ;