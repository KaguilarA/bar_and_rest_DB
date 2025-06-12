DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS CreateProduct$$

CREATE PROCEDURE `CreateProduct` (
    IN p_name VARCHAR(255),
    IN p_description TEXT,
    IN p_stock INT,
    IN p_on_landing BOOLEAN,
    IN p_type_id INT,
    IN p_state_id INT,
    IN p_author_id INT,
    IN p_price DECIMAL(10,2)
)
BEGIN
    DECLARE new_product_id INT;
    DECLARE v_has_stock BOOLEAN;

    SELECT has_stock INTO v_has_stock
    FROM product_types
    WHERE id = p_type_id;

    IF v_has_stock AND (p_stock IS NULL OR p_stock <= 0) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Este tipo de producto requiere un valor válido de stock.';
    END IF;

    INSERT INTO products (
        name, description, stock, on_landing,
        type_id, state_id, author_id, date_created, date_updated
    ) VALUES (
        p_name, p_description,
        IF(v_has_stock, p_stock, NULL),
        p_on_landing,
        p_type_id, p_state_id, p_author_id,
        NOW(), NOW()
    );

    -- Obtener el ID del producto recién insertado
    SET new_product_id = LAST_INSERT_ID();

    -- Insertar el precio
    INSERT INTO prices (
        product_id, amount, is_current, date_created
    ) VALUES (
        new_product_id, p_price, TRUE, NOW()
    );
END$$

DELIMITER ;
