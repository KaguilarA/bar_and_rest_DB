DELIMITER $$

DROP PROCEDURE IF EXISTS CreateInvoice$$

CREATE PROCEDURE CreateInvoice(
    IN p_name VARCHAR(100),
    IN p_product_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE invoice_id INT;

    INSERT INTO `invoices` (`name`)
    VALUES (p_name);

    SET invoice_id = LAST_INSERT_ID();

    INSERT INTO `products_by_invoice` (`invoice_id`, `product_id`, `quantity`)
    VALUES (invoice_id, p_product_id, p_quantity);
END$$

DELIMITER ;