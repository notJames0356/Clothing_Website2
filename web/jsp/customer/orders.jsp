<%-- 
    Document   : orders
    Created on : Feb 17, 2025, 10:04:56 AM
    Author     : Dinh_Hau
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
</body>
</html>
