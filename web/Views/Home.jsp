<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page import="App.Entities.Category" %>
<%@ page import="App.Entities.Product" %>
<%@ page import="java.util.List" %>

<%
    List<Category> categories=(List<Category>) request.getAttribute("categories");
    List<Product> products =(List<Product>) request.getAttribute("products");
    String msg = (String) request.getAttribute("msg");
%>

<%--
  Created by IntelliJ IDEA.
  User: Oussidi_Mohamed
  Date: 21/12/2019
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>

<jsp:include page="../Partials/Header.jsp" >
    <jsp:param name="title" value="Shopper | Home"/>
</jsp:include>

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
                            <strong>Shop is fun</strong>
                        </h1>

                        <p>
                            <strong>BROWSE OUR PREMIUM PRODUCT</strong>
                        </p>

                        <p class="mb-4 d-none d-md-block">
                            <strong>Us which over of signs divide dominion deep  fill bring <br> they're meat beho upon own earth without morning over third. Their male dry. They are great appear whose land fly grass.</strong>
                        </p>

                        <a  href="" class="btn btn-outline-white btn-lg">Start Buying Now
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
                            <strong>Shop is fun</strong>
                        </h1>

                        <p>
                            <strong>BROWSE OUR PREMIUM PRODUCT</strong>
                        </p>

                        <p class="mb-4 d-none d-md-block">
                            <strong>Us which over of signs divide dominion deep  fill bring <br> they're meat beho upon own earth without morning over third. Their male dry. They are great appear whose land fly grass.</strong>
                        </p>

                        <a  href="" class="btn btn-outline-white btn-lg">Start
                            Buying Now
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
                            <strong>Shop is fun</strong>
                        </h1>

                        <p>
                            <strong>BROWSE OUR PREMIUM PRODUCT</strong>
                        </p>

                        <p class="mb-4 d-none d-md-block">
                            <strong>Us which over of signs divide dominion deep  fill bring <br> they're meat beho upon own earth without morning over third. Their male dry. They are great appear whose land fly grass.</strong>
                        </p>

                        <a  href="" class="btn btn-outline-white btn-lg">Start
                            Buying Now
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
                        <a class="nav-link" href="home">Tous
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>

                    <c:forEach var="cat" items="${categories}" >
                        <li class="nav-item">
                            <a class="nav-link" href="home?cat=${cat.getIdCategory()} ">${cat.getCategory()}</a>
                        </li>
                    </c:forEach>

                </ul>
                <!--Home.jsp Links -->

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
                <c:forEach items="${products}" var="product">
                    <div class="col-lg-4 col-md-3 mb-4">
                       <a href="product?id=${product.getIdProduit()}">
                               <!--Card-->
                        <div class="card">
                                <!--Card image-->
                                <div class="view overlay p-3">
                                    <img class="card-img-top" alt="" src="data:image/jpg;base64,${product.getBase64Image()}" />
                                    <div class="mask rgba-white-slight"></div>
                                </div>
                                <!--Card image-->

                                <!--Card content-->
                                <div class="card-body text-center">
                                    <!--Category & Title-->
                                    <h5 class="grey-text">${product.getLabel()}</h5>

                                    <h4 class="font-weight-bold blue-text">
                                        <c:if test="${product.getPromo()>0}" >
                                          <span class="mr-1">
                                            <del>${product.getPrix()} DH</del>
                                          </span>
                                            <span>${product.getPrix()-product.getPrix()*product.getPromo()/100} DH</span>
                                        </c:if>
                                        <c:if test="${product.getPromo()==0}" >
                                            <span>${product.getPrix()} DH</span>
                                        </c:if>
                                    </h4>
                                </div>
                                <!--Card content-->
                            </div>
                        <!--Card-->
                        </a>
                    </div>
                </c:forEach>
            </div>
            <!--Grid row-->

        </section>
        <!--Section: Products v.3-->

        <!--Pagination-->
        <%--<nav class="d-flex justify-content-center wow fadeIn">
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
        </nav>--%>
        <!--Pagination-->

    </div>
    <c:if test="${not empty msg}" >
        <div class="myalert">${msg}</div>
    </c:if>
</main>
<!--Main layout-->

<jsp:include page="../Partials/Footer.jsp" />