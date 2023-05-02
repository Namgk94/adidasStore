<%-- 
    Document   : cart.jsp
    Created on : Mar 19, 2023, 3:43:31 PM
    Author     : NAM
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.mycompany.mavenproject1.service.ListCart"%>
<%@page import="com.mycompany.mavenproject1.model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <section class="h-100" style="background-color: #eee;">
            <div class="container h-100 py-5">

                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div id="cart-content" class="col-10">

                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="fw-normal mb-0 text-black">Shopping Cart</h3>
                            <div>
                                <p class="mb-0"><span class="text-muted">Sort by:</span> <a href="#!"
                                                                                            class="text-body">price <i class="fas fa-angle-down mt-1"></i></a></p>
                            </div>
                        </div>
                        <div class="text-none" style="display: none; font-weight: bold; font-size: 30px; padding: 30px">
                            <p>Không có sản phẩm nào trong giỏ hàng ! </p>
                            <a href="index.jsp" style="text-decoration: underline !important;"> Đi tới trang mua hàng </a>
                        </div>

                        <%
                            for (Cart cart : ListCart.getCartList()) {%>
                        <div class="card rounded-3 mb-4">
                            <div class="card-body p-4">
                                <div class="row d-flex justify-content-around align-items-center">
                                    <div class="col-md-2 col-lg-2 col-xl-2">
                                        <a href="detail-product?detail_product_id=<%=cart.getProduct().getProductID()%>">
                                            <img src="<%=cart.getProduct().getProductImage()%>"
                                             class="img-fluid rounded-3" alt="<%=cart.getProduct().getProductName()%>">
                                        </a>
                                    </div>
                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                        <p class="lead fw-normal mb-2"><%=cart.getProduct().getProductName()%></p>
                                        <p><span class="text-muted">Size: </span><%=cart.getSize()%></p>
                                    </div>
                                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                        <input min="1" name="quantity" value="<%=cart.getQuantity()%>" type="button"
                                               class="form-control form-control-sm" style="text-align: center;"/>
                                    </div>
                                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                        <%
                                            double price = Double.valueOf(cart.getProduct().getProductPrice());
                                            String totalPrice = String.valueOf(price * cart.getQuantity());
                                            DecimalFormat formatter = new DecimalFormat("###,###,###");
                                        %>
                                        <h5 class="mb-0"><%=formatter.format(Float.parseFloat(totalPrice))%></h5>
                                    </div>
                                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                        <a href="delete-to-cart?idDelete=<%=cart.getProduct().getProductID()%>&sizeProduct=<%=cart.getSize()%>" class="text-danger"><i class="fas fa-trash fa-lg"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>


                        <div class="card" style="width: 100%;">
                            <div class="card-body">
                                <%DecimalFormat formatter = new DecimalFormat("###,###,###");%>
                                <p><strong>Total: </strong><%=formatter.format(ListCart.totalCart())%> VNĐ</p>
                                <a href="checkout?total=<%=ListCart.totalCart()%>">
                                    <button style="width: 100%;" type="button" class="btn btn-warning btn-block btn-lg">Checkout</button>
                                </a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
                                    
           <%@include file="footer.jsp" %>                            
    </body>
    <script>
        let cards = document.querySelectorAll(".card.rounded-3");
        let textNoProduct = document.querySelector(".text-none");
        if (cards.length == 0) {
            textNoProduct.style.display = "block";
        }

    </script>

</html>