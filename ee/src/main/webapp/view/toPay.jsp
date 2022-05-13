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
    <title>Оплата</title>
    <link rel="stylesheet" href="../boostrap/http_cdn.jsdelivr.net_npm_bootstrap@5.1.3_dist_css_bootstrap.css">
    <link rel="stylesheet" href="../css/main_style.css">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/18ac87942d.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="container toPay">

    <form method="post" action="${pageContext.request.contextPath}?where=toPaySuccess" class="row g-3">
        <div class="card-header font-weight-bold text-center">
            Оплата товара
        </div>
        <div class="col-12">
            <label for="creditCardNum" class="form-label">Номер карты</label>
            <input type="text" minlength="16" maxlength="16" class="form-control" id="creditCardNum" name="creditCardNum" placeholder="0000 0000 0000 0000" required>
        </div>
        <div class="col-md-6">
            <label for="creditCardName" class="form-label">Имя</label>
            <input type="text" minlength="3" maxlength="10" class="form-control" id="creditCardName" name="creditCardName" placeholder="Иван" required>
        </div>
        <div class="col-md-6">
            <label for="creditCardDate" class="form-label">Действует до</label>
            <input type="text" minlength="5" maxlength="5" class="form-control" id="creditCardDate" name="creditCardDate" placeholder="12/22" required>
        </div>
        <div class="col-12 container text-center">
            <button type="submit" class="btn btn-primary">Подтвердить</button>
        </div>
        <div class="mb-3 text-center">
            <a href="${pageContext.request.contextPath}?where=home" style="text-decoration: none">Вернуться на главную страницу</a>
        </div>
    </form>
</div>
</body>
</html>
