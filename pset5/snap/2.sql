SELECT "expires_timestamp"
FROM "messages"
WHERE "id" = 151;

QUERY PLAN
`--SEARCH messages USING INTEGER PRIMARY KEY (rowid=?)
Run Time: real 0.000 user 0.000079 sys 0.000000