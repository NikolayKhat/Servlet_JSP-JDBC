<%--
  Created by IntelliJ IDEA.
  User: nnkha
  Date: 20.04.2022
  Time: 3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Авторизация</title>
    <link rel="stylesheet" href="../boostrap/http_cdn.jsdelivr.net_npm_bootstrap@5.1.3_dist_css_bootstrap.css">
    <link rel="stylesheet" href="../css/main_style.css">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/18ac87942d.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <div class="login">
        <form method="post" action="${pageContext.request.contextPath}?where=loginCheck">
            <div class="card-header font-weight-bold text-center">
                Авторизация
            </div>
            <div class="mb-3">
                <label for="userNameLogin" class="form-label requiredNotification">Логин</label>
                <input type="test" class="form-control" id="userNameLogin" name="userNameLogin" placeholder="Введите логин" required>
            </div>
            <div class="mb-3">
                <label for="passwordLogin" class="form-label requiredNotification">Пароль</label>
                <input type="password" class="form-control" id="passwordLogin" name="passwordLogin" placeholder="Введите пароль" required>
            </div>
            <div class="container row mb-3">
<%--                <div class="col-sm-6 form-check">--%>
<%--                    <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                    <label class="form-check-label" for="exampleCheck1">Запомнить меня</label>--%>
<%--                </div>--%>
                <div class="col-sm-6">
                    <a href="${pageContext.request.contextPath}?where=registration" style="text-decoration: none">Зарегистрироваться</a>
                </div>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Войти</button>
            </div>
            <div class="mb-3 text-center">
                <a href="${pageContext.request.contextPath}?where=home" style="text-decoration: none">Вернуться на главную страницу</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
