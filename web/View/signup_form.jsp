<%-- 
    Document   : resign_form
    Created on : Nov 12, 2024, 3:59:15 PM
    Author     : kohakuta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../assets/css/base.css" />
        <title>Đăng Ký</title> 
       
        <style>
            body {
                margin: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: var(--white-color--);
                
            }
            .signup-container {
                position: relative;
                width: 100%;
                max-width: 35%;
                height: 90%;
                background-color: var(--white-color--);
                border-radius: 20px;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.5);
                text-align: center;
            }
            .signup-container form{
                padding: 35px;
            }
            .header{
                padding: 20px;   
                display: flex;
                border-radius: 20px 20px 0px 0px;
                color: var(--white-color--);
                width: 100%;
                justify-content: center;
                background-color: var(--primary--color--);
                margin-bottom: 20px;
            }
            .header h1{
                padding-top: 1%;
                font-size: 40px;
            }
            input{
                padding: 15px 0;
                padding-left: 25px;
                font-size: 20px;
                margin-bottom: 25px;
                width: 100%;
                border: none;
                border-radius: 45px;
                background-color: #f0f0f0;
            }
            input::placeholder{
                color: var(--text-color--);
                font-size: 25px;
            }
            .custom-select {
                padding: 15px 25px;
                font-size: 20px;
                margin-bottom: 25px;
                width: 100%;
                border: none;
                border-radius: 45px;
                background-color: #f0f0f0;
                color: var(--text-color--);
                appearance: none; /* Ẩn mũi tên mặc định */
            }
            button{
                background-color: var(--primary--color--);
            }
            .signup-button {
                margin-top:  5%;
                width: 100%;
                padding: 16px;
                font-size: 20px;
                color: var(--white-color--);
                border: none;
                border-radius: 45px;
                cursor: pointer;
            }
            .signup-button:hover {
                opacity: 80%;
            }
            .signin {
                position: absolute;
                font-size: 22px;
                bottom: 20px;
                left: 50%;
                transform: translateX(-50%);
            }
            .signin a {
                color: var(--primary--color--);
                text-decoration: none;
                font-weight: bold;
            }
            form a{
                color: green;
                text-decoration: none;
                font-weight: bold;
            }
        </style>
</head>
<body>
    <div class="signup-container">
        <div class="header">
            <h1>Đăng ký</h1> 
        </div> 
        <form action="${pageContext.request.contextPath}/Signup" method="POST">
            <div>
                <input type="text" name="username" placeholder="Tên đăng nhập" required>
            </div>
            <div>
                <input type="password" name="password" placeholder="Mật khẩu" required>
            </div>
            <div>
                <select name="role" required class="custom-select">
                    <option value="">Chọn vai trò</option>
                    <option value="2">Người mua hàng</option>
                    <option value="3">Người bán hàng</option>
                    <option value="4">Người giao hàng</option>
                </select>
            </div>
            <button class="signup-button">ĐĂNG KÝ</button>
            <%
                String error = request.getParameter("error");
                if (error != null && error.equals("invalid")) {
            %>
            <div style="color: red; font-size: 20px; padding: 15px">
                Tài khoản đã tồn tại, hãy đăng nhập
            </div>
            <%
                }       
            %>

        </form>
        <div class="signin">
            <p>Đã có tài khoản?</p>
            <a href="login_form.jsp">ĐĂNG NHẬP NGAY</a>
        </div>
    </div>
</body>
</html>