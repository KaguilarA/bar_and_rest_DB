DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetAllInvoices$$

-- Create a new procedure to get all invoices with their items (products and promos) and total amount
CREATE PROCEDURE GetAllInvoices()
BEGIN
    -- Select invoices with their items (products and promos) and total amount
    SELECT 
        i.id,
        i.name,
        i.date_created,
        s.name AS state,
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
                    'total', pr.price * ibi.quantity
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
            SELECT SUM(ibi.price * ibi.quantity)
            FROM items_by_invoice ibi
            JOIN promos pr ON ibi.promo_id = pr.id
            WHERE ibi.invoice_id = i.id
        ) AS total_promos,
        (
            -- Calculate the grand total amount of the invoice
            SELECT SUM(
                CASE
                    WHEN ibi.promo_id IS NOT NULL THEN ibi.price * ibi.quantity
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
    JOIN 
        states s ON i.state_id = s.id
    JOIN 
        users u ON i.author_id = u.id
    ORDER BY 
        i.date_created DESC; -- Order by date created in descending order
END$$

DELIMITER ;