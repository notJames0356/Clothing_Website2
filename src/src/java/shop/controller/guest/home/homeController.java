/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package shop.controller.guest.home;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import shop.DAO.guest.home.homeDAO;
import shop.model.Product;

/**
 *
 * @author Dinh_Hau
 */
@WebServlet(name="home", urlPatterns={"/home"})
public class homeController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet newServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet newServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        homeDAO dao = new homeDAO();
        List<Product> newArrivals = dao.getNewArrivals();
        List<Product> bestSellers = dao.getBestSellers();
        List<Product> discountedProducts = dao.getDiscountedProducts();
        List<Product> recommendProducts = dao.getRecommendProducts(null);

//        Xử lý danh sách New Arrivals
        if (newArrivals != null && !newArrivals.isEmpty()) {
            request.setAttribute("newArrivalsList", newArrivals);
        } else {
            request.setAttribute("newArrivalsMessage", "No new arrivals found.");
        }

//        Xử lý danh sách Best Sellers
        if (bestSellers != null && !bestSellers.isEmpty()) {
            request.setAttribute("bestSellers", bestSellers);
        } else {
            request.setAttribute("bestSellersMessage", "No best sellers found.");
        }

//        Xử lý danh sách Discounted Products
        if (discountedProducts != null && !discountedProducts.isEmpty()) {
            request.setAttribute("discountedProducts", discountedProducts);
        } else {
            request.setAttribute("discountedProductsMessage", "No discounted products found.");
        }

//      Xử lý danh sách Recommended Products
        if (recommendProducts != null && !recommendProducts.isEmpty()) {
            request.setAttribute("recommendProducts", recommendProducts);
        } else {
            request.setAttribute("recommendProductsMessage", "No recommended products found.");
        }

        // Chuyển tiếp đến trang home.jsp
        request.getRequestDispatcher("jsp/guest/home.jsp").forward(request, response);
    
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
