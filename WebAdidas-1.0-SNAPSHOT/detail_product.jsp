<%-- 
    Document   : detail_product
    Created on : Mar 12, 2023, 4:46:55 PM
    Author     : NAM
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.mycompany.mavenproject1.model.BillDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.mavenproject1.database.RateDao"%>
<%@page import="com.mycompany.mavenproject1.database.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.mavenproject1.model.Product"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="WebContent/assets/css/detail_product.css">
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
        <div class="container">
            <div class="buy-product-section">
                <div class="pd-img">
                    <img src="${sessionScope.product.getProductImage()}"
                         alt="${sessionScope.product.getProductName()}">
                </div>
                <div class="pd-info" data-id="${sessionScope.product.getProductID()}">
                    <div class="pd-header">
                        <h3>${sessionScope.product.getProductName()}</h3>
                        

                        <p class="bold-text price">${sessionScope.price_format}</p>
                        <div class="desc">
                            <p class="bold-text">Description</p>
                            <p>${sessionScope.product.getProductDescription()}</p>
                        </div>

                        <div class="sizes">
                            <p class="bold-text">Sizes</p>
                            <%
                                Product p = ProductDao.getProductById(request.getParameter("detail_product_id"));
                                if (p.getProductCategory().equalsIgnoreCase("quần áo")) {%>
                            <ul>
                                <li><span>S</span></li>
                                <li><span>M</span></li>
                                <li><span>L</span></li>
                                <li><span>XL</span></li>
                                <li><span>XXL</span></li>
                            </ul>
                            <%} else if (p.getProductCategory().equalsIgnoreCase("giày dép")) {%>
                            <ul>
                                <li><span>39</span></li>
                                <li><span>40</span></li>
                                <li><span>40.5</span></li>
                                <li><span>41</span></li>
                                <li><span>42</span></li>
                            </ul>
                            <%} else {%>
                            <ul>
                                <li><span>Freesize</span></li>
                            </ul>
                            <%}%>
                        </div>
                    </div>

                    <div class="pd-action">
                        <form action="" method="post">
                            <input type="text" hidden value="">
                            <button type="button">Add to Cart <i class="fa-solid fa-arrow-right"></i></button>
                        </form>

                        <div class="wishlist">
                            <p href=""><i class="fa-regular fa-heart"></i></p>
                        </div>
                    </div>

                    <div class="pd-footer">
                        <p>
                            <a href="">Celebrate Women: Buy 2, get 30% off</a>
                        </p>
                        <p>
                            <a href="">Find out when to order to get before Lunar New Year</a>
                        </p>
                    </div>
                </div>
            </div>


            <!-- MODAL ADD SUCCESS -->
            <div class="wrapper-modal success">
                <div class="content-modal modal-success">
                    <span><i class="fa-solid fa-check"></i></span>
                    <span> Added to your cart !</span>
                    <form action="add-to-cart?idProduct=${sessionScope.product.getProductID()}">
                        <input type="hidden" name="idValue" value="">
                        <input type="hidden" name="sizeValue" value="">
                        <button class="modal-submit-btn" type="submit">
                            <i class="fa-solid fa-close close"></i>
                        </button>
                    </form>
                </div>
            </div>

            <!-- MODAL FAILED -->
            <div class="wrapper-modal failed">
                <div class="content-modal modal-failed">
                    <span><i class="fa-solid fa-close"></i></span>
                    <span> Failed to add ! Please choose all informations</span>
                    <i class="fa-solid fa-close close"></i>
                </div>
            </div>


            <!-- review section -->
            <%
                ArrayList<BillDetail> listReviews = RateDao.getReviews(p.getProductID());
                if (listReviews != null && listReviews.size() > 0) {%>

            <div class="review-section">
                <%
                    int sum = 0;
                    for (BillDetail e : listReviews) {
                        sum += e.getRateStar();
                    }
                    float avg = (sum / listReviews.size());

                %>
                <div class="header">
                    <h4>Reviews <span class="count-review">(count review)</span></h4>
                    <div class="avg-rate">
                        <span class="avg"><%=avg%></span>
                        <div class="star">
                            <i value="1" class="rate-star fa-solid fa-star"></i>
                            <i value="2" class="fa-solid fa-star"></i>
                            <i value="3" class="fa-solid fa-star"></i>
                            <i value="4" class="fa-solid fa-star"></i>
                            <i value="5" class="fa-solid fa-star"></i>
                        </div>
                    </div>
                </div>

                <div class="body">
                    <% for (BillDetail bill : listReviews) {%>
                    <div class="review">
                        <div class="review-header">
                            <%if (bill.getReviewHeader() == null || bill.getReviewHeader().isBlank()) {%>
                            <h5>Customer</h5>
                            <%} else {%>
                            <h5><%=bill.getReviewHeader()%></h5>
                            <%}%>

                            <p><%=bill.getRateTime()%></p>
                        </div>
                        <div>
                            <p>
                                <span style="color: #383d41; font-size: 13px">Size: <%=bill.getSize()%></span>
                            </p>
                        </div>
                        <div class="star">  
                            <%
                                for (int i = 1; i <= 5; i++) {
                                    if (bill.getRateStar() >= i) {%>
                            <i value="<%=i%>" class="rate-star fa-solid fa-star"></i>
                            <%} else {%>
                            <i value="<%=i%>" class="fa-solid fa-star"></i>
                            <%}
                                }%>
                        </div>
                        <div class="text">
                            <%if (bill.getReviewText() != null) {%>
                            <p><%=bill.getReviewText()%></p>     
                            <%}%>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
            <script>
                let reviews = document.querySelectorAll(".review-section .review");
                var countReview = document.querySelector(".count-review");
                countReview.innerText = "(" + reviews.length + ")";

                var avgRateStars = document.querySelectorAll(".avg-rate .star i");
                let avg = document.querySelector(".avg-rate .avg").innerText;
                for (let index = 0; index < parseInt(avg); index++) {
                    avgRateStars[index].classList.add("rate-star");
                }
            </script>
            <%}%>

        </div>

        <%@include file="footer.jsp" %>
    </body>
    <script>
        var sizeElements = document.querySelectorAll(".sizes ul li");
        var inputSizeValue = document.querySelector(".pd-action form input");
        let currentActive = null;
        sizeElements.forEach(e => {
            e.onclick = () => {
                if (e !== currentActive) {
                    e.classList.add("active");
                    let sizeValue = e.querySelector("span");
                    if (currentActive) {
                        currentActive.classList.remove("active");
                    }
                    inputSizeValue.setAttribute("value", sizeValue.innerText);
                    currentActive = e;
                }
            }
        });

        var addToCartBtn = document.querySelector(".pd-action form button");
        var wrapperModal = document.querySelectorAll(".wrapper-modal");
        var modalSuccess = document.querySelector(".wrapper-modal.success");
        var modalFailed = document.querySelector(".wrapper-modal.failed");
        var closeModal = document.querySelectorAll(".wrapper-modal .content-modal .close");
        addToCartBtn.onclick = () => {
            if (inputSizeValue.value !== "") {
                modalSuccess.classList.add("active-modal");
            } else {
                modalFailed.classList.add("active-modal");
            }
        }
        closeModal.forEach((e, index) => {
            e.onclick = () => {
                wrapperModal[index].classList.remove("active-modal");
            }
        });


        var modalSubmitBtn = document.querySelector(".modal-success .modal-submit-btn");
        var dataIdValue = document.querySelector(".pd-info").getAttribute("data-id");
        var inpIdValue = document.querySelector(".modal-success form input[name='idValue']");
        var inpSizeValue = document.querySelector(".modal-success form input[name='sizeValue']");
        modalSubmitBtn.onclick = () => {
            inpIdValue.setAttribute("value", dataIdValue);
            inpSizeValue.setAttribute("value", inputSizeValue.getAttribute("value"));
        }
    </script>

</html>
