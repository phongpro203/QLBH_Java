<%-- 
    Document   : GoodsEdit
    Created on : Nov 20, 2024, 1:45:51 PM
    Author     : kohakuta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Goods"%>
<%@page import="Model.GoodsDB"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    GoodsDB goodsDB = new GoodsDB();
    Goods goods = goodsDB.find(id);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sửa sản phẩm</title>
        <style>
      * {
        box-sizing: border-box;
      }
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 20px;
        background-color: #f0f0f0;
      }
      .form-container {
        background-color: white;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        max-width: 500px;
        margin: auto;
      }
      h2 {
        text-align: center;
      }
      label {
        display: block;
        margin-bottom: 5px;
      }
      input,
      textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
      }
      input[type="submit"] {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px;
        border-radius: 4px;
        cursor: pointer;
        width: 100%;
      }
      input[type="submit"]:hover {
        background-color: #0056b3;
      }
    </style>
    </head>
    <body>
        <div class="form-container">
        <h2>Sửa sản phẩm</h2>
        <form action="${pageContext.request.contextPath}/ShopOwner" method="post">
            <input type="hidden" name="action" value="editGoods">
            <input type="hidden" name="id" value="<%= goods.getId() %>">
            <label for="tensp">Tên sản phẩm:</label><br>
            <input type="text" id="tensp" name="tensp" value="<%= goods.getTensp() %>" required><br>
            <label for="chungloai">Chủng loại:</label><br>
            <input type="text" id="chungloai" name="chungloai" value="<%= goods.getChungloai() %>" required><br>
            <label for="chitiet">Chi tiết:</label><br>
            <textarea id="chitiet" name="chitiet" required><%= goods.getChitiet() %></textarea><br>
            <label for="gia">Giá:</label><br>
            <input type="number" id="gia" name="gia" value="<%= goods.getGia() %>" required><br>
            <label for="soluong">Số lượng:</label><br>
            <input type="number" id="soluong" name="soluong" value="<%= goods.getSoluong() %>" required><br>
            <label for="hinhanh">Hình ảnh:</label><br>
            <input type="file" id="hinhanh" name="hinhanh" value="<%= goods.getHinhanh() %>" accept="image/*" required><br>
            <label for="giamGia">Giảm giá (%):</label><br>
            <input type="number" id="giamGia" name="giamGia" value="<%= goods.getGiamGia() %>" required><br><br>
            <input type="submit" value="Sửa sản phẩm" />
        </form>
        </div>
    </body>
</html>
