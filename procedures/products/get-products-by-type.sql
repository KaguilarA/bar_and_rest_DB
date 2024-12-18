DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetProductsByType$$

-- Create a new procedure to get products by type
CREATE PROCEDURE GetProductsByType(IN p_type_id INT)
BEGIN
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
        `products`.`type_id` = p_type_id
    ORDER BY 
        `products`.`name` ASC; -- Order the results by the name of the product in ascending order
END$$

DELIMITER ;