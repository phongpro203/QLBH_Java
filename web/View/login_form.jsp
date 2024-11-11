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
                font-family: "Roboto", sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: var(--white-color--);
                
            }
            .login-container {
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
                display: flex;
                border-radius: 20px 20px 0px 0px;
                color: var(--white-color--);
                width: 100%;
                justify-content: center;
                height: 15%;
                background-color: var(--primary--color--);
            }
            .header h1{
                padding-top: 1%;
                font-size: 50px;
            }
            input{
                padding-left: 25px;
                font-size: 25px;
                margin-bottom: 25px;
                width: 100%;
                height: 50px;
                border: none;
                border-radius: 45px;
                background-color: #f0f0f0;
            }
            input::placeholder{
                color: darkgreen;
                font-size: 25px;
            }
            button{
                background-color: var(--primary--color--);
            }
            .login-button {
                margin-top:  5%;
                width: 100%;
                padding: 16px;
                font-size: 24px;
                color: var(--white-color--);
                border: none;
                border-radius: 45px;
                cursor: pointer;
            }
            .signup {
                margin-top: 38%;
                font-size: 22px;
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
        <form action="" method="post">
            <div>
                <input type="text" name="txtUser" placeholder="Tên đăng nhập" required>
            </div>
            <div>
                <input type="password" name="txtPass" placeholder="Mật khẩu" required>
            </div>
            <button type="submit" class="login-button">ĐĂNG NHẬP</button>
        </form>
        <div class="signup">
            <p>Không có tài khoản?</p>
            <a href="#">ĐĂNG KÝ NGAY</a>
        </div>
    </div>
</body>
</html>
