<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html lang="vi">
    <head>
        <title>TITLE</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">


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

        <script src="common-js/jquery.vide.min.js"></script>
    </head>
    <body >
        <%@include file="includes/header.jsp" %>
        <%@include file="includes/modal.jsp" %>
        <div class="slider display-table center-text" data-vide-bg="webm:uploads/Save_As.webm, poster:uploads/Save_As.jpg">
            <h1 class="title display-table-cell"><b>TECH</b>IN<b>BMT</b></h1>
        </div><!-- slider -->
        <section class="blog-area section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-12">
                        <div class="row" id="content">
                            <script> <%--tạo function gửi request bằng ajax--%>
function thaTim(idnews, iduser, x)
{
    $.ajax({
        type: "post",
        url: "ThaTim", // servlet
        data: "idnews=" + idnews + "&iduser=" + iduser,
        success: function () {
            if ($(x).css('color') == 'rgb(255, 0, 0)') {
                $(x).css('color', '');
            } else {
                $(x).css('color', 'rgb(255, 0, 0)');
            }
        }
    });
}
;
                            </script>
                            <jsp:include page="includes/posts.jsp">
                                <jsp:param name="begin" value="0"/>
                                <jsp:param name="number" value="5"/>
                            </jsp:include>
                        </div><!-- row -->

                        <script> <%--tạo function gửi request bằng ajax--%>
var pagenum = 5;
function loadMore(begin, number)
{
    $.ajax({
        type: "post",
        url: "includes/posts.jsp", // servlet
        data: "begin=" + begin + "&number=" + number,
        success: function (data) {
            $('#content').append(data);
            pagenum = pagenum + 5;
        }
    });
}
;
                        </script>
                        <a class="load-more-btn" href="javascript:void(0);" onclick="loadMore(pagenum, 5)"><b>XEM THÊM</b></a>
                    </div><!-- col-lg-8 col-md-12 -->
                    <div class="col-lg-4 col-md-12 ">
                        <%@include file="includes/infosidebar.jsp" %>
                    </div><!-- col-lg-4 col-md-12 -->
                </div><!-- row -->
            </div><!-- container -->
        </section><!-- section -->
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
