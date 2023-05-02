<%-- 
    Document   : order_tracker
    Created on : Feb 11, 2023, 1:56:45 PM
    Author     : NAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Adidas Login</title>
        <link rel="stylesheet" href="WebContent/assets/css/register.css"/>
        <link rel="stylesheet" href="WebContent/assets/css/style.css"/>
        <link rel="stylesheet" href="WebContent/assets/css/order_tracker.css"/>
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
        <%@include file="header.jsp"%>

        <div class="account-register container order-tracker">
            <div class="account-register-item register-form form-order-tracker">
                <h1>Your Order</h1>
                <p style="color: red;">${sessionScope.invalid_message}</p>
                <form class="form-order-tracker-1" action="order-tracker">
                    <div class="input-item">
                        <input type="text" required name="order_number" class="order-number-input" placeholder="Order number *">
                    </div>
                    <div class="input-item">
                        <input type="email" required name="email_user" class="email-input" placeholder="Email *">
                    </div>

                    <button type="submit">Continue <i class="fa-solid fa-arrow-right"></i></button>
                </form>

                <div class="form-order-tracker-2">
                    <p>Can't find your order number? Log in to access your order history.</p>
                    <a href="login.jsp">Log in <i class="fa-solid fa-arrow-right"></i></a>
                </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>
