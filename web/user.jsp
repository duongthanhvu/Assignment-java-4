<%-- 
    Document   : news
    Created on : Dec 22, 2017, 11:43:31 PM
    Author     : vudt9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/laydulieu" prefix="f"%>
<c:if test="${cookie.username == null}">
    <c:redirect url="index.jsp"></c:redirect>
</c:if>


<!DOCTYPE HTML>
<html lang="vi">
    <head>
        <title>TITLE</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

        <!-- Font -->

        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">

        <!-- Stylesheets -->

        <link href="common-css/bootstrap.css" rel="stylesheet">

        <link href="common-css/ionicons.css" rel="stylesheet">

        <link href="blog-sidebar/css/styles.css" rel="stylesheet">

        <link href="blog-sidebar/css/responsive.css" rel="stylesheet">

        <script src="common-js/jquery-3.1.1.min.js"></script>

        <script src="common-js/tether.min.js"></script>

        <script src="common-js/bootstrap.js"></script>

        <script src="common-js/scripts.js"></script>


        <script src="tinymce/tinymce.min.js"></script>
        <script src="tinymce/init-tinymce.js"></script>
    </head>
    <body>
        <%@include file="includes/header.jsp" %>
        <%@include file="includes/modal.jsp" %>
        <section class="blog-area section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-12">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#home">Tạo mới</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#menu1">Bài của tôi</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#menu2">Bài yêu thích</a>
                            </li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content" style="background-color: white; text-align: left">
                            <div id="home" class="container tab-pane active"><br>
                                <div class="box">
                                    <div class="box-body pad">
                                        <form action="ThemTin" method="POST" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <label for="title">Tiêu đề:</label>
                                                <input type="text" class="form-control" id="title" placeholder="Nhập tiêu đề của tin tức" name="title" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="shortdescription">Mô tả:</label>
                                                <input type="text" class="form-control" id="shortdescription" placeholder="Đoạn mô tả về tin tức" name="shortdescription">
                                            </div>
                                            <div class="form-group">
                                                <label for="addnews">Nội dung:</label>
                                                <textarea class="tinymce" id="addnews" placeholder="Place some text here" name="description"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="featureimg">Ảnh đại diện:</label>
                                                <input type="file" class="form-control" id="featureimg" name="featureimg">
                                            </div>
                                            <br>
                                            <input type="submit" class="btn btn-outline-primary" value="Đăng tin">
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div id="menu1" class="container tab-pane fade"><br>
                                <ul class="list-group">
                                    <c:forEach items="${f:getNewsByUser(sessionScope.userid)}" var="news">
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <a class="w-75" href="news.jsp?newsid=${news.idnews}"><h5>${news.title}</h5></a>
                                            <span>
                                                <a class="btn btn-outline-success" href="javascript:void(0);" onclick="suaTin(${news.idnews})">Sửa</a>
                                                <a class="btn btn-outline-danger" href="XoaTinTuc?id=${news.idnews}">Xóa</a>
                                            </span>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div id="menu2" class="container tab-pane fade"><br>
                                <ul class="list-group">
                                    <c:forEach items="${f:getSavedNewsByUser(sessionScope.userid)}" var="savednews">
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <a class="w-75" href="news.jsp?newsid=${savednews.news.idnews}"><h5>${savednews.news.title}</h5></a>
                                            <span>
                                                <a class="btn btn-outline-success" onclick="this.innerHTML = 'Like';" href="ThaTim?idnews=${savednews.news.idnews}&iduser=${sessionScope.userid}">Unlike</a>
                                            </span>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 ">
                        <div class="single-post info-area ">
                            <c:set var="user" value="${f:getUserById(sessionScope.userid)}"></c:set>
                                <div class="about-area">
                                <c:choose>
                                    <c:when test="${user.avatar != null}" >
                                        <img class="img-fluid rounded" style="max-width: 100%; height: auto" src="uploads/${user.avatar}">
                                    </c:when>
                                    <c:otherwise>
                                        <img class="img-fluid rounded" style="max-width: 100%; height: auto" src="images/ben-o-sullivan-382817.jpg">
                                    </c:otherwise>
                                </c:choose>
                                <h3><b><c:out value="${user.fullname}"></c:out></b></h3>
                                <p><c:out value="${user.username}"></c:out></p>
                                    <br>
                                    <p>Email: <c:out value="${user.email}"></c:out></p>
                                <p>Ngày đăng ký: <c:out value="${user.createddate}"></c:out></p>
                                <br>
                                <a href="#" class="btn btn-outline-primary">Sửa thông tin</a>
                            </div>

                            <div class="subscribe-area">

                                <h4 class="title"><b>SUBSCRIBE</b></h4>
                                <div class="input-area">
                                    <form>
                                        <input class="email-input" type="text" placeholder="Enter your email">
                                        <button class="submit-btn" type="submit"><i class="ion-ios-email-outline"></i></button>
                                    </form>
                                </div>

                            </div><!-- subscribe-area -->

                            <div class="tag-area">

                                <h4 class="title"><b>TAG CLOUD</b></h4>
                                <ul>
                                    <li><a href="#">Manual</a></li>
                                    <li><a href="#">Liberty</a></li>
                                    <li><a href="#">Recomendation</a></li>
                                    <li><a href="#">Interpritation</a></li>
                                    <li><a href="#">Manual</a></li>
                                    <li><a href="#">Liberty</a></li>
                                    <li><a href="#">Recomendation</a></li>
                                    <li><a href="#">Interpritation</a></li>
                                </ul>

                            </div><!-- subscribe-area -->

                        </div><!-- info-area -->
                    </div><!-- col-lg-4 col-md-12 -->
                </div>
            </div>
        </section>
        <div id="suatin" class="modal fade" role="dialog"></div>
        <script>
            function suaTin(newsid)
            {
                $.ajax({
                    type: "post",
                    url: "includes/editnews.jsp", // servlet
                    data: "newsid=" + newsid,
                    success: function (data) {
                        $('#suatin').html(data);
                        $('#suatin').modal();
                        tinymce.init({
                            selector: "textarea.tinymce"
                        });
                    }
                });
            }
            ;
        </script>
    </body>

</html>
