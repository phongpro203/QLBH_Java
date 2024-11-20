/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Address;
import Model.AddressDB;
import Model.Goods;
import Model.GoodsDB;
import Model.ShopOwner;
import Model.ShopOwnerDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kohakuta
 */
@WebServlet("/ShopOwner")
public class ShopOwnerServlet extends HttpServlet {

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
            out.println("<title>Servlet ShopOwnerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopOwnerServlet at " + request.getContextPath() + "</h1>");
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
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private ShopOwnerDB shopownerDB = new ShopOwnerDB();
    private AddressDB addressDB = new AddressDB();

    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
//        // Lấy thông tin từ form
//        String tenshop = request.getParameter("tenshop");
//        String tenchushop = request.getParameter("tenchushop");
//        String sdt = request.getParameter("sdt");
//        String masothue = request.getParameter("masothue");
//
//        // Lấy thông tin địa chỉ từ form
//        String tinhthanh = request.getParameter("tinhthanh");
//        String xaphuong = request.getParameter("xaphuong");
//        String quanhuyen = request.getParameter("quanhuyen");
//        String sonha = request.getParameter("sonha");
//
//        try {
//            // 1. Thêm địa chỉ vào bảng address và lấy address_id
//            Address address = new Address();
//            address.setTinhthanh(tinhthanh);
//            address.setXaphuong(xaphuong);
//            address.setQuanhuyen(quanhuyen);
//            address.setSonha(sonha);
//            int address_id = addressDB.insert(address);
//
//            // 2. Lấy user_id từ session sau khi đăng ký thành công
//            Integer userId = (Integer) request.getSession().getAttribute("user_id");
//            if (userId == null) {
//                response.sendRedirect("View/ShopOwner.jsp?error=userid is null.");
//                return;
//            }
//            int user_id = userId.intValue();
//
//            // 3. Thêm người bán hàng với address_id và user_id vừa lấy
//            ShopOwner shopowner = new ShopOwner();
//            shopowner.setTenshop(tenshop);
//            shopowner.setTenchushop(tenchushop);
//            shopowner.setSdt(sdt);
//            shopowner.setMasothue(masothue);
//            shopowner.setAddress_id(address_id);
//            shopowner.setUser_id(user_id);
//
//            shopownerDB.insert(shopowner);
//
//            response.sendRedirect("View/ShopOwner_form.jsp"); // Điều hướng đến trang thành công
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.sendRedirect("View/ShopOwner.jsp?error=Không thể thêm thông tin");
//        }
//    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    // Lấy action để xác định thao tác
    String action = request.getParameter("action");

    if (action == null || action.isEmpty() || action.equals("addShopOwner")) {
        // Logic thêm ShopOwner (giữ nguyên)
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
            // 1. Thêm địa chỉ vào bảng address và lấy address_id do MySQL tự động sinh
            Address address = new Address();
            address.setTinhthanh(tinhthanh);
            address.setXaphuong(xaphuong);
            address.setQuanhuyen(quanhuyen);
            address.setSonha(sonha);

            int address_id = addressDB.insert(address); // ID tự động tăng được trả về sau khi thêm

            // 2. Lấy user_id từ session
            Integer userId = (Integer) request.getSession().getAttribute("user_id");
            if (userId == null) {
                response.sendRedirect("View/ShopOwner.jsp?error=userid is null.");
                return;
            }
            int user_id = userId;

            // 3. Thêm ShopOwner với address_id và user_id
            ShopOwner shopowner = new ShopOwner();
            shopowner.setTenshop(tenshop);
            shopowner.setTenchushop(tenchushop);
            shopowner.setSdt(sdt);
            shopowner.setMasothue(masothue);
            shopowner.setAddress_id(address_id);
            shopowner.setUser_id(user_id);

            shopownerDB.insert(shopowner); // ID shopowner được tự động sinh trong DB

            response.sendRedirect("View/ShopOwner_form.jsp?message=Thêm ShopOwner thành công");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("View/ShopOwner.jsp?error=Không thể thêm thông tin");
        }
    } else {
        // Các xử lý khác (ví dụ: thêm hàng hóa)
        GoodsDB goodsDB = new GoodsDB();

        try {
            switch (action) {
                case "addGoods": {
                    // Logic thêm hàng hóa
                    String tensp = request.getParameter("tensp");
                    String chungloai = request.getParameter("chungloai");
                    String chitiet = request.getParameter("chitiet");
                    int gia = Integer.parseInt(request.getParameter("gia"));
                    int soluong = Integer.parseInt(request.getParameter("soluong"));
                    String hinhanh = request.getParameter("hinhanh");
                    int shopOwnerId = Integer.parseInt(request.getParameter("shopOwnerId"));
                    int giamGia = Integer.parseInt(request.getParameter("giamGia"));

                    Goods goods = new Goods();
                    goods.setTensp(tensp);
                    goods.setChungloai(chungloai);
                    goods.setChitiet(chitiet);
                    goods.setGia(gia);
                    goods.setSoluong(soluong);
                    goods.setHinhanh(hinhanh);
                    goods.setShopOwnerId(shopOwnerId);
                    goods.setGiamGia(giamGia);

                    goodsDB.insertGoods(goods); // ID hàng hóa tự động tăng

                    response.sendRedirect("View/Goods_form.jsp?message=Thêm hàng hóa thành công");
                    break;
                }
                default:
                    response.sendRedirect("View/Error.jsp?message=Hành động không hợp lệ");
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("View/Goods_form.jsp?error=Không thể xử lý yêu cầu");
        }
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
