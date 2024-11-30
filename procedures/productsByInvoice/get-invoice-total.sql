DELIMITER $$

DROP PROCEDURE IF EXISTS GetInvoiceTotal$$

CREATE PROCEDURE GetInvoiceTotal(IN p_invoice_id INT)
BEGIN
    DECLARE total DECIMAL(10, 2) DEFAULT 0.00;

    SELECT SUM(P.price * PBI.quantity) INTO total
    FROM `products_by_invoice` PBI
    JOIN `products` P ON P.id = PBI.product_id
    WHERE PBI.invoice_id = p_invoice_id;

    SELECT total AS totalAmount;
END$$

DELIMITER ;