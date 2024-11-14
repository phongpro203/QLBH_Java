<%-- 
    Document   : login_form
    Created on : Nov 11, 2024, 9:13:59 PM
    Author     : kohakuta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../assets/css/base.css" />
        <title>Đăng Nhập</title>
       
        <style>
            body {
                margin: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: var(--white-color--);
                
            }
            .login-container {
                position: relative;
                width: 100%;
                max-width: 35%;
                height: 90%;
                background-color: var(--white-color--);
                border-radius: 20px;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.5);
                text-align: center;
            }
            .login-container form{
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
            button{
                background-color: var(--primary--color--);
            }
            .login-button {
                margin-top:  5%;
                width: 100%;
                padding: 16px;
                font-size: 20px;
                color: var(--white-color--);
                border: none;
                border-radius: 45px;
                cursor: pointer;
            }
            .login-button:hover {
                opacity: 80%;
            }
            .signup {
                position: absolute;
                font-size: 22px;
                bottom: 20px;
                left: 50%;
                transform: translateX(-50%);
            }
            .signup a {
                color: var(--primary--color--);
                text-decoration: none;
                font-weight: bold;
            }
        </style>
</head>
<body>
    <div class="login-container">
        <div class="header">
           <h1>Đăng nhập</h1> 
        </div> 
        <form action="${pageContext.request.contextPath}/Login" method="POST">
            <div>
                <input type="text" name="username" placeholder="Tên đăng nhập" required>
            </div>
            <div>
                <input type="password" name="password" placeholder="Mật khẩu" required>
            </div>
            <%
                String error = request.getParameter("error");
                if (error != null && error.equals("invalid")) {
            %>
            <div style="color: red; font-size: 18px; margin-bottom: 15px;">
                Sai tên đăng nhập hoặc mật khẩu.
            </div>
            <%
                }
            %>

            <button class="login-button">ĐĂNG NHẬP</button>
        </form>
        <div class="signup">
            <p>Không có tài khoản?</p>
            <a href="signup_form.jsp">ĐĂNG KÝ NGAY</a>
        </div>
    </div>
</body>
</html>
