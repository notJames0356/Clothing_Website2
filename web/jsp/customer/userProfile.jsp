<%-- 
    Document   : userProfile
    Created on : Feb 17, 2025, 10:05:07 AM
    Author     : HuuVan
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Profile</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/guest/signup.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/customer/profile.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/common/layout/layout.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/guest/home.css"/>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.5.3/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.5.3/js/bootstrap.min.js"></script>
    </head>
    <body>
        <jsp:include page="../common/layout/header.jsp"></jsp:include>
            <section class="main_content_area">
                <div class="account_dashboard">
                    <div class="row w-100">
                        <div class="col-sm-12 col-md-3 col-lg-3">
                            <!-- Sidebar -->
                            <div class="dashboard_tab_button">
                                <ul role="tablist" class="nav flex-column dashboard-list">
                                    <li style="margin-bottom: 20px">
                                        <img style="border: 5px solid #2d336b; height: 255px" src="img/icon/header/user.png" width="100%">
                                    </li>
                                    <li><a href="#account-details" data-toggle="tab" class="nav-link active">Account Details</a></li>
                                    <li><a href="#orders" data-toggle="tab" class="nav-link" onclick="loadOrders()">Orders</a></li>

                                </ul>
                            </div>    
                        </div>

                        <div class="col-sm-12 col-md-9 col-lg-9">
                            <!-- Tab Content -->
                            <div class="tab-content dashboard_content">
                                <!-- Account Details -->
                                <div class="tab-pane fade show active" id="account-details">
                                    <h3>Account Details</h3>
                                    <div class="login">
                                        <div class="login_form_container">
                                            <div class="account_login_form">
                                                <form id="form-1" action="profile" method="POST">
                                                    <label>Username</label>
                                                    <input class="input_type" type="text" id="txtUserName" name="txtUserName" value="${sessionScope.customer.username}" readonly>
                                                <label for="txtFullName">Full Name</label>
                                                <input class="input_type " type="text"  id="txtFullName" name="txtFullName" value="${sessionScope.customer.cus_name}" readonly>               
                                                <label for="txtEmail">Email</label>
                                                <input class="input_type " type="text" id="txtEmail" name="txtEmail" value="${sessionScope.customer.email}" readonly>         
                                                <label for="txtAddress">Address</label>
                                                <input class="input_type " type="text"  id="txtAddress" name="txtAddress" value="${sessionScope.customer.address}" readonly>
                                                <label for="txtPhone">Phone</label>
                                                <input class="input_type input_read" type="text"  id="txtPhone" name="txtPhone" value="${sessionScope.customer.phone}" readonly>
                                                <c:if test="${not empty requestScope.message}">
                                                    <span class="message ${requestScope.message == 'Update Successful!' ? 'success' : 'error'}">
                                                        ${requestScope.message}
                                                    </span>
                                                </c:if>

                                                <div class="save_button primary_btn default_button">
                                                    <button onclick="changeType(this)" id="edit" type="button" style="background:#2d336b">Edit</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Orders -->
                            <div class="tab-pane fade" id="orders">
                                <h3>Orders</h3>
                                <div class="coron_table table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Full Name</th>
                                                <th>Date</th>
                                                <th>Status</th>
                                                <th>Payment</th>
                                                <th>Total</th>
                                                <th>Actions</th>	 	 	 	
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.listOrder}" var="o">
                                                <tr>
                                                    <td>${sessionScope.customer.cus_name}</td>
                                                    <td>${o.order_date}</td>
                                                    <td>${o.tracking}</td>
                                                    <td>${o.payment_method}</td>
                                                    <td>${o.total_price}</td>
                                                    <td><a href="OrderDetail?id=${o.order_id != null ? o.order_id : ''}" class="view">View</a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div> <!-- End Tab Content -->
                    </div>
                </div>
            </div>      	
        </section>
        <!-- footer -->
        <jsp:include page="../common/layout/footer.jsp"></jsp:include>

            <script src="${pageContext.request.contextPath}/JS/customer/ProfileAndOrder.js"></script>
    </body>
</html>
