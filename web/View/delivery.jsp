<%-- 
    Document   : delivery
    Created on : Nov 18, 2024, 2:14:33 PM
    Author     : Admin
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="Model.GoodsDB"%>
<%@page import="Model.Order"%>
<%@page import="Model.Goods"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Locale"%>
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
    .status__text {
      color: #26aa99;
    }
  </style>
  <body>
      <div class="app-container">
          <%@include file="Header.jsp" %>
          <div class="grid app__content">
              <h1 style="color: grey; font-weight: 300;">DANH SÁCH ĐƠN HÀNG ĐẶT MUA:</h1>
              <%
                  List<Order> orderList = (List<Order>) request.getAttribute("orderList");
                  Collections.sort(orderList, new Comparator<Order>() {
                      @Override
                      public int compare(Order o1, Order o2) {
                          List<String> priority = Arrays.asList("Chờ giao hàng","Đang giao hàng", "Đã giao", "Đã đánh giá");
                          return Integer.compare(priority.indexOf(o1.getTinhTrang()), priority.indexOf(o2.getTinhTrang()));
                      }
                  });

                  if (orderList != null) {
                      for (Order order : orderList) {
                          GoodsDB goodsDB = new GoodsDB();
                          Goods goods = goodsDB.find(order.getGoodsId());
                          int gia = (int) (goods.getGia() - (goods.getGia() * (double) goods.getGiamGia()) / 100);
                          int sl = order.getThanhTien() / gia;
              %>
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
                    background-image: url('${pageContext.request.contextPath}/assets/image/<%= goods.getHinhanh() %>');
                  "
                  class="product__img"
                ></div>
              </div>
              <div class="product__detail">
                  <div class="product__content-title"><%= goods.getTensp() %></div>
                <div class="product__content__quantity">x<%= sl %></div>
                <div class="product__content__status">
                    Trạng thái: <span class="status__text"><%= order.getTinhTrang() %></span>
                </div>
              </div>
              <%
                  NumberFormat currencyFormat = NumberFormat.getInstance(new Locale("vi", "VN"));
                  String formattedGia = currencyFormat.format(gia);
                  String formattedtt = currencyFormat.format(order.getThanhTien());
              %>
              <div class="product__price">
                  <span class="price__css"><%= formattedGia%>đ</span>
              </div>
            </div>
            <div class="price">
              Thành tiền: <span class="price__css"><%=formattedtt  %>đ</span>
            </div>
          </div>
          <%
              if("Đã giao".equals(order.getTinhTrang()))
              {
          %>
          <div class="report">
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
          </div>
          <%
              }
          %>
              </div>
              <%
                                    }
                                } else {
                                %>
                                <h1>Không có sản phẩm nào</h1>
                                <% }%>
      </div>
    </div>
  </body>
</html>
