/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package shop.DAO.admin.orderManagement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import shop.context.DBcontext;
import shop.model.Customer;
import shop.model.Order;
import shop.model.OrderDetail;
import shop.model.Product;

/**
 *
 * @author Dinh_Hau
 */
public class OrderManagementDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        String sql = "select * \n"
                + "from [Order] o \n"
                + "Join Customer c on c.cus_id = o.cus_id\n"
                + "Order by order_date DESC";

        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setOrder_id(rs.getInt("order_id"));
                o.setCus_id(rs.getInt("cus_id"));
                o.setTotal_price(rs.getBigDecimal("total_price"));
                o.setTracking(rs.getString("tracking"));
                o.setOrder_date(rs.getDate("order_date"));
                o.setPayment_method(rs.getString("payment_method"));

                Customer c = new Customer(
                        rs.getString("cus_name"),
                        rs.getString("email"),
                        rs.getString("username"),
                        rs.getString("phone"),
                        rs.getString("address"));
                o.setCustomer(c);

                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Order> getOrdersBySearch(List<Order> inputList, String search) {
        // Kiểm tra inputList và search
        if (inputList == null || inputList.isEmpty() || search == null || search.trim().isEmpty()) {
            return inputList != null ? inputList : getAllOrders();
        }

        List<Order> list = new ArrayList<>();
        String searchLower = search.trim().toLowerCase();

        for (Order o : inputList) {

            String cusName = o.getCustomer().getCus_name() != null ? o.getCustomer().getCus_name().toLowerCase() : "";

            String orderId = o.getOrder_id() != 0 ? String.valueOf(o.getOrder_id()) : "";

            // Kiểm tra xem cus_name hoặc cus_id có chứa chuỗi tìm kiếm không
            if (cusName.contains(searchLower) || orderId.contains(searchLower)) {
                list.add(o);
            }
        }
        return list;
    }

    public List<Order> getOrdersByFilter(List<Order> inputList, String trackingStatus) {

        if (inputList == null || inputList.isEmpty() || trackingStatus == null || trackingStatus.trim().isEmpty()) {
            return inputList != null ? inputList : getAllOrders();
        }

        List<Order> list = new ArrayList<>();
        String trackingStatusLower = trackingStatus.trim().toLowerCase();

        for (Order o : inputList) {

            String tracking = o.getTracking() != null ? o.getTracking().toLowerCase() : "";

            if (tracking.contains(trackingStatusLower)) {
                list.add(o);
            }
        }
        return list;
    }

    public List<Order> sortOrders(List<Order> inputList, String sort) {

        if (inputList == null || inputList.isEmpty() || sort == null || sort.trim().isEmpty()) {
            return inputList != null ? inputList : getAllOrders();
        }

        List<Order> sortedList = new ArrayList<>(inputList);

        switch (sort.trim().toLowerCase()) {
            case "price_asc":
                sortedList.sort(Comparator.comparing(Order::getTotal_price));
                break;
            case "price_desc":
                sortedList.sort(Comparator.comparing(Order::getTotal_price, Comparator.reverseOrder()));
                break;
            case "newest":
                sortedList.sort(Comparator.comparing(Order::getOrder_date, Comparator.reverseOrder()));
                break;
            case "oldest":
                sortedList.sort(Comparator.comparing(Order::getOrder_date));
                break;
            default:
                break;
        }

        return sortedList;
    }

    public List<Order> getOrdersByTimeRange(List<Order> inputList, String range) {
        // Kiểm tra inputList và range
        if (inputList == null || inputList.isEmpty() || range == null || range.trim().isEmpty()) {
            List<Order> defaultList = getAllOrders();
            return defaultList != null ? defaultList : new ArrayList<>(); // Trả về getAllOrders() hoặc danh sách rỗng
        }

        List<Order> list = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // Định dạng ngày thành chuỗi
        sdf.setLenient(false); // Đảm bảo không tự động điều chỉnh ngày không hợp lệ

        java.util.Calendar cal = java.util.Calendar.getInstance();
        Date currentDate = cal.getTime();
        String currentDateStr = sdf.format(currentDate);
        System.out.println("Current Date: " + currentDateStr);

        switch (range.trim()) {
            case "all":
                list.addAll(inputList); // Trả về toàn bộ danh sách
                break;
            case "today":
                list = inputList.stream()
                        .filter(o -> o != null && o.getOrder_date() != null)
                        .filter(o -> {
                            String orderDateStr = sdf.format(o.getOrder_date());
                            return orderDateStr.equals(currentDateStr); // So sánh trực tiếp ngày
                        })
                        .collect(Collectors.toList());
                break;
            case "last7Days":
                // Lấy ngày 7 ngày trước
                cal.setTime(currentDate);
                cal.add(java.util.Calendar.DATE, -7);
                Date sevenDaysAgo = cal.getTime();
                String sevenDaysAgoStr = sdf.format(sevenDaysAgo);
                System.out.println("7 Days Ago: " + sevenDaysAgoStr);

                list = inputList.stream()
                        .filter(o -> o != null && o.getOrder_date() != null)
                        .filter(o -> {
                            String orderDateStr = sdf.format(o.getOrder_date());
                            return (orderDateStr.compareTo(sevenDaysAgoStr) >= 0 && orderDateStr.compareTo(currentDateStr) <= 0);
                        })
                        .collect(Collectors.toList());
                break;
            case "last30Days":
                cal.setTime(currentDate);
                cal.add(java.util.Calendar.DATE, -30);
                Date thirtyDaysAgo = cal.getTime();
                String thirtyDaysAgoStr = sdf.format(thirtyDaysAgo);
                System.out.println("30 Days Ago: " + thirtyDaysAgoStr);

                list = inputList.stream()
                        .filter(o -> o != null && o.getOrder_date() != null)
                        .filter(o -> {
                            String orderDateStr = sdf.format(o.getOrder_date());
                            return (orderDateStr.compareTo(thirtyDaysAgoStr) >= 0 && orderDateStr.compareTo(currentDateStr) <= 0);
                        })
                        .collect(Collectors.toList());
                break;
            default:
                list.addAll(new ArrayList<>()); // Mặc định trả về danh sách rỗng nếu range không hợp lệ
                break;
        }

        return list;
    }

    public List<OrderDetail> getOrderDetails(int orderId) {
        List<OrderDetail> details = new ArrayList<>();
        String sql = "SELECT od.order_id, od.pro_id, od.quantity, od.price_per_unit,  \n"
                + "                     p.pro_name,  p.image,\n"
                + "                     o.total_price, o.tracking, o.order_date, o.payment_method,  \n"
                + "                     c.cus_name, c.email, c.username, c.phone, c.address  \n"
                + "                     FROM OrderDetail od  \n"
                + "                     JOIN Product p ON od.pro_id = p.pro_id  \n"
                + "                     JOIN [Order] o ON od.order_id = o.order_id  \n"
                + "                     JOIN Customer c ON o.cus_id = c.cus_id  \n"
                + "                     WHERE od.order_id = ?";

        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, orderId);
            rs = ps.executeQuery();

            while (rs.next()) {
                OrderDetail detail = new OrderDetail();
                detail.setOrder_id(rs.getInt("order_id"));
                detail.setPro_id(rs.getInt("pro_id"));
                detail.setQuantity(rs.getInt("quantity"));
                detail.setPrice_per_unit(rs.getBigDecimal("price_per_unit"));

                // Product
                Product P = new Product();
                P.setPro_id(rs.getInt("pro_id"));
                P.setPro_name(rs.getString("pro_name"));
                P.setImage(rs.getString("image"));

                detail.setProduct(P);

                //Order
                Order O = new Order();
                O.setOrder_id(rs.getInt("order_id"));
                O.setTotal_price(rs.getBigDecimal("total_price"));
                O.setTracking(rs.getString("tracking"));
                O.setOrder_date(rs.getDate("order_date"));
                O.setPayment_method(rs.getString("payment_method"));

                //Customer
                Customer customer = new Customer(
                        rs.getString("cus_name"),
                        rs.getString("email"),
                        rs.getString("username"),
                        rs.getString("phone"),
                        rs.getString("address")
                );
                O.setCustomer(customer); // Liên kết khách hàng với đơn hàng
                detail.setOrder(O); // Liên kết đơn hàng với chi tiết đơn hàng

                details.add(detail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return details;
    }

    public String updateOrderStatus(int orderId, String newStatus) {
        String sql = "UPDATE [Order] SET tracking = ? WHERE order_id = ?";
        String message = "";
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, newStatus);
            ps.setInt(2, orderId);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                message = "Order status updated successfully for order ID: " + orderId;

            } else {
                message = "No order found with ID: " + orderId;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return message;
    }

    public static void main(String[] args) {
        OrderManagementDAO dao = new OrderManagementDAO();
        List<Order> o = dao.getOrdersByTimeRange(dao.getAllOrders(), "last30Days");
        List<OrderDetail> n = dao.getOrderDetails(18);

        System.out.println(o);

    }

}
