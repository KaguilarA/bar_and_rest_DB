DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetPaginatedProductsByState$$

-- Create a new procedure to get products by type
CREATE PROCEDURE GetPaginatedProductsByState(
    IN p_page INT, 
    IN p_page_size INT,
    IN p_state_id INT
)
BEGIN
    DECLARE v_offset INT;

    -- Validar que los parámetros sean mayores que 0
    IF p_page < 1 THEN
        SET p_page = 1;
    END IF;
    IF p_page_size < 1 THEN
        SET p_page_size = 10; -- Valor por defecto
    END IF;
    
    -- Calcular el OFFSET
    SET v_offset = (p_page - 1) * p_page_size;


    -- Select products with the specified type along with their type and state information
    SELECT 
        `products`.`id`, 
        `products`.`name`, 
        `products`.`description`, 
        `products`.`image_url`, 
        `products`.`stock`, 
        `products`.`price`, 
        `product_types`.`name` AS `type`, 
        `states`.`name` AS `state`, 
        `products`.`date_created`, 
        `products`.`date_updated`
    FROM 
        `products`
    INNER JOIN 
        `product_types` ON `products`.`type_id` = `product_types`.`id`
    INNER JOIN 
        `states` ON `products`.`state_id` = `states`.`id`
    WHERE 
        `products`.`state_id` = p_state_id
    ORDER BY 
        `products`.`id` ASC -- Order the results by the name of the product in ascending order
    LIMIT p_page_size OFFSET v_offset;
END$$

DELIMITER ;