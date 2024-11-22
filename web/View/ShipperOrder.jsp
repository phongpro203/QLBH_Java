<%-- 
    Document   : ShipperOrder
    Created on : Nov 22, 2024, 10:39:35 AM
    Author     : kohakuta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.OrderDB"%>
<%@page import="Model.ShipperDB"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đơn hàng đã nhận</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            .container {
                display: flex;
                min-height: 100vh;
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
                <h2>Quản lý đơn hàng</h2>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/Goods">Quay lại trang chủ</a></li>
                    <li><a href="ShipperOrderManagement.jsp">Nhận đơn</a></li>
                    <li><a href="ShipperOrder.jsp">Đơn đã nhận</a></li>
                </ul>
            </aside>
            <main class="content">
                <h3>Đơn hàng đã nhận</h3>
                <table>
                    <tr>
                        <th>Người bán</th>
                        <th>Tên sản phẩm</th>
                        <th>Người mua</th>
                        <th>Địa chỉ giao hàng</th>
                        <th>Thành tiền</th>
                        <th>Tình trạng</th>
                        <th>Hành động</th>
                    </tr>
                    <%
                        // Lấy `user_id` từ session
                        Integer userId = (Integer) session.getAttribute("id");

                        if (userId != null) {
                            // Lấy `shipper_id` từ `user_id`
                            ShipperDB shipperDB = new ShipperDB();
                            int shipperId = shipperDB.getShipperIdByUserId(userId);

                            // Kiểm tra nếu `shipper_id` hợp lệ
                            if (shipperId > 0) {
                                // Lấy danh sách đơn hàng theo `shipper_id`
                                OrderDB orderDB = new OrderDB();
                                List<String[]> orders = orderDB.getOrdersByShipperId(shipperId);

                                if (orders != null && !orders.isEmpty()) {
                                    for (String[] order : orders) {
                    %>
                    <tr>
                        <td><%= order[3]%></td> <!-- Chủ cửa hàng -->
                        <td><%= order[1]%></td> <!-- Tên sản phẩm -->
                        <td><%= order[2]%></td> <!-- Người mua -->                        
                        <td><%= order[4]%></td> <!-- Địa chỉ giao hàng -->
                        <td><%= order[8]%></td> <!-- Thành tiền -->
                        <td>
                            <% if ("Đơn hàng gặp sự cố".equals(order[5])) {%>
                            <span class="status-error"><%= order[5]%></span>
                            <% } else if ("Đã giao".equals(order[5])) {%>
                            <span class="status-success"><%= order[5]%></span>
                            <% } else {%>
                            <span><%= order[5]%></span>
                            <% } %>
                        </td>
                        <td>
                            <%-- Hành động --%>
                            <% if ("Đang giao".equals(order[5])) {%>
                            <form action="${pageContext.request.contextPath}/ShipperManagement" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="completeDelivery">
                                <input type="hidden" name="orderId" value="<%= order[0]%>">
                                <button type="submit">Đã giao</button>
                            </form>
                            <form action="${pageContext.request.contextPath}/ShipperManagement" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="reportIssue">
                                <input type="hidden" name="orderId" value="<%= order[0]%>">
                                <button type="submit" style="background-color: red;">Báo hàng hỏng</button>
                            </form>
                            <% } %>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="9" style="text-align:center;">Không có đơn hàng nào</td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="9" style="text-align:center;">Không tìm thấy shipper ID</td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="9" style="text-align:center;">Người dùng chưa đăng nhập</td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </main>
        </div>
    </body>
</html>
