DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetProductById$$

-- Create a new procedure to get a product by ID
CREATE PROCEDURE GetProductById(IN p_id INT)
BEGIN
    -- Select the product with the specified ID along with its type and state information
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
        `products`.`id` = p_id;
END$$

DELIMITER ;