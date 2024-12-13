DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetInvoicesByState$$

-- Create a new procedure to get an invoice by state along with its products and total amount
CREATE PROCEDURE GetInvoicesByState(IN p_state ENUM('pendiente', 'cancelada', 'anulada'))
BEGIN
    -- Select the invoice with its products and total amount
    SELECT 
        i.id,
        i.name,
        i.date_created,
        (
            -- Subquery to get products associated with the invoice
            SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'id', p.id,
                    'name', p.name,
                    'quantity', pbi.quantity,
                    'price', p.price,
                    'total', p.price * pbi.quantity
                )
            )
            FROM items_by_invoice pbi
            JOIN products p ON pbi.product_id = p.id
            WHERE pbi.invoice_id = i.id
        ) AS products,
        (
            -- Subquery to calculate the total amount of the invoice
            SELECT SUM(p.price * pbi.quantity)
            FROM items_by_invoice pbi
            JOIN products p ON pbi.product_id = p.id
            WHERE pbi.invoice_id = i.id
        ) AS total_amount
    FROM 
        invoices i
    WHERE 
        i.state = p_state;
END$$

DELIMITER ;