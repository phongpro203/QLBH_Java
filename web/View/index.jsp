<%-- 
    Document   : index
    Created on : Nov 7, 2024, 10:19:27 PM
    Author     : Admin
--%>

<%@page import="Model.MatHangDB"%>
<%@page import="java.util.List"%>
<%@page import="Model.MatHang"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Danh sách mặt hàng</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Mã hàng</th>
                <th>Tên hàng</th>
                <th>Giá</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Lấy danh sách mặt hàng từ request
                List<MatHang> matHangList = (List<MatHang>) request.getAttribute("matHangList");
                
                if (matHangList != null) {
                    // Lặp qua danh sách và hiển thị từng mặt hàng
                    for (MatHang matHang : matHangList) {
            %>
            <tr>
                <td><%= matHang.getMahang() %></td>
                <td><%= matHang.getTenhang() %></td>
                <td><%= matHang.getGia() %></td>
            </tr>
            <% 
                    }
                } else {
            %>
            <tr>
                <td colspan="3">Không có sản phẩm nào</td>
            </tr>
            <% } %>
        
        </tbody>
    </table>
            <form action="View/a.jsp" method="POST">
            <label>mahang </label>
            <input type="text" name="m" value="" required=""/> <br/> <br/>
            <label>tenhang </label>
            <input type="text" name="t" value="" required=""/> <br/>
            <label>gia </label>
            <input type="number" name="g" value="" required=""/> <br/>
            <input type="submit" value="sửa"/> <br/>
            ------------------------------------------------- <br/>
        </form>
            <h1>hello</h1>
    </body>
</html>
