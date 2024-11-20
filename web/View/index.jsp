<%-- 
    Document   : index
    Created on : Nov 7, 2024, 10:19:27 PM
    Author     : Admin
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Locale"%>
<%@page import="Model.Goods"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <title>Web bán hàng</title>
    </head>
    <style>
        /*Main container*/
        a {
            color: inherit; /* Giữ nguyên màu chữ */
            text-decoration: none; /* Xóa gạch chân */
            display: block; /* Giúp toàn bộ thẻ a bao phủ toàn bộ div bên trong */
        }

        a:hover {
            text-decoration: none; /* Đảm bảo rằng không có gạch chân khi hover */
        }
        .app__content {
            padding-top: 36px;
        }
        .category {
            background-color: var(--white-color--);
            border-radius: 2px;
        }
        .category__heading {
            font-size: 1.7rem;
            color: var(--text--color--);
            padding: 12px 16px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            margin-top: 0;
        }
        .category__heading-icon {
            font-size: 1.4rem;
            margin-right: 4px;
            position: relative;
            top: -1px;
        }
        .category-list {
            padding-left: 0;
            list-style: none;
            padding-bottom: 8px;
            margin-left: 10px;
        }
        .category-item {
            padding: 8px 16px;
        }
        .category-item--active .category-item__link {
            color: var(--primary--color--);
        }
        .category-item--active .category-item__link::before {
            content: "";
            top: 50%;
            transform: translateY(-50%);
            left: -10px;
            position: absolute;
            border: 4px solid;
            border-color: transparent transparent transparent var(--primary--color--);
        }
        .category-item__link {
            position: relative;
            text-decoration: none;
            color: var(--text--color--);
            font-size: 1.6rem;
            font-weight: 5500;
            transition: right linear 0.1s;
            right: 0;
        }
        .category-item__link:hover {
            color: var(--primary--color--);
            right: -4px;
        }
        /*Home + sort*/
        .home-filter {
            display: flex;
            background-color: rgb(0, 0, 0, 0.05);
            align-items: center;
            padding: 12px 22px;
            border-radius: 2px;
        }
        .home-filter__input {
            margin-right: 20px;
            height: 36px;
            padding: 5px;
            padding-left: 10px;
            width: 700px;
        }

        .home-filter__label {
            font-size: 1.4rem;
            color: #555;
            margin-right: 16px;
        }
        .home-filter__btn.btn {
            margin-right: 12px;
            min-width: 100px;
        }
        .home-filter__page {
            display: flex;
            align-items: center;
            margin-left: auto;
        }
        .home-filter__page-num {
            margin-right: 22px;
            font-size: 1.4rem;
        }
        .home-filter__page-num-currunt {
            color: var(--primary--color--);
        }
        .home-filter__page-control {
            border-radius: 2px;
            overflow: hidden;
            display: flex;
            width: 72px;
            height: 36px;
        }
        .home-filter__page-num-btn {
            flex: 1;
            background-color: white;
            display: flex;
            text-decoration: none;
        }
        .home-filter__page-num-btn:first-child {
            border-right: 1px solid #e4e2e2;
        }
        .home-filter__page-num-btn--disible {
            background-color: #f9f9f9;
            cursor: default;
        }
        .home-filter__page-icon--disible {
            color: #d8d5d5;
        }
        .home-filter__page-icon {
            margin: auto;
        }
        .select-input {
            position: relative;
            height: 34px;
            padding: 0 10px;
            min-width: 200px;
            background-color: var(--white-color--);
            display: flex;
            border-radius: 2px;
            align-items: center;
            justify-content: space-between;
        }
        .select-input::after {
            position: absolute;
            content: "";
            height: 100%;
            width: 100%;
            left: 0;
            top: 5%;
        }
        .select-input:hover .select-input__list {
            display: block;
        }
        .select-input__label {
            font-size: 1.4rem;
        }
        .select-input-icon {
            font-size: 1.1rem;
            color: #4a4a4a;
            margin: 0 15px;
            position: relative;
        }
        .select-input__list {
            position: absolute;
            left: 0;
            right: 0;
            top: 100%;
            border-radius: 2px;
            background-color: var(--white-color--);
            top: 26px;
            z-index: 1;
        }
        .select-input__list {
            list-style: none;
            padding: 12px 0;
            display: none;
        }
        .select-input__link {
            text-decoration: none;
            font-size: 1.4rem;
            display: block;
            padding: 6px 14px;
            color: var(--text--color--);
        }
        .select-input__link:hover {
            color: var(--primary--color--);
        }
        /*Product*/
        .home-product {
            margin-bottom: 10px;
        }
        .home-product-item {
            background-color: var(--white-color--);
            margin-top: 10px;
            position: relative;
            border-bottom-left-radius: 2px;
            border-bottom-right-radius: 2px;
            box-shadow: 0 0.1rem 0.2rem rgba(0, 0, 0, 0.1);
            cursor: pointer;

            padding-bottom: 5px;
        }
        .home-product-item:hover {
            box-shadow: 0 0.1rem 0.2rem rgba(0, 0, 0, 0.05);
            transform: translateY(-1px);
            border: 1px solid var(--primary--color--);
        }
        .home-product-item__img {
            padding-top: 100%;
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
        }
        .home-product-item__name {
            font-size: 1.4rem;
            font-weight: 400;
            line-height: 1.8rem;
            height: 36px;
            overflow: hidden;
            margin: 10px 10px 6px;
            display: block;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 2;
        }

        .home-product-item__price {
            display: flex;
            flex-wrap: wrap;

            align-items: baseline;
            justify-content: space-between;
        }

        .home-product-item__price-old {
            font-size: 1.3rem;
            color: #666;
            text-decoration: line-through;
            margin-left: 10px;
        }

        .home-product-item__price-current {
            font-size: 1.5rem;
            color: var(--primary--color--);
            margin-right: 10px;

        }

        .home-product__item-action {
            display: flex;
            justify-content: space-between;
            margin: 6px 10px;
        }

        .home-product-item__heart {
            font-size: 1.3rem;
        }
        i.home-product-item__heart-icon-liked {
            display: none;
            color: rgba(238, 67, 32, 0.97);
        }
        .home-product-item__heart--liked .home-product-item__heart-icon-liked {
            display: inline-block;
        }
        .home-product-item__heart--liked .home-product-item__heart-icon {
            display: none;
        }
        .home-product__item-rate {
            margin-left: auto;
        }
        .home-product-item__slod {
            margin-left: 4px;
        }
        .home-product__item-rate-gold {
            color: #ffd840;
        }
        .home-product-item__origin {
            display: flex;
            justify-content: space-between;
            margin: 0 10px;
            color: #8b8989;
            font-weight: 100;
            font-style: 1.2rem;
        }

        .home-product-item__favourite {
            position: absolute;
            top: 10px;
            left: -4px;
            background-color: var(--primary--color--);
            color: var(--white-color--);
            font-size: 1rem;
            padding-right: 6px;
            border-top-right-radius: 2px;
            border-bottom-right-radius: 2px;
        }
        .home-product-item__favourite i {
            font-size: 0.8rem;
            margin: 0 3px 0 4px;
        }
        .home-product-item__favourite::after {
            content: "";
            position: absolute;
            left: 0;
            bottom: -3px;
            border-top: 4px solid rgb(255, 8, 8);
            border-left: 3px solid transparent;
            filter: brightness(60%);
        }
        .home-product-item__sale-off {
            position: absolute;
            top: 0;
            right: 0;
            height: 40px;
            width: 36px;
            background-color: #ffd840;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .home-product-item__percent {
            color: red;
            font-size: 1.3rem;
            font-weight: 600;
        }
        .home-product-item__sale-off::after {
            content: "";
            position: absolute;
            border-width: 0 18px 6px;
            border-style: solid;
            border-color: #ffd840 #ffd840 transparent #ffd840;
            top: 100%;
        }

    </style>
    <body>
        <div class="app__container">
            <%@ include file="Header.jsp" %>
            <div class="grid">
                <!--Danh mục-->
                <div class="grid__row app__content">
                    <div class="grid__column-2">
                        <nav class="category">
                            <h3 class="category__heading">
                                <i class="category__heading-icon fa-solid fa-list"></i>
                                Danh mục
                            </h3>
                            <ul class="category-list">
                                <li class="category-item">
                                    <a href="" class="category-item__link">Danh sách các mặt hàng</a>
                                </li>
                                <c:if test="${sessionScope.role_id == 3}">
                                    <li class="category-item">
                                        <a href="View/ShopOwnerDashboard.jsp" class="category-item__link">Quản lý bán hàng</a>
                                    </li>
                                </c:if>
                                <c:if test="${sessionScope.role_id == 4}">
                                    <li class="category-item">
                                        <a href="" class="category-item__link">Quản lý giao hàng</a>
                                    </li>
                                </c:if>
                                <c:if test="${sessionScope.role_id == 1}">
                                    <li class="category-item">
                                        <a href="" class="category-item__link">Quản lý tài khoản</a>
                                    </li>
                                </c:if>
                        </nav>
                    </div>

                    <div class="grid__column-10">
                        <div class="home-filter">
                            <span class="home-filter__label">Mua sắm ngay hôm nay, ngập tràn ưu đãi</span>
                        </div>
                        <!--Product-->
                        <div class="home-product">
                            <div class="grid__row">
                                <%
                                    List<Goods> goodsList = (List<Goods>) request.getAttribute("goodsList");
                                    if (goodsList != null) {
                                        for (Goods goods : goodsList) {
                                            int gia = (int) (goods.getGia() - (goods.getGia() * (double) goods.getGiamGia()) / 100);
                                            NumberFormat currencyFormat = NumberFormat.getInstance(new Locale("vi", "VN"));
                                            String formattedGia = currencyFormat.format(gia);
                                            String formattedGiaGoc = currencyFormat.format(goods.getGia());
                                %>
                                <a href="${pageContext.request.contextPath}/ProductDetail?id=<%= goods.getId()%>" class="grid__column-2-4">
                                    <div class="home-product-item">
                                        <div
                                            class="home-product-item__img"
                                            style="background-image: url('${pageContext.request.contextPath}/assets/image/<%= goods.getHinhanh()%>');"
                                            ></div>
                                        <h4 class="home-product-item__name">
                                            <%= goods.getTensp()%>
                                        </h4>
                                        <div class="home-product-item__price">
                                            <span class="home-product-item__price-old">
                                                <%= formattedGiaGoc%>đ
                                            </span>
                                            <span class="home-product-item__price-current">
                                                <%= formattedGia%>đ
                                            </span>
                                        </div>
                                        <div class="home-product__item-action">
                                            <span class="home-product-item__heart home-product-item__heart--liked">
                                                <i class="home-product-item__heart-icon fa-regular fa-heart"></i>
                                                <i class="home-product-item__heart-icon-liked fa-solid fa-heart"></i>
                                            </span>
                                            <div class="home-product__item-rate">
                                                <i class="home-product__item-rate-gold fa fa-star" aria-hidden="true"></i>
                                            </div>
                                            <span class="home-product-item__slod"><%= goods.getSoluong() - 23%> Đã bán</span>
                                        </div>
                                        <div class="home-product-item__origin">
                                            <span class="home-product-item__brand"><%= goods.getChungloai()%></span>
                                            <span class="home-product-item__origin-name">Việt Nam</span>
                                        </div>
                                        <div class="home-product-item__favourite">
                                            <i class="fa-solid fa-check"></i>
                                            Yêu thích
                                        </div>
                                        <div class="home-product-item__sale-off">
                                            <span class="home-product-item__percent"><%= goods.getGiamGia()%>%</span>
                                            <span class="home-product-item__label">GIẢM</span>
                                        </div>
                                    </div>
                                </a>
                                <%
                                    }
                                } else {
                                %>
                                <h1>Không có sản phẩm nào</h1>
                                <% }%>
                                <tr>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
    </body>
</html>
