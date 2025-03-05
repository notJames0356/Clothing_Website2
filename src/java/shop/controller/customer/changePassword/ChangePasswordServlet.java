/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package shop.controller.customer.changePassword;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Pattern;
import shop.DAO.customer.changePassword.ChangePasswordDAO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ChangePasswordServlet", urlPatterns = {"/ChangePassword"})
public class ChangePasswordServlet extends HttpServlet {

    private final String PASSWORD = "jsp/customer/changePassword.jsp";
    private final String PROFILE = "jsp/customer/userProfile.jsp";

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(PASSWORD).forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("txtUserName");
        String currentPass = request.getParameter("txtPassword");
        String newPass = request.getParameter("txtNewPassword");
        String reNewPass = request.getParameter("txtReNewPassword");

        ChangePasswordDAO dao = new ChangePasswordDAO();
        String message;

        if (currentPass.isBlank() || newPass.isBlank() || reNewPass.isBlank()) {
            message = "Please Fill In Complete Information";
        } else if (!newPass.equals(reNewPass)) {
            message = "Passwords Do Not Match";
        } else if (!dao.checkCurrentPass(username, currentPass)) {
            message = "Current Password is Incorrect";
        } else if (!isValidPassword(newPass)) {
            message = "Password must be at least 8 characters, including uppercase and special characters!";
        } else if (dao.changePass(username, newPass)) {
            message = "Password Change Successful";
        } else {
            message = "Password Change Failed";
        }

        request.setAttribute("message", message);

        request.getRequestDispatcher(PASSWORD).forward(request, response);
    }

    private boolean isValidPassword(String password) {
        String regex = "^(?=.*[A-Z])(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?]).{8,}$";
        return Pattern.matches(regex, password);
    }

}
