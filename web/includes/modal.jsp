<%-- 
    Document   : modal
    Created on : Dec 12, 2017, 10:47:23 PM
    Author     : vudt9
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
        <div id="dangnhap" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Đăng nhập</h4>
                    </div>
                    <div class="modal-body container-fluid">
                        <c:if test="${sessionScope.error != null}">
                            <div class="alert alert-danger">
                                <c:out value="${sessionScope.error}"></c:out>                        
                                </div>
                        </c:if>                        
                        <form action="Login" method="POST">
                            <div class="form-group">
                                <label for="username1">Username:</label>
                                <input type="text" class="form-control" id="username1" placeholder="Enter username" name="username" required>
                            </div>
                            <div class="form-group">
                                <label for="pwd1">Password:</label>
                                <input type="password" class="form-control" id="pwd1" placeholder="Enter password" name="password" required>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" name="remember"> Remember me</label>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
                        </form>
                        <div class="text-center">
                            <br>
                            <a href="forgot-password.html">Forgot Password?</a>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        <c:if test="${sessionScope.error != null}">
            <script>
                $(document).ready(function () {
                    $("#dangnhap").modal();
                });
            </script>
            <c:remove var="error" scope="session"></c:remove>
        </c:if>
        <!-- Modal -->
        <div id="dangky" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Đăng ký</h4>
                    </div>
                    <div class="modal-body container-fluid">
                        <c:if test="${sessionScope.errorRegister != null}">
                            <div class="alert alert-danger">
                                <c:out value="${sessionScope.errorRegister}"></c:out>                        
                            </div>
                        </c:if>                        
                        <form action="Register" method="POST">
                            <div class="form-group">
                                <label for="fullname">Tên đầy đủ:</label>
                                <input type="text" class="form-control" id="fullname" placeholder="Enter username" name="fullname" required>
                            </div>
                            <div class="form-group">
                                <label for="username">Username:</label>
                                <input type="text" class="form-control" id="username" placeholder="Enter username" name="username" required>
                            </div>
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="text" class="form-control" id="email" placeholder="Enter email" name="email" required>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Password:</label>
                                <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password" required>
                            </div>
                            <div class="form-group">
                                <label for="retype-password">Repeat password:</label>
                                <input type="password" class="form-control" id="retype-password" placeholder="Retype password" required>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Đăng ký</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
<c:if test="${sessionScope.errorRegister != null}">
    <script>
        $(document).ready(function () {
            $("#dangky").modal();
        });
    </script>
    <c:remove var="errorRegister" scope="session"></c:remove>
</c:if>