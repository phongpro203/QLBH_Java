<%-- 
    Document   : sellerSignup
    Created on : Nov 13, 2024, 10:19:02 PM
    Author     : kohakuta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kênh người bán hàng</title>
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
                background-color: white;
                z-index: 100001;
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
                font-size: 18px;
                color: black;
                margin-top: 2px;
                margin-left: 5px;
                font-weight: 400;
            }
            .header-user{
                display: flex;
                align-items: center;
                position: relative;
                max-width: 259px;
                height: 56px;
                color: black;
                padding-right: 5%;
                
            }
            .account-popover{
                max-width: 100%;
                max-height: 100%;
                flex-flow: row nowrap;
                display: flex;
                align-items: center;
            }
            .formable-onboarding{
                padding-top: 56px;
                min-width: 1232px;
                margin: 0 auto;
            }
        </style> 
    </head>
    <body>
        <div class="app">
            <div class="formable-onboarding-page">
                <div class="header">
                    <div class="header-wrapper">
                        <div class="header-logo">
                            <div class="icon">
                                <img src="src" alt="Shop"/>                          <!-- icon ở đây -->
                            </div>
                            <span class="title">Đăng ký trở thành người bán hàng</span>
                        </div>
                        <div class="header-user">
                            <div class="account-popover">
                                <div class="popover-ref">
                                    <div class="account-popover-controller">

                                        <div class="account-name">
                                            <div class="username">Username</div>    <!-- Tên ở đây -->
                                        </div>
                                    </div>
                                </div>
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
                                                        <h1>Thông tin Shop</h1>
                                                    </div>
                                                    <div class="step-content">
                                                        <div class="abstract-form">
                                                            <form action="${pageContext.request.contextPath}/SellerSignUp" method="post">
                                                                <div class="formable-redeber">
                                                                    <div class="ỉtem">
                                                                        <label class="form-label">
                                                                            <span class="eds-form-item__reqiured">*</span>
                                                                            Tên Shop
                                                                        </label>
                                                                        <div class="form-item_control">
                                                                            <div class="form-item_content">
                                                                                <div class="formable-renderer">
                                                                                    <div class="form-input">
                                                                                        <input type="text" name="tenshop" required>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <label class="form-label">
                                                                            <span class="eds-form-item__reqiured">*</span>
                                                                            Tên Chủ Shop
                                                                        </label>
                                                                        <div class="form-item_control">
                                                                            <div class="form-item_content">
                                                                                <div class="formable-renderer">
                                                                                    <div class="form-input">
                                                                                        <input type="text" name="tenchushop" required>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <label class="form-label">
                                                                            <span class="eds-form-item__reqiured">*</span>
                                                                            Số Điện Thoại
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
                                                                        Mã Số Thuế
                                                                        </label>
                                                                        <div class="form-item_control">
                                                                            <div class="form-item_content">
                                                                                <div class="formable-renderer">
                                                                                    <div class="form-input">
                                                                                        <input type="text" name="masothue">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        Tỉnh Thành
                                                                        </label>
                                                                        <div class="form-item_control">
                                                                            <div class="form-item_content">
                                                                                <div class="formable-renderer">
                                                                                    <div class="form-input">
                                                                                        <input type="text" name="tinhthanh" required>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        Xã Phường
                                                                        </label>
                                                                        <div class="form-item_control">
                                                                            <div class="form-item_content">
                                                                                <div class="formable-renderer">
                                                                                    <div class="form-input">
                                                                                        <input type="text" name="xaphuong" required>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        Quận Huyện
                                                                        </label>
                                                                        <div class="form-item_control">
                                                                            <div class="form-item_content">
                                                                                <div class="formable-renderer">
                                                                                    <div class="form-input">
                                                                                        <input type="text" name="quanhuyen" required>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        Số Nhà
                                                                        </label>
                                                                        <div class="form-item_control">
                                                                            <div class="form-item_content">
                                                                                <div class="formable-renderer">
                                                                                    <div class="form-input">
                                                                                        <input type="text" name="sonha" required>
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
        </div>

    </body>
</html>
