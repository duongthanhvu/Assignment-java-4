<%-- 
    Document   : news
    Created on : Dec 22, 2017, 11:43:31 PM
    Author     : vudt9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/laydulieu" prefix="f"%>

<c:if test="${param.newsid == null}">
    <c:redirect url="index.jsp"></c:redirect>
</c:if>
<c:set var="news" value="${f:getNewsById(param.newsid)}"></c:set>
    <!DOCTYPE HTML>
    <html lang="en">
        <head>
            <title><c:out value="${news.title}"></c:out></title>
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <meta charset="UTF-8">


            <!-- Font -->

            <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">


            <!-- Stylesheets -->

            <link href="common-css/bootstrap.css" rel="stylesheet">

            <link href="common-css/ionicons.css" rel="stylesheet">


            <link href="single-post-2/css/styles.css" rel="stylesheet">

            <link href="single-post-2/css/responsive.css" rel="stylesheet">

        </head>
        <body >

        <%@include file="includes/header.jsp" %>
        <%@include file="includes/modal.jsp" %>
        <div class="slider" style="background-image: url(uploads/${news.featureimg}); background-position: center center; background-attachment: fixed;">

        </div><!-- slider -->

        <section class="post-area">
            <div class="container">

                <div class="row">

                    <div class="col-lg-1 col-md-0"></div>
                    <div class="col-lg-10 col-md-12">

                        <div class="main-post">

                            <div class="post-top-area">

                                <h5 class="pre-title">FASHION</h5>

                                <h3 class="title"><a href="#"><b><c:out value="${news.title}"></c:out></b></a></h3>

                                    <div class="post-info">

                                        <div class="left-area">
                                            <a class="avatar" href="#"><img src="images/avatar-1-120x120.jpg" alt="Profile Image"></a>
                                        </div>

                                        <div class="middle-area">
                                            <a class="name" href="#"><b>${news.users.fullname}</b></a>
                                        <h6 class="date">đăng ngày ${news.createddate}</h6>
                                    </div>

                                </div><!-- post-info -->

                                <p class="para">${news.description}</p>

                            </div><!-- post-top-area -->
                            <div class="post-bottom-area">
                                <div class="post-icons-area">
                                    <ul class="post-icons">
                                        <li><a href="#"><i class="ion-heart"></i></a></li>
                                        <li><a href="#"><i class="ion-chatbubble"></i></a></li>
                                        <li><a href="#"><i class="ion-eye"></i></a></li>
                                    </ul>

                                    <ul class="icons">
                                        <li>Chia sẻ : </li>
                                        <li><a href="#"><i class="ion-social-facebook"></i></a></li>
                                        <li><a href="#"><i class="ion-social-twitter"></i></a></li>
                                        <li><a href="#"><i class="ion-social-pinterest"></i></a></li>
                                    </ul>
                                </div>

                                <div class="post-footer post-info">

                                    <div class="left-area">
                                        <a class="avatar" href="#"><img src="images/avatar-1-120x120.jpg" alt="Profile Image"></a>
                                    </div>

                                    <div class="middle-area">
                                        <a class="name" href="#"><b>${news.users.fullname}</b></a>
                                        <h6 class="date">đăng ngày ${news.createddate}</h6>
                                    </div>

                                </div><!-- post-info -->

                            </div><!-- post-bottom-area -->

                        </div><!-- main-post -->
                    </div><!-- col-lg-8 col-md-12 -->
                </div><!-- row -->
            </div><!-- container -->
        </section><!-- post-area -->


        <section class="recomended-area section">
            <div class="container">
                <div class="row">
                    <c:forEach items="${f:getLatestNews(0,3)}" var="latestnews">
                        <div class="col-lg-4 col-md-6">
                            <div class="card h-100">
                                <div class="single-post post-style-1">

                                    <div class="blog-image"><img src="uploads/${latestnews.featureimg}" alt="Blog Image"></div>

                                    <a class="avatar" href="news.jsp?newsid=${latestnews.idnews}"><img src="images/icons8-team-355979.jpg" alt="Profile Image"></a>

                                    <div class="blog-info">

                                        <h4 class="title"><a href="#"><b>${latestnews.title}</b></a></h4>
  
                                        <ul class="post-footer">
                                            <li><a href="#"><i class="ion-heart"></i></a></li>
                                            <li><a href="#comment"><i class="ion-chatbubble"></i></a></li>
                                            <li><a href="#"><i class="ion-eye"></i></a></li>
                                        </ul>
                                    </div><!-- blog-info -->
                                </div><!-- single-post -->
                            </div><!-- card -->
                        </div><!-- col-md-6 col-sm-12 -->
                    </c:forEach>
                </div><!-- row -->
            </div><!-- container -->
        </section>

        <section class="comment-section center-text">
            <div class="container">
                <h4><b>ĐĂNG BÌNH LUẬN</b></h4>
                <div class="row">

                    <div class="col-lg-2 col-md-0"></div>

                    <div class="col-lg-8 col-md-12">
                        <div class="comment-form">
                            <c:choose>
                                <c:when test="${sessionScope.userid != null}">
                                    <form action="Comment?idnews=${news.idnews}" method="post">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <textarea name="comment" rows="2" class="text-area-messge form-control"
                                                          placeholder="Viết bình luận tại đây" aria-required="true" aria-invalid="false"></textarea >
                                            </div><!-- col-sm-12 -->
                                            <div class="col-sm-12">
                                                <button class="submit-btn" type="submit" id="form-submit"><b>Đăng bình luận</b></button>
                                            </div><!-- col-sm-12 -->
                                        </div><!-- row -->
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <div class="alert alert-warning">Vui lòng <a data-toggle="modal" href="#dangnhap">đăng nhập</a> để đăng bình luận!</div>
                                </c:otherwise>
                            </c:choose>
                        </div><!-- comment-form -->

                        <h4 id="comment"><b>BÌNH LUẬN(${f:getCommentCount(news.idnews)})</b></h4>
                        <c:forEach items="${f:getCommentByNews(news.idnews)}" var="comment">
                            <div class="commnets-area text-left">
                                <div class="comment">
                                    <div class="post-info">
                                        <div class="left-area">
                                            <a class="avatar" href="#"><img src="images/avatar-1-120x120.jpg" alt="Profile Image"></a>
                                        </div>
                                        <div class="middle-area">
                                            <a class="name" href="#"><b>${comment.users.fullname}</b></a>
                                            <h6 class="date">vào lúc ${comment.createddate}</h6>
                                        </div>
                                    </div><!-- post-info -->
                                    <p>${comment.content}</p>
                                </div>
                            </div><!-- commnets-area -->
                        </c:forEach>
                        <!--                        <a class="more-comment-btn" href="#"><b>BÌNH LUẬN CŨ HƠN</b></a>-->

                    </div><!-- col-lg-8 col-md-12 -->

                </div><!-- row -->

            </div><!-- container -->
        </section>

        <footer>

            <div class="container">
                <div class="row">

                    <div class="col-lg-4 col-md-6">
                        <div class="footer-section">

                            <a class="logo" href="#"><img src="images/logo.png" alt="Logo Image"></a>
                            <p class="copyright">Bona @ 2017. All rights reserved.</p>
                            <p class="copyright">Designed by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
                            <ul class="icons">
                                <li><a href="#"><i class="ion-social-facebook-outline"></i></a></li>
                                <li><a href="#"><i class="ion-social-twitter-outline"></i></a></li>
                                <li><a href="#"><i class="ion-social-instagram-outline"></i></a></li>
                                <li><a href="#"><i class="ion-social-vimeo-outline"></i></a></li>
                                <li><a href="#"><i class="ion-social-pinterest-outline"></i></a></li>
                            </ul>

                        </div><!-- footer-section -->
                    </div><!-- col-lg-4 col-md-6 -->

                    <div class="col-lg-4 col-md-6">
                        <div class="footer-section">
                            <h4 class="title"><b>CATAGORIES</b></h4>
                            <ul>
                                <li><a href="#">BEAUTY</a></li>
                                <li><a href="#">HEALTH</a></li>
                                <li><a href="#">MUSIC</a></li>
                            </ul>
                            <ul>
                                <li><a href="#">SPORT</a></li>
                                <li><a href="#">DESIGN</a></li>
                                <li><a href="#">TRAVEL</a></li>
                            </ul>
                        </div><!-- footer-section -->
                    </div><!-- col-lg-4 col-md-6 -->

                    <div class="col-lg-4 col-md-6">
                        <div class="footer-section">

                            <h4 class="title"><b>SUBSCRIBE</b></h4>
                            <div class="input-area">
                                <form>
                                    <input class="email-input" type="text" placeholder="Enter your email">
                                    <button class="submit-btn" type="submit"><i class="icon ion-ios-email-outline"></i></button>
                                </form>
                            </div>

                        </div><!-- footer-section -->
                    </div><!-- col-lg-4 col-md-6 -->

                </div><!-- row -->
            </div><!-- container -->
        </footer>


        <!-- SCIPTS -->

        <script src="common-js/jquery-3.1.1.min.js"></script>

        <script src="common-js/tether.min.js"></script>

        <script src="common-js/bootstrap.js"></script>

        <script src="common-js/scripts.js"></script>

    </body>
</html>

