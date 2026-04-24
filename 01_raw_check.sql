-- 01. 원본 상태 확인
SELECT COUNT(*) AS Total_Rows FROM cosmetics_raw; -- 행 개수 확인
SELECT * FROM cosmetics_raw LIMIT 10; -- 샘플 데이터 확인
SHOW COLUMNS FROM cosmetics_raw; -- 컬럼 구조 확인 

-- event_type 값 확인
SELECT event_type FROM cosmetics_raw GROUP BY event_type LIMIT 10; 

-- 결측치 확인
SELECT
    SUM(CASE WHEN event_time IS NULL OR TRIM(event_time) = '' THEN 1 ELSE 0 END) AS missing_event_time,
    SUM(CASE WHEN event_type IS NULL OR TRIM(event_type) = '' THEN 1 ELSE 0 END) AS missing_event_type,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS missing_product_id,
    SUM(CASE WHEN category_id IS NULL THEN 1 ELSE 0 END) AS missing_category_id,
    SUM(CASE WHEN category_code IS NULL OR TRIM(category_code) = '' THEN 1 ELSE 0 END) AS missing_category_code,
    SUM(CASE WHEN brand IS NULL OR TRIM(brand) = '' THEN 1 ELSE 0 END) AS missing_brand,
    SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS missing_price,
    SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS missing_user_id,
    SUM(CASE WHEN user_session IS NULL OR TRIM(user_session) = '' THEN 1 ELSE 0 END) AS missing_user_session
FROM cosmetics_raw;

-- 수치형 값 상태 확인
SELECT 
	MIN(price) AS min_price,
    MAX(price) AS max_price,
    AVG(price) AS avg_price
FROM cosmetics_raw; 

    
	