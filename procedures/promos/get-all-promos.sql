DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetAllPromos$$

-- Create a new procedure to get all promos along with their associated products
CREATE PROCEDURE GetAllPromos()
BEGIN
    -- Select all promos with their state information and associated products
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
        GROUP_CONCAT(`products`.`name` ORDER BY `products`.`id` ASC) AS product_names,
        GROUP_CONCAT(`items_by_promos`.`quantity` ORDER BY `products`.`id` ASC) AS product_quantities
    FROM 
        `promos`
    INNER JOIN 
        `states` ON `promos`.`state_id` = `states`.`id`
    LEFT JOIN 
        `items_by_promos` ON `promos`.`id` = `items_by_promos`.`promo_id`
    LEFT JOIN 
        `products` ON `items_by_promos`.`product_id` = `products`.`id`
    GROUP BY 
        `promos`.`id`
    ORDER BY 
        `promos`.`name` ASC; -- Order the results by the name of the promo in ascending order
END$$

DELIMITER ;