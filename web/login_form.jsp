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
         <link rel="stylesheet" href="./assets/css/base.css"/>
        <title>Đăng Nhập</title>
       
        <style>
            .login-container {
                width: 100%;
                max-width: 400px;
                margin: 80px auto;
                padding: 32px;
                background-color: var(--primary--color--);
                border-radius: 20px;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            .login-container h2 {
                font-size: 100px;
                color: var(--white-color--);
                background-color: var(--primary--color--);
                margin-bottom: 32px;
            }
            .input-group {
                margin-bottom: 25px;
            }
            .input-group input {
                width: 100%;
                font-size: 24px;
                border: none;
                border-radius: 45px;
                background-color: #f0f0f0;
            }
            .options {
                text-align: right;
                margin-bottom: 25px;
            }
            .options a {
                color: var(--primary--color--);
                text-decoration: none;
                font-size: 22px;
            }
            button{
                background-color: var(--primary--color--);
            }
            .login-button {
                width: 100%;
                padding: 16px;
                font-size: 24px;
                color: var(--white-color--);
                
                border: none;
                border-radius: 45px;
                cursor: pointer;
            }
            .signup {
                margin-top: 32px;
                font-size: 22px;
            }
            .signup a {
                background-color: var(--primary--color--);
                text-decoration: none;
                font-weight: bold;
            }
        </style>
</head>
<body>
    <div class="grid">
        <div class="grid__row">
            <div class="grid__column-10">
                <div class="login-container">
                    <h2>SIGN IN</h2>
                    <form action="" method="post">
                        <div class="input-group">
                            <input type="text" name="txtUser" placeholder="Username" required>
                        </div>
                        <div class="input-group">
                            <input type="password" name="txtPass" placeholder="Password" required>
                        </div>
                        <div class="options">
                            <a href="#">Forgot Username / Password?</a>
                        </div>
                        <button type="submit" class="login-button">SIGN IN</button>
                    </form>
                    <div class="signup">
                        <p>Don’t have an account?</p>
                        <a href="#">SIGN UP NOW</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
