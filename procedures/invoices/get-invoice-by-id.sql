DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetInvoiceById$$

-- Create a new procedure to get invoice data by ID
CREATE PROCEDURE GetInvoiceById(
    IN p_id INT
)
BEGIN
    -- Select the invoice data with the specified ID
    SELECT 
        i.id,
        i.date_created,
        i.total_amount,
        (
            -- Subquery to get products associated with the invoice
            SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'id', p.id,
                    'name', p.name,
                    'quantity', ibi.quantity,
                    'price', ibi.price,
                    'total', ibi.price * ibi.quantity
                )
            )
            FROM items_by_invoice ibi
            JOIN products p ON ibi.product_id = p.id
            WHERE ibi.invoice_id = i.id
        ) AS products,
        (
            -- Subquery to get promos associated with the invoice
            SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'id', pr.id,
                    'name', pr.name,
                    'quantity', ibi.quantity,
                    'price', pr.price,
                    'total', pr.price
                )
            )
            FROM items_by_invoice ibi
            JOIN promos pr ON ibi.promo_id = pr.id
            WHERE ibi.invoice_id = i.id
        ) AS promos,
        (
            -- Subquery to calculate the total amount of the products in the invoice
            SELECT SUM(ibi.price * ibi.quantity)
            FROM items_by_invoice ibi
            JOIN products p ON ibi.product_id = p.id
            WHERE ibi.invoice_id = i.id
        ) AS total_products,
        (
            -- Subquery to calculate the total amount of the promos in the invoice
            SELECT SUM(pr.price)
            FROM items_by_invoice ibi
            JOIN promos pr ON ibi.promo_id = pr.id
            WHERE ibi.invoice_id = i.id
        ) AS total_promos,
        (
            -- Calculate the grand total amount of the invoice
            SELECT SUM(
                CASE
                    WHEN ibi.promo_id IS NOT NULL THEN pr.price
                    ELSE ibi.price * ibi.quantity
                END
            )
            FROM items_by_invoice ibi
            LEFT JOIN products p ON ibi.product_id = p.id
            LEFT JOIN promos pr ON ibi.promo_id = pr.id
            WHERE ibi.invoice_id = i.id
        ) AS total_amount
    FROM 
        invoices i
    WHERE 
        i.id = p_id;
END$$

DELIMITER ;