<%-- 
    Document   : thongke
    Created on : Dec 31, 2017, 5:54:21 PM
    Author     : vudt9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/laydulieu" prefix="f"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>SB Admin - Start Bootstrap Template</title>
        <!-- Bootstrap core CSS-->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Custom styles for this template-->
        <link href="css/sb-admin.css" rel="stylesheet">
    </head>

    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
        <!-- Navigation-->
        <%@include file="includes/nav.jsp" %>
        <div class="content-wrapper">
            <div class="container-fluid">
                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="#">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active">Charts</li>
                </ol>
                <!-- Area Chart-->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fa fa-area-chart"></i> Thống kê lượng người dùng đăng ký mới</div>
                    <div class="card-body">
                        <canvas id="luongNguoiDungDK" width="100%" height="30"></canvas>
                    </div>
                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                </div>
                <!-- Pie Chart-->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fa fa-bar-chart"></i> Thống kê số lượng bài viết của các tác giả</div>
                    <div class="card-body">
                        <canvas id="myPieChart" width="100" height="50"></canvas>
                    </div>
                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                </div>
            </div>
            <!-- /.container-fluid-->
            <!-- /.content-wrapper-->
            <footer class="sticky-footer">
                <div class="container">
                    <div class="text-center">
                        <small>Copyright © Your Website 2017</small>
                    </div>
                </div>
            </footer>
            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fa fa-angle-up"></i>
            </a>
            <!-- Logout Modal-->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-primary" href="login.html">Logout</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Bootstrap core JavaScript-->
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <!-- Core plugin JavaScript-->
            <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
            <!-- Page level plugin JavaScript-->
            <script src="vendor/chart.js/Chart.min.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="js/sb-admin.min.js"></script>
            <!-- Custom scripts for this page-->
            <script>
                // Chart.js scripts
                // -- Set new default font family and font color to mimic Bootstrap's default styling
                Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
                Chart.defaults.global.defaultFontColor = '#292b2c';
                // -- Area Chart Example
                var ctx = document.getElementById("luongNguoiDungDK");
                var myLineChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
                        datasets: [{
                                label: "Đăng ký",
                                lineTension: 0.3,
                                backgroundColor: "rgba(2,117,216,0.2)",
                                borderColor: "rgba(2,117,216,1)",
                                pointRadius: 5,
                                pointBackgroundColor: "rgba(2,117,216,1)",
                                pointBorderColor: "rgba(255,255,255,0.8)",
                                pointHoverRadius: 5,
                                pointHoverBackgroundColor: "rgba(2,117,216,1)",
                                pointHitRadius: 20,
                                pointBorderWidth: 2,
                                data: [${f:getNumOfUsersPerMonth(1,2017)}, ${f:getNumOfUsersPerMonth(2,2017)}, ${f:getNumOfUsersPerMonth(3,2017)}, ${f:getNumOfUsersPerMonth(4,2017)}, ${f:getNumOfUsersPerMonth(5,2017)}, ${f:getNumOfUsersPerMonth(6,2017)}, ${f:getNumOfUsersPerMonth(7,2017)}, ${f:getNumOfUsersPerMonth(8,2017)}, ${f:getNumOfUsersPerMonth(9,2017)}, ${f:getNumOfUsersPerMonth(10,2017)}, ${f:getNumOfUsersPerMonth(11,2017)}, ${f:getNumOfUsersPerMonth(12,2017)}],
                            }],
                    },
                    options: {
                        scales: {
                            xAxes: [{
                                    time: {
                                        unit: 'date'
                                    },
                                    gridLines: {
                                        display: false
                                    },
                                    ticks: {
                                        maxTicksLimit: 7
                                    }
                                }],
                            yAxes: [{
                                    ticks: {
                                        min: 0,
                                        max: 10,
                                        maxTicksLimit: 3
                                    },
                                    gridLines: {
                                        color: "rgba(0, 0, 0, .125)",
                                    }
                                }],
                        },
                        legend: {
                            display: false
                        }
                    }
                });

                // -- Pie Chart Example
                <c:set var="usr" value="${f:getTopUserByNumOfNews()}"></c:set>
                var ctx = document.getElementById("myPieChart");
                var myPieChart = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: [
                            <c:forEach items="${usr}" var="name">
                                "${name.key.username}",
                            </c:forEach>
                        ],
                        datasets: [{
                                data: [
                                    <c:forEach items="${usr}" var="num">
                                        ${num.value},
                                    </c:forEach>
                                ],
                                backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745'],
                            }],
                    },
                });
            </script>
        </div>
    </body>
</html>
