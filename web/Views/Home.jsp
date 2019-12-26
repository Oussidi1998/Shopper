<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page import="App.Entities.Category" %>
<%@ page import="App.Entities.Produit" %>
<%@ page import="java.util.List" %>

<% List<Category> categories=(List<Category>) request.getAttribute("categories");%>
<% List<Produit> produits=(List<Produit>) request.getAttribute("produits");%>

<%--
  Created by IntelliJ IDEA.
  User: Oussidi_Mohamed
  Date: 21/12/2019
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Shopper</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <style><%@include file="../css/bootstrap.min.css"%></style>
    <!-- Material Design Bootstrap -->
    <style><%@include file="../css/mdb.min.css"%></style>
    <!-- Your custom styles (optional) -->
    <style><%@include file="../css/style.min.css"%></style>
    <style type="text/css">
        html,
        body,
        header,
        .carousel {
            height: 60vh;
        }

        @media (max-width: 740px) {

            html,
            body,
            header,
            .carousel {
                height: 100vh;
            }
        }

        @media (min-width: 800px) and (max-width: 850px) {

            html,
            body,
            header,
            .carousel {
                height: 100vh;
            }
        }

    </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
    <div class="container">

        <!-- Brand -->
        <a class="navbar-brand waves-effect" href="./">
            <strong class="blue-text">Shopper</strong>
        </a>

        <!-- Collapse -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Links -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <!-- Left -->
            <ul class="navbar-nav mr-auto"></ul>

            <!-- Right -->
            <ul class="navbar-nav nav-flex-icons">
                <li class="nav-item">
                    <a href="cart" class="nav-link waves-effect">
                        <span class="badge red z-depth-1 mr-1"> 1 </span>
                        <i class="fas fa-shopping-cart"></i>
                        <span class="clearfix d-none d-sm-inline-block"> Cart </span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link waves-effect">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="https://twitter.com/MDBootstrap" class="nav-link waves-effect" target="_blank">
                        <i class="fab fa-twitter"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link  waves-effect" data-toggle="modal" data-target="#modalLogin">Sign In</a>
                </li>
                <li class="nav-item">
                    <button class="nav-link border border-light rounded waves-effect" data-toggle="modal" data-target="#modalRegister">Register</button>
                </li>
            </ul>

        </div>

    </div>
</nav>
<!-- Navbar -->

