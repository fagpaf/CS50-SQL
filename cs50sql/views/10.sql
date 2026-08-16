SELECT "contrast" AS "order_contrast"
FROM "views"
WHERE "contrast" > 0.45
ORDER BY "contrast" DESC;