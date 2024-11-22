/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.OrderDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kohakuta
 */
@WebServlet("/OrderManagement")
public class OrderManagementServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
            out.println("<title>Servlet OrderManagementServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderManagementServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final OrderDB orderDB = new OrderDB();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "confirmOrder":
                confirmOrder(request, response);
                break;
            case "retryDelivery":
                retryDelivery(request, response);
                break;
            default:
                response.sendRedirect("View/OrderManagement.jsp");
        }
    }

    private void retryDelivery(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy order_id từ request
            int orderId = Integer.parseInt(request.getParameter("orderId"));

            // Cập nhật trạng thái đơn hàng thành "Quán đã xác nhận đơn"
            orderDB.updateTinhTrangOrder(orderId, "Chờ giao hàng");
            response.sendRedirect("View/OrderManagement.jsp?success=retry_successful");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("View/OrderManagement.jsp?error=retry_failed");
        }
    }

    private void confirmOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy order_id từ request
            int orderId = Integer.parseInt(request.getParameter("orderId"));

            // Cập nhật trạng thái đơn hàng thành "Quán đã xác nhận đơn"
            orderDB.updateTinhTrangOrder(orderId, "Chờ giao hàng");
            response.sendRedirect("View/OrderManagement.jsp?success=confirm_successful");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("View/OrderManagement.jsp?error=confirm_failed");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
