<%-- 
    Document   : userProfile
    Created on : Feb 17, 2025, 10:05:07 AM
    Author     : HuuVan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Profile</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/guest/signup.css"/>
    </head>
    <body>
        <div id="signup-frame">
            <h2>My Profile</h2>
            <form action="profile" method="POST" id="signup-form">
                <p>
                    <label for="txtUserName">Username</label><br>
                    <input type="text" id="txtUserName" name="txtUserName" value="${sessionScope.customer.username}" readonly="">
                </p>
                <p>
                    <label for="txtFullName">Full Name</label><br>
                    <input type="text" id="txtFullName" name="txtFullName" value="${sessionScope.customer.cus_name}">
                </p>
                <p>
                    <label for="txtEmail">Email</label><br>
                    <input type="text" id="txtEmail" name="txtEmail" value="${sessionScope.customer.email}" readonly="">
                </p>
                <p>
                    <label for="txtPhone">Phone</label><br>
                    <input type="text" id="txtPhone" name="txtPhone" value="${sessionScope.customer.phone}">
                </p>
                <p>
                    <label for="txtAddress">Address</label><br>
                    <input type="text" id="txtAddress" name="txtAddress" value="${sessionScope.customer.address}">
                </p>
                <h7 style="color: red">${requestScope.message}</h7>
                <button type="submit" name="btnAction" value="update">Update</button>
            </form>
                <a href="home">Back to Home</a>
        </div>

        <script src="${pageContext.request.contextPath}/JS/guest/login.js"></script>
    </body>
</html>
