-- Cấu trúc lại cơ sở dữ liệu và tối ưu hiệu suất (PayFlow)
USE payflow_db;

-- Bước 1: Tạo Composite Index đúng chuẩn (Equality trước, Range sau)
CREATE INDEX idx_type_date ON Transactions (transaction_type, created_at);

-- Bước 2: Truy vấn đã được "SARGable" hóa để tận dụng tối đa B-Tree Index
EXPLAIN
SELECT SUM(amount) AS total_deposit
FROM Transactions
WHERE
    transaction_type = 'DEPOSIT'
    AND created_at >= '2026-06-01 00:00:00'
    AND created_at < '2026-07-01 00:00:00';

-- (Tùy chọn) Kích hoạt Profiling để xem thời gian thực thi siêu nhỏ (Execution Time)
-- SET profiling = 1;
-- [Chạy truy vấn SELECT...]
-- SHOW PROFILES;