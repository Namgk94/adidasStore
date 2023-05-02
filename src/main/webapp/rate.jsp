<%-- 
    Document   : rate.jsp
    Created on : Apr 3, 2023, 3:12:48 PM
    Author     : NAM
--%>

<%@page import="com.mycompany.mavenproject1.model.BillDetail"%>
<%@page import="com.mycompany.mavenproject1.model.Bill"%>
<%@page import="com.mycompany.mavenproject1.database.UserDao"%>
<%@page import="com.mycompany.mavenproject1.database.BillDao"%>
<%@page import="com.mycompany.mavenproject1.model.Product"%>
<%@page import="java.util.ArrayList"%>
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
                    <div class="col-10">

                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="fw-normal mb-0 text-black">Rate the product you bought</h3>
                            <div>
                                <p class="mb-0"><span class="text-muted">Sort by:</span> <a href="#!"
                                                                                            class="text-body">price <i class="fas fa-angle-down mt-1"></i></a></p>
                            </div>
                        </div>
                        <div class="text-none" style="display: none; font-weight: bold; font-size: 30px; padding: 30px">
                            <p>Bạn chưa mua hàng lần nào! </p>
                            <a href="index.jsp" style="text-decoration: underline !important;"> Đi tới trang mua hàng </a>
                        </div>

                        <%
                            BillDao billDao = new BillDao();
                            String userEmail = String.valueOf(session.getAttribute("username"));
                            int userId = UserDao.getUserIdByEmail(userEmail);
                            ArrayList<Bill> listBill = billDao.getBillByUserId(userId);
                            for (Bill bill : listBill) {
                                for (BillDetail p : billDao.getBillDetailsByBillId(bill.getBillId())) {%>
                        <div class="card rounded-3 mb-4">
                            <div class="card-body p-4" data-check-rated="<%=p.isRated()%>">
                                <div class="row d-flex justify-content-around align-items-center">
                                    <div class="col-md-2 col-lg-2 col-xl-2">
                                        <a href="detail-product?detail_product_id=<%=p.getProduct().getProductID()%>">
                                            <img src="<%=p.getProduct().getProductImage()%>"
                                                 class="img-fluid rounded-3" alt="<%=p.getProduct().getProductName()%>">
                                        </a>
                                    </div>
                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                        <p class="lead fw-normal mb-2"><%=p.getProduct().getProductName()%></p>
                                        <p><span class="text-muted">Size: </span><%=p.getSize()%></p>
                                        <p><span class="text-muted">Order at: </span><%=bill.getOrderTime()%></p>
                                    </div>
                                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                        <input min="1" name="quantity" value="<%=p.getProduct().getAmount()%>" type="button"
                                               class="form-control form-control-sm" style="text-align: center;"/>
                                    </div>
                                    <div class="col-md-1col-lg-1 col-xl-1 offset-lg-1" style="width: max-content">
                                        <%
                                            double price = Double.valueOf(p.getProduct().getProductPrice());
                                            String totalPrice = String.valueOf(price * p.getProduct().getAmount());
                                        %>
                                        <h5 class="mb-0"><%=totalPrice%></h5>
                                    </div>
                                    <div class="col-md-2 col-lg-3 col-xl-2 text-center rate-btn-section">
                                        <!-- Button trigger modal -->
                                        <a type="button" class="btn btn-primary btn-rating" data-bs-toggle="modal"
                                           data-bs-target="#exampleModalCenter" data-id-bill="<%=p.getBillId()%>" data-id-product ="<%=p.getProduct().getProductID()%>"
                                           style="">
                                            Rating
                                        </a>
                                        <p>Bạn đã đánh giá sản phẩm này</p> 
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}
                            }%>

                    </div>
                </div>
            </div>
        </section>

        <!-- modal rating -->
        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <form action="rating-product" method="post" class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Rating</h5>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="rate-choose">
                            <i value="1" class="rate-star fa-solid fa-star"></i>
                            <i value="2" class="fa-solid fa-star"></i>
                            <i value="3" class="fa-solid fa-star"></i>
                            <i value="4" class="fa-solid fa-star"></i>
                            <i value="5" class="fa-solid fa-star"></i>
                            <input type="hidden" name="rateStar" value="1">
                        </div>
                        <div class="rate-text">
                            <label for="review_label">Label: </label>
                            <input name="reviewHeader" id="review_label" type="text">
                        </div>
                        <div class="rate-text">
                            <label for="review_text">Your Review: </label>
                            <input name="reviewText" id="review_text" type="text">
                        </div>

                    </div>
                    <div class="modal-footer">
                        <input type="hidden" name="id_product_rate">
                        <input type="hidden" name="id_bill_rate">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn link-product" style="
                                background-color: #ffda00;">Rate</button>
                    </div>
                </form>
            </div>
            <style>
                .rate-btn-section a{
                    background-color: rgb(237, 173, 43);
                    padding: 5px;
                    border-radius: 10px;
                    color: #fff !important;
                    text-decoration: none;
                    border: 2px solid #ffb31a;
                }

                .rate-star {
                    color: rgb(255, 251, 0);
                }

                .rate-choose i {
                    cursor: pointer;
                    margin: 3px;
                    transition: 0.2s all linear;
                }

                .rate-text {
                    display: flex;
                    margin: 10px 0;
                }
                .rate-text input {
                    flex: 1;
                    padding: 5px 15px
                }
                .rate-text label {
                    flex: 1;
                    font-weight: bold;
                }
            </style>
        </div>
        <%@include file="footer.jsp" %>                            
    </body>
    <script>
        let cards = document.querySelectorAll(".card.rounded-3");
        let textNoProduct = document.querySelector(".text-none");
        if (cards.length == 0) {
            textNoProduct.style.display = "block";
        }


        let cardBodyList = document.querySelectorAll(".card-body");
        cardBodyList.forEach(e => {
            if (e.getAttribute("data-check-rated") == "false") {
                e.querySelector(".rate-btn-section a").setAttribute("style", "display: inline-block !important;")
                e.querySelector(".rate-btn-section p").setAttribute("style", "display: none !important;")
            } else {
                e.querySelector(".rate-btn-section a").setAttribute("style", "display: none !important;")
                e.querySelector(".rate-btn-section p").setAttribute("style", "display: inline-block !important;");

            }
        })


        var rateStar = document.querySelectorAll(".modal-body .fa-star");
        var inputRateStarHidden = document.querySelector("input[name='rateStar']");
        rateStar.forEach(e => {
            e.onclick = () => {
                rateStar.forEach(item => {
                    item.classList.remove("rate-star");
                });
                let value = e.getAttribute("value");
                for (let index = 0; index < value; index++) {
                    rateStar[index].classList.add("rate-star");
                }
                inputRateStarHidden.setAttribute("value", value);
            }
        });

        var btnRating = document.querySelectorAll(".btn-rating");
        var hrefIdProduct = document.querySelector(".modal-footer .link-product");
        btnRating.forEach(e => {
            e.onclick = () => {
                var product_id = e.getAttribute("data-id-product");
                var bill_id = e.getAttribute("data-id-bill");

//            set value for input hidden;
                document.querySelector("input[name='id_product_rate']").setAttribute("value", product_id);
                document.querySelector("input[name='id_bill_rate']").setAttribute("value", bill_id);
                console.log(document.querySelector("input[name='id_product_rate']").getAttribute("value"));
                console.log(document.querySelector("input[name='id_bill_rate']").getAttribute("value"));

                var nameProduct = e.parentNode.parentNode.querySelector(".lead.fw-normal").innerText;
                var modalTitle = document.querySelector(".modal-content .modal-title").innerText = "Review: " + nameProduct;
            }
        })

    </script>

</html>
