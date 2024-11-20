<%-- 
    Document   : GoodsView
    Created on : Nov 18, 2024, 4:11:11 PM
    Author     : kohakuta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="Model.Goods"%>
<%@ page import="Model.GoodsDB"%>
<%
    int shopOwnerId = Integer.parseInt(request.getParameter("shopOwnerId"));
    GoodsDB goodsDB = new GoodsDB();
    List<Goods> goodsList = goodsDB.findAllGoodsByShop(shopOwnerId);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách sản phẩm</title>
    </head>
    <body>
        <h1>Danh sách sản phẩm của ShopOwner</h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Tên sản phẩm</th>
                <th>Chủng loại</th>
                <th>Chi tiết</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Hình ảnh</th>
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
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
