DELIMITER $$

DROP PROCEDURE IF EXISTS GetAllInvoices$$

CREATE PROCEDURE GetAllInvoices()
BEGIN
    SELECT * FROM `invoices`;
END$$

DELIMITER ;