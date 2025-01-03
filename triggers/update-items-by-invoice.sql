DELIMITER $$

-- Drop triggers if they already exist
DROP TRIGGER IF EXISTS `items_by_invoice_before_update`;

-- Create trigger to enforce product_id XOR promo_id logic
CREATE TRIGGER `items_by_invoice_before_update`
BEFORE UPDATE ON `items_by_invoice`
FOR EACH ROW
BEGIN
    IF (NEW.`product_id` IS NULL AND NEW.`promo_id` IS NULL) OR 
       (NEW.`product_id` IS NOT NULL AND NEW.`promo_id` IS NOT NULL) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Either product_id or promo_id must be set, but not both.';
    END IF;
END$$

DELIMITER ;