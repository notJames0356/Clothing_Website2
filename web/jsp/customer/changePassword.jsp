<%-- 
    Document   : changePassword
    Created on : Feb 17, 2025, 10:05:38 AM
    Author     : Dinh_Hau
--%>
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
        <title>Change Password</title>
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
        <style>
            .message {
                display: block;
                font-weight: bold;
                font-size: 14px;
                margin-top: 10px;
                padding: 8px 12px;
                border-radius: 5px;
                width: 250px;
            }

            /* Thông báo thành công (màu xanh) */
            .success {
                color: green;
                background-color: rgba(0, 255, 0, 0.1);
                border: 1px solid green;
            }

            /* Thông báo lỗi (màu đỏ) */
            .error {
                color: red;
                background-color: rgba(255, 0, 0, 0.1);
                border: 1px solid red;
                width: 300px;
            }
        </style>
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
                                    <li><a href="profile" class="nav-link">Account Details</a></li>
                                    <c:if test="${sessionScope.admin.role.toLowerCase() != 'admin'}">
                                    <li><a href="Order" class="nav-link">Orders</a></li>
                                    </c:if> 
                                <li><a href="ChangePassword" class="nav-link active">Change Password</a></li>
                            </ul>
                        </div>    
                    </div>

                    <div class="col-sm-12 col-md-9 col-lg-9">
                        <!-- Tab Content -->
                        <div class="tab-content dashboard_content">
                            <!-- Account Details -->
                            <div class="tab-pane fade show active" id="account-details">
                                <h3>Change Password</h3>
                                <div class="login">
                                    <div class="login_form_container">
                                        <div class="account_login_form">
                                            <form action="ChangePassword" method="POST">
                                                <label for="txtUserName">Username</label>
                                                <input type="text" id="txtUserName" name="txtUserName" value="${sessionScope.customer.username}" readonly>

                                                <label for="txtPassword">Enter Current Password</label>
                                                <div class="input-group">
                                                    <input type="password" id="txtPassword" name="txtPassword">
                                                    <span class="toggle-password" onclick="togglePassword('txtPassword', this)">👁️</span>
                                                </div>

                                                <label for="txtNewPassword">Enter New Password</label>
                                                <div class="input-group">
                                                    <input type="password" id="txtNewPassword" name="txtNewPassword">
                                                    <span class="toggle-password" onclick="togglePassword('txtNewPassword', this)">👁️</span>
                                                </div>

                                                <label for="txtReNewPassword">Re-enter New Password</label>
                                                <div class="input-group">
                                                    <input type="password" id="txtReNewPassword" name="txtReNewPassword">
                                                    <span class="toggle-password" onclick="togglePassword('txtReNewPassword', this)">👁️</span>
                                                </div>
                                                <input type="submit" value="Change Password" 
                                                       style="background-color: #2d336b; color: white; border: none; padding: 12px;
                                                       font-size: 16px; font-weight: bold; border-radius: 5px; width: 100%;
                                                       margin-top: 15px; cursor: pointer;" 
                                                       onmouseover="this.style.backgroundColor = '#1a1f50';"
                                                       onmouseout="this.style.backgroundColor = '#2d336b';"">
                                            </form>
                                            <c:if test="${not empty requestScope.message}">
                                                <span class="message ${requestScope.message == 'Password Change Successful' ? 'success' : 'error'}">
                                                    ${requestScope.message}
                                                </span>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>      	
        </section>
        <!-- footer -->
        <jsp:include page="../common/layout/footer.jsp"></jsp:include>

            <script src="${pageContext.request.contextPath}/JS/customer/ProfileAndOrder.js"></script>
    </body>
</html>
