<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="sidebar text-light p-3">
    <h3 class="text-center">Shop Manager</h3>
    <div class="nav flex-column">
        <a href="${pageContext.request.contextPath}/jsp/admin/dashboard.jsp" class="nav-link text-light p-3 border-0 rounded">
            <i class="bi bi-speedometer2"></i>Dashboard
        </a>
        <a href="#" class="nav-link text-light p-3 border-0 rounded">
            <i class="bi bi-people"></i>Account Management
        </a>
        <a href="${pageContext.request.contextPath}/productM" class="nav-link text-light p-3 border-0 rounded">
            <i class="bi bi-box-seam"></i>Product Management
        </a>
        <a href="${pageContext.request.contextPath}/orderM" class="nav-link text-light p-3 border-0 rounded">
            <i class="bi bi-cart3"></i>Order Management
        </a>
        <a href="#" class="nav-link text-light p-3 border-0 rounded">
            <i class="bi bi-chat-dots"></i>Feedback Management
        </a>
        <a href="#" class="nav-link text-light p-3 border-0 rounded">
            <i class="bi bi-graph-up"></i>Revenue
        </a>
    </div>
</div>