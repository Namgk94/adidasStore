Source Code: bài tập lớn JAVA

Đề tài: Website thương mại điện tử Adidas và Trang quản trị website

Sinh viên: Nguyễn Văn Nam

Mã Sinh Viên: 211210966

---------------------------------

- CHỨC NĂNG CỦA CÁC PACKAGE TRONG JAVA:

    + Controller: Chứa các file servlet để thao tác, tương tác, trao đổi thông tin giữa Client và WebServer.
    
    + Model: Chứa các đối tượng như sản phẩm, hóa đơn, chi tiết hóa đơn, giỏ hàng,...
    
    + Database: Chứa các lớp với các phương thức để tương tác với Cơ sở dữ liệu qua JDBC.
    
    + Service: Là package để lưu các lớp nhằm quản lý các đối tượng, mảng đối tượng.
    
    + Cookie: Xử lý các chức năng liên quan đến Cookie.

---------------------------------

-) TRANG ADMIN:

    + Theo dõi thông tin cửa hàng: Tổng khách hàng đăng ký, Tổng sản phẩm hiện có, Tổng đơn hàng, Số loại sản phẩm sắp hết hàng. Biểu đồ doanh thu, 
    
    lợi nhuận, số lượng đơn hàng trong 6 tháng. Bảng thông tin các đơn hàng và khách hàng mới nhất của cửa hàng
    
    + Quản lý sản phẩm: Thêm, sửa, xóa.
    
    + Quản lý đơn hàng: Thêm, sửa, xóa.
    
    + Quản lý đánh giá: Theo dõi tất cả đánh giá của khách hàng.
    
-) TRANG CUSTOMER: 
    
    + Hiển thị sản phẩm theo các danh mục: Sử dụng vòng lặp để render các sản phẩm và servlet để bắt các parameter trên đường dẫn và tương tác với Database qua JDBC.
    
    + Tìm kiếm các sản phẩm theo từ khóa.
    
    + Thêm sản phẩm vào giỏ hàng: Khi đã chọn size thì sản phẩm sẽ được thêm, ngược lại thì đẩy ra thông báo lỗi.
    
    + Xem chi tiết sản phẩm khi ấn vào thẻ sản phẩm, hiển thị các đánh giá của khách hàng về sản phẩm đó.
    
    + Giỏ hàng: Xem các sản phẩm đang có trong giỏ, Xóa sản phẩm, tiến hành lấy thông tin thanh toán(Check out).
    
    + Đăng ký khách hàng mới.
    
    + Đăng nhập.
    
    + Khi đã đăng nhập: Sẽ xem được các sản phẩm đã mua và có thể đánh giá sản phẩm, Xem lịch sử mua hàng.
    
    + Tra cứu đơn hàng: Nhập gmail mua hàng và mã đơn hàng đúng sẽ cho ra thông tin đơn hàng đó.
    
-) DEMO WEBSITE

  CLICK ĐỂ XEM: 
  
   +/ Trang Admin: https://github.com/Namgk94/adidasStore/issues/1#issue-1692745521
   
   +/ Trang Customer: https://github.com/Namgk94/adidasStore/issues/2#issue-1692762192
