<%-- 
    Document   : header
    Created on : Feb 10, 2023, 2:22:11 PM
    Author     : NAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="WebContent/assets/css/style.css"/>
        <link rel="stylesheet" href="WebContent/assets/css/header.css"/>
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
        <div id="header">
            <div id="tag-slide" style="min-height: unset!important; padding: 0;" class="carousel slide" data-bs-interval="5000" data-bs-ride="carousel">
                <div style="min-height: unset!important; padding: 0;" class="carousel-inner" style="display: flex;">
                    <div class="carousel-item active">
                        <div class="transition-group">
                            <span class="transition-item">EASY RETURNS</span>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="transition-group">
                            <span class="transition-item">FREE SHIPPING FOR ADICLUB MEMBERS</span>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="transition-group">
                            <span class="transition-item">FULL OF ADVANTAGES</span>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="transition-group">
                            <span class="transition-item">DIVERSE PRODUCTS</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="header-wrapper">
                <div class="header-top">
                    <ul class="header-top-menu">
                        <li class="header-top-item">
                            <a href="">Help</a>
                        </li>
                        <li class="header-top-item">
                            <a href="order_tracker.jsp">Order tracker</a>
                        </li>
                        <li class="header-top-item">
                            <a href="register.jsp">Become a member</a>
                        </li>
                        <li class="header-top-item">
                            <a href="">Adiclub</a>
                        </li>
                        <li class="header-top-item">

                            <%
                                String user = (String.valueOf(session.getAttribute("username")));
                                if (user == null || user.equals("null") || user.equals("")) {%>
                            <a href="login.jsp">Login</a>
                            <%} else {%>
                            <span style="text-decoration: none; font-weight: bold"><%=user%></span>
                            <%}%>
                        </li>
                    </ul>
                </div>
                <div class="header-bottom">
                    <a href="index.jsp" class="logobrand">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Adidas_Logo.svg/2560px-Adidas_Logo.svg.png"
                             alt="">
                    </a>

                    <div class="navbar">
                        <a href="shop_page.jsp?for=men&action=default" class="nav-item hightlight">
                            <span>MEN</span>
                        </a>
                        <a href="shop_page.jsp?for=women&action=default" class="nav-item hightlight">
                            <span>WOMEN</span>
                        </a>
                        <a href="shop_page.jsp?prop=kid&action=default" class="nav-item hightlight">
                            <span>KIDS</span>
                        </a>
                        <a href="shop_page.jsp?prop=sport&action=default" class="nav-item">
                            <span>Sport</span>
                        </a>
                        <a class="nav-item">
                            <span>brands</span>
                        </a>
                        <a class="nav-item">
                            <span>Release dates</span>
                        </a>
                        <a class="nav-item hightlight">
                            <span>Outlet</span>
                        </a>
                    </div>

                    <div class="header-function">
                        <div class="search-section">
                            <form action="shop_page.jsp?action=search" method="post">

                                <input type="text" placeholder="Search" name="search_value">
                                <button class="searchBtn" type="submit">
                                    <i class="fa fa-solid fa-magnifying-glass"></i>
                                </button>
                            </form>
                        </div>

                        <div class="user">
                            <p check-user="${sessionScope.username}" onclick="handleModalUser(this)"><i class="fa-regular fa-user"></i></p>
                        </div>
                        <div class="modal-user">
                            <button onclick="handleCloseModal(this)" class="close-modal"><i class="fa-solid fa-circle-xmark"></i></button>
                            <p><i class="fa-solid fa-user"></i>Customer: <span></span></p>
                            <a href="user-account?action=orderhistory">Order History</a>
                            <a href="rate.jsp">Rating Product</a>
                            <a href="user-account?action=logout">Log out</a>
                        </div>


                        <div class="wishlist">
                            <a href=""><i class="fa-regular fa-heart"></i></a>
                        </div>

                        <div class="cart">
                            <a href="cart.jsp"><i class="fa-solid fa-cart-shopping"></i></a>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </body>
    <script src="WebContent/assets/js/header.js"></script>
</html>
