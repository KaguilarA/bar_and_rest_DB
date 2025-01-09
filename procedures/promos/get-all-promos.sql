DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetAllPromos$$

-- Create a new procedure to get all promos along with their associated products
CREATE PROCEDURE GetAllPromos()
BEGIN
    -- Select all promos with their state information and associated products
    SELECT 
        `promos`.`id` AS `id`, 
        `promos`.`name` AS `name`, 
        `promos`.`price` AS `price`, 
        `promos`.`days_of_week` AS `days_of_week`, 
        `promos`.`specific_date` AS `specific_date`, 
        `promos`.`image_url` AS `image_url`, 
        `states`.`name` AS `state`, 
        `promos`.`date_created` AS `date_created`, 
        `promos`.`date_updated` AS `date_updated`,
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
    GROUP BY 
        `promos`.`id`;
END$$

DELIMITER ;