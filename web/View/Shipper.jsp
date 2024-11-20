<%-- 
    Document   : Shipper
    Created on : Nov 18, 2024, 11:31:58 AM
    Author     : kohakuta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../assets/css/base.css" />
        <title>Kênh người người giao hàng</title>
        <style>
            body{
                height: 100vh;
                background-color: #f6f6f6;
            }
            .app{
                margin: 0;
                padding: 0;
                vertical-align: baseline;
                border: 0;
                background-color: #f6f6f6;
            }
            .header{
                display: flex;
                top: 0;
                left: 0;
                width: 100%;
                height: 60px;
                box-shadow: 0 1px 4px 0 rgba(0,0,0,0.07);
                background-color: var(--primary--color--);
                color: var(--white-color--);
                align-items: center;
            }
            .title{
                font-size: 20px;
                color: var(--white-color--);
                padding-left: 20px;
                font-weight: 400;
            }
            .onboarding-layout{
                max-width: none;
            }
            .layout_main{
                width: 1232px;
                margin: 0 auto;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                padding-top: 20px;
                border-radius: 10px;
            }
            .step-header{
                margin: 0;
                border-bottom: 2px;
                text-align: center;
                color: var(--text--color--);
            }
            .step-header h1{
                padding-top: 10px;
                font-size: 30px;
            }
            .step-content{
                position: relative;
                max-width: 944px;
                min-height: 198px;

            }
            .form-label{
                width: 200px;
                text-align: end;
                box-sizing: border-box;
                align-items: center;
                padding-right: 20px;
            }
            .form-input{
                display: inline-table;
                width: 100%;
                padding: 0 12px;
                height: 32px;
                border-spacing: 0;
                box-sizing: border-box;
                border: 1px solid white;
                border-radius: 5px;
                outline: none;
            }
            .form-input input{
                width: 300px;
                padding: 6px;
                font-size: 1.6rem;
                align-items: center;
                border: 1px solid rgba(0, 0, 0, .5);
                border-radius: 5px;
                box-shadow: inset 0 2px 0 rgba(0, 0, 0, .02);
            }
            .iner-item{
                display: flex;
                font-size: 15px;
                align-items: center;
                padding-bottom: 20px;
            }
            button{
                background-color: var(--primary--color--);
                color: var(--white-color--);
                border-radius: 4px;
                padding: 10px 15px 10px 15px;
                min-width: 130px;
            }
            .Button{
                padding-top: 20px;
                text-align: center;
                padding-bottom: 40px;
            }
            .eds-form-item__reqiured{
                color: red;
            }
            .abstract-form{
                padding: 20px;
            }
            .onboarding-content{
                box-shadow: 0 1px 4px 1px rgba(0,0,0,0.07);
                background-color: white;
                display: flex;
                width: 1232px;
                justify-content: center;
                border-radius: 5px;
            }
        </style> 
    </head>
    <body>
        <div class="app">
            <div class="header">
                <p class="title">Đăng ký trở thành người giao hàng</p>
            </div>
            <div class="onboarding-layout">
                <div class="layout_main">
                    <div class="onboarding-content">
                        <div class="step-content">
                            <div class="step-header">
                                <h1>Thông tin Shipper</h1>
                            </div>
                            <div class="abstract-form">
                                <form action="${pageContext.request.contextPath}/Shipper" method="post">
                                    <div class="iner-item">
                                        <label class="form-label">
                                            <span class="eds-form-item__reqiured">*</span>
                                            Họ và Tên
                                        </label>
                                        <div class="form-input">
                                            <input type="text" name="hoten" required>
                                        </div>
                                    </div>
                                    <div class="iner-item">
                                        <label class="form-label">
                                            <span class="eds-form-item__reqiured">*</span>
                                            Số điện thoại
                                        </label>
                                        <div class="form-input">
                                            <input type="text" name="sdt" required>
                                        </div>
                                    </div>
                                    <div class="Button">
                                        <button type="submit">Lưu</button>
                                    </div>
                                    <%
                                        String error = request.getParameter("error");
                                        if (error != null && error.equals("invalid")) {
                                    %>
                                    <div style="color: red; font-size: 18px; margin-bottom: 0px;text-align: center;padding-top: 10px;">
                                        Số điện thoại đã tồn tại
                                    </div>
                                    <%
                                        }
                                    %>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>              
            </div>
        </div>
    </body>
</html>