<!--Carousel Wrapper-->
<div id="carousel-example-1z" class="carousel slide carousel-fade pt-4" data-ride="carousel">

    <!--Indicators-->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-1z" data-slide-to="1"></li>
        <li data-target="#carousel-example-1z" data-slide-to="2"></li>
    </ol>
    <!--/.Indicators-->

    <!--Slides-->
    <div class="carousel-inner" role="listbox">

        <!--First slide-->
        <div class="carousel-item active">
            <div class="view" style="background-image: url('https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/8-col/img%282%29.jpg'); background-repeat: no-repeat; background-size: cover;">

                <!-- Mask & flexbox options-->
                <div class="mask rgba-black-strong d-flex justify-content-center align-items-center">

                    <!-- Content -->
                    <div class="text-center white-text mx-5 wow fadeIn">
                        <h1 class="mb-4">
                            <strong>Learn Bootstrap 4 with MDB</strong>
                        </h1>

                        <p>
                            <strong>Best & free guide of responsive web design</strong>
                        </p>

                        <p class="mb-4 d-none d-md-block">
                            <strong>The most comprehensive tutorial for the Bootstrap 4. Loved by over 500 000 users. Video and
                                written versions
                                available. Create your own, stunning website.</strong>
                        </p>

                        <a target="_blank" href="https://mdbootstrap.com/education/bootstrap/" class="btn btn-outline-white btn-lg">Start
                            free tutorial
                            <i class="fas fa-graduation-cap ml-2"></i>
                        </a>
                    </div>
                    <!-- Content -->

                </div>
                <!-- Mask & flexbox options-->

            </div>
        </div>
        <!--/First slide-->

        <!--Second slide-->
        <div class="carousel-item">
            <div class="view" style="background-image: url('https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/8-col/img%283%29.jpg'); background-repeat: no-repeat; background-size: cover;">

                <!-- Mask & flexbox options-->
                <div class="mask rgba-black-strong d-flex justify-content-center align-items-center">

                    <!-- Content -->
                    <div class="text-center white-text mx-5 wow fadeIn">
                        <h1 class="mb-4">
                            <strong>Learn Bootstrap 4 with MDB</strong>
                        </h1>

                        <p>
                            <strong>Best & free guide of responsive web design</strong>
                        </p>

                        <p class="mb-4 d-none d-md-block">
                            <strong>The most comprehensive tutorial for the Bootstrap 4. Loved by over 500 000 users. Video and
                                written versions
                                available. Create your own, stunning website.</strong>
                        </p>

                        <a target="_blank" href="https://mdbootstrap.com/education/bootstrap/" class="btn btn-outline-white btn-lg">Start
                            free tutorial
                            <i class="fas fa-graduation-cap ml-2"></i>
                        </a>
                    </div>
                    <!-- Content -->

                </div>
                <!-- Mask & flexbox options-->

            </div>
        </div>
        <!--/Second slide-->

        <!--Third slide-->
        <div class="carousel-item">
            <div class="view" style="background-image: url('https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/8-col/img%285%29.jpg'); background-repeat: no-repeat; background-size: cover;">

                <!-- Mask & flexbox options-->
                <div class="mask rgba-black-strong d-flex justify-content-center align-items-center">

                    <!-- Content -->
                    <div class="text-center white-text mx-5 wow fadeIn">
                        <h1 class="mb-4">
                            <strong>Learn Bootstrap 4 with MDB</strong>
                        </h1>

                        <p>
                            <strong>Best & free guide of responsive web design</strong>
                        </p>

                        <p class="mb-4 d-none d-md-block">
                            <strong>The most comprehensive tutorial for the Bootstrap 4. Loved by over 500 000 users. Video and
                                written versions
                                available. Create your own, stunning website.</strong>
                        </p>

                        <a target="_blank" href="https://mdbootstrap.com/education/bootstrap/" class="btn btn-outline-white btn-lg">Start
                            free tutorial
                            <i class="fas fa-graduation-cap ml-2"></i>
                        </a>
                    </div>
                    <!-- Content -->

                </div>
                <!-- Mask & flexbox options-->

            </div>
        </div>
        <!--/Third slide-->

    </div>
    <!--/.Slides-->

    <!--Controls-->
    <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
    <!--/.Controls-->

</div>
<!--/.Carousel Wrapper-->

<!--Main layout-->
<main>
    <div class="container">

        <!--Navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark mdb-color lighten-3 mt-3 mb-5">

            <!-- Navbar brand -->
            <span class="navbar-brand">Categories:</span>

            <!-- Collapse button -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicExampleNav"
                    aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Collapsible content -->
            <div class="collapse navbar-collapse" id="basicExampleNav">

                <!-- Links -->
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Tous
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>

                    <c:forEach var="cat" items="${categories}" >
                        <li class="nav-item">
                            <a class="nav-link" href="home?cat=/<c:out value='${cat.getIdCategory()}'/>"><c:out value="${cat.getCategory()}"/></a>
                        </li>
                    </c:forEach>

                </ul>
                <!-- Links -->

                <form class="form-inline">
                    <div class="md-form my-0">
                        <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
                    </div>
                </form>
            </div>
            <!-- Collapsible content -->

        </nav>
        <!--/.Navbar-->

        <!--Section: Products v.3-->
        <section class="text-center mb-4">

            <!--Grid row-->
            <div class="row wow fadeIn">

                <!--Grid column-->
                <c:forEach items="${produits}" var="product">
                    <div class="col-lg-3 col-md-6 mb-4">

                        <!--Card-->
                        <div class="card">

                            <!--Card image-->
                            <div class="view overlay">
                                <img class="card-img-top" alt="" src="data:image/jpg;base64,${product.getBase64Image()}" />
                                <a>
                                    <div class="mask rgba-white-slight"></div>
                                </a>
                            </div>
                            <!--Card image-->

                            <!--Card content-->
                            <div class="card-body text-center">
                                <!--Category & Title-->
                                <a href="" class="grey-text">
                                    <h5><c:out value="${product.getLabel()}"/></h5>
                                </a>
                                <h5>
                                    <strong>
                                        <c:if test="${!product.getDescription().equals('')}" >
                                            <p class="dark-grey-text"><c:out value="${product.getDescription()}"/> ...
                                            </p>
                                        </c:if>
                                    </strong>
                                </h5>

                                <h4 class="font-weight-bold blue-text">
                                    <strong><c:out value="${product.getPrix()}"/> DH</strong>
                                </h4>

                            </div>
                            <!--Card content-->

                        </div>
                        <!--Card-->

                    </div>
                </c:forEach>
            </div>
            <!--Grid row-->

        </section>
        <!--Section: Products v.3-->

        <!--Pagination-->
        <nav class="d-flex justify-content-center wow fadeIn">
            <ul class="pagination pg-blue">

                <!--Arrow left-->
                <li class="page-item disabled">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>

                <li class="page-item active">
                    <a class="page-link" href="#">1
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">4</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">5</a>
                </li>

                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </ul>
        </nav>
        <!--Pagination-->

    </div>
