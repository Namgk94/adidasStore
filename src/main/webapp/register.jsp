<%-- 
    Document   : register
    Created on : Feb 10, 2023, 2:37:34 PM
    Author     : NAM
--%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="WebContent/assets/css/register.css"/>
        <link rel="stylesheet" href="WebContent/assets/css/style.css"/>

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
        <%
            String check_valid_register = String.valueOf(session.getAttribute("check_valid_register"));
            if (check_valid_register.equals("false")) {%>
        <script>
            alert('ĐĂNG KÝ THẤT BẠI!!!\nEmail của bạn đã được sử dụng !\n Vui lòng chọn một email khác.')
        </script>
        <%
                session.setAttribute("check_valid_register", "none");
            }
        %>

        <%@include file="header.jsp" %>

        <div class="account-register container">
            <div class="account-register-item register-form">
                <h1>REGISTER</h1>
                <form action="create-account">
                    <div class="name">
                        <h2 class="title">Your Name</h2>
                        <div class="input-item">
                            <input required type="text" name="firstname_user" placeholder="First Name *">
                        </div>
                        <div class="input-item">
                            <input required type="text" name="lastname_user" placeholder="Last Name *">
                        </div>
                    </div>

                    <div class="gender">
                        <h2 class="title">Gender</h2>
                        <input type="hidden" name="valueGender_user">
                        <input type="radio" id="male" value="male" name="gender">
                        <label for="male">Male</label>
                        <input type="radio" id="female" value="female" name="gender">
                        <label for="female">Female</label>
                    </div>

                    <div class="details">
                        <h2 class="title">Login Details</h2>
                        <div class="input-item">
                            <input type="email" required="" name="email_user" class="email-input" placeholder="Email *">
                        </div>
                        <div class="input-item">
                            <input type="password" required name="password_user" class="password-input" placeholder="Password *">
                            <p class="password-message">
                                Minimum 8 characters with at least one uppercase, one lowercase, one special character and a
                                number.
                            </p>
                        </div>
                    </div>

                    <button type="submit">Register <i class="fa-solid fa-arrow-right"></i></button>
                </form>
            </div>
            <div class="account-register-item event">
                <h1>JOIN ADICLUB. GET REWARDED TODAY.</h1>
                <p>As an adiClub member you get rewarded with what you love for doing what you love. Sign up today and
                    receive immediate access to these Level 1 benefits:</p>
                <ul>
                    <li><i class="fa-solid fa-check"></i>Free delivery</li>
                    <li><i class="fa-solid fa-check"></i>A 15% off voucher for your next purchase</li>
                    <li><i class="fa-solid fa-check"></i>Access to Members Only products and sales</li>
                    <li><i class="fa-solid fa-check"></i>Special offers and promotions</li>
                </ul>
                <p>Join now to start earning points, reach new levels and unlock more rewards and benefits from adiClub.</p>
                <p>Want to learn more about adiClub?</p>
                <a href="">Read more about free membership</a>
                <img src="https://www.adidas.com.vn/glass/react/5200dd5/assets/img/adiClub-account-register.jpeg" alt="">
            </div>
        </div>

        <%@include file="footer.jsp" %>
    </body>
    <script src="WebContent/assets/js/register.js"></script>
</html>
