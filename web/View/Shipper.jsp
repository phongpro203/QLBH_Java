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
            .app{
                margin: 0;
                padding: 0;
                vertical-align: baseline;
                border: 0;
            }
            .formable-onboarding-page{
                padding-top: 56px;
                min-width: 1232px;
                margin: 0;
            }
            .header{
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 56px;
                box-shadow: 0 1px 4px 0 rgba(0,0,0,0.07);
                background-color: var(--primary--color--);
                color: var(--white-color--);
                z-index: 100001;
                align-items: center;
            }
            .header-wrapper{
                width: 100%;
                align-items: center;
                display: flex;
                justify-content: space-between;
            }
            .header-logo{
                margin-left: 16px;
                display: flex;
                align-items: center;
            }
            .icon{
                height: 30px;
                text-align: center;
                align-items: center;
                height: 100%;
            }
            .title{
                font-size: 20px;
                color: var(--white-color--);
                padding: 15px;
                margin-left: 5px;
                font-weight: 400;
            }
            .header-user{
                display: flex;
                align-items: center;
                position: relative;
                max-width: 259px;
                height: 56px;
                color: var(--white-color--);
                padding-right: 5%;

            }
            .account-popover{
                max-width: 100%;
                max-height: 100%;
                flex-flow: row nowrap;
                display: flex;
                align-items: center;
            }
            .formable-onboarding-page{
                padding-top: 56px;
                min-width: 1232px;
                margin: 0 auto;
                background-color: #F6F6F6;
            }
            .formable-onboarding{
                min-height: calc(100vh - 56vh - 40px);
                padding-bottom: 64px;

            }
            .onboarding-layout{
                max-width: none;
            }
            .onboarding-layout__header{
                margin-bottom: 16px;
            }
            .layout_main{
                width: 1232px;
                margin: 0 auto;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }
            .layout-card{
                border-radius:  4px;
                background-color: white;
                box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.12);
            }
            .step-header{
                margin: 0;
                border-bottom: 1px;
                text-align: center;
                color: var(--text--color--);
            }
            .step-header h1{
                font-size: 30px;
            }
            .step-content{
                position: relative;
                max-width: 944px;
                margin: 48px auto 40px;
                min-height: 198px;
            }
            .form-label{
                justify-content: flex-end;
                width: 200px;
                text-align: end;
                box-sizing: border-box;
            }
            .form-item{
                margin-bottom: 24px;
            }
            .form-item_iner{
                display: flex;
                margin-bottom: 24px;
                font-size: 14px;
                align-items: flex-start;
            }
            .eds-form-item__reqiured{
                display: inline-block;
                font-size: 12px;
                color: #ff4742;
                margin-right: 3px;
            }
            .form-input{
                position: relative;
                display: inline-table;
                width: 100%;
                padding: 0 12px;
                font-size: 14px;
                height: 32px;
                border-spacing: 0;
                box-sizing: border-box;
                border: 1px solid white;
                border-radius: 4px;
                outline: none;
            }
            .eds-form-item__extra{
                padding-top: 4px;
                font-size: 12px;
                line-height: 16px;
                color: #666;
            }
            .formable-renderer{
                text-align: center;
            }
            .formable-renderer button{
                font-size: 20px;
            }
            button{
                background-color: var(--primary--color--);
                color: var(--white-color--);
                border-radius: 4px;
                padding: 10px 15px 10px 15px;
            }
            .flow-step-content{
                width: 1232px;
            }
            .username{
                font-size: 16px;
            }
        </style> 
    </head>
    <body>
        <div class="app">
            <div class="formable-onboarding-page">
                <div class="header">
                    <div class="header-wrapper">
                        <div class="header-logo">
                            <span class="title">Đăng ký trở thành người giao hàng</span>
                        </div>
                    </div>
                </div>
                <div class="model">
                </div>
                <div class="formable-onboarding">
                    <div class="onboarding-layout">
                        <div class="onboarding-layout__header"></div>
                        <div class="layout_main">
                            <div class="layout-card">
                                <div class="content">
                                    <div class="flow-content">
                                        <div class="flow-step-content">
                                            <div class="step-header">
                                                <h1>Thông tin Shipper</h1>
                                            </div>
                                            <div class="step-content">
                                                <div class="abstract-form">
                                                    <form action="${pageContext.request.contextPath}/Shipper" method="post">
                                                        <div class="formable-rendeber">
                                                            <div class="form-item">
                                                                <div class="form-item_iner">
                                                                    <label class="form-label">
                                                                        <span class="eds-form-item__reqiured">*</span>
                                                                        Họ và Tên
                                                                    </label>
                                                                    <div class="form-item_control">
                                                                        <div class="form-item_content">
                                                                            <div class="formable-renderer">
                                                                                <div class="form-input">
                                                                                    <input type="text" name="hoten" required>
                                                                                </div>
                                                                            </div>
                                                                            <div data-v-547eeefc="" class="eds-form-item__extra"><!----> </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-item">
                                                                <div class="form-item_iner">
                                                                    <label class="form-label">
                                                                        <span class="eds-form-item__reqiured">*</span>
                                                                        Số điện thoại
                                                                    </label>
                                                                    <div class="form-item_control">
                                                                        <div class="form-item_content">
                                                                            <div class="formable-renderer">
                                                                                <div class="form-input">
                                                                                    <input type="text" name="sdt" required>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-item_control">
                                                            <div class="form-item_content">
                                                                <div class="formable-renderer">
                                                                    <button type="submit">Lưu</button>
                                                                </div>
                                                            </div>
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
