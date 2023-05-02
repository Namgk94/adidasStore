<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.mavenproject1.database.ShopDao"%>
<%@page import="com.mycompany.mavenproject1.model.User"%>
<%@page import="com.mycompany.mavenproject1.model.Bill"%>
<%@page import="com.mycompany.mavenproject1.database.BillDao"%>
<%@page import="com.mycompany.mavenproject1.database.ProductDao"%>
<%@page import="com.mycompany.mavenproject1.database.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Danh sách nhân viên | Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <!-- Navbar-->
        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">


                <!-- User Menu-->
                <li>
                    <a class="app-nav__item" href="/index.jsp"><i class='bx bx-log-out bx-rotate-180'></i> </a>
                </li>
            </ul>
        </header>
        <!-- Sidebar menu-->
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="../images/hay.jpg" width="50px"
                                                alt="User Image">
                <div>
                    <p class="app-sidebar__user-name"><b>Admin</b></p>
                    <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
                </div>
            </div>
            <hr>
            <ul class="app-menu">
                <li><a class="app-menu__item haha" href="phan-mem-ban-hang.html"><i class='app-menu__icon bx bx-cart-alt'></i>
                        <span class="app-menu__label">POS Bán Hàng</span></a></li>
                <li><a class="app-menu__item active" href="index.jsp"><i class='app-menu__icon bx bx-tachometer'></i><span
                            class="app-menu__label">Bảng điều khiển</span></a></li>
                <li><a class="app-menu__item " href="table-data-table.html"><i class='app-menu__icon bx bx-id-card'></i> <span
                            class="app-menu__label">Quản lý nhân viên</span></a></li>
                <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Quản lý khách hàng</span></a></li>
                <li><a class="app-menu__item" href="table-data-product.jsp"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
                </li>
                <li><a class="app-menu__item" href="table-data-oder.jsp"><i class='app-menu__icon bx bx-task'></i><span
                            class="app-menu__label">Quản lý đơn hàng</span></a></li>
                <li><a class="app-menu__item" href="table-data-rate.jsp"><i class='app-menu__icon bx bx-run'></i><span
                            class="app-menu__label">Quản lý đánh giá
                        </span></a></li>
                <li><a class="app-menu__item" href="table-data-money.html"><i class='app-menu__icon bx bx-dollar'></i><span
                            class="app-menu__label">Bảng kê lương</span></a></li>
                <li><a class="app-menu__item" href="quan-ly-bao-cao.html"><i
                            class='app-menu__icon bx bx-pie-chart-alt-2'></i><span class="app-menu__label">Báo cáo doanh thu</span></a>
                </li>
                <li><a class="app-menu__item" href="page-calendar.html"><i class='app-menu__icon bx bx-calendar-check'></i><span
                            class="app-menu__label">Lịch công tác </span></a></li>
                <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-cog'></i><span class="app-menu__label">Cài
                            đặt hệ thống</span></a></li>
            </ul>
        </aside>
        <main class="app-content">
            <div class="row">
                <div class="col-md-12">
                    <div class="app-title">
                        <ul class="app-breadcrumb breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><b>Bảng điều khiển</b></a></li>
                        </ul>
                        <div id="clock"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <!--Left-->
                <div class="col-md-12 col-lg-6">
                    <div class="row">
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small primary coloured-icon"><i class='icon bx bxs-user-account fa-3x'></i>
                                <div class="info">
                                    <h4>Tổng khách hàng</h4>
                                    <p><b><%=UserDao.getTotalUser()%> khách hàng</b></p>
                                    <p class="info-tong">Tổng số khách hàng được quản lý.</p>
                                </div>
                            </div>
                        </div>
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small info coloured-icon"><i class='icon bx bxs-data fa-3x'></i>
                                <div class="info">
                                    <h4>Tổng sản phẩm</h4>
                                    <p><b><%=ProductDao.getTotalProduct()%> sản phẩm</b></p>
                                    <p class="info-tong">Tổng số sản phẩm được quản lý.</p>
                                </div>
                            </div>
                        </div>
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small warning coloured-icon"><i class='icon bx bxs-shopping-bags fa-3x'></i>
                                <div class="info">
                                    <h4>Tổng đơn hàng</h4>
                                    <p><b><%=BillDao.getTotalBill()%> đơn hàng</b></p>
                                    <p class="info-tong">Tổng số hóa đơn bán hàng trong tháng.</p>
                                </div>
                            </div>
                        </div>
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small danger coloured-icon"><i class='icon bx bxs-error-alt fa-3x'></i>
                                <div class="info">
                                    <h4>Sắp hết hàng</h4>
                                    <p><b><%=ProductDao.getAmountRunOut()%> sản phẩm</b></p>
                                    <p class="info-tong">Số sản phẩm (SL < 20) cảnh báo hết cần nhập thêm.</p>
                                </div>
                            </div>
                        </div>
                        <!-- col-12 -->
                        <div class="col-md-12">
                            <div class="tile">
                                <h3 class="tile-title">Đơn hàng mới</h3>
                                <div>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>ID đơn hàng</th>
                                                <th>Tên khách hàng</th>
                                                <th>Tổng tiền</th>
                                                <th>Trạng thái</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%  DecimalFormat formatter = new DecimalFormat("###,###,###");
                                                for (Bill bill : BillDao.getNewestBills()) {%>
                                            <tr>
                                                <td><%=bill.getBillId()%></td>
                                                <td><%=bill.getUserName()%></td>
                                                <td>
                                                    <%=formatter.format(Double.parseDouble(bill.getTotal()))%>	
                                                </td>
                                                <td><span class="badge bg-danger"><%=bill.getOrderState()%></span></td>
                                            </tr>
                                            <%}
                                            %>

                                        </tbody>
                                    </table>
                                </div>
                                <!-- / div trống-->
                            </div>
                        </div>

                        <!-- / col-12 -->
                        <!-- col-12 -->
                        <div class="col-md-12">
                            <div class="tile">
                                <h3 class="tile-title">Khách hàng mới</h3>
                                <div>
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Tên khách hàng</th>
                                                <th>Giới tính</th>
                                                <th>Địa chỉ email</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                for (User user : UserDao.getNewestUsers()) {%>
                                            <tr>
                                                <td>#<%=user.getUserID()%> </td>
                                                <td><%=user.getUserFullname()%></td>
                                                <td><%=user.getUserGender()%></td>
                                                <td><span class="tag tag-danger"><%=user.getUserEmail()%></span></td>
                                            </tr>
                                            <%}%>

                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                        <!-- / col-12 -->
                    </div>
                </div>
                <!--END left-->
                <!--Right-->
                <div class="col-md-12 col-lg-6">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="tile chart_bar">
                                <%
                                    String[] months = {"01", "02", "03", "04", "05", "06"};
                                    ArrayList<Integer> data = new ArrayList<>();
                                    for (int i = 0; i < 6; i++) {
                                        data.add(BillDao.getAmountBill6Months(months[i]));
                                    }
                                %>
                                <!-- truyền data từ sql vào input hidden -->
                                <input type="hidden" name="data_don_hang" value="<%=data.get(0)%>"><!-- thang 1 -->
                                <input type="hidden" name="data_don_hang" value="<%=data.get(1)%>"><!-- thang 2 -->
                                <input type="hidden" name="data_don_hang" value="<%=data.get(2)%>"><!-- thang 3 -->
                                <input type="hidden" name="data_don_hang" value="<%=data.get(3)%>"><!-- thang 4 -->
                                <input type="hidden" name="data_don_hang" value="<%=data.get(4)%>"><!-- thang 5 -->
                                <input type="hidden" name="data_don_hang" value="<%=data.get(5)%>"><!-- thang 6 -->

                                <h3 class="tile-title">Dữ liệu đơn hàng 6 tháng</h3>
                                <div class="embed-responsive embed-responsive-16by9">
                                    <canvas class="embed-responsive-item" id="lineChartDemo"></canvas>
                                </div>
                            </div>
                        </div>
                                
                        <div class="col-md-12">
                            <div class="tile chart_bar">
                                <%
                                    String[] _months = {"01", "02", "03", "04", "05", "06"};
                                    ArrayList<Integer> _data = new ArrayList<>();
                                    for (int i = 0; i < 6; i++) {
                                        _data.add(ShopDao.getRevenue_6Months(_months[i]));
                                    }
                                %>
                                <!-- truyền data từ sql vào input hidden -->
                                <input type="hidden" name="data_doanh_thu" value="<%=_data.get(0)%>"><!-- thang 1 -->
                                <input type="hidden" name="data_doanh_thu" value="<%=_data.get(1)%>"><!-- thang 2 -->
                                <input type="hidden" name="data_doanh_thu" value="<%=_data.get(2)%>"><!-- thang 3 -->
                                <input type="hidden" name="data_doanh_thu" value="<%=_data.get(3)%>"><!-- thang 4 -->
                                <input type="hidden" name="data_doanh_thu" value="<%=_data.get(4)%>"><!-- thang 5 -->
                                <input type="hidden" name="data_doanh_thu" value="<%=_data.get(5)%>"><!-- thang 6 -->


                                <%
                                    ArrayList<Integer> profit_data = new ArrayList<>();
                                    for (int i = 0; i < 6; i++) {
                                        profit_data.add(ShopDao.getProfit_6Months(_months[i]));
                                    }
                                %>
                                <!-- truyền data từ sql vào input hidden -->
                                <input type="hidden" name="data_loi_nhuan" value="<%=profit_data.get(0)%>"><!-- thang 1 -->
                                <input type="hidden" name="data_loi_nhuan" value="<%=profit_data.get(1)%>"><!-- thang 2 -->
                                <input type="hidden" name="data_loi_nhuan" value="<%=profit_data.get(2)%>"><!-- thang 3 -->
                                <input type="hidden" name="data_loi_nhuan" value="<%=profit_data.get(3)%>"><!-- thang 4 -->
                                <input type="hidden" name="data_loi_nhuan" value="<%=profit_data.get(4)%>"><!-- thang 5 -->
                                <input type="hidden" name="data_loi_nhuan" value="<%=profit_data.get(5)%>"><!-- thang 6 -->

                                <h3 class="tile-title">Thống kê 6 tháng <span style="color: rgb(255, 212, 59);">Doanh thu</span> | <span style="color: rgb(9, 109, 239);">Lợi nhuận</span></h3>
                                <div class="embed-responsive embed-responsive-16by9">
                                    <canvas class="embed-responsive-item" id="barChartDemo"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!--END right-->
            </div>


            <div class="text-center" style="font-size: 13px">
                <p><b>Copyright
                        <script type="text/javascript">
                            document.write(new Date().getFullYear());
                        </script> Phần mềm quản lý bán hàng | Dev By Trường
                    </b></p>
            </div>
        </main>
        <script src="js/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="js/popper.min.js"></script>
        <script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
        <!--===============================================================================================-->
        <script src="js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>
        <!--===============================================================================================-->
        <script src="js/plugins/pace.min.js"></script>
        <!--===============================================================================================-->
        <script type="text/javascript" src="js/plugins/chart.js"></script>
        <!--===============================================================================================-->
        <script type="text/javascript">

                            var data_don_hang = document.querySelectorAll(".chart_bar input[name='data_don_hang']");
                            var dataDonHang = {
                                labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6"],
                                datasets: [{
                                        label: "Dữ liệu đầu tiên",
                                        fillColor: "rgba(255, 213, 59, 0.767), 212, 59)",
                                        strokeColor: "rgb(255, 212, 59)",
                                        pointColor: "rgb(255, 212, 59)",
                                        pointStrokeColor: "rgb(255, 212, 59)",
                                        pointHighlightFill: "rgb(255, 212, 59)",
                                        pointHighlightStroke: "rgb(255, 212, 59)",
                                        data: [
                                            data_don_hang[0].value,
                                            data_don_hang[1].value,
                                            data_don_hang[2].value,
                                            data_don_hang[3].value,
                                            data_don_hang[4].value,
                                            data_don_hang[5].value]
                                    }
                                ]
                            };

                            var data_doanh_thu = document.querySelectorAll(".chart_bar input[name='data_doanh_thu']");
                            var data_loi_nhuan = document.querySelectorAll(".chart_bar input[name='data_loi_nhuan']");

                            var dataDoanhThu = {
                                labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6"],
                                datasets: [{
                                        label: "Dữ liệu đầu tiên",
                                        fillColor: "rgba(255, 213, 59, 0.767), 212, 59)",
                                        strokeColor: "rgb(255, 212, 59)",
                                        pointColor: "rgb(255, 212, 59)",
                                        pointStrokeColor: "rgb(255, 212, 59)",
                                        pointHighlightFill: "rgb(255, 212, 59)",
                                        pointHighlightStroke: "rgb(255, 212, 59)",
                                        data: [
                                            data_doanh_thu[0].value,
                                            data_doanh_thu[1].value,
                                            data_doanh_thu[2].value,
                                            data_doanh_thu[3].value,
                                            data_doanh_thu[4].value,
                                            data_doanh_thu[5].value]
                                    },
                                    {
                                        label: "Dữ liệu kế tiếp",
                                        fillColor: "rgba(9, 109, 239, 0.651)  ",
                                        pointColor: "rgb(9, 109, 239)",
                                        strokeColor: "rgb(9, 109, 239)",
                                        pointStrokeColor: "rgb(9, 109, 239)",
                                        pointHighlightFill: "rgb(9, 109, 239)",
                                        pointHighlightStroke: "rgb(9, 109, 239)",
                                        data: [
                                            data_loi_nhuan[0].value,
                                            data_loi_nhuan[1].value,
                                            data_loi_nhuan[2].value,
                                            data_loi_nhuan[3].value,
                                            data_loi_nhuan[4].value,
                                            data_loi_nhuan[5].value]
                                    }
                                ]
                            };
                            var ctxl = $("#lineChartDemo").get(0).getContext("2d");
                            var lineChart = new Chart(ctxl).Line(dataDonHang);

                            var ctxb = $("#barChartDemo").get(0).getContext("2d");
                            var barChart = new Chart(ctxb).Bar(dataDoanhThu);
        </script>
        <script type="text/javascript">
            //Thời Gian
            function time() {
                var today = new Date();
                var weekday = new Array(7);
                weekday[0] = "Chủ Nhật";
                weekday[1] = "Thứ Hai";
                weekday[2] = "Thứ Ba";
                weekday[3] = "Thứ Tư";
                weekday[4] = "Thứ Năm";
                weekday[5] = "Thứ Sáu";
                weekday[6] = "Thứ Bảy";
                var day = weekday[today.getDay()];
                var dd = today.getDate();
                var mm = today.getMonth() + 1;
                var yyyy = today.getFullYear();
                var h = today.getHours();
                var m = today.getMinutes();
                var s = today.getSeconds();
                m = checkTime(m);
                s = checkTime(s);
                nowTime = h + " giờ " + m + " phút " + s + " giây";
                if (dd < 10) {
                    dd = '0' + dd
                }
                if (mm < 10) {
                    mm = '0' + mm
                }
                today = day + ', ' + dd + '/' + mm + '/' + yyyy;
                tmp = '<span class="date"> ' + today + ' - ' + nowTime +
                        '</span>';
                document.getElementById("clock").innerHTML = tmp;
                clocktime = setTimeout("time()", "1000", "Javascript");

                function checkTime(i) {
                    if (i < 10) {
                        i = "0" + i;
                    }
                    return i;
                }
            }
        </script>
    </body>

</html>