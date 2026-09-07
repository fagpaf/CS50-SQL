-- *** The Lost Letter ***
SELECT address, type
FROM addresses
JOIN scans 
    ON addresses.id = scans.address_id
JOIN packages 
    ON scans.package_id = packages.id
WHERE packages.from_address_id = (
    SELECT id 
    FROM addresses 
    WHERE address = '900 Somerville Avenue'
)
    AND packages.contents LIKE '%letter%';

-- *** The Devious Delivery ***
SELECT contents, addresses.type
FROM packages
JOIN scans 
    ON packages.id = scans.package_id
JOIN addresses 
    ON scans.address_id = addresses.id
WHERE packages.from_address_id IS NULL
    AND scans.action = 'Drop';

-- *** The Forgotten Gift ***
SELECT packages.contents, drivers.name
FROM packages
JOIN scans 
    ON packages.id = scans.package_id
JOIN drivers 
    ON scans.driver_id = drivers.id
WHERE packages.from_address_id = (
    SELECT id 
    FROM addresses 
    WHERE address = '109 Tileston Street')
ORDER BY scans.timestamp DESC
LIMIT 1;