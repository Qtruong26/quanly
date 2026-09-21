# Báo cáo Phân tích Lệnh EXPLAIN

- **Trước khi tối ưu (Legacy Script):**
  - `type`: **ALL** (Hiện tượng Full Table Scan - thảm họa hiệu suất).
  - `possible_keys` & `key`: NULL (Hệ thống không tìm thấy Index nào để dùng do bị kẹt hàm `YEAR()` và `MONTH()`).
  - `rows`: ~5,000,000 (MySQL dự kiến phải quét toàn bộ bảng).

- **Sau khi tối ưu (Refactored Script):**
  - `type`: **range** (MySQL đã nhận diện được việc quét theo khoảng thời gian trên B-Tree).
  - `possible_keys` & `key`: **idx_type_date** (MySQL đã sử dụng thành công Composite Index vừa tạo).
  - `rows`: Đã giảm xuống một con số cực nhỏ (chỉ tương đương số lượng giao dịch DEPOSIT trong tháng 6/2026).
  - `Extra`: **Using index condition** (Công nghệ Index Condition Pushdown được áp dụng, giúp lọc dữ liệu ngay từ tầng Storage Engine).
