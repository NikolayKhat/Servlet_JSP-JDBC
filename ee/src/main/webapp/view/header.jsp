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
            <c:choose>
                <c:when test="${loginCheck != null}">
                    <jsp:include page="headerLogOut.jsp" />
                </c:when>
                <c:otherwise>
                    <jsp:include page="headerLogIn.jsp" />
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>
