DELIMITER $$

DROP PROCEDURE IF EXISTS AddProductToInvoice$$

CREATE PROCEDURE AddProductToInvoice(
    IN p_invoice_id INT,
    IN p_product_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE current_stock INT;

    SELECT stock INTO current_stock
    FROM products
    WHERE id = p_product_id;

    IF current_stock >= p_quantity THEN
        INSERT INTO products_by_invoice (invoice_id, product_id, quantity)
        VALUES (p_invoice_id, p_product_id, p_quantity);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock for this product';
    END IF;
END$$

DELIMITER ;