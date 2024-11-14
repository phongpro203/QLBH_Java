<%-- 
    Document   : Header
    Created on : Nov 12, 2024, 6:07:49 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<style>
    /*Header*/
.header {
  height: 120px;
  background-image: linear-gradient(0, #3f323c, var(--primary--color--));
}
.header__navbar {
  display: flex;
  justify-content: space-between;
}
.header__navbar-list {
  list-style: none;
  padding-left: 0;
  margin-top: 4px 0 0 0;
}
.header__navbar-item {
  margin: 0 8px;
  display: inline-block;
  position: relative;
}
.header__navbar-item--hasqr:hover .header__qr {
  display: block;
  animation: fadein ease-in 0.2s forwards;
  transform-origin: top left;
}

.header__navbar-item--has_notify:hover .header__notify {
  display: block;
  z-index: 1;
}

.header__navbar-item--has_notify::after {
  content: "";
  display: block;
  position: absolute;
  width: 100%;
  height: 20px;
  top: 80%;
  cursor: default;
}

.header__navbar-item,
.header__navbar-item-link {
  font-size: 1.5rem;
  color: var(--white-color--);
  text-decoration: none;
  font-weight: 300;
}
.header__navbar-item,
.header__navbar-item-link,
.header__navbar-icon-link {
  display: inline-flex;
  align-items: center;
}
.header__navbar-item:hover,
.header__navbar-item-link:hover,
.header__navbar-icon-link:hover {
  color: rgba(255, 255, 255, 0.8);
  cursor: pointer;
}
.header__navbar-item--bold {
  font-weight: 450;
}
.header__navbar-item--separate::after {
  content: "";
  display: block;
  position: absolute;
  width: 1px;
  height: 14px;
  background-color: #dadada;
  right: -8px;
  top: 50%;
  transform: translateY(-50%);
}
.header__navbar-icon-link {
  color: var(--white-color--);
  text-decoration: none;
}
.header__navbar-icon {
  font-size: 1.8rem;
  margin: 0 4px;
}
.header__navbar-title--nopoiter {
  cursor: text;
  color: var(--white-color--);
}

/*Header notification*/
.header__notify {
  position: absolute;
  top: 115%;
  width: 400px;
  background-color: var(--white-color--);
  right: 0;
  border: 1px solid #d3d3d3;
  cursor: default;
  animation: fadein ease-in 0.2s;
  transform-origin: 90% top;
  margin-top: 10px;
  display: none;
  z-index: 1;
  border-radius: 2px;
  box-shadow: 0 1px 3.125rem 0 rgba(0, 0, 0, 0.2);
}
.header__notify-header {
  background-color: var(--white-color--);
}
.header__notify-header h3 {
  color: #8b8989;
  margin: 0 0 0 12px;
  font-weight: 400;
  font-size: 1.4rem;
  line-height: 40px;
  cursor: text;
}
.header__notify-list {
  padding-left: 0;
}
.header__notify-item {
  list-style: none;
}

.header__notify-link:hover {
  background-color: #c9c9c9;
}

.header__notify-link {
  text-decoration: none;
  padding: 12px;
  display: flex;
  background-color: rgba(184, 33, 33, 0.07);
}
.header__notify-img {
  width: 48px;
}
.header__notify-info {
  margin-left: 12px;
}
.header__notify-name {
  display: block;
  font-size: 14px;
  color: var(--black-color--);
  margin-bottom: 4px;
  font-weight: 400;
}
.header__notify-decription {
  font-size: 12px;
  color: rgb(60, 60, 60);
  line-height: 1.4rem;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
  overflow: hidden;
}

.header__notify-footer {
  display: flex;
}

.header__notify-btn {
  text-decoration: none;
  padding: 10px;
  color: var(--text--color--);
  margin: auto;
  font-weight: 400;
}
.header__notify::before {
  content: "";
  position: absolute;
  border-style: solid;
  border-width: 10px 17px;
  top: -19px;
  right: 25px;
  border-color: transparent transparent var(--white-color--) transparent;
}
.header-with-search {
  height: 85px;
  display: flex;
  align-items: center;
  padding: 0 7px;
  margin-top: -10px;
}
.header__logo {
  width: 200px;
  margin-bottom: 20px;
}
.header__logo-img {
  width: 150px;
  fill: var(--white-color--);
}
.header__search {
  flex: 1;
  height: 40px;
  background-color: var(--white-color--);
  border-radius: 2px;
  display: flex;
  align-items: center;
}
.header__cart {
  width: 150px;
  text-align: center;
  margin-top: 10px;
  position: relative;
}
.header__cart::after {
  content: "";
  display: block;
  width: 15%;
  height: 10px;
  position: absolute;
  top: 99%;
  right: 50%;
  transform: translateX(50%);
}
.header__cart-hover {
  display: inline-block;
  padding: 0 8px;
  cursor: pointer;
}
.header__cart-hover:hover .header__cart-list {
  display: block;
}
.header__cart-list {
  position: absolute;
  z-index: 1;
  right: 55px;
  top: 120%;
  box-shadow: 0 1px 3.125rem 0 rgba(0, 0, 0, 0.2);
  width: 400px;
  background-color: var(--white-color--);
  border-radius: 2px;
  display: none;
  cursor: default;
  animation: fadein ease-in 0.2s forwards;
  transform-origin: 97% top;
}
.header__cart-list::after {
  content: "";
  display: block;
  border-width: 10px;
  top: -19px;
  right: 9px;
  border-style: solid;
  border-color: transparent transparent var(--white-color--) transparent;
  position: absolute;
  cursor: pointer;
}
.header__cart-list-img {
  width: 60%;
}
.header__cart-list p {
  font-size: 1.3rem;
}
.no-cart {
  padding: 20px 0;
}
.header__cart-icon {
  color: var(--white-color--);
  font-size: 2.3rem;
  display: block;
}
.logo {
  color: white;
  font-size: 60px;
}
.text-logo {
  color: white;
  font-size: 40px;
  margin-left: 10px;
  margin-bottom: 30px;
}
.header__search-input {
  border: none;
  height: 100%;
  padding-left: 16px;
  font-size: 1.4rem;
  border-radius: 2px;
  outline: none;
  width: 100%;
}
.header__search-input-warp {
  flex: 1;
  position: relative;
  height: 100%;
}
/*history search*/
.header__search-input:focus ~ .header__search-history {
  display: block;
}
.header__search-history {
  position: absolute;
  background-color: var(--white-color--);
  top: 106%;
  left: 0;
  right: 0;
  box-shadow: 0 0 1px;
  border-radius: 1px;
  display: none;
  z-index: 1;
}
.header__search-history-heading {
  font-size: 1.4rem;
  font-weight: 300;
  color: #a3a3a3;
  padding-left: 16px;
}
.header__search-history-list {
  padding: 0;
  margin: 0;
}
.header__search-history-item {
  list-style: none;
  text-decoration: none;
  color: var(--text--color--);
  font-weight: 650;
  font-size: 1.2rem;
  padding-left: 16px;
  padding-bottom: 8px;
  padding-top: 8px;
}
.header__search-history-item-link {
  text-decoration: none;
  display: block;
  color: var(--text--color--);
  font-weight: 530;
  font-size: 1.4rem;
}
.header__search-history-item:hover {
  background-color: #cdcdcd;
}
.header__search-selection {
  border-left: 1px solid #c8c8c8;
  padding-left: 16px;
  display: flex;
  align-items: center;
  position: relative;
  cursor: pointer;
}
.header__search-selection::after {
  content: "";
  width: 100%;
  position: absolute;
  display: block;
  top: 100%;
  left: 0;
  height: 15px;
}
.header__search-selection:hover .header__search-option {
  display: block;
}
.header__search-selection-label {
  font-size: 1.3rem;
  color: var(--text--color--);
}

.header__search-selection-icon {
  font-size: 1.1rem;
  color: #4a4a4a;
  margin: 0 15px;
  position: relative;
  top: 0px;
}
.header__search-btn {
  background-color: var(--primary--color--);
  border: none;
  height: 36px;
  border-radius: 2px;
  margin-right: 2px;
}
.header__search-btn-icon {
  color: var(--white-color--);
  padding: 0 25px;
}
.header__search-btn:hover {
  background-color: rgb(60, 14, 60);
  cursor: pointer;
}
.header__search-option {
  position: absolute;
  top: 105%;
  left: 0;
  right: 0;
  background-color: var(--white-color--);
  list-style: none;
  padding: 10px;
  font-size: 1.4rem;
  border-radius: 2px;
  display: none;
  box-shadow: 0 0 3px #ccc;
}
.header__search-option:hover {
  background-color: #b7b7b7;
}
.header__search-option-item-icon {
  color: var(--primary--color--);
  margin-left: 10px;
}
</style>
<header class="header">
            <div class="grid">
              <nav class="header__navbar">
                <ul class="header__navbar-list">
                  <li
                    class="header__navbar-item header__navbar-item--hasqr header__navbar-item--separate"
                  >
                      Vào cửa hàng trên ứng dụng
                  </li>
                  <li class="header__navbar-item">
                    <span class="header__navbar-title--nopoiter">Kết nối</span>
                    <a href="" class="header__navbar-icon-link">
                      <i class="header__navbar-icon fa-brands fa-facebook"></i>
                    </a>
                    <a href="" class="header__navbar-icon-link">
                      <i class="header__navbar-icon fa-brands fa-instagram"></i>
                    </a>
                  </li>
                </ul>
    
                 <!-- Nếu chưa đăng nhập -->
    <c:if test="${sessionScope.username == null}">
        <ul class="header__navbar-list">
            <li class="header__navbar-item header__navbar-item--has_notify">
                <i class="fa fa-sign-in" aria-hidden="true"></i>
            </li>
            <li class="header__navbar-item header__navbar-item--bold header__navbar-item--separate">
                <a style="    text-decoration: none; color: white;" href="View/signup_form.jsp" target="target">Đăng ký</a>
            </li>
            <li class="header__navbar-item header__navbar-item--bold">
                <a style="    text-decoration: none; color: white;" href="View/login_form.jsp" target="target">Đăng nhập</a>
            </li>
        </ul>
    </c:if>

                 <!-- Nếu đã đăng nhập -->
                 <c:if test="${sessionScope.username != null}">
                     <ul class="header__navbar-list">
                         <li class="header__navbar-item header__navbar-item--bold header__navbar-item--separate">
                             Xin chào, ${sessionScope.username}
            </li>
            <li class="header__navbar-item header__navbar-item--bold ">
                             <form action="${pageContext.request.contextPath}/logout" method="post">
                                 <button style="background-color: transparent; border: none;     margin: 0;" type="submit" class="header__navbar-item header__navbar-item--bold">
                                     Đăng xuất
                                 </button>
                             </form>
            </li>
        </ul>
    </c:if>
              </nav>
    
              <div class="header-with-search">
                <div class="header__logo">
                    <i class="logo fa fa-shopping-bag" aria-hidden="true"></i>
                    <span class="text-logo">Shop</span>
                </div>
                <div class="header__search">
                  <div class="header__search-input-warp">
                    <input
                      type="text"
                      class="header__search-input"
                      placeholder="Tìm kiếm sản phẩm"
                    />
                    
                  </div>
                  <div class="header__search-selection">          
                  </div>
                  <a href="#"><button class="header__search-btn">
                    <i
                      class="header__search-btn-icon fa-solid fa-magnifying-glass"
                    ></i>
                  </button></a>
                </div>
                <div class="header__cart">
                  <a href="#"><div class="header__cart-hover">
                    <i class="header__cart-icon fa fa-truck" aria-hidden="true"></i>
                  </div>
                </div></a>
              </div>
            </div>
          </header>