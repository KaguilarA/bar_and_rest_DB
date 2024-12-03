DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetAllInvoices$$

-- Create a new procedure to get all invoices along with their products and total amount
CREATE PROCEDURE GetAllInvoices()
BEGIN
    -- Select invoices with their products and total amount
    SELECT 
        i.id AS invoice_id,
        i.name AS invoice_name,
        i.date_created AS invoice_date,
        (
            -- Subquery to get products associated with the invoice
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
            -- Subquery to calculate the total amount of the invoice
            SELECT SUM(p.price * pbi.quantity)
            FROM products_by_invoice pbi
            JOIN products p ON pbi.product_id = p.id
            WHERE pbi.invoice_id = i.id
        ) AS total_amount
    FROM 
        invoices i
    ORDER BY 
        i.date_created DESC; -- Order the results by the date of creation in descending order
END$$

DELIMITER ;