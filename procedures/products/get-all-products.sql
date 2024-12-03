DELIMITER $$
-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetAllProducts$$

-- Create a new procedure to get all products
CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM `products`;
END$$

DELIMITER ;