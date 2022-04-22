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
    <form method="post" action="${pageContext.request.contextPath}?where=createTacoCheck">
        <div class="row">

            <div class="col-lg-3 col-sm-6">
                <div class="product-card">
                    <div class="product-img">
                        <img src="../img/ingredients/tomato.png" class="card-img-top" alt="помидор">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Томаты</h5>
                        <p class="card-text">Самые свежие. Самые вкусные.</p>
                        <div class="price">
                            <span class="ruble">10</span>
                            <label for="ingredients1">
                                <input type="checkbox" name="ingredients1" id="ingredients1" class="custom-checkbox" value="10">
                                <div class="cart-plus"><i class="fa-solid fa-cart-plus"></i></div>
                            </label>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-sm-6">
                <div class="product-card">
                    <div class="product-img">
                        <img src="../img/ingredients/turkey.png" class="card-img-top" alt="индейка">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Индейка</h5>
                        <p class="card-text">---</p>
                        <div class="price">
                            <span class="ruble">20</span>
                            <label for="ingredients2">
                                <input type="checkbox" name="ingredients2" id="ingredients2" class="custom-checkbox" value="20">
                                <div class="cart-plus"><i class="fa-solid fa-cart-plus"></i></div>
                            </label>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-sm-6">
                <div class="product-card">
                    <div class="product-img">
                        <img src="../img/ingredients/tomato.png" class="card-img-top" alt="помидор">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Томаты</h5>
                        <p class="card-text">---</p>
                        <div class="price">
                            <span class="ruble">30</span>
                            <label for="ingredients3">
                                <input type="checkbox" name="ingredients3" id="ingredients3" class="custom-checkbox" value="30">
                                <div class="cart-plus"><i class="fa-solid fa-cart-plus"></i></div>
                            </label>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-sm-6">
                <div class="product-card">
                    <div class="product-img">
                        <img src="../img/ingredients/tomato.png" class="card-img-top" alt="помидор">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Томаты</h5>
                        <p class="card-text">---</p>
                        <div class="price">
                            <span class="ruble">40</span>
                            <label for="ingredients4">
                                <input type="checkbox" name="ingredients4" id="ingredients4" class="custom-checkbox" value="40">
                                <div class="cart-plus"><i class="fa-solid fa-cart-plus"></i></div>
                            </label>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="container text-center cart">
            <button type="submit" class="btn btn-primary">
                <i class="fa-solid fa-cart-arrow-down"></i>
            </button>
        </div>
    </form>

</div>


<jsp:include page="footer.jsp" />

</body>
</html>
