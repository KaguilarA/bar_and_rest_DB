DELIMITER $$

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS GetPermissionsByIds$$

-- Create a new procedure to get permissions by an array of IDs
CREATE PROCEDURE GetPermissionsByIds(
    IN p_ids JSON
)
BEGIN
    -- Create a temporary table to store the IDs
    CREATE TEMPORARY TABLE temp_ids (id INT);

    -- Insert the IDs into the temporary table
    INSERT INTO temp_ids (id)
    SELECT value FROM JSON_TABLE(p_ids, '$[*]' COLUMNS (value INT PATH '$'));

    -- Select the permissions with the specified IDs from the permissions table
    SELECT 
        `id`, 
        `name`, 
        `description`
    FROM 
        `permissions`
    WHERE 
        `id` IN (SELECT id FROM temp_ids);

    -- Drop the temporary table
    DROP TEMPORARY TABLE IF EXISTS temp_ids;
END$$

DELIMITER ;