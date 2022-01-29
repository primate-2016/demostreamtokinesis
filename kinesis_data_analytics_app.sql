-- This is used in the Kinesis Data Analytics app which operates on the 
-- Kinesis stream - pasted into console

CREATE OR REPLACE STREAM "DESTINATION_USER_DATA" (
    first VARCHAR(16), 
    last VARCHAR(16), 
    age INTEGER, 
    gender VARCHAR(16), 
    latitude FLOAT, 
    longitude FLOAT
);
CREATE OR REPLACE PUMP "STREAM_PUMP" AS INSERT INTO "DESTINATION_USER_DATA"

SELECT STREAM "first", "last", "age", "gender", "latitude", "longitude"
FROM "SOURCE_SQL_STREAM_001"
WHERE "age" >= 21;