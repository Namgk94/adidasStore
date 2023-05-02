<%-- 
    Document   : shop_page
    Created on : Mar 29, 2023, 3:52:38 PM
    Author     : NAM
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="com.mycompany.mavenproject1.database.ProductDao"%>
<%@page import="com.mycompany.mavenproject1.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="WebContent/assets/css/products_slide.css">
        <link rel="stylesheet" href="WebContent/assets/css/shop_page.css">

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
        <%
            ArrayList<Product> list = new ArrayList<>();
            request.setCharacterEncoding("utf-8");
//            click nav item
            String gender = request.getParameter("for");
            String prop = request.getParameter("prop");
//            search
            String action = request.getParameter("action");
            String search_value = request.getParameter("search_value");
            if (action != null && action.equals("search")) {
                list = ProductDao.getProductsBySearch(search_value);
            } else if (action != null && action.equals("default")) {
                if (gender != null) {
                    list = ProductDao.getProductsByGender(gender);
                } else if (prop != null) {
                    list = ProductDao.getProductsByProp(prop);
                }
            }
        %>


        <%    if (action != null && action.equals("search")) {%>
        <div class="container" style="padding: 50px 0;">
            <p>Your Search results for:</p>
            <h3 style="
                display: inline-block;
                letter-spacing: 1px;
                font-style: italic;
                font-size: 35px;
                text-transform: uppercase;"
            >
                "<%=search_value%>"
            </h3><span style=" color: #767677;font-size: 15px;margin: 0 10px;">[<%=list.size()%>]</span>
        </div>      
        <%} else {%>
        <div class="container" style="padding: 40px 0;">
            <div class="source">
                <a href="index.jsp">Home</a>
                <p><%=(gender == null || gender == "") ? prop : gender%></p>
            </div>
            <h3 style="
                display: inline-block;
                letter-spacing: 1px;
                font-style: italic;
                font-size: 35px;
                text-transform: uppercase;"
            ><%=(gender != null) ? gender : prop%></h3>
            <span style=" color: #767677;font-size: 15px;margin: 0 10px;">[<%=list.size()%>]</span>
        </div>
        <%}%>

        <%  if (list.size() == 0) {%>
        <div style="text-align: center">
            <p style="font-size: 40px;font-style: italic;text-transform: uppercase;color: #333; font-weight: bold">
                Không có sản phẩm nào phù hợp !
            </p>
        </div>
        <%  } else {%>
        <div class="list-wrapper container">
            <%for (Product p : list) {%>
            <div class="product-card">
                <div class="card-img">
                    <a href="detail-product?productIdValue=<%=p.getProductID()%>">
                        <img src="<%=p.getProductImage()%>"
                             alt="<%=p.getProductName()%>">
                    </a>
                </div>

                <div class="card-wishlist">
                    <form action="">
                        <button type="button">
                            <i class="fa-regular fa-heart"></i>
                            <i class="fa-solid fa-heart"></i>
                        </button>
                    </form>
                </div>

                <a href="detail-product?productIdValue=<%=p.getProductID()%>">
                    <div class="product-price">
                        <%DecimalFormat formatter = new DecimalFormat("###,###,###");%>
                        <span><%=formatter.format(Double.parseDouble(p.getProductPrice()))%></span>
                    </div>

                    <div class="card-detail">
                        <p class="card-name"><%=p.getProductName()%></p>
                        <p class="card-category"><%=p.getProductCategory()%></p>
                        <p class="card-label"><%=p.getProductLabel()%></p>
                    </div>
                </a>
            </div>
            <%}
                }%>
        </div>
        <%@include file="footer.jsp" %>
    </body>
    <script>
        const wishlistBtn = document.querySelectorAll(".card-wishlist button");
        const cardWishlistELements = document.querySelectorAll(".card-wishlist");
        var inputCheckCookies = document.querySelectorAll(".card-wishlist input[name='checkCookie']");
        wishlistBtn.forEach((e, index) => {
            e.onclick = () => {
                cardWishlistELements[index].classList.toggle("active");
            }
        });
        inputCheckCookies.forEach((e, index) => {
            if (e.getAttribute("value") == "true") {
                cardWishlistELements[index].classList.add("active");
            } else {
                cardWishlistELements[index].classList.remove("active");
            }
        });
        var detailProductButtonSubmit = document.querySelectorAll(".detail-product-submit");
        detailProductButtonSubmit.forEach((item) => {
            item.onclick = () => {
                var inputHiddenElement = item.parentNode.parentNode.querySelector('input[name="productIdValue"]') || item.parentNode.parentNode.parentNode.querySelector('input[name="productIdValue"]');
                var idValue = item.parentNode.parentNode.parentNode.getAttribute("data-id") || item.parentNode.parentNode.getAttribute("data-id");
                inputHiddenElement.setAttribute("value", idValue);
                console.log(inputHiddenElement);
            }
        });
    </script>

</html>
