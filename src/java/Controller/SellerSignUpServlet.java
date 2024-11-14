/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Address;
import Model.AddressDB;
import Model.SellerSignUp;
import Model.SellerSignUpDB;
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
@WebServlet("/SellerSignUp")
public class SellerSignUpServlet extends HttpServlet {

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
            out.println("<title>Servlet SellerSignUpServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SellerSignUpServlet at " + request.getContextPath() + "</h1>");
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
    private SellerSignUpDB sellerDB = new SellerSignUpDB();
    private AddressDB addressDB = new AddressDB();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Lấy thông tin từ form
    String tenshop = request.getParameter("tenshop");
    String tenchushop = request.getParameter("tenchushop");
    String sdt = request.getParameter("sdt");
    String masothue = request.getParameter("masothue");

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
            response.sendRedirect("View/sellerSignup.jsp?error=userid is null.");
            return;
        }
        int user_id = userId.intValue();

        // 3. Thêm người bán hàng với address_id và user_id vừa lấy
        SellerSignUp seller = new SellerSignUp();
        seller.setTenshop(tenshop);
        seller.setTenchushop(tenchushop);
        seller.setSdt(sdt);
        seller.setMasothue(masothue);
        seller.setAddress_id(address_id);
        seller.setUser_id(user_id);

        sellerDB.insert(seller);
        
        response.sendRedirect("View/seller_form.jsp"); // Điều hướng đến trang thành công
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("View/sellerSignup.jsp?error=Không thể thêm thông tin");
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
