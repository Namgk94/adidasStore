<%-- 
    Document   : orderhistory
    Created on : Mar 28, 2023, 3:35:03 PM
    Author     : NAM
--%>

<%@page import="com.mycompany.mavenproject1.database.UserDao"%>
<%@page import="com.mycompany.mavenproject1.model.Bill"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.mavenproject1.database.BillDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="product.css">

        <!-- fontawsome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
    </head>

    <body>
        <%@include file="header.jsp" %>
        <div class="orders-section container table-responsive">
            <h1>Orders History</h1>
            <br>
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>Mã đơn</th>
                        <th>Khách hàng</th>
                        <th>Địa chỉ nhận hàng</th>
                        <th>Số điện thoại</th>
                        <th>Thời gian đặt hàng</th>
                        <th>Đơn hàng</th>
                        <th>Số lượng</th>
                        <th>Tổng tiền</th>
                        <th>Tình trạng</th>
                        <th>Ghi chú khách hàng</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String userEmail = String.valueOf(session.getAttribute("username"));
                        int userId = UserDao.getUserIdByEmail(userEmail);
                        BillDao billDao = new BillDao();
                        ArrayList<Bill> listBill = billDao.getBillByUserId(userId);
                        for (Bill bill : listBill) {%>
                    <tr>
                        <td><%=bill.getBillId()%></td>
                        <td><%=bill.getUserName()%></td>
                        <td style="min-width: 150px; overflow-wrap: break-word"><%=bill.getAddress()%></td>
                        <td style="min-width: 100px; overflow-wrap: break-word"><%=bill.getTelNumber()%></td>
                        <td style="min-width: 150px; overflow-wrap: break-word"><%=bill.getOrderTime()%></td>
                        <td style="min-width: 250px; overflow-wrap: break-word">
                            <%=billDao.getStringBillDetail(bill.getBillId())%>  
                        </td>   
                        <td><%=billDao.getAmountByBillId(bill.getBillId())%> </td>
                        <td><%=bill.getTotal()%> đ</td>
                        <td><span class="badge bg-danger"><%=bill.getOrderState()%></span></td>
                        <td style="max-width: 150px; overflow-wrap: break-word"><%=bill.getNote()%></td>
                    </tr>

                    <%
                        }%>

                </tbody>
            </table>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
