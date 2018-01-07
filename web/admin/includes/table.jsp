<%-- 
    Document   : table
    Created on : Dec 31, 2017, 5:06:14 PM
    Author     : vudt9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/laydulieu" prefix="f"%>
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i> Danh sách người dùng</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Tên</th>
                  <th>Username</th>
                  <th>Email</th>
                  <th>Quyền</th>
                  <th>Trạng thái</th>
                  <th>Ngày tạo</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>Tên</th>
                  <th>Username</th>
                  <th>Email</th>
                  <th>Quyền</th>
                  <th>Trạng thái</th>
                  <th>Ngày tạo</th>
                </tr>
              </tfoot>
              <tbody>
                <c:forEach items="${f:getAllUsers()}" var="users">
                <tr>
                  <td>${users.fullname}</td>
                  <td>${users.username}</td>
                  <td>${users.email}</td>
                  <td>${users.roleid}</td>
                  <td>${users.status}</td>
                  <td>${users.createddate}</td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
      </div>