</main>
<!--Main layout-->

<!--Footer-->
<footer class="page-footer text-center font-small mt-4 wow fadeIn">
    <!--Copyright-->
    <div class="footer-copyright py-3">
        © 2019 Copyright:
        <a href="https://Shopper.com/"> Shopper.com </a>
    </div>
    <!--/.Copyright-->


</footer>
<!--/.Footer-->

<!-- modals -->
<div class="modal fade" id="modalLogin" tabindex="-1" aria-hidden="true" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Login</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body pt-4">
                <form action="login">
                    <div class="form-group mb-4">
                        <input type="email" class="form-control p-4 " name="email" placeholder="Enter email">
                    </div>
                    <div class="form-group  mb-5">
                        <input type="password" class="form-control p-4" name="pwd" placeholder="Enter password">
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Se Connecter</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modalRegister" tabindex="-1" aria-hidden="true" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Register</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body pt-4">
                <form action="register">
                    <div class="form-group row mb-4">
                        <div class="col"><input type="text" class="form-control p-4 " name="nom" placeholder="First Name"></div>
                        <div class="col"><input type="text" class="form-control p-4 " name="prenom" placeholder="Last Name"></div>
                    </div>
                    <div class="form-group row mb-4">
                        <div class="col"><input type="text" class="form-control p-4 " name="username" placeholder="User Name"></div>
                        <div class="col"><input type="email" class="form-control p-4 " name="email" placeholder="Email"></div>
                    </div>
                    <div class="form-group row mb-4">
                        <div class="col"><input type="password" class="form-control p-4 " name="pwd" placeholder="Password"></div>
                        <div class="col"><input type="password" class="form-control p-4 " name="c_pwd" placeholder="Confirm Password"></div>
                    </div>
                    <div class="form-group row mb-4">
                        <div class="col"><select class="form-control" name="civil" id=""><option selected disabled>--Gender--</option><option value="f">Female</option><option value="m">Male</option></select></div>
                        <div class="col"><input type="file" class="form-control" name="avatar"><label for="">profil picture</label></div>
                    </div>
                    <div class="form-group row mb-4">
                        <div class="col"><input type="text" class="form-control p-4 " name="pays" placeholder=" Pays" ></div>
                        <div class="col"><input type="text" class="form-control p-4 " name="ville" placeholder=" City"></div>
                        <div class="col"> <input type="number" class="form-control p-4" name="zipcode" placeholder=" ZIPCODE"></div>
                    </div>
                    <div class="form-group row mb-5">
                        <div class="col"><textarea name="adresse" class="form-control" cols="40" rows="3" placeholder="Address"></textarea></div>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Register</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- end modals -->

<!-- SCRIPTS -->
<!-- JQuery -->
<script type="text/javascript"><%@include file="../js/jquery-3.4.1.min.js"%></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript"><%@include file="../js/popper.min.js"%></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript"><%@include file="../js/bootstrap.min.js"%></script>
<!-- MDB core JavaScript -->
<script type="text/javascript"><%@include file="../js/mdb.min.js"%></script>
<!-- Initializations -->
<script type="text/javascript">
    // Animations initialization
    new WOW().init();

</script>
</body>

</html>
