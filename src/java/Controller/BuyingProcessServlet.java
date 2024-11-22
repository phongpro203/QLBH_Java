/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.AddressDB;
import Model.Order;
import Model.OrderDB;
import Model.Shopper;
import Model.ShopperDB;
import com.mysql.cj.x.protobuf.MysqlxCrud;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class BuyingProcessServlet extends HttpServlet {

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
            out.println("<title>Servlet BuyingProcessServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyingProcessServlet at " + request.getContextPath() + "</h1>");
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("username");
        if (user == null) {
            // Lấy URL của trang hiện tại để lưu
            String productDetailURL = "ProductDetail" + "?id=" + request.getParameter("id_goods");
            session.setAttribute("redirectAfterLogin", productDetailURL); // Lưu URL vào session

            // Chuyển hướng đến trang login
            response.sendRedirect("View/login_form.jsp");
        } else {
            ShopperDB shoperDB = new ShopperDB();
            int user_id = (int) session.getAttribute("id");
            Shopper shopper = shoperDB.findByUser(user_id);
            AddressDB addressDB = new AddressDB();
            int shop_owner_id = Integer.parseInt(request.getParameter("id_shop"));
            int goods_id = Integer.parseInt(request.getParameter("id_goods"));
            int sl = 1;
            if(request.getParameter("quality") != null)
            {
                sl = Integer.parseInt(request.getParameter("quality"));
            }
            int gia = Integer.parseInt(request.getParameter("price"));
            int thanhtien = sl * gia;
            int[] address = addressDB.getAddresses(shopper.getId(), shop_owner_id);
            Date currentDate = new Date();
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(currentDate);

            // Cộng thêm 4 ngày vào ngày hiện tại
            calendar.add(Calendar.DAY_OF_MONTH, 4);
            java.sql.Date ngayDat = new java.sql.Date(currentDate.getTime());
            java.sql.Date ngayGiao = new java.sql.Date(calendar.getTimeInMillis()); // Chuyển đổi sang java.sql.Date

            Order order = new Order(0, goods_id, shopper.getId(), shop_owner_id, null, address[0], address[1], "Chờ lấy hàng", ngayDat, null, thanhtien);
            OrderDB orderdb = new OrderDB();
            orderdb.insertOrder(order);
            response.sendRedirect("Delivery");
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
