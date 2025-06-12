DELIMITER $$

CREATE TRIGGER trg_restore_stock_on_cart_item_delete
AFTER DELETE ON cart_items
FOR EACH ROW
BEGIN
  IF OLD.product_id IS NOT NULL THEN
    UPDATE products
    SET stock = stock + OLD.quantity
    WHERE id = OLD.product_id;
  END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_restore_stock_on_cart_promo_product_delete
AFTER DELETE ON cart_promo_products
FOR EACH ROW
BEGIN
  UPDATE products
  SET stock = stock + OLD.quantity
  WHERE id = OLD.product_id;
END $$

DELIMITER ;
