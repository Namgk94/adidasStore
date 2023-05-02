<%@page import="java.text.DecimalFormat"%>
<%@page import="com.mycompany.mavenproject1.cookie.CookieProduct"%>
<%@page import="com.mycompany.mavenproject1.database.ProductDao"%>
<%@page import="com.mycompany.mavenproject1.model.Product"%>
<%@page import="com.mycompany.mavenproject1.service.ListProducts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
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
        
           <!-- Slide product Still interested ? -->

        <div id="product-viewed" class="carousel slide" data-bs-interval="10000" data-bs-ride="carousel">
            <div class="slide-title container">
                <h1>Still interested?</h1>
                <div class="carousel-control-button">
                    <a class="slide-control carousel-control-prev" href="#product-viewed" role="button" data-bs-slide="prev">
                        <span class=" carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="slide-control carousel-control-next" href="#product-viewed" role="button" data-bs-slide="next">
                        <span class=" carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <%  
                String[] listIdViewed = CookieProduct.getCookiesProductViewed(request);
                int i,j;
                int size = 0;
                if (listIdViewed != null) {
                    size = listIdViewed.length;
                }
                if (listIdViewed != null && size > 0) {%>

            <div class="carousel-inner">
                <%
                    int amountOddItem = size % 4;
                    int pageNumber = (size % 4 == 0) ? size / 4 : size / 4 + 1;
                    int currentRender = 0;
                    int currentCondition = 4;
                    for (i = 1; i <= pageNumber; i++) {
                        if (i == pageNumber && amountOddItem != 0) {
                            currentCondition = amountOddItem + currentRender;
                        }
                %>
                <div class="carousel-item <%=(i == 1) ? "active" : ""%>">
                    <div class="slide-wrapper">   
                        <%for (j = currentRender; j < currentCondition; j++) {
                                String id = listIdViewed[j];
                                Product p = ProductDao.getProductById(id);
                                if (p != null) {%>
                        <div class="product-wrapper">
                            <form action="detail-product">
                                <input type="hidden" name="productIdValue" value="<%=p.getProductID()%>">
                                <div class="product-card">
                                    <button class="card-img detail-product-submit" type="submit">
                                        <img src="<%=p.getProductImage()%>" alt="<%=p.getProductName()%>">
                                    </button>

                                    <button class="detail-product-submit" type="submit">
                                        <div class="product-price">
                                            <%DecimalFormat formatter = new DecimalFormat("###,###,###");%>
                                            <span><%=formatter.format(Double.parseDouble(p.getProductPrice()))%></span>
                                        </div>

                                        <div class="card-detail">
                                            <p class="card-name"><%=p.getProductName()%></p>
                                            <p class="card-category"><%=p.getProductCategory()%></p>
                                            <p class="card-label"><%=p.getProductLabel()%></p>
                                        </div>
                                    </button>
                                </div>
                            </form>
                            <div class="card-wishlist">
                                <form action="add-to-wishlist">
                                    <input type="hidden" name="idWishList" value="<%=p.getProductID()%>">
                                    <input type="hidden" name="checkWishlist" value="">
                                    <button type="button">
                                        <i class="fa-regular fa-heart"></i>
                                        <i class="fa-solid fa-heart"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                        <%}
                            }%>


                    </div>
                </div>
                <%
                        currentRender = currentCondition;
                        currentCondition += 4;

                    }%>

            </div>
            <%} else { %>
            <div class="none-product">
                <p>Không có sản phẩm nào !</p>
            </div>
            <%}%>
        </div>
        
        
        
        <div id="product-slide" class="carousel slide" data-bs-interval="10000" data-bs-ride="carousel">
            <div class="slide-title container">
                <h1>Best of Products</h1>
                <div class="carousel-control-button">
                    <a class="slide-control carousel-control-prev" href="#product-slide" role="button" data-bs-slide="prev">
                        <span class=" carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="slide-control carousel-control-next" href="#product-slide" role="button" data-bs-slide="next">
                        <span class=" carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="carousel-inner">

                <%  
                    ListProducts.ClearListProduct();
                    ProductDao.getProductsData();
                    size = ListProducts.getList().size();
                    int amountOddItem = size % 4;
                    int pageNumber = (size % 4 == 0) ? size / 4 : size / 4 + 1;
                    int currentRender = 0;
                    int currentCondition = 4;
                    for (i = 1; i <= pageNumber; i++) {
                        if (i == pageNumber && amountOddItem != 0) {
                            currentCondition = amountOddItem + currentRender;
                        }
                %>
                <div class="carousel-item <%=(i == 1) ? "active" : ""%>">
                    <div class="slide-wrapper">   
                        <%for (j = currentRender; j < currentCondition; j++) {
                                Product p = ListProducts.getList().get(j);
                                if (p != null) {%>
                        <div class="product-wrapper">
                            <form action="detail-product">
                                <input type="hidden" name="productIdValue" value="<%=p.getProductID()%>">
                                <div class="product-card">
                                    <button class="card-img detail-product-submit" type="submit">
                                        <img src="<%=p.getProductImage()%>" alt="<%=p.getProductName()%>">
                                    </button>

                                    <button class="detail-product-submit" type="submit">
                                        <div class="product-price">
                                            <%DecimalFormat formatter = new DecimalFormat("###,###,###");%>
                                            <span><%=formatter.format(Double.parseDouble(p.getProductPrice()))%></span>
                                        </div>

                                        <div class="card-detail">
                                            <p class="card-name"><%=p.getProductName()%></p>
                                            <p class="card-category"><%=p.getProductCategory()%></p>
                                            <p class="card-label"><%=p.getProductLabel()%></p>
                                        </div>
                                    </button>
                                </div>
                            </form>
                            <div class="card-wishlist">
                                <form action="add-to-wishlist">
                                    <input type="hidden" name="idWishList" value="<%=p.getProductID()%>">
                                    <input type="hidden" name="checkWishlist" value="">
                                    <button type="button">
                                        <i class="fa-regular fa-heart"></i>
                                        <i class="fa-solid fa-heart"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                        <%}
                            }%>


                    </div>
                </div>
                <%
                        currentRender = currentCondition;
                        currentCondition += 4;

                    }%>

            </div>
        </div>




        <!-- TRENDING SLIDE-->
        <div id="trending-slide" class="carousel slide" data-bs-interval="10000" data-bs-ride="carousel">
            <div class="slide-title container">
                <h1>Trending</h1>
                <div class="carousel-control-button">
                    <a class="slide-control carousel-control-prev" href="#trending-slide" role="button" data-bs-slide="prev">
                        <span class=" carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="slide-control carousel-control-next" href="#trending-slide" role="button" data-bs-slide="next">
                        <span class=" carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="carousel-inner">

                <%  ListProducts.ClearListProduct ();

                    ProductDao.getTrendingProducts ();
                    size  = ListProducts.getList().size();
                    amountOddItem  = size % 4;
                    pageNumber  = (size % 4 == 0) ? size / 4 : size / 4 + 1;
                    currentRender  = 0;
                    currentCondition  = 4;
                    for (i  = 1;
                    i <= pageNumber ;
                    i

                    
                        ++) {
                        if (i == pageNumber && amountOddItem != 0) {
                            currentCondition = amountOddItem + currentRender;
                        }
                %>
                <div class="carousel-item <%=(i == 1) ? "active" : ""%>">
                    <div class="slide-wrapper">   
                        <%for (j = currentRender; j < currentCondition; j++) {
                                Product p = ListProducts.getList().get(j);
                                if (p != null) {%>
                        <div class="product-wrapper">
                            <form action="detail-product">
                                <input type="hidden" name="productIdValue" value="<%=p.getProductID()%>">
                                <div class="product-card">
                                    <button class="card-img detail-product-submit" type="submit">
                                        <img src="<%=p.getProductImage()%>" alt="<%=p.getProductName()%>">
                                    </button>

                                    <button class="detail-product-submit" type="submit">
                                        <div class="product-price">
                                            <%DecimalFormat formatter = new DecimalFormat("###,###,###");%>
                                            <span><%=formatter.format(Double.parseDouble(p.getProductPrice()))%></span>
                                        </div>

                                        <div class="card-detail">
                                            <p class="card-name"><%=p.getProductName()%></p>
                                            <p class="card-category"><%=p.getProductCategory()%></p>
                                            <p class="card-label"><%=p.getProductLabel()%></p>
                                        </div>
                                    </button>
                                </div>
                            </form>
                            <div class="card-wishlist">
                                <form action="add-to-wishlist">
                                    <input type="hidden" name="idWishList" value="<%=p.getProductID()%>">
                                    <input type="hidden" name="checkWishlist" value="">
                                    <button type="button">
                                        <i class="fa-regular fa-heart"></i>
                                        <i class="fa-solid fa-heart"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                        <%}
                            }%>


                    </div>
                </div>
                <%
                        currentRender = currentCondition;
                        currentCondition += 4;

                    }%>

            </div>
        </div>
                    
                    
        
        
    </body>
    <script>
        const wishlistBtn = document.querySelectorAll(".card-wishlist button");

        const cardWishlistELements = document.querySelectorAll(".card-wishlist");
        var inputCheckCookies = document.querySelectorAll(".card-wishlist input[name='checkCookie']");
        wishlistBtn.forEach((e, index) => {
            e.onclick = () => {
                cardWishlistELements[index].classList.toggle("active");

            };
        });
        inputCheckCookies.forEach((e, index) => {
            if (e.getAttribute("value") == "true") {
                cardWishlistELements[index].classList.add("active");
            } else {
                cardWishlistELements[index].classList.remove("active");
            }
        });

    </script>

</html>