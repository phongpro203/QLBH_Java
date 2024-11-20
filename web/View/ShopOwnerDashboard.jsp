<%-- 
    Document   : ShopOwnerDashboard
    Created on : Nov 18, 2024, 4:09:02 PM
    Author     : kohakuta
--%>

<%@page import="Model.ShopOwner"%>
<%@page import="Model.ShopOwnerDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="Model.Goods" %>
<%@ page import="Model.GoodsDB"%>
<%
    int id = (int) session.getAttribute("id"); 
    //int id = Integer.parseInt(request.getParameter("id"));
        ShopOwnerDB shopDB = new ShopOwnerDB();
        ShopOwner shop = shopDB.find(id);
        request.setAttribute("shop", shop);
    GoodsDB goodsDB = new GoodsDB();
    List<Goods> goodsList = goodsDB.findAllGoodsByShop(id);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý kênh bán hàng</title>
    </head>
    <body>
        <h1>Quản lý hàng hóa</h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Tên sản phẩm</th>
                <th>Chủng loại</th>
                <th>Chi tiết</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Hình ảnh</th>
                <th>Giảm giá</th>
                <th>Hành động</th>
            </tr>
            <%
                for (Goods goods : goodsList) {
            %>
            <tr>
                <td><%= goods.getId()%></td>
                <td><%= goods.getTensp()%></td>
                <td><%= goods.getChungloai()%></td>
                <td><%= goods.getChitiet()%></td>
                <td><%= goods.getGia()%></td>
                <td><%= goods.getSoluong()%></td>
                <td><img src="<%= goods.getHinhanh()%>" width="100"></td>
                <td><%= goods.getGiamGia()%>%</td>
                <td>
                    <form action="ShopOwnerServlet" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="editGoods">
                        <input type="hidden" name="id" value="<%= goods.getId()%>">
                        <button type="submit">Sửa</button>
                    </form>
                    <form action="ShopOwnerServlet" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="deleteGoods">
                        <input type="hidden" name="id" value="<%= goods.getId()%>">
                        <button type="submit">Xóa</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <h2>Thêm sản phẩm mới</h2>
        <form action="ShopOwnerServlet" method="post">
            <input type="hidden" name="action" value="addGoods">
            <input type="hidden" name="shopOwnerId" value="<%= id%>">
            <label>Tên sản phẩm: <input type="text" name="tensp"></label><br>
            <label>Chủng loại: <input type="text" name="chungloai"></label><br>
            <label>Chi tiết: <textarea name="chitiet"></textarea></label><br>
            <label>Giá: <input type="number" name="gia"></label><br>
            <label>Số lượng: <input type="number" name="soluong"></label><br>
            <label>Hình ảnh: <input type="text" name="hinhanh"></label><br>
            <label>Giảm giá (%): <input type="number" name="giamGia"></label><br>
            <button type="submit">Thêm</button>
        </form>
    </body>
</html>
