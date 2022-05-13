<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}?where=home">TACO</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Переключатель навигации">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}?where=home" class="nav-link">Главная</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}?where=createTaco" class="nav-link">Создайте свое тако</a>
                </li>
            </ul>
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                    <c:choose>
                        <%-- Если пользователь вошел в аккаунт, то отображается его login (при нажатии на login отображается кнопка выхода) --%>
                        <c:when test="${loginCheck != null}">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><b>${loginCheck}</b></a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a href="${pageContext.request.contextPath}?where=logoutCheck" class="dropdown-item">Выход</a></li>
                            </ul>
                        </c:when>
                        <%-- Если пользователь не вошел в аккаунт, то отображается иконка "пользователя" (при нажатии на нее появляются кнопки входа и регистрации) --%>
                        <c:otherwise>
                            <a href="" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa-regular fa-user"></i></a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a href="${pageContext.request.contextPath}?where=login" class="dropdown-item">Вход</a></li>
                                <li><a href="${pageContext.request.contextPath}?where=registration" class="dropdown-item">Регистрация</a></li>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}?where=cart" class="nav-link"><i class="fa-solid fa-cart-shopping"></i></a>
                </li>
            </ul>
        </div>
    </div>
</nav>
