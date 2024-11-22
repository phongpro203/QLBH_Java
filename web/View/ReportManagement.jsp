<%-- 
    Document   : ReportManagement
    Created on : Nov 20, 2024, 7:10:07 PM
    Author     : kohakuta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Model.ReportDB" %>
<%@ page import="Model.Report" %>
<%@ page import="java.util.List" %>

<%
    int userId = (int) session.getAttribute("id"); // Retrieve the user_id from the session
    ReportDB reportDB = new ReportDB();
    List<String[]> reports = reportDB.getReportsWithDetailsByUser(userId); // Fetch reports for the logged-in user
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý phản hồi</title>
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
                        <a href="ShopOwnerDashboard.jsp">Quản lý sản phẩm</a>
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
                    <h3>Report Management</h3>
                    <table>
                        <tr>
                            
                            <th>Tên sản phẩm</th>
                            <th>Tên khách hàng</th>
                            <th>Phản hồi</th>
                        </tr>
                        <%
                            if (reports != null && !reports.isEmpty()) {
                                for (String[] report : reports) {
                        %>
                        <tr>
                            
                            <td><%= report[2]%></td> <!-- Tên sản phẩm -->
                            <td><%= report[3]%></td> <!-- Tên khách hàng -->
                            <td><%= report[1]%></td> <!-- Phản hồi -->
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="5" style="text-align:center;">Không có phản hồi nào</td>
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
