DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetLandingPromos$$

-- Create a new procedure to get all landing promos along with their associated products
CREATE PROCEDURE GetLandingPromos()
BEGIN
    -- Select the promos on the landing page along with their state information and associated products
    SELECT 
        `promos`.`id` AS promo_id, 
        `promos`.`name` AS promo_name, 
        `promos`.`price` AS promo_price, 
        `promos`.`image_url` AS promo_image_url, 
        GROUP_CONCAT(`products`.`id` ORDER BY `products`.`id` ASC) AS product_ids,
        GROUP_CONCAT(`products`.`name` ORDER BY `products`.`id` ASC) AS product_names,
        GROUP_CONCAT(`products_by_promos`.`quantity` ORDER BY `products`.`id` ASC) AS product_quantities
    FROM 
        `promos`
    INNER JOIN 
        `states` ON `promos`.`state_id` = `states`.`id`
    LEFT JOIN 
        `products_by_promos` ON `promos`.`id` = `products_by_promos`.`promo_id`
    LEFT JOIN 
        `products` ON `products_by_promos`.`product_id` = `products`.`id`
    WHERE 
        `promos`.`on_landing` = TRUE
    GROUP BY 
        `promos`.`id`
    ORDER BY 
        `promos`.`name` ASC; -- Order the results by the name of the promo in ascending order
END$$

DELIMITER ;