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
    // Lấy user_id từ session
    int userId = (int) session.getAttribute("id");

    // Lấy shop_owner_id thông qua user_id
    ShopOwnerDB shopDB = new ShopOwnerDB();
    int shopOwnerId = shopDB.getShopOwnerIdByUserId(userId);

    // Lấy danh sách sản phẩm dựa trên tìm kiếm hoặc toàn bộ sản phẩm
    GoodsDB goodsDB = new GoodsDB();
    List<Goods> goodsList;

    // Kiểm tra nếu có từ khóa tìm kiếm
    String keyword = request.getParameter("keyword");
    if (keyword != null && !keyword.isEmpty()) {
        goodsList = goodsDB.searchGoodsByShopAndName(shopOwnerId, keyword);
    } else {
        goodsList = goodsDB.findAllGoodsByShopId(shopOwnerId);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý kênh bán hàng</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            .container {
                display: flex;
                height: 100vh;
            }

            .sidebar {
                width: 250px;
                background-color: #f4f4f4;
                padding: 20px;
            }

            .sidebar h2 {
                margin-top: 0;
            }

            .sidebar ul {
                list-style-type: none;
                padding: 0;
            }

            .sidebar ul li {
                margin: 15px 0;
            }

            .sidebar ul li a {
                text-decoration: none;
                color: #333;
            }

            .sidebar ul li a:hover {
                color: #007bff;
            }

            .content {
                flex: 1;
                padding: 20px;
                overflow-y: auto;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            table,
            th,
            td {
                border: 1px solid #ddd;
            }

            th,
            td {
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }

            button {
                padding: 5px 10px;
                margin: 0 5px;
                border: none;
                border-radius: 4px;
                background-color: #007bff;
                color: white;
                cursor: pointer;
            }

            button:hover {
                background-color: #0056b3;
            }
            a{
                color: white;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <aside class="sidebar">
                <h2>Quản lý cửa hàng</h2>
                <ul>
                    <li>
                        <a href="${pageContext.request.contextPath}/Goods">Quay lại trang chủ</a>
                    </li>
                    <li>
                        <a style="color: #0056b3;" href="ShopOwnerDashboard.jsp">Quản lý sản phẩm</a>
                    </li>
                    <li>
                        <a href="OrderManagement.jsp">Quản lý đơn hàng</a>
                    </li>
                    <li>
                        <a href="ReportManagement.jsp">Phản hồi của khách</a>
                    </li>  
                </ul>
            </aside>
            <main class="content">
                <div id="storeOwners" class="section">
                    <h3>Quản lý sản phẩm</h3>
                     <!-- Form tìm kiếm -->
                    <form action="ShopOwnerDashboard.jsp" method="get" style="margin-bottom: 20px;">
                        <input type="text" name="keyword" placeholder="Tìm kiếm sản phẩm..." value="<%= keyword != null ? keyword : "" %>">
                        <button type="submit">Tìm kiếm</button>
                    </form>
                    <!-- Nút thêm sản phẩm -->
                    <button type="submit"><a href="GoodsAdd.jsp">Thêm sản phẩm</a></button>
                    <!-- Bảng hiển thị sản phẩm -->
                    <table>
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
                            if (goodsList != null && !goodsList.isEmpty()) {
                                for (Goods goods : goodsList) {
                        %>
                        <tr>
                            <td><%= goods.getId()%></td>
                            <td><%= goods.getTensp()%></td>
                            <td><%= goods.getChungloai()%></td>
                            <td><%= goods.getChitiet()%></td>
                            <td><%= goods.getGia()%></td>
                            <td><%= goods.getSoluong()%></td>
                            <td><img src="${pageContext.request.contextPath}/assets/image/<%= goods.getHinhanh()%>" width="100"></td>
                            <td><%= goods.getGiamGia()%>%</td>
                            <td>
                                <form action="GoodsEdit.jsp" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="<%= goods.getId()%>">
                                    <button type="submit">Sửa</button>
                                </form>
                                    <hr>
                                <form action="${pageContext.request.contextPath}/ShopOwner" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="deleteGoods">
                                    <input type="hidden" name="id" value="<%= goods.getId()%>">
                                    <button type="submit" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')">Xóa</button>
                                </form>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="9" style="text-align: center;">Không tìm thấy sản phẩm nào</td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </main>
        </div>
    </body>
</html>
