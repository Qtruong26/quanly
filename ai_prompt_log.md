- **Prompt 1:** Trong cơ sở dữ liệu MySQL, mặc định từ khóa JOIN (khi không ghi rõ LEFT hay RIGHT) sẽ hoạt động như thế nào? Nó sẽ bỏ qua hay giữ lại các bản ghi không có sự trùng khớp ở cả hai bảng?
- **Prompt 2:** Khi tôi sử dụng LEFT JOIN và đếm số lượng đơn hàng bằng hàm COUNT, tôi nên dùng COUNT(\*) hay COUNT(tên_cột_khóa_chính_bảng_order)? Sự khác biệt khi kết quả trả về NULL là gì?
- **Prompt 3:** Hãy phân tích hiệu năng (Performance) của việc dùng LEFT JOIN kết hợp IS NULL so với việc dùng subquery NOT IN khi muốn tìm kiếm các bản ghi không tồn tại trong bảng khác.
- **Prompt 4:** Có cú pháp SQL nào cho phép tôi kết hợp kết quả của một LEFT JOIN và một RIGHT JOIN để giả lập tính năng FULL OUTER JOIN trong MySQL không?

# Nhật ký tương tác trợ lý AI (Database Tuning Assistant)

1. **Prompt 1:** Trong MySQL, nếu tôi tạo Index cho một cột ngày tháng, nhưng trong mệnh đề WHERE tôi lại viết `WHERE YEAR(col) = 2026`, tại sao MySQL lại từ chối sử dụng Index và phải quét toàn bộ bảng (Full Table Scan)? (Tìm hiểu SARGable).
2. **Prompt 2:** Khi thiết kế một Composite Index trong MySQL cho cột `(transaction_type, created_at)`, thứ tự các cột trong Index có quan trọng không? Tôi nên đặt cột nào đứng trước để có hiệu suất lọc dữ liệu (Selectivity) tốt nhất?
3. **Prompt 3:** Làm thế nào để tôi có thể xem được chi tiết thời gian thực thi (Execution Time) của một câu lệnh SQL thay vì chỉ xem Execution Plan trong MySQL (Gợi ý: `SET profiling = 1`)?
4. **Prompt 4:** Trong kết quả EXPLAIN, cột 'Extra' hiện chữ 'Using index condition' khác gì với 'Using index' (Covering Index)?
