<%-- 
    Document   : header
    Created on : Dec 20, 2017, 10:48:35 AM
    Author     : vudt9
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<header>
    <!-- ****** Top Header Area Start ****** -->
    <div class="top_header_area">
        <div class="container">
            <div class="row">
                <div class="col-5 col-sm-6">
                    <!--                      Top Social bar start 
                                        <div class="top_social_bar">
                                            <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                            <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                            <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                                            <a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a>
                                            <a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
                                        </div>-->
                </div>
                <!--  Login Register Area -->
                <div class="col-7 col-sm-6">
                    <div class="signup-search-area d-flex align-items-center justify-content-end">
                        <div class="login_register_area d-flex">
                            <c:choose>
                                <c:when test="${cookie.username != null}">
                                    <div class="login">
                                        <a href="user.jsp">
                                            <c:out value="${cookie.username.value}"></c:out>
                                        </a>
                                    </div>
                                    <div class="register">
                                        <a href="Logout">Đăng xuất</a>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="login">
                                        <a data-toggle="modal" href="#dangnhap">Đăng nhập</a>
                                    </div>
                                    <div class="register">
                                        <a data-toggle="modal" href="#dangky">Đăng ký</a>
                                    </div>                                    
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <!--                         Search Button Area 
                                                <div class="search_button">
                                                    <a class="searchBtn" href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                </div>
                                                 Search Form 
                                                <div class="search-hidden-form">
                                                    <form action="#" method="get">
                                                        <input type="search" name="search" id="search-anything" placeholder="Search Anything...">
                                                        <input type="submit" value="" class="d-none">
                                                        <span class="searchBtn"><i class="fa fa-times" aria-hidden="true"></i></span>
                                                    </form>
                                                </div>-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ****** Top Header Area End ****** -->

    <nav class="container-fluid position-relative no-side-padding">

        <a href="index.jsp" class="logo"><img src="images/logo.png" alt="Logo Image"></a>

        <div class="menu-nav-icon" data-nav-menu="#main-menu"><i class="ion-navicon"></i></div>

        <ul class="main-menu visible-on-click" id="main-menu">
            <li><a href="index.jsp">Trang chủ</a></li>
            <li><a href="about.jsp">Giới thiệu</a></li>
            <li><a href="contact.jsp">Liên hệ</a></li>
        </ul><!-- main-menu -->

        <div class="src-area">
            <form>
                <button class="src-btn" type="submit"><i class="ion-ios-search-strong"></i></button>
                <input class="src-input" type="text" placeholder="Tìm kiếm">
            </form>
        </div>

    </nav><!-- conatiner -->
</header>
