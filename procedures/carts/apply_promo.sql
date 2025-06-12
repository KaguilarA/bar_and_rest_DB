DELIMITER $$

CREATE PROCEDURE apply_cart_promo_once(IN cartId INT)
BEGIN
    DECLARE deleted_id INT DEFAULT 3;
    DECLARE to_pay_id INT DEFAULT 2;

    DECLARE done INT DEFAULT FALSE;
    DECLARE v_promo_id INT;
    DECLARE v_quantity INT;

    DECLARE promo_cursor CURSOR FOR
        SELECT p.id, p.products_quantity
        FROM promos p
        WHERE p.state_id != deleted_id;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN promo_cursor;

    promo_loop: LOOP
        FETCH promo_cursor INTO v_promo_id, v_quantity;
        IF done THEN
            LEAVE promo_loop;
        END IF;

        -- Check if all required products for the promo are in the cart
        IF (
            SELECT COUNT(*)
            FROM products_by_promos pbp
            WHERE pbp.promo_id = v_promo_id AND pbp.product_id IN (
                SELECT ci.product_id
                FROM cart_items ci
                WHERE ci.cart_id = cartId AND ci.state_id != deleted_id AND ci.product_id IS NOT NULL
            )
        ) = (
            SELECT COUNT(*) FROM products_by_promos WHERE promo_id = v_promo_id
        ) THEN

            -- Insert promo into cart
            INSERT INTO cart_items (
                cart_id, promo_id, quantity, unit_price, state_id
            ) VALUES (
                cartId, v_promo_id, v_quantity,
                (SELECT amount FROM prices WHERE promo_id = v_promo_id AND is_current = TRUE LIMIT 1),
                to_pay_id
            );

            -- Link promo to products
            INSERT INTO cart_promo_products (cart_item_id, product_id, quantity, state_id)
            SELECT 
                LAST_INSERT_ID(), pbp.product_id, 1, to_pay_id
            FROM products_by_promos pbp
            WHERE pbp.promo_id = v_promo_id;

            -- Mark individual products as deleted
            UPDATE cart_items
            SET state_id = deleted_id
            WHERE cart_id = cartId AND product_id IN (
                SELECT product_id FROM products_by_promos WHERE promo_id = v_promo_id
            ) AND state_id != deleted_id;

            -- Promo applied, exit loop
            LEAVE promo_loop;
        END IF;
    END LOOP;

    CLOSE promo_cursor;
END$$

DELIMITER ;
