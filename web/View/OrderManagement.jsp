<%-- 
    Document   : OrderManagement
    Created on : Nov 20, 2024, 6:26:10 PM
    Author     : kohakuta
--%>

<%@page import="java.util.Comparator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.OrderDB"%>
<%@page import="java.util.List"%>
<%@page import="Model.ShopOwnerDB"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý đơn hàng</title>
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

            .status-error {
                color: red;
                font-weight: bold;
            }

            .status-success {
                color: green;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <aside class="sidebar">
                <h2>Quản lý cửa hàng</h2>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/Goods">Quay lại trang chủ</a></li>
                    <li><a href="ShopOwnerDashboard.jsp">Quản lý sản phẩm</a></li>
                    <li><a style="color: #0056b3;" href="OrderManagement.jsp">Quản lý đơn hàng</a></li>
                    <li><a href="ReportManagement.jsp">Phản hồi của khách</a></li>
                </ul>
            </aside>
            <main class="content">
                <h3>Quản lý đơn hàng</h3>
                <table>
                    <tr>
                        <th>Tên sản phẩm</th>
                        <th>Người mua</th>
                        <th>Chủ cửa hàng</th>
                        <th>Người giao hàng</th>
                        <th>Địa chỉ giao hàng</th>      
                        <th>Ngày đặt</th>
                        <th>Ngày giao</th>
                        <th>Thành tiền</th>
                        <th>Tình trạng</th>
                        <th>Hành động</th>
                    </tr>
                    <%
                        // Lấy user_id từ session
                            int userId = (int) session.getAttribute("id");

                            // Lấy shop_owner_id từ user_id
                            ShopOwnerDB shopOwnerDB = new ShopOwnerDB();
                            int shopOwnerId = shopOwnerDB.getShopOwnerIdByUserId(userId);

                            // Lấy danh sách đơn hàng theo shop_owner_id
                            OrderDB orderDB = new OrderDB();
                            List<String[]> orderDetails = orderDB.getOrdersWithNameByShopOwner(shopOwnerId);
                            orderDetails.sort(new Comparator<String[]>() {
                                @Override
                                public int compare(String[] a, String[] b) {
                                    return a[6].compareTo(b[6]);
                                }
                            });

                            if (orderDetails != null && !orderDetails.isEmpty()) {
                                for (String[] order : orderDetails) {
                                    String shipperName = order[4] != null && !order[4].isEmpty() ? order[4] : "N/A"; // Nếu chưa có shipper nhận
                    %>
                    <tr>
                        <td><%= order[1] != null ? order[1] : "N/A"%></td> <!-- Tên sản phẩm -->
                        <td><%= order[2] != null ? order[2] : "N/A"%></td> <!-- Người mua -->
                        <td><%= order[3] != null ? order[3] : "N/A"%></td> <!-- Chủ cửa hàng -->
                        <td><%= shipperName%></td> <!-- Người giao hàng -->
                        <td><%= order[5] != null ? order[5] : "N/A"%></td> <!-- Địa chỉ giao hàng -->
                        <td><%= order[7] != null ? order[7] : "N/A"%></td> <!-- Ngày đặt -->
                        <td><%= order[8] != null ? order[8] : "N/A"%></td> <!-- Ngày giao -->
                        <td><%= order[9] != null ? order[9] : "N/A"%></td> <!-- Thành tiền -->
                        <td>
                            <% if ("Đơn hàng gặp sự cố".equals(order[6])) {%>
                            <span class="status-error"><%= order[6]%></span>
                            <% } else if ("Đã giao".equals(order[6])) {%>
                            <span class="status-success"><%= order[6]%></span>
                            <% } else {%>
                            <span><%= order[6]%></span>
                            <% } %>
                        </td>
                        <td>
                            <%-- Hành động --%>
                            <% if ("Chờ lấy hàng".equals(order[6])) {%>
                            <form action="${pageContext.request.contextPath}/OrderManagement" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="confirmOrder">
                                <input type="hidden" name="orderId" value="<%= order[0]%>">
                                <button type="submit">Xác nhận đơn</button>
                            </form>
                            <% } else if ("Đơn hàng gặp sự cố".equals(order[6]) || "Shipper từ chối đơn".equals(order[6])) {%>
                            <form action="${pageContext.request.contextPath}/OrderManagement" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="retryDelivery">
                                <input type="hidden" name="orderId" value="<%= order[0]%>">
                                <button type="submit">Giao lại</button>
                            </form>
                            <% } %>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="10" style="text-align:center;">Không có đơn hàng nào</td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </main>
        </div>
    </body>
</html>
