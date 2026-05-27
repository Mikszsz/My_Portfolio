CREATE database project;
USE project;

SELECT * FROM calls ;

CREATE TABLE calls (
    ID CHAR(50),
    cust_name CHAR(50),
    sentiment CHAR(20),
    csat_score INT,
    call_timestamp CHAR(10),
    reason CHAR(20),
    city CHAR(20),
    state CHAR(20),
    channel CHAR(20),
    response_time CHAR(20),
    call_duration_minutes INT,
    call_center CHAR(20)
);
SET SQL_SAFE_UPDATES = 0;

UPDATE calls 
SET call_timestamp = STR_TO_DATE(call_timestamp, '%m/%d/%Y');

SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;

UPDATE calls 
SET csat_score = NULL 
WHERE csat_score = '0';

SET SQL_SAFE_UPDATES = 1;

SELECT * FROM calls LIMIT 10;

SELECT COUNT(*) AS rows_num FROM calls;
SELECT COUNT(*) AS cols_num FROM information_schema.columns WHERE table_name = 'calls';

SELECT DISTINCT sentiment FROM calls;
SELECT DISTINCT reason FROM calls;
SELECT DISTINCT channel FROM calls;
SELECT DISTINCT response_time FROM calls;
SELECT DISTINCT call_center FROM calls;

SELECT DAYNAME(STR_TO_DATE(call_timestamp, '%m/%d/%Y')) AS day_of_call, COUNT(*) AS num_of_calls FROM calls GROUP BY 1 ORDER BY 2 DESC;

SELECT sentiment, count(*), ROUND((COUNT(*) / (SELECT COUNT(*) FROM calls)) * 100, 1) AS pct
FROM calls GROUP BY 1 ORDER BY 3 DESC;

SELECT reason, count(*), ROUND((COUNT(*) / (SELECT COUNT(*) FROM calls)) * 100, 1) AS pct
FROM calls GROUP BY 1 ORDER BY 3 DESC;

SELECT channel, count(*), ROUND((COUNT(*) / (SELECT COUNT(*) FROM calls)) * 100, 1) AS pct
FROM calls GROUP BY 1 ORDER BY 3 DESC;

SELECT response_time, count(*), ROUND((COUNT(*) / (SELECT COUNT(*) FROM calls)) * 100, 1) AS pct
FROM calls GROUP BY 1 ORDER BY 3 DESC;

SELECT call_center, count(*), ROUND((COUNT(*) / (SELECT COUNT(*) FROM calls)) * 100, 1) AS pct
FROM calls GROUP BY 1 ORDER BY 3 DESC;

SELECT state, COUNT(*) FROM calls GROUP BY 1 ORDER BY 2 DESC;

SELECT DAYNAME(STR_TO_DATE(call_timestamp, '%m/%d/%Y')) AS Day_of_call, COUNT(*) AS num_of_calls 
FROM calls GROUP BY 1 ORDER BY 2 DESC;

SELECT MIN(csat_score), MAX(csat_score), ROUND(AVG(csat_score),1)
FROM calls WHERE csat_score != 0;

SELECT MIN(call_timestamp), MAX(call_timestamp)
FROM calls;

SELECT MIN(call_duration_minutes), MAX(call_duration_minutes), AVG(call_duration_minutes)
FROM calls;

SELECT call_center, response_time, COUNT(*)
FROM calls GROUP BY 1,2 ORDER BY 1,3 DESC;

SELECT call_center, AVG(call_duration_minutes)
FROM calls GROUP BY 1 ORDER BY 2 DESC;

SELECT channel, AVG(call_duration_minutes)
FROM calls GROUP BY 1 ORDER BY 2 DESC;

SELECT state, COUNT(*)
FROM calls GROUP BY 1 ORDER BY 2 DESC;

SELECT state, reason, COUNT(*)
FROM calls GROUP BY 1,2 ORDER BY 1,3 DESC;

SELECT state, sentiment, COUNT(*)
FROM calls GROUP BY 1,2 ORDER BY 1,3 DESC;

SELECT state, AVG(csat_score)
FROM calls WHERE csat_score != 0 GROUP BY 1 ORDER BY 2 DESC;

SELECT sentiment, AVG(call_duration_minutes)
FROM calls GROUP BY 1 ORDER BY 2 DESC;

SELECT call_timestamp, MAX(call_duration_minutes) OVER(PARTITION BY call_timestamp) AS max_call_duration
FROM calls ORDER BY 2 DESC;

