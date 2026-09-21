Khi sử dụng LEFT JOIN để đếm số lượng đơn hàng của tất cả khách hàng (bao gồm cả người chưa mua), ta bắt buộc phải dùng `COUNT(o.order_id)` thay vì `COUNT(*)`.

Lý do là `COUNT(*)` sẽ đếm tổng số lượng dòng dữ liệu trả về. Khi dùng LEFT JOIN, khách hàng chưa mua hàng (như Charlie) vẫn trả về 1 dòng (với các cột bên Orders bị NULL), khiến hàm `COUNT(*)` đếm thành 1 đơn hàng sai thực tế. Trong khi đó, `COUNT(o.order_id)` chỉ đếm các dòng mà cột khóa chính không bị NULL, giúp ghi nhận chính xác 0 đơn hàng cho những khách hàng tiềm năng này.
