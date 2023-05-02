<%-- 
    Document   : checkout
    Created on : Mar 19, 2023, 5:42:51 PM
    Author     : NAM
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="com.mycompany.mavenproject1.service.ListCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="WebContent/assets/css/checkout.css">
    <title>Document</title>
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
    <section class="form-checkout container">
        <h1>CHECK OUT</h1>
        <form action="create-order">
            
            <input type="text" name="nameCustomer" value="${sessionScope.nameCustomer}" placeholder="Your name..." required>
            <input type="text" name="address" placeholder="Your address..." required>
            <input type="tel" name="phoneNumber" placeholder="Your phone number..." required>
            <textarea name="note" placeholder="Your note..." id="" cols="30" rows="2"></textarea>
            <select name="payment" id="payment">
                <option value="Thanh toán khi nhận hàng">Thanh toán khi nhận hàng</option>
                <option value="">Chuyển khoản ngân hàng</option>
            </select>
            <input type="hidden" name="total" value="<%=ListCart.totalCart()%>">
            <%DecimalFormat formatter = new DecimalFormat("###,###,###");%>
            <p class="detail">Chi tiết thanh toán: <span><%=formatter.format(ListCart.totalCart())%> VNĐ</span></p>
            <button type="submit">Order</button>
        </form>
    </section>
            <%@include file="footer.jsp" %>
</body>
</html>
