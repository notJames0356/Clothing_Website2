package shop.controller.admin.orderManagement;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.List;
import shop.DAO.admin.orderManagement.OrderManagementDAO;
import shop.model.OrderDetail;

@WebServlet(name = "OrderManagementController", urlPatterns = {"/orderM", "/orderM/details", "/orderM/updateStatus"})
public class OrderManagementController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        OrderManagementDAO dao = new OrderManagementDAO();
        String path = request.getServletPath();

        if (path.equals("/orderM")) {
            // Existing logic for loading orders
            String search = request.getParameter("search");
            String time = request.getParameter("time");
            String status = request.getParameter("status");
            String sort = request.getParameter("sort");

            List<shop.model.Order> listO = dao.getAllOrders();
            listO = dao.getOrdersByTimeRange(listO, time);
            listO = dao.getOrdersByFilter(listO, status);
            listO = dao.sortOrders(listO, sort);
            listO = dao.getOrdersBySearch(listO, search);

            request.setAttribute("listO", listO);

            boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));

            if (isAjax) {
                // Trả về HTML của table body cho AJAX request
                StringBuilder html = new StringBuilder();
                if (listO != null && !listO.isEmpty()) {
                    for (shop.model.Order o : listO) {
                        html.append("<tr>");
                        html.append("<td>").append(o.getOrder_id()).append("</td>");
                        html.append("<td>").append(o.getCustomer().getCus_name()).append("</td>");
                        html.append("<td>").append(o.getFormattedPrice()).append(" VND</td>");
                        html.append("<td>").append(o.getPayment_method().equals("cash") ? "Cash" : "Bank Transfer").append("</td>");
                        html.append("<td>").append(o.getTracking()).append("</td>");
                        html.append("<td>").append(o.getOrder_date()).append("</td>");
                        html.append("<td>");
                        html.append("<button class=\"btn btn-details\">Details</button>");
                        if ("processing".equalsIgnoreCase(o.getTracking()) || "shipping".equalsIgnoreCase(o.getTracking())) {
                            html.append("<button class=\"btn btn-update\">Update</button>");
                        } else {
                            html.append("<button class=\"btn btn-update-falled\" disabled=\"true\">Update</button>");
                        }
                        html.append("</td>");
                        html.append("</tr>");
                    }
                }
                out.print(html.toString());
            } else {
                // Forward đến JSP cho request thông thường
                request.getRequestDispatcher("jsp/admin/orderManagement.jsp").forward(request, response);
            }
        } else if (path.equals("/orderM/details")) {
            // Handle order details request
            String orderIdStr = request.getParameter("orderId");
            if (orderIdStr != null) {
                try {
                    int orderId = Integer.parseInt(orderIdStr);
                    List<OrderDetail> details = dao.getOrderDetails(orderId);

                    // Manually construct HTML for order details
                    if (details != null && !details.isEmpty()) {
                        OrderDetail detail = details.get(0); // Assuming one order detail per order for simplicity
                        StringBuilder html = new StringBuilder();
                        html.append("<h3>Order Details</h3>");
                        html.append("<p><strong>Order ID:</strong> ").append(detail.getOrder_id()).append("</p>");
                        html.append("<p><strong>Customer:</strong> ").append(detail.getOrder().getCustomer().getCus_name()).append("</p>");
                        html.append("<p><strong>Phone:</strong> ").append(detail.getOrder().getCustomer().getPhone()).append("</p>");
                        html.append("<p><strong>Email:</strong> ").append(detail.getOrder().getCustomer().getEmail()).append("</p>");
                        html.append("<p><strong>Address:</strong> ").append(detail.getOrder().getCustomer().getAddress()).append("</p>");
                        html.append("<p><strong>Payment method:</strong> ").append(detail.getOrder().getPayment_method()).append("</p>");
                        html.append("<p><strong>Tracking status:</strong> ").append(detail.getOrder().getTracking()).append("</p>");
                        html.append("<p><strong>Order date:</strong> ").append(detail.getOrder().getOrder_date()).append("</p>");
                        html.append("<h4>Order Items:</h4>");
                        html.append("<table class=\"order-details-table\">");
                        html.append("<thead><tr><th>ID</th><th>Product</th><th>Unit Per Price</th><th>Quantity</th><th>Subtotal</th></tr></thead>");
                        html.append("<tbody>");

                        for (OrderDetail d : details) {
                            html.append("<tr>");
                            html.append("<td>").append(d.getPro_id()).append("</td>");
                            html.append("<td>").append(d.getProduct().getPro_name()).append("</td>");
                            html.append("<td>").append(d.getFormattedPrice(d.getPrice_per_unit())).append(" VND</td>");
                            html.append("<td>x").append(d.getQuantity()).append("</td>");
                            BigDecimal subtotal = d.getPrice_per_unit().multiply(new BigDecimal(d.getQuantity()));
                            html.append("<td>").append(d.getFormattedPrice(subtotal)).append(" VND</td>");
                            html.append("</tr>");
                        }

                        html.append("</tbody>");
                        html.append("</table>");
                        html.append("<p class=\"text-end m-3\"><strong>Total Price:</strong> ").append(detail.getOrder().getFormattedPrice()).append(" VND</p>");
                        out.print(html.toString());
                    } else {
                        out.print("<p class=\"text-danger\">No details found for this order</p>");
                    }
                } catch (NumberFormatException e) {
                    out.print("<p class=\"text-danger\">Invalid order ID</p>");
                }
            } else {
                out.print("<p class=\"text-danger\">Order ID not provided</p>");
            }
        } else if (path.equals("/orderM/updateStatus")) {
            // Handle update status request
            String orderIdStr = request.getParameter("orderId");
            String newStatus = request.getParameter("newStatus");
            if (orderIdStr != null && newStatus != null) {
                try {
                    int orderId = Integer.parseInt(orderIdStr);
                    String message = dao.updateOrderStatus(orderId, newStatus);
                    out.print(message); // Trả về thông báo từ DAO
                } catch (NumberFormatException e) {
                    out.print("Invalid order ID");
                }
            } else {
                out.print("Order ID or new status not provided");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
