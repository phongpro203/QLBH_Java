<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./assets/css/base.css"/>
        <title>Giải phương trình bậc 2</title>
    </head>
    <style>
        body {
            background-color: var(--primary--color--);
        }
    </style>
    <body>
        <%
            String kq = "";

            if (request.getParameter("a") != null && request.getParameter("b") != null && request.getParameter("c") != null) {
                try {
                    int a = Integer.parseInt(request.getParameter("a"));
                    int b = Integer.parseInt(request.getParameter("b"));
                    int c = Integer.parseInt(request.getParameter("c"));

                    if (a == 0) {
                        kq = "Đây không phải là phương trình bậc hai.";
                    } else {
                        double delta = b * b - 4 * a * c;

                        if (delta > 0) {
                            double x1 = (-b + Math.sqrt(delta)) / (2 * a);
                            double x2 = (-b - Math.sqrt(delta)) / (2 * a);
                            kq = "Phương trình có hai nghiệm phân biệt: x1 = " + x1 + "; x2 = " + x2;
                        } else if (delta == 0) {
                            double x = -b / (2 * a);
                            kq = "Phương trình có nghiệm kép: " + x;
                        } else {
                            kq = "Phương trình vô nghiệm.";
                        }
                    }
                } catch (NumberFormatException e) {
                    kq = "Lỗi: Vui lòng nhập đúng định dạng số.";
                }
            }
        %>

        <form action="index.jsp" method="GET">
            <label>Nhập a: </label>
            <input type="number" name="a" value="" required/> <br/> <br/>
            
            <label>Nhập b: </label>
            <input type="number" name="b" value="" required/> <br/><br/>
            
            <label>Nhập c: </label>
            <input type="number" name="c" value="" required/> <br/><br/>
            
            <input type="submit" value="Tính"/> <br/><br/>
            
            <label>Kết quả: </label>
            
            <p><%=kq%></p>
        </form>
    </body>
</html>
