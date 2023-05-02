<%-- 
    Document   : order_detail
    Created on : Feb 11, 2023, 3:38:25 PM
    Author     : NAM
--%>

<%@page import="com.mycompany.mavenproject1.database.BillDao"%>
<%@page import="com.mycompany.mavenproject1.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="WebContent/assets/css/order_detail.css">
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
        <div class="order-detail-section">
            <div class="logo-section">
                <a href="index.jsp">
                    <img src="https://cdn.freebiesupply.com/logos/large/2x/adidas-4-logo-black-and-white.png" alt="">
                </a>
            </div>
            <div class="order-detail-content container">
                <div class="state">
                    <h2 class="">${sessionScope.order_State}</h2>
                </div>

                <div class="detail">
                    <p class="order-number title">Order Number: <span>${sessionScope.orderNumber}</span></p>
                    <p>Customer Ordered: <span>${sessionScope.orderCustomer}</span></p>
                    <p>Tel to contact: <span>${sessionScope.orderTel}</span></p>
                    <p>Date Ordered: <span>${sessionScope.order_Time}</span></p>
                    <p>Delivery To Address: <span>${sessionScope.orderAddress}</span></p>
                    <p>Total Price: <span>${sessionScope.orderTotal}</span></p>

                    <!-- list products  -->
                    <div class="list-product">
                        <%                            int billId = Integer.parseInt(request.getParameter("order_number"));
                            BillDao billDao = new BillDao();
                            ArrayList<Product> list = billDao.getProductsInBillDetails(billId);
                            for (Product p : list) {%>

                        <div class="card rounded-3 mb-4">
                            <div class="card-body p-4">
                                <div class="row d-flex justify-content-around align-items-center">
                                    <div class="col-md-2 col-lg-2 col-xl-2">
                                        <img src="<%=p.getProductImage()%>"
                                             class="img-fluid rounded-3" alt="<%=p.getProductName()%>">
                                    </div>
                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                        <p class="lead fw-normal mb-2"><%=p.getProductName()%></p>
                                        <p><span class="text-muted">Size: </span><%=p.getSize()%></p>
                                    </div>
                                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                        <input min="1" name="quantity" value="<%=p.getAmount()%>" type="button"
                                               class="form-control form-control-sm" style="text-align: center;"/>
                                    </div>
                                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                        <%
                                            double price = Double.valueOf(p.getProductPrice());
                                            String totalPrice = String.valueOf(price * p.getAmount());
                                            
                                        %>
                                        <h5 class="mb-0"><%=totalPrice%></h5>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%}
                        %>
                    </div>
                </div>

            </div>
        </div>
    </body>
</html>
