<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: nnkha
  Date: 20.04.2022
  Time: 2:26
  To change this template use File | Settings | File Templates.
--%>
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
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium aliquam aliquid amet aspernatur, aut dolore ducimus est expedita hic impedit in magni modi molestias obcaecati possimus qui recusandae reiciendis, sapiente!
        </div>
        <div class="col-xl-4 col-sm-12">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium aliquam aliquid amet aspernatur, aut dolore ducimus est expedita hic impedit in magni modi molestias obcaecati possimus qui recusandae reiciendis, sapiente!
        </div>
        <div class="col-xl-4 col-sm-12">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium aliquam aliquid amet aspernatur, aut dolore ducimus est expedita hic impedit in magni modi molestias obcaecati possimus qui recusandae reiciendis, sapiente!
        </div>
    </div>

    <div class="my-carousel">
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
    </div>

    <div class="row">
        <div class="col-xl-4 col-sm-12">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium aliquam aliquid amet aspernatur, aut dolore ducimus est expedita hic impedit in magni modi molestias obcaecati possimus qui recusandae reiciendis, sapiente!
        </div>
        <div class="col-xl-4 col-sm-12">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium aliquam aliquid amet aspernatur, aut dolore ducimus est expedita hic impedit in magni modi molestias obcaecati possimus qui recusandae reiciendis, sapiente!
        </div>
        <div class="col-xl-4 col-sm-12">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium aliquam aliquid amet aspernatur, aut dolore ducimus est expedita hic impedit in magni modi molestias obcaecati possimus qui recusandae reiciendis, sapiente!
        </div>
    </div>

</div>

<jsp:include page="footer.jsp" />

</body>
</html>
