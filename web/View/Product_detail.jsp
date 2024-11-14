<%-- 
    Document   : Product_detail
    Created on : Nov 13, 2024, 10:22:56 PM
    Author     : Admin
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="Model.Goods"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/base.css" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
            integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <title>Chi tiết sản phẩm</title>
    </head>
<style>
    .app-content {
      margin-top: 20px;
      min-height: 100vh;
    }
    .home-product__img {
      padding-top: 100%;
      background-repeat: no-repeat;
      background-size: cover;
      background-position: center;
    }

    .product-detail,
    .product-img {
      padding: 20px;
    }
    html {
      background-color: rgba(0, 0, 0, 0.05);
    }

    .app {
      background-color: var(--white-color--);
    }

    .product-name {
      font-size: 2rem;
      line-height: 24px;
      font-weight: 500;
    }

    .product-price-box {
      background-color: rgba(0, 0, 0, 0.05);
      padding: 20px;
      margin-top: 10px;
    }

    .product-price {
      color: #ee4d2d;
      font-size: 3rem;
      font-weight: 500;
      line-height: 3rem;
    }

    .product-title {
      color: grey;
    }
    .product__detail {
      font-size: 1.6rem;
      margin-top: 20px;
      line-height: 2rem;
    }
    .product-quality {
      font-size: 1.6rem;
      margin-top: 20px;
      line-height: 2rem;
    }
    .product--quality-input {
      outline: none;
      margin-left: 10px;
      width: 100px;
    }
    .product-buy {
      margin-top: 20px;
    }
    .product-buy-button {
      font-size: 2rem;
      color: white;
      border: none;
      background-color: var(--primary--color--);
      padding: 10px 20px;
      cursor: pointer;
    }
    .product-buy-button:hover {
      opacity: 0.9;
    }
    
    .product-shop {
      text-decoration: none;
      color: #333;
      display: block;
      border: 1px solid rgb(147, 147, 147);
      display: inline-flex;
      padding: 10px 20px;
      cursor: pointer;
      margin-left: 10px;
    }
  </style>
  <body>
    <div class="app-container">
        <%@ include file="Header.jsp" %>
      <div class="grid app">
          <%
              Goods goods = (Goods) request.getAttribute("goods");
                  int gia = (int) (goods.getGia() - (goods.getGia() * (double) goods.getGiamGia()) / 100);
                  NumberFormat currencyFormat = NumberFormat.getInstance(new Locale("vi", "VN"));
                  String formattedGia = currencyFormat.format(gia);
          %>
          <!--Ảnh-->
        <div class="grid__row app-content">
          <div class="grid__column-4 product-img">
            <div
                style="background-image: url('${pageContext.request.contextPath}/assets/image/<%= goods.getHinhanh()%>');"
              class="home-product__img"
            ></div>
          </div>
          <div class="grid__column-8 product-detail">
            <div class="product">
              <span class="product-name"><%= goods.getTensp() %> </span>
              <div class="product-price-box">
                <span class="product-price"> <%= formattedGia %>đ</span>
              </div>
              <div class="product__detail">
                  <span class="product-title">Tên cửa hàng: đồ chơi</span> <a class="product-shop" href="${pageContext.request.contextPath}/ViewShop?id=<%= goods.getShopOwnerId() %>">Xem cửa hàng</a>
              </div>
              <div class="product__detail">
                <span class="product-title">Chi tiết sản phẩm:</span>
                <%= goods.getChitiet() %>
              </div>
              <div class="product__detail">
                <span class="product-title">Thể loại:</span>  <%= goods.getChungloai()%>
              </div>
              <form action="" method="post">
                  <div class="product-quality">
                <span class="product-title">Số lượng: </span>
                <input type="number" class="product--quality-input" name="quality"/>
              </div>
              <div class="product-buy">
                <button class="product-buy-button">Mua hàng</button>
              </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
