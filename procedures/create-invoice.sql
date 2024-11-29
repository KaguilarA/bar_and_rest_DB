DELIMITER $$

DROP PROCEDURE IF EXISTS CreateInvoice$$

CREATE PROCEDURE CreateInvoice(
    IN p_name VARCHAR(100)
)
BEGIN
    INSERT INTO `invoices` (`name`)
    VALUES (p_name);
END$$

DELIMITER ;