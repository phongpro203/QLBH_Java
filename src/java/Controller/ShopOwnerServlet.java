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
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "viewAll"; // Mặc định hiển thị toàn bộ sản phẩm
        }

        switch (action) {
            case "searchGoods":
                searchGoods(request, response);
                break;
            case "viewAll":
            default:
                viewAllGoods(request, response);
                break;
        }
    }

    private void searchGoods(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy user_id từ session
            Integer userId = (Integer) request.getSession().getAttribute("id");
            if (userId == null) {
                response.sendRedirect("View/login_form.jsp?error=session_expired");
                return;
            }

            // Lấy shop_owner_id từ user_id
            int shopOwnerId = shopownerDB.getShopOwnerIdByUserId(userId);
            if (shopOwnerId == -1) {
                response.sendRedirect("View/ShopOwnerDashboard.jsp?error=shop_owner_not_found");
                return;
            }

            // Lấy từ khóa tìm kiếm từ request
            String keyword = request.getParameter("keyword");

            // Tìm kiếm sản phẩm trong GoodsDB
            List<Goods> goodsList = goodsDB.searchGoodsByShopAndName(shopOwnerId, keyword);

            // Gửi kết quả tìm kiếm tới JSP
            request.setAttribute("goodsList", goodsList);
            request.getRequestDispatcher("View/ShopOwnerDashboard.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("View/ShopOwnerDashboard.jsp?error=search_failed");
        }
    }

    private void viewAllGoods(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy user_id từ session
            Integer userId = (Integer) request.getSession().getAttribute("id");
            if (userId == null) {
                response.sendRedirect("View/login_form.jsp?error=session_expired");
                return;
            }

            // Lấy shop_owner_id từ user_id
            int shopOwnerId = shopownerDB.getShopOwnerIdByUserId(userId);
            if (shopOwnerId == -1) {
                response.sendRedirect("View/ShopOwnerDashboard.jsp?error=shop_owner_not_found");
                return;
            }

            // Lấy danh sách toàn bộ sản phẩm
            List<Goods> goodsList = goodsDB.findAllGoodsByShopId(shopOwnerId);

            // Gửi danh sách sản phẩm tới JSP
            request.setAttribute("goodsList", goodsList);
            request.getRequestDispatcher("View/ShopOwnerDashboard.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("View/ShopOwnerDashboard.jsp?error=view_failed");
        }
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
    private GoodsDB goodsDB = new GoodsDB();

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {

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
                    response.sendRedirect("View/ShopOwner.jsp?error=userid is null.");
                    return;
                }
                int user_id = userId.intValue();

                // 3. Thêm người bán hàng với address_id và user_id vừa lấy
                ShopOwner shopowner = new ShopOwner();
                shopowner.setTenshop(tenshop);
                shopowner.setTenchushop(tenchushop);
                shopowner.setSdt(sdt);
                shopowner.setMasothue(masothue);
                shopowner.setAddress_id(address_id);
                shopowner.setUser_id(user_id);

                shopownerDB.insert(shopowner);

                response.sendRedirect("View/login_form.jsp"); // Điều hướng đến trang thành công
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("View/ShopOwner.jsp?error=Không thể thêm thông tin");
            }
            return;
        }
        switch (action) {
            case "addGoods":
                addGoods(request, response);
                break;
            case "editGoods":
                editGoods(request, response);
                break;
            case "deleteGoods":
                deleteGoods(request, response);
                break;
            default:
                response.sendRedirect("View/ShopOwnerDashboard.jsp");
        }
    }

    private void addGoods(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy user_id từ session
            Integer userId = (Integer) request.getSession().getAttribute("id");
            if (userId == null) {
                response.sendRedirect("View/GoodsAdd.jsp?error=Chưa đăng nhập");
                return;
            }

            // Lấy shop_owner_id từ user_id
            int shopOwnerId = shopownerDB.getShopOwnerIdByUserId(userId);
            if (shopOwnerId == -1) {
                response.sendRedirect("View/GoodsAdd.jsp?error=Không tìm thấy ShopOwner");
                return;
            }

            // Lấy các tham số từ request
            String tensp = request.getParameter("tensp");
            String chungloai = request.getParameter("chungloai");
            String chitiet = request.getParameter("chitiet");
            int gia = Integer.parseInt(request.getParameter("gia"));
            int soluong = Integer.parseInt(request.getParameter("soluong"));
            String hinhanh = request.getParameter("hinhanh");
            int giamGia = Integer.parseInt(request.getParameter("giamGia"));

            // Tạo đối tượng Goods
            Goods goods = new Goods(0, tensp, chungloai, chitiet, gia, soluong, hinhanh, shopOwnerId, giamGia);

            // Gọi DB để thêm sản phẩm
            goodsDB.insertGoods(goods);

            response.sendRedirect("View/ShopOwnerDashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("View/GoodsAdd.jsp?error=Không thể thêm sản phẩm");
        }
    }

    private void editGoods(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy user_id từ session
            Integer userId = (Integer) request.getSession().getAttribute("id");
            if (userId == null) {
                response.sendRedirect("View/GoodsEdit.jsp?error=Chưa đăng nhập");
                return;
            }

            // Lấy shop_owner_id từ user_id
            int shopOwnerId = shopownerDB.getShopOwnerIdByUserId(userId);
            if (shopOwnerId == -1) {
                response.sendRedirect("View/GoodsEdit.jsp?error=Không tìm thấy ShopOwner");
                return;
            }

            // Lấy các tham số từ request
            int id = Integer.parseInt(request.getParameter("id"));
            String tensp = request.getParameter("tensp");
            String chungloai = request.getParameter("chungloai");
            String chitiet = request.getParameter("chitiet");
            int gia = Integer.parseInt(request.getParameter("gia"));
            int soluong = Integer.parseInt(request.getParameter("soluong"));
            String hinhanh = request.getParameter("hinhanh");
            int giamGia = Integer.parseInt(request.getParameter("giamGia"));

            // Kiểm tra sản phẩm có thuộc shop_owner này không
            if (!goodsDB.isGoodsBelongsToShopOwner(id, shopOwnerId)) {
                response.sendRedirect("View/GoodsEdit.jsp?error=Sản phẩm không thuộc sở hữu của bạn");
                return;
            }

            // Tạo đối tượng Goods
            Goods goods = new Goods(id, tensp, chungloai, chitiet, gia, soluong, hinhanh, shopOwnerId, giamGia);

            // Gọi DB để cập nhật sản phẩm
            goodsDB.updateGoods(goods);

            response.sendRedirect("View/ShopOwnerDashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("View/GoodsEdit.jsp?error=Không thể sửa sản phẩm&id=" + request.getParameter("id"));
        }
    }

    private void deleteGoods(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            goodsDB.deleteGoods(id);
            response.sendRedirect("View/ShopOwnerDashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("View/ShopOwnerDashboard.jsp?error=Không thể xóa sản phẩm");
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
