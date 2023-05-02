<%-- 
    Document   : index
    Created on : Feb 5, 2023, 1:08:40 PM
    Author     : NAM
--%>

<%@page import="com.mycompany.mavenproject1.database.JDBCConnection"%>
<%@page import="com.mycompany.mavenproject1.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.mavenproject1.service.ManageUser"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./WebContent/assets/css/header.css"/>
        <title>adidas Official Website</title>
    </head>

    <body>


        <%@include file="header.jsp" %>
        <%@include file="posterhead.jsp" %>


        <div class="content-wrapper container">
            <h1>Who are you shopping for?</h1>
            <div class="content-row">
                <div class="content">
                    <a href="shop_page.jsp?action=default&for=women">
                        <div class="content-img">
                            <img src="https://brand.assets.adidas.com/image/upload/f_auto,q_auto,fl_lossy/if_w_gt_800,w_800/enVN/Images/nav-women-d_tcm212-819363.jpg" alt="">
                        </div>
                        <h2>women</h2>
                    </a>

                </div>
                <div class="content">
                    <a href="shop_page.jsp?action=default&for=men">
                        <div class="content-img">
                            <img src="https://brand.assets.adidas.com/image/upload/f_auto,q_auto,fl_lossy/if_w_gt_800,w_800/enVN/Images/nav-men-d_tcm212-819364.jpg " alt="">
                        </div>
                        <h2>men</h2>
                    </a>
                </div>


                <div class="content">
                    <a href="shop_page.jsp?action=default&prop=kid">
                        <div class="content-img">
                            <img src="https://brand.assets.adidas.com/image/upload/f_auto,q_auto,fl_lossy/if_w_gt_800,w_800/enVN/Images/nav-kids-d_tcm212-819367.jpg" alt="">
                        </div>
                        <h2>kids</h2>
                    </a>

                </div>
            </div>
            <style>
                .content-wrapper{
                    display: flex;
                    flex-direction: column;
                }
                .content-wrapper a{
                    color: unset;
                    text-decoration: unset;
                }
                .content-wrapper h1{
                    font-size: 30px;
                    font-weight: bold;
                    padding: 0 1.5%;
                }
                .content-wrapper h1,h2{
                    text-transform: uppercase;
                }
                .content-wrapper h2{
                    font-size: 18px;
                    font-weight: 700;
                    padding-top: 15px;
                    color: #333;
                    text-decoration: unset !important;
                }
                .content-row{
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    flex-wrap: wrap;
                    width: 100%;
                    padding: 30px 0;
                }
                .content-row .content{
                    width: 30%;
                    margin: 0 10px;
                }
                .content-row .content .content-img{
                    width: 100%;
                    height: 400px;
                    overflow: hidden;
                    position: relative;
                }
                .content-row .content .content-img::before{
                    content: "";
                    width: 100%;
                    height: 100%;
                    background-color: rgba(0, 0, 0, 0.2);
                    position: absolute;
                }
                .content .content-img img{
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                    object-position: center;

                }
            </style>
        </div>

        <%@include file="products_slide.jsp" %>

        <!-- paragraph -->
        <div class="" style="
             background-color: #f5f5e5;
             ">
            <div class="wrapper container" style="display: flex; justify-content: center; padding: 30px 0;">
                <div class="content">
                    <h1>STORIES, STYLES AND SPORTSWEAR AT ADIDAS, SINCE 1949</h1>
                    <p>
                        Sport keeps us fit. Keeps you mindful. Brings us together. Through sport we have the power to change
                        lives. Whether it is through stories of inspiring athletes. Helping you to get up and get moving.
                        Sportswear featuring the latest technologies, to up your performance. Beat your PB.adidas offers a
                        home to the runner, the basketball player, the soccer kid, the fitness enthusiast. The weekend hiker
                        that loves to escape the city. The yoga teacher that spreads the moves. The 3-Stripes are seen in
                        the music scene. On stage, at festivals. Our sports clothing keeps you focused before that whistle
                        blows. During the race. And at the finish lines. We’re here to supportcreators. Improve their game.
                        Their lives. And change the world.
                    </p>
                    <p>
                        adidas is about more than sportswear and workout clothes. We partner with the best in the industry
                        to co-create. This way we offer our fans the sports apparel and style that match their athletic
                        needs, while keeping sustainability in mind. We’re here to support creators. Improve their game.
                        Create change. And we think about the impact we have on our world.
                    </p>
                </div>
                <div class="content">
                    <h1>Workout clothes, for any sports</h1>
                    <p>
                        adidas designs for and with athletes of all kinds. Creators, who love to change the game. Challenge
                        conventions. Break the rules and define new ones. Then break them again. We supply teams and
                        individuals with athletic clothing pre-match. To stay focussed. We design sports apparel that get
                        you to the finish line. To win the match. We support women, with bras and tights made for purpose.
                        From low to high support. Maximum comfort. We design, innovate and itterate. Testing new
                        technologies in action. On the pitch, the tracks, the court, the pool. Retro workout clothes inspire
                        new streetwear essentials. Like NMD, Ozweego and our Firebird tracksuits. Classic sports models are
                        brought back to life. Like Stan Smith. And Superstar. Now seen on the streets and the stages.
                    </p>
                    <p>
                        Through our collections we blur the borders between high fashion and high performance. Like our
                        adidas by Stella McCartney athletic clothing collection – designed to look the part inside and
                        outside of the gym. Or some of our adidas Originals lifestyle pieces, that can be worn as sportswear
                        too. Our lives are constantly changing. Becoming more and more versatile. And adidas designs with
                        that in mind.
                    </p>
                </div>
            </div>
            <style>
                .content{
                    padding: 30px 20px;
                    display: flex;
                    flex-direction: column;
                }
                .content h1{
                    font-size: 36px;
                    font-weight: bolder;
                    color: #000;
                    margin-bottom: 20px;
                    width: 70%;
                    flex: 2;
                }
                .content p{
                    flex: 1;
                    line-height: 1.3;
                }
            </style>
        </div>


        <%@include file="footer.jsp" %>
    </body>
</html>
