<%-- 
    Document   : delivery
    Created on : Nov 18, 2024, 2:14:33 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/base.css" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
            integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
    <title>Giao hàng</title>
  </head>
  <style>
    .app-container {
      background-color: rgba(0, 0, 0, 0.05);
    }
    .app__content {
        margin-top: 20px;
        min-height: 100vh;
        border-radius: 2px;
        color: #333;
    }
    .product {
      background-color: white;
      padding: 10px;
      margin-bottom: 10px;
    }
    .product__content {
      display: flex;
    }
    .product__img {
      padding-top: 100%;
      background-repeat: no-repeat;
      background-size: cover;
      background-position: center;
    }
    .product__content-title {
      font-size: 2.6rem;
      padding-left: 10px;
      line-height: 2.5rem;
    }
    .product__content__quantity,
    .product__content__status {
      padding-left: 10px;
      padding-top: 5px;
      font-size: 1.3rem;
    }
    .product__price {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-left: auto;
      font-size: 1.6rem;
      width: 100px;
    }
    .price__css {
      color: red;
    }
    .report {
    }
    .price {
      width: 100%;
      font-size: 1.6rem;
      text-align: right;
      padding: 10px;
    }
    .price__css {
    }
    .report__box {
      margin-right: 30px;
    }
    .report__box-text {
      display: block;
      width: 100%;
      height: 100px;
      padding: 10px;
      font-size: 2rem;
    }
    .form {
      width: 100%;
      display: flex;
      justify-content: flex-end;
    }
    .btn {
      background-color: var(--primary--color--);
      color: white;
      height: 36px;
      border-radius: 2px;
      border: none;
      cursor: pointer;
      display: inline-flex;
      justify-content: center;
      align-items: center;
      font-size: 1.5rem;
      margin: 10px;
      min-width: 142px;
    }
    .btn__showbox {
      margin-right: 40px;
    }
  </style>
  <body>
    <div class="app-container">
        <%@include file="Header.jsp" %>
      <div class="grid app__content">
        <h1 style="color: grey; font-weight: 300;">DANH SÁCH ĐƠN HÀNG ĐẶT MUA:</h1>
        <div class="product">
          <div
            style="
              border-bottom: 1px solid rgb(196, 196, 196);
              margin-bottom: 20px;
              margin-right: 30px;
            "
            class="alo"
          >
            <div class="product__content">
              <div style="width: 100px">
                <div
                  style="
                    background-image: url('https://gamelandvn.com/wp-content/uploads/anh/2022/11/nahida-genshin-impact-thumbnail.webp');
                  "
                  class="product__img"
                ></div>
              </div>
              <div class="product__detail">
                <div class="product__content-title">Card màn hình bala</div>
                <div class="product__content__quantity">x1</div>
                <div class="product__content__status">
                  Trạng thái: <span class="status__text">Giao thành công</span>
                </div>
              </div>
              <div class="product__price">
                <span class="price__css">9,000đ</span>
              </div>
            </div>
            <div class="price">
              Thành tiền: <span class="price__css">100.000đ</span>
            </div>
          </div>
          <div class="report">
              <c:if test="${param.isFeedback == 'true'}">
                  <div class="report__box">
              <form action="">
                <textarea
                  name="report"
                  id=""
                  class="report__box-text"
                ></textarea>
                <br />
                <div class="form">
                  <button class="btn report__box-btn">Gửi phản hồi</button>
                </div>
              </form>
            </div>
              </c:if>
            <div class="form" action="">
                <a style="text-decoration: none;" class="btn btn__showbox" href="${pageContext.request.contextPath}/View/delivery.jsp?isFeedback=true">Phản hồi</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
