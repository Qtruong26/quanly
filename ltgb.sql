-- Chỉ định sử dụng cơ sở dữ liệu
USE QuanLySinhVien;

-- =========================================================================
-- 1. Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất
-- =========================================================================
-- Sử dụng Subquery (truy vấn lồng) để lấy giá trị lớn nhất trước,
-- cách này giúp lấy được tất cả các môn nếu có nhiều môn cùng chung mức credit cao nhất.
SELECT *
FROM Subject
WHERE
    Credit = (
        SELECT MAX(Credit)
        FROM Subject
    );

-- =========================================================================
-- 2. Hiển thị các thông tin môn học có điểm thi lớn nhất
-- =========================================================================
-- Kết nối bảng Subject và Mark để lấy tên môn và điểm,
-- sau đó lọc bằng Subquery tìm điểm MAX.
SELECT Sub.SubId, Sub.SubName, Sub.Credit, Sub.Status, M.Mark
FROM Subject Sub
    JOIN Mark M ON Sub.SubId = M.SubId
WHERE
    M.Mark = (
        SELECT MAX(Mark)
        FROM Mark
    );

-- =========================================================================
-- 3. Hiển thị thông tin sinh viên và điểm trung bình, xếp hạng điểm giảm dần
-- =========================================================================
-- Sử dụng LEFT JOIN để lấy cả những sinh viên chưa có điểm thi (sẽ bị NULL).
-- Dùng hàm AVG() để tính trung bình và ORDER BY DESC để sắp xếp giảm dần.
SELECT S.StudentId, S.StudentName, AVG(M.Mark) AS DiemTrungBinh
FROM Student S
    LEFT JOIN Mark M ON S.StudentId = M.StudentId
GROUP BY
    S.StudentId,
    S.StudentName
ORDER BY DiemTrungBinh DESC;