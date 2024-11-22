<%-- 
    Document   : GoodsForm
    Created on : Nov 20, 2024, 11:58:18 AM
    Author     : kohakuta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Thêm sản phẩm</title>
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
        <h2>Thêm sản phẩm</h2>
        <form action="${pageContext.request.contextPath}/ShopOwner" method="post">
            <input type="hidden" name="action" value="addGoods">
            <label for="tensp">Tên sản phẩm:</label><br>
            <input type="text" id="tensp" name="tensp" required><br>
            <label for="chungloai">Chủng loại:</label><br>
            <input type="text" id="chungloai" name="chungloai" required><br>
            <label for="chitiet">Chi tiết:</label><br>
            <textarea id="chitiet" name="chitiet" required></textarea><br>
            <label for="gia">Giá:</label><br>
            <input type="number" id="gia" name="gia" required><br>
            <label for="soluong">Số lượng:</label><br>
            <input type="number" id="soluong" name="soluong" required><br>
            <label for="hinhanh">Hình ảnh:</label><br>
            <input type="file" id="hinhanh" name="hinhanh" accept="image/*" required><br>
            <label for="giamGia">Giảm giá (%):</label><br>
            <input type="number" id="giamGia" name="giamGia" required><br><br>
            <input type="submit" value="Thêm Sản Phẩm" />
        </form>
        </div>
    </body>
</html>

