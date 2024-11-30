DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateProductQuantityInvoice$$

CREATE PROCEDURE UpdateProductQuantityInvoice(
    IN p_invoice_id INT,
    IN p_product_id INT,
    IN p_new_quantity INT
)
BEGIN
    DECLARE current_quantity INT;

    SELECT `quantity` INTO current_quantity
    FROM `products_by_invoice`
    WHERE `invoice_id` = p_invoice_id AND `product_id` = p_product_id;

    IF current_quantity IS NOT NULL THEN
        UPDATE `products_by_invoice`
        SET `quantity` = p_new_quantity
        WHERE `invoice_id` = p_invoice_id AND `product_id` = p_product_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Product in invoice does not exist';
    END IF;
END$$

DELIMITER ;