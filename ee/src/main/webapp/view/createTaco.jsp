<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="../boostrap/http_cdn.jsdelivr.net_npm_bootstrap@5.1.3_dist_css_bootstrap.css">
    <link rel="stylesheet" href="../css/main_style.css">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/18ac87942d.js" crossorigin="anonymous"></script>
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="container">
    <form method="post" action="${pageContext.request.contextPath}?where=createTacoCheck">
        <div class="row">
            <%-- Выводит список ингредиетов в виде карточек --%>
            <c:forEach items="${ingredients}" var="list">
                <div class="col-lg-3 col-sm-6">
                    <div class="product-card">
                        <div class="product-img">
                            <img src="../img/ingredients/${list.getId()}.png" class="card-img-top" alt="${list.getName()}">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title text-center">${list.getName()}</h5>
                            <div style="text-align: right">
                                <span class="ruble">${list.getPrice()}</span>
                                <label for="${list.getId()}">
                                    <input type="checkbox" name="${list.getId()}" id="${list.getId()}" class="custom-checkbox" value="${list.getPrice()}">
                                    <div class="cart-plus"><i class="fa-solid fa-cart-plus"></i></div>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="container text-center">
            <button type="submit" class="btn btn-primary">
                <i class="fa-solid fa-cart-arrow-down"></i>
            </button>
        </div>
    </form>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
