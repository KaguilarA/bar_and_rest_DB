DELIMITER $$

CREATE TRIGGER trg_decrease_stock_on_cart_item_insert
AFTER INSERT ON cart_items
FOR EACH ROW
BEGIN
  IF NEW.product_id IS NOT NULL THEN
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE id = NEW.product_id;
  END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_decrease_stock_on_cart_promo_product_insert
AFTER INSERT ON cart_promo_products
FOR EACH ROW
BEGIN
  UPDATE products
  SET stock = stock - NEW.quantity
  WHERE id = NEW.product_id;
END $$

DELIMITER ;
