<%-- 
    Document   : error
    Created on : Feb 17, 2025, 10:02:25 AM
    Author     : Dinh_Hau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/common/layout/layout.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/guest/home.css"/>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
        <style>
            body {
                font-family: Arial, sans-serif;
                text-align: center;
                background-color: #f8f8f8;
                margin: 0;
                padding: 0;
            }

            .error_section {
                display: flex;
                justify-content: center;
                align-items: center; /* Căn giữa theo chiều dọc */
                min-height: calc(100vh - 200px); /* Giảm chiều cao để không chiếm toàn bộ màn hình */
                padding: 50px 0; /* Tạo khoảng cách với header và footer */
            }


            .error_form {
                background: #fff;
                padding: 50px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .error_form h1 {
                font-size: 120px;
                color: #2d336b;
                margin: 0;
            }

            .error_form h2 {
                font-size: 24px;
                color: #333;
                margin: 20px 0;
                font-weight: bold;
            }

            .error_form p {
                font-size: 16px;
                color: #777;
                margin-bottom: 30px;
            }

            .error_form a {
                display: inline-block;
                text-decoration: none;
                background: #2d336b;
                color: #fff;
                padding: 12px 30px;
                border-radius: 25px;
                font-size: 16px;
                font-weight: bold;
                transition: 0.3s;
            }

            .error_form a:hover {
                background: #138f9c;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../common/layout/header.jsp"></jsp:include>
            <div>
                <div class="error_section">
                    <div class="row">
                        <div class="col-12">
                            <div class="error_form">
                                <h1>404</h1>
                                <h2>Opps! PAGE NOT BE FOUND</h2>
                                <p>Sorry but the page you are looking for does not exist, have been<br> removed, name changed or is temporarity unavailable.</p>
                                <a href="home">Back to home page</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <jsp:include page="../common/layout/footer.jsp"></jsp:include>
    </body>
</html>
