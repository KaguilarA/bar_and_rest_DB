DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetProductsByState$$

-- Create a new procedure to get products by state
CREATE PROCEDURE GetProductsByState(IN p_state_id INT)
BEGIN
    -- Select products with the specified state along with their type and state information
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
        `products`.`id` ASC; -- Order the results by the name of the product in ascending order
END$$

DELIMITER ;