<%--
  Created by IntelliJ IDEA.
  User: nnkha
  Date: 20.04.2022
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Успешная оплата</title>
    <link rel="stylesheet" href="../boostrap/http_cdn.jsdelivr.net_npm_bootstrap@5.1.3_dist_css_bootstrap.css">
    <link rel="stylesheet" href="../css/main_style.css">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/18ac87942d.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="container toPay">
    <div class="card">
        <h5 class="card-header text-center">Просмотр информации</h5>
        <div class="card-body">
            <div class="row">
                <div class="col-6">
                    Номер карты:
                </div>
                <div class="col-6">
                    <%= request.getParameter("creditCardNum") %>
                </div>
                <div class="col-6">
                    Имя:
                </div>
                <div class="col-6">
                    <%= request.getParameter("creditCardName") %>
                </div>
                <div class="col-6">
                    Дата:
                </div>
                <div class="col-6">
                    <%= request.getParameter("creditCardDate") %>
                </div>
                <div class="col-6">
                    Цена:
                </div>
                <div class="col-6">
                    <span class="ruble">${listTacoPriceAll}</span>
                </div>
            </div>
        </div>
        <div class="mb-3 text-center">
            <a href="${pageContext.request.contextPath}?where=home" class="btn btn-primary">OK</a>
        </div>
    </div>

</div>
</body>
</html>
