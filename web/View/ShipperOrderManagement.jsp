<%-- 
    Document   : ShipperOrderManagement
    Created on : Nov 20, 2024, 8:23:21 PM
    Author     : kohakuta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.OrderDB"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý đơn hàng cho shipper</title>
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
                <h2>Quản lý đơn hàng</h2>
                <ul>
                    <li>
                        <a href="${pageContext.request.contextPath}/Goods">Quay lại trang chủ</a>
                    </li>
                    <li>
                        <a style="color: #0056b3;" href="ShipperOrderManagement.jsp">Nhận đơn</a>
                    </li>
                    <li>
                        <a href="ShipperOrder.jsp">Đơn giao</a>
                    </li>
                </ul>
            </aside>
            <main class="content">
                <div id="storeOwners" class="section">
                <h3>Quản lý đơn hàng cho shipper</h3>
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
                        int count = 0;
                        OrderDB orderDB = new OrderDB();
                        List<String[]> orderDetails = orderDB.getOrdersWithName();

                        if (orderDetails != null && !orderDetails.isEmpty()) {
                            for (String[] order : orderDetails) {
                            String status = order[6];  // Tình trạng đơn hàng
                             if ("Chờ giao hàng".equals(status)) {
                               count++;
%>
                    <tr>
                        <td><%= order[3] != null ? order[3] : "N/A"%></td> <!-- Người bán -->
                        <td><%= order[1] != null ? order[1] : "N/A"%></td> <!-- Tên sản phẩm -->
                        <td><%= order[2] != null ? order[2] : "N/A"%></td> <!-- Người mua -->
                        <td><%= order[5] != null ? order[5] : "N/A"%></td> <!-- Địa chỉ giao hàng -->
                        <td><%= order[9] != null ? order[9] : "N/A"%></td> <!-- Thành tiền -->
                        <td>
                            <% if ("Đơn hàng gặp sự cố".equals(status)) {%>
                            <span class="status-error"><%= status%></span>
                            <% } else if ("Đã giao".equals(status)) {%>
                            <span class="status-success"><%= status%></span>
                            <% } else {%>
                            <span><%= status%></span>
                            <% } %>
                        </td>
                        <td>
                            <% if ("Chờ giao hàng".equals(status)) {%>
                            <form action="${pageContext.request.contextPath}/ShipperManagement" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="acceptOrder">
                                <input type="hidden" name="orderId" value="<%= order[0]%>">
                                <button type="submit">Nhận đơn</button>
                            </form>
                            <% } %>
                        </td>
                    </tr>
                    <%
                        }}
                    } else {
                    %>
                    <tr>
                        <td colspan="6" style="text-align:center;">Không có đơn hàng nào</td>
                    </tr>
                    <%
                        }
                    %>
                    <%
                        if(count < 1)
                        {
                        %>
                        <tr>
                        <td colspan="6" style="text-align:center;">Không có đơn hàng nào</td>
                    </tr>
                        <%
                            }
                    %>
                    
                </table>
            </main>
        </div>
    </body>
</html>
