DELIMITER $$

CREATE PROCEDURE GetInvoiceById(IN p_id INT)
BEGIN
    SELECT * FROM `invoices` WHERE `id` = p_id;
END$$

DELIMITER ;