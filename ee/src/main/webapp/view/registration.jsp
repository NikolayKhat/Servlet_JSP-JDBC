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
    <title>Регистрация</title>
    <link rel="stylesheet" href="../boostrap/http_cdn.jsdelivr.net_npm_bootstrap@5.1.3_dist_css_bootstrap.css">
    <link rel="stylesheet" href="../css/main_style.css">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/18ac87942d.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <div class="registration">
        <form method="post" action="${pageContext.request.contextPath}?where=registrationCheck">
            <div class="mb-3">
                <label for="loginRegistration" class="form-label requiredNotification">Логин</label>
                <input type="text" class="form-control" id="loginRegistration" placeholder="Придумайте логин" name="loginRegistration" required>
            </div>
            <div class="mb-3">
                <label for="passwordRegistration" class="form-label requiredNotification">Пароль</label>
                <input type="password" class="form-control" id="passwordRegistration" placeholder="Придумайте пароль" name="passwordRegistration" required>
            </div>
            <div class="mb-3">
                <label for="passwordReRegistration" class="form-label requiredNotification">Повторите пароль</label>
                <input type="password" class="form-control" id="passwordReRegistration" placeholder="Подтвердите пароль" name="passwordReRegistration" required>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Зарегистрироваться</button>
            </div>
            <div class="mb-3 text-center">
                <a href="${pageContext.request.contextPath}?where=home" style="text-decoration: none">Вернуться на главную страницу</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
