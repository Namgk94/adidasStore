<%-- 
    Document   : error.jsp
    Created on : Mar 12, 2023, 6:19:12 PM
    Author     : NAM
--%>

<%@page import="com.mycompany.mavenproject1.database.ProductDao"%>
<%@page import="com.mycompany.mavenproject1.model.Product"%>
<%@page import="com.mycompany.mavenproject1.cookie.CookieProduct"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="WebContent/assets/css/products_slide.css">
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
        
        <h1>ERROR!</h1>
        <h2>${sessionScope.message}</h2>
        <h2>${sessionScope.insert}</h2>
        <h2>${sessionScope.testFind}</h2>
        <p>${sessionScope.bill_user.getOrderTime()}</p>
        <p>${sessionScope.bill_user.getAddress()}</p>
        <p>${sessionScope.bill_user.getUserName()}</p>
        <p>${sessionScope.bill_user.getTotalPrice()}</p>
    </body>
</html>
