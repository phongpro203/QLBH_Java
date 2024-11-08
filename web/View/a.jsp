<%-- 
    Document   : a
    Created on : Nov 7, 2024, 10:42:25 PM
    Author     : Admin
--%>

<%@page import="Model.MatHang"%>
<%@page import="Model.MatHangDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
                String mahang = request.getParameter("m");
    String tenhang = request.getParameter("t");
    String giaStr = request.getParameter("g");
    int gia = 0;  // Khởi tạo biến gia

    // Kiểm tra xem tham số 'g' có null hoặc rỗng không trước khi chuyển đổi
    if (giaStr != null && !giaStr.isEmpty()) {
        try {
            gia = Integer.parseInt(giaStr);
        } catch (NumberFormatException e) {
            // Xử lý lỗi nếu không thể chuyển đổi
            out.println("Giá không hợp lệ!");
            return;  // Kết thúc nếu gặp lỗi
        }
    } else {
        out.println("Giá trị 'g' là bắt buộc.");
        return;  // Kết thúc nếu 'g' rỗng
    }
                MatHangDB mh = new MatHangDB();
                MatHang mathang = new MatHang(mahang,tenhang,gia);
                mh.updateProduct(mathang);
            %>
            <a><a href="${pageContext.request.contextPath}/mathang">Ve</a>
    </body>
</html>
