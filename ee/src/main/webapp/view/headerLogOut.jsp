<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
    <li class="nav-item dropdown">
        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa-regular fa-user"></i></a>
        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a href="${pageContext.request.contextPath}?where=logoutCheck" class="dropdown-item">Выход</a></li>
        </ul>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}?where=cart" class="nav-link"><i class="fa-solid fa-cart-shopping"></i></a>
    </li>
</ul>