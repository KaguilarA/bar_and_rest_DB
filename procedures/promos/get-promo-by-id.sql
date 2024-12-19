DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetPromoById$$

-- Create a new procedure to get a promo by ID along with its associated products
CREATE PROCEDURE GetPromoById(IN p_id INT)
BEGIN
    -- Select the promo with the specified ID along with its state information and associated products
    SELECT 
        `promos`.`id` AS promo_id, 
        `promos`.`name` AS promo_name, 
        `promos`.`price` AS promo_price, 
        `promos`.`days_of_week` AS promo_days_of_week, 
        `promos`.`specific_date` AS promo_specific_date, 
        `promos`.`image_url` AS promo_image_url, 
        `states`.`name` AS promo_state, 
        `promos`.`date_created` AS promo_date_created, 
        `promos`.`date_updated` AS promo_date_updated,
        GROUP_CONCAT(`products`.`id` ORDER BY `products`.`id` ASC) AS product_ids,
        GROUP_CONCAT(`products`.`name` ORDER BY `products`.`id` ASC) AS product_names
    FROM 
        `promos`
    INNER JOIN 
        `states` ON `promos`.`state_id` = `states`.`id`
    LEFT JOIN 
        `products_by_promos` ON `promos`.`id` = `products_by_promos`.`promo_id`
    LEFT JOIN 
        `products` ON `products_by_promos`.`product_id` = `products`.`id`
    WHERE 
        `promos`.`id` = p_id
    GROUP BY 
        `promos`.`id`
    ORDER BY 
        `promos`.`name` ASC; -- Order the results by the name of the promo in ascending order
END$$

DELIMITER ;