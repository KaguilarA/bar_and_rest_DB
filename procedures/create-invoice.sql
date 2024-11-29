DELIMITER $$

CREATE PROCEDURE CreateInvoice(
    IN p_name VARCHAR(100)
)
BEGIN
    DECLARE p_date DATETIME DEFAULT CURRENT_TIMESTAMP;

    INSERT INTO `invoices` (`date`, `name`)
    VALUES (p_date, p_name);
END$$

DELIMITER ;