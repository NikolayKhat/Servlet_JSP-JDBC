<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: nnkha
  Date: 21.04.2022
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Корзина</title>
    <link rel="stylesheet" href="../css/main_style.css">
    <link rel="stylesheet" href="../boostrap/http_cdn.jsdelivr.net_npm_bootstrap@5.1.3_dist_css_bootstrap.css">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/18ac87942d.js" crossorigin="anonymous"></script>
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="container cart">
    <div class="row">
        <%-- Список созданных тако --%>
        <c:forEach items="${listTacoId}" var="id" >
            <div class="col-lg-12">
                <div class="card">
                    <h5 class="card-header">
                        Тако ${id}: <span class="ruble">${listTacoPrice[id - 1]}</span>
                        <a href="${pageContext.request.contextPath}?where=deleteTaco&id=${id}" class="link-danger" style="text-decoration: none; float: right"><i class="fa-solid fa-rectangle-xmark"></i></a>
                    </h5>
                    <div class="card-body">
                        <p class="card-text">
                            Ингредиенты: ${listTacoIngredients[id - 1]}
                        </p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="text-center">
        <c:choose>
            <c:when test="${listTacoPriceAll == 0}">
                <h4 style="padding-top: 50px">Корзина пуста!</h4>
                <a href="${pageContext.request.contextPath}?where=createTaco" class="btn btn-primary btn-sm">Вернуться к созданию тако</a>
            </c:when>
            <c:otherwise>
                <h4>Итоговая сумма: ${listTacoPriceAll}</h4>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}?where=toPay">Оплатить</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
