/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.OrderDB;
import Model.Shipper;
import Model.ShipperDB;
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
@WebServlet("/ShipperManagement")
public class ShipperManagementServlet extends HttpServlet {

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
            out.println("<title>Servlet ShipperManagementServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShipperManagementServlet at " + request.getContextPath() + "</h1>");
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
    private final OrderDB orderDB = new OrderDB();
    private final ShipperDB shipperDB = new ShipperDB();

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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "acceptOrder":
                acceptOrder(request, response);
                break;
            case "confirmDelivery":
                confirmDelivery(request, response);
                break;
            case "reportIssue":
                reportIssue(request, response);
                break;
            case "completeDelivery":
                completeDelivery(request, response);
                break;
            default:
                response.sendRedirect("View/ShipperOrderManagement.jsp");
        }
    }

    private void acceptOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy thông tin order_id và user_id
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            int userId = (int) request.getSession().getAttribute("id");

            // Tìm shipper_id dựa trên user_id
            Shipper shipper = shipperDB.findByUserId(userId);
            if (shipper == null) {
                response.sendRedirect("View/ShipperOrderManagement.jsp?error=shipper_not_found");
                return;
            }

            // Cập nhật trạng thái đơn hàng thành "Đã giao cho bên vận chuyển"
            orderDB.updateShipperAndStatus(orderId, shipper.getId(), "Đang giao");
            response.sendRedirect("View/ShipperOrderManagement.jsp?success=order_accepted");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("View/ShipperOrderManagement.jsp?error=accept_failed");
        }
    }


    private void confirmDelivery(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy order_id và user_id (shipper đang đăng nhập)
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            int userId = (int) request.getSession().getAttribute("id");

            // Tìm shipper_id dựa trên user_id
            Shipper shipper = shipperDB.findByUserId(userId);
            if (shipper == null) {
                response.sendRedirect("View/ShipperOrderManagement.jsp?error=shipper_not_found");
                return;
            }

            // Cập nhật shipper_id và trạng thái đơn hàng
            orderDB.updateShipperAndStatus(orderId, shipper.getId(), "Đang giao");
            response.sendRedirect("View/ShipperOrderManagement.jsp?success=delivery_confirmed");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("View/ShipperOrderManagement.jsp?error=confirm_failed");
        }
    }

    private void reportIssue(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            orderDB.updateTinhTrangOrder(orderId, "Đơn hàng gặp sự cố");
            response.sendRedirect("View/ShipperOrder.jsp?success=issue_reported");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("View/ShipperOrder.jsp?error=report_failed");
        }
    }

    private void completeDelivery(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            orderDB.updateTinhTrangOrder(orderId, "Đã giao");
            response.sendRedirect("View/ShipperOrder.jsp?success=delivery_completed");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("View/ShipperOrder.jsp?error=complete_failed");
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
