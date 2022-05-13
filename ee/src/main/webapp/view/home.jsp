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
    <div class="row">
        <div class="col-xl-4 col-sm-12">
            <h4>Быстро</h4>
            Не нужно долго ждать своего заказа, всего пять минут и он готов.
        </div>
        <div class="col-xl-4 col-sm-12">
            <h4>Рестораны</h4>
            В одной только Москве работают более 30 наших ресторанов, а в области и того больше
        </div>
        <div class="col-xl-4 col-sm-12">
            <h4>Нас любят</h4>
            В течение 10 лет мы работали в поте лица, чтобы удовлетворить все потребности наших клиентов, и мы не собираемся останавливаться на этом.
        </div>
    </div>

    <div class="my-carousel">
    </div>
    <div id="carouselExampleIndicators" class="carousel slide carousel-fade carousel-dark" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="../img/taco/1.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="../img/taco/2.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="../img/taco/3.png" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Предыдущий</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Следующий</span>
        </button>
    </div>

    <div class="row">
        <div class="col-xl-4 col-sm-12">
            <h4>О тако</h4>
            Тако - традиционное блюдо мексиканской кухни.
        </div>
        <div class="col-xl-4 col-sm-12">
            <h4>Ингредиенты</h4>
            Говядина, свинина, курица, морепродукты, чоризо, пережаренные бобы, овощи, сыр, лук, сальса, гуакамоле.
        </div>
        <div class="col-xl-4 col-sm-12">
            <h4>Наши повара</h4>
            Квалифицированные специалисты с десятилетним стажем работы в сфере.
        </div>
    </div>

</div>

<jsp:include page="footer.jsp" />

</body>
</html>
