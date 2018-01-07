<%-- 
    Document   : posts
    Created on : Dec 22, 2017, 10:17:11 PM
    Author     : vudt9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/laydulieu" prefix="f"%>

<c:forEach items="${f:getLatestNews(param.begin,param.number)}" var="news"> <!--Tham khảo mục EL functions https://stackoverflow.com/tags/el/info-->
    <div class="col-lg-12 col-md-12">
        <div class="card h-100">
            <div class="single-post post-style-2">

                <div class="blog-image"><img src="uploads/${news.featureimg}" alt="Blog Image"></div>

                <div class="blog-info">

                    <h6 class="pre-title"><a href="#"><b>HEALTH</b></a></h6>

                    <h4 class="title"><a href="news.jsp?newsid=${news.idnews}"><b><c:out value="${news.title}"></c:out></b></a></h4>

                        <p><c:out value="${news.shortDescription}"></c:out></p>

                        <div class="avatar-area">
                            <a class="avatar" href="#"><img style="height: 100%" src="uploads/${news.users.avatar}" alt="Profile Image"></a>
                            <div class="right-area">
                                <a class="name" href="#"><b>${news.users.fullname}</b></a>
                            <h6 class="date" href="#">đăng ngày ${news.createddate}</h6>
                            </div>
                        </div>

                    <ul class="post-footer">
                        <li><a href="javascript:void(0);" onclick="thaTim(${news.idnews}, ${sessionScope.userid}, this)"><i class="ion-heart"></i></a></li>
                        <li><a href="news.jsp?newsid=${news.idnews}#comment"><i class="ion-chatbubble"></i></a></li>
                        <li><a href="#"><i class="ion-eye"></i></a></li>
                    </ul>

                </div><!-- blog-right -->

            </div><!-- single-post extra-blog -->

        </div><!-- card -->
    </div><!-- col-lg-12 col-md-12 -->
</c:forEach>