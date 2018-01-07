<%-- 
    Document   : editnews
    Created on : Jan 1, 2018, 8:26:08 PM
    Author     : vudt9
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/laydulieu" prefix="f"%>
<c:set var="news" value="${f:getNewsById(param.newsid)}"></c:set>

    <div class="modal-dialog">
            <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Sửa tin</h4>
            </div>
            <div class="modal-body container-fluid">                     
                <form action="SuaTin" method="POST" enctype="multipart/form-data">
                    <div class="form-group hidden" style="visibility: hidden">
                        <input type="text" class="form-control" name="id" value="${news.idnews}">
                    </div>                
                    <div class="form-group">
                        <label for="title">Tiêu đề:</label>
                        <input type="text" class="form-control" id="title" placeholder="Nhập tiêu đề của tin tức" name="title" value="${news.title}" required>
                    </div>
                    <div class="form-group">
                        <label for="shortdescription">Mô tả:</label>
                        <input type="text" class="form-control" id="shortdescription" placeholder="Đoạn mô tả về tin tức" name="shortdescription" value="${news.shortDescription}">
                    </div>
                    <div class="form-group">
                        <label for="addnews${news.idnews}">Nội dung:</label>
                        <textarea class="tinymce" id="addnews${news.idnews}" placeholder="Place some text here" name="description">${news.description}</textarea>
                    </div>
                    <div class="form-group">
                        <label for="featureimg">Ảnh đại diện:</label>
                        <input type="file" class="form-control" id="featureimg" name="featureimg">
                    </div>
                    <br>
                    <input type="submit" class="btn btn-outline-primary" value="Sửa tin">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
