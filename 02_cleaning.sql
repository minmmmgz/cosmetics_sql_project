-- 02. 정제 테이블 생성
DROP TABLE IF EXISTS cosmetics_clean;

CREATE TABLE cosmetics_clean AS
SELECT
    STR_TO_DATE(REPLACE(TRIM(event_time), ' UTC', ''), '%Y-%m-%d %H:%i:%s') AS event_time,
    LOWER(TRIM(event_type)) AS event_type,
    product_id,
    category_id,
    NULLIF(LOWER(TRIM(brand)), '') AS brand,
    price,
    user_id,
    NULLIF(TRIM(user_session), '') AS user_session
FROM cosmetics_raw WHERE price >= 0;

-- 정제 테이블 확인 
SELECT *
FROM cosmetics_clean
LIMIT 10;

SHOW COLUMNS FROM cosmetics_clean;

-- 정제 테이블 행 개수
SELECT COUNT(*) AS clean_rows
FROM cosmetics_clean;



