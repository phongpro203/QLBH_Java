/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Address;
import Model.AddressDB;
import Model.ShopOwner;
import Model.Shopper;
import Model.ShopperDB;
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
@WebServlet("/Shopper")
public class ShopperServlet extends HttpServlet {

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
            out.println("<title>Servlet ShopperServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopperServlet at " + request.getContextPath() + "</h1>");
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
    private ShopperDB shopperDB = new ShopperDB();
    private AddressDB addressDB = new AddressDB();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        // Lấy thông tin từ form
        String hoten = request.getParameter("hoten");
        String sdt = request.getParameter("sdt");

        // Lấy thông tin địa chỉ từ form
        String tinhthanh = request.getParameter("tinhthanh");
        String xaphuong = request.getParameter("xaphuong");
        String quanhuyen = request.getParameter("quanhuyen");
        String sonha = request.getParameter("sonha");

        try {
            // 1. Thêm địa chỉ vào bảng address và lấy address_id
            Address address = new Address();
            address.setTinhthanh(tinhthanh);
            address.setXaphuong(xaphuong);
            address.setQuanhuyen(quanhuyen);
            address.setSonha(sonha);
            int address_id = addressDB.insert(address);

            // 2. Lấy user_id từ session sau khi đăng ký thành công
            Integer userId = (Integer) request.getSession().getAttribute("user_id");
            if (userId == null) {
                response.sendRedirect("View/Shopper.jsp?error=userid is null.");
                return;
            }
            int user_id = userId.intValue();

            // 3. Thêm người bán hàng với address_id và user_id vừa lấy
            Shopper shopper = new Shopper();
            shopper.setHoten(hoten);
            shopper.setSdt(sdt);
            shopper.setAddress_id(address_id);
            shopper.setUser_id(user_id);

            shopperDB.insert(shopper);

            response.sendRedirect("View/Shopper_form.jsp"); // Điều hướng đến trang thành công
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("View/Shopper.jsp?error=Không thể thêm thông tin");
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
