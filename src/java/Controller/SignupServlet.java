/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.User;
import Model.UserDB;
import com.mysql.cj.Session;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kohakuta
 */
/**
 *
 * @author kohakuta
 */
@WebServlet("/Signup")
public class SignupServlet extends HttpServlet {

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
            out.println("<title>Servlet SignupServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignupServlet at " + request.getContextPath() + "</h1>");
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
    private final UserDB userDB = new UserDB();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        // Lấy dữ liệu từ request
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int roleId = Integer.parseInt(request.getParameter("role"));

        // Tạo đối tượng User và gán giá trị
        User newuser = new User();
        newuser.setUserName(username);
        newuser.setPassword(password);
        newuser.setRole_id(roleId);

        try {
            if (isUsernameTaken(username)) {
                response.sendRedirect("View/signup_form.jsp?error=invalid");
            } else {
                // Lưu người dùng mới vào cơ sở dữ liệu
                userDB.insert(newuser);
                HttpSession session = request.getSession();
                session.setAttribute("user_id", newuser.getId());
                // Chuyển hướng đến login_form.jsp
                switch (newuser.getRole_id()) {
                    case 2:
                        response.sendRedirect("View/Shopper.jsp");
                        break;
                    case 3:
                        response.sendRedirect("View/ShopOwner.jsp");
                        break;
                    case 4:
                        response.sendRedirect("View/Shipper.jsp");
                        break;
                    default:
                        break;
                }
            }
        } catch (IOException | SQLException e) {
            response.sendRedirect("View/signup_form.jsp?error=invalid");
        }
    }

    private boolean isUsernameTaken(String username) throws SQLException {
        // Kiểm tra nếu username đã tồn tại trong CSDL
        List<User> allUsers = userDB.getAll();
        for (User user : allUsers) {
            if (user.getUserName().equals(username)) {
                return true;
            }
        }
        return false;
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
