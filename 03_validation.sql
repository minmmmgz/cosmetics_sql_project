-- 3. 정제 후 검수

-- 컬럼 타입 확인
SHOW COLUMNS FROM cosmetics_clean;

-- event_type 값 분포 확인
SELECT event_type, COUNT(*) AS cnt
FROM cosmetics_clean
GROUP BY event_type
ORDER BY cnt DESC;

-- 5. 결측치 확인
SELECT
    SUM(CASE WHEN event_time IS NULL THEN 1 ELSE 0 END) AS missing_event_time,
    SUM(CASE WHEN event_type IS NULL OR TRIM(event_type) = '' THEN 1 ELSE 0 END) AS missing_event_type,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS missing_product_id,
    SUM(CASE WHEN category_id IS NULL THEN 1 ELSE 0 END) AS missing_category_id,
    SUM(CASE WHEN brand IS NULL THEN 1 ELSE 0 END) AS missing_brand,
    SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS missing_price,
    SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS missing_user_id,
    SUM(CASE WHEN user_session IS NULL THEN 1 ELSE 0 END) AS missing_user_session
FROM cosmetics_clean;

SELECT 'raw' AS table_name, COUNT(*) AS row_count
FROM cosmetics_raw
UNION ALL
SELECT 'clean' AS table_name, COUNT(*) AS row_count
FROM cosmetics_clean;