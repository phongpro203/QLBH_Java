<%-- 
    Document   : admin_form.jsp
    Created on : Nov 20, 2024, 7:45:00 PM
    Author     : Admin
--%>

<%@page import="Model.Order"%>
<%@page import="Model.OrderDB"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="Model.UserDB"%>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Quản Lý Tài Khoản</title>
    </head>
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
    </style>
    <body>
        <div class="container">
            <aside class="sidebar">
                <h2>Quản Lý Tài Khoản</h2>
                <ul>
                    <li>
                        <a href="${pageContext.request.contextPath}/Goods">Quay lại trang chủ</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/View/admin_form.jsp?ql=tk">Quản lý tài khoản</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/View/admin_form.jsp?ql=dh">Quản lý đơn hàng</a>
                    </li>
                </ul>
            </aside>
            <main class="content">
                <%
                    if ("tk".equals(request.getParameter("ql"))) {
                        UserDB userDB = new UserDB();
                        if (request.getParameter("id_user") != null) {
                            userDB.deleteUser(Integer.parseInt(request.getParameter("id_user")));
                        }
                        List<User> userList = userDB.getAll();
                %>
                <div id="storeOwners" class="section">
                    <h3>Quản lý tài khoản</h3>
                    <table>
                        <tr>
                            <th>Tài khoản</th>
                            <th>Mật khẩu</th>
                            <th>Vai trò</th>
                            <th>Hành Động</th>
                        </tr>
                        <%
                            String[] roles = {"Admin", "Người mua hàng", "Người bán hàng", "Người giao hàng"};
                            for (User user : userList) {
                                int stt = user.getRole_id() - 1;
                                String vaitro = roles[stt];
                        %>
                        <tr>
                            <td><%= user.getUserName()%></td>
                            <td><%= user.getPassword()%></td>
                            <td><%= vaitro%></td>
                            <td>
                                <form action="" method="get">
                                    <input type="hidden" name="ql" value="tk" />
                                    <input type="hidden" name="id_user" value="<%= user.getId()%>" />
                                    <button>Xóa</button>
                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
                <%}
                    if ("dh".equals(request.getParameter("ql"))) {
                        OrderDB orderDB = new OrderDB();
                        if (request.getParameter("id_user") != null) {
                            orderDB.deleteOrder(Integer.parseInt(request.getParameter("id_user")));
                        }
                        List<String[]> stringList = orderDB.getOrdersWithNames();
                %>
                <div id="storeOwners" class="section">
                    <h3>Quản lý đơn hàng</h3>
                    <table>
                        <tr>
                            <th>Tên sản phẩm</th>
                            <th>Tên người mua</th>
                            <th>Tên người bán</th>
                            <th>Tên người giao</th>
                            <th>Địa chỉ gửi</th>
                            <th>Địa chỉ nhận</th>
                            <th>Tình trạng</th>
                            <th>Ngày đặt</th>
                            <th>Ngày giao</th>
                            <th>Thành tiền</th>
                        </tr>
                        <%
                            for (String[] order : stringList) {
                                if ("Đã giao".equals(order[7]) || "Đã đánh giá".equals(order[7])) {
                        %>
                        <tr>
                            <td><%= order[1]  %></td>
                            <td><%= order[2]  %></td>
                            <td><%= order[3]  %></td>
                            <td><%= order[4]  %></td>
                            <td><%= order[5]  %></td>
                            <td><%= order[6]  %></td>
                            <td><%= order[7]  %></td>
                            <td><%= order[8]  %></td>
                            <td><%= order[9]  %></td>
                            <td><%= order[10]  %></td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </table>
                </div>
                <%}%>

            </main>
        </div>


    </body>
</html>
