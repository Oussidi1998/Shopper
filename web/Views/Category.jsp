<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page import="App.Entities.Category" %>
<%@ page import="App.Entities.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.lang.Math" %>

<%
    Category category=(List<Category>) request.getAttribute("category");
    List<Product> products =(List<Product>) request.getAttribute("products");
%>

<%--
  Created by IntelliJ IDEA.
  User: Oussidi_Mohamed
  Date: 21/12/2019
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>

<jsp:include page="../Partials/Header.jsp" >
    <jsp:param name="title" value="Books Network | Home"/>
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


        <!--Second slide-->
        <div class="carousel-item active">
            <div class="view" style="background-image: url('https://pixabay.com/get/gcb0492e8be7f1cd2acf51c804074265311d9b650e7b865009eb4408dbf5fb4db8d842665e243712ec3bbb54ec23fd2c0_1920.jpg'); background-repeat: no-repeat;
            background-size:
            cover;">

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

                        <a data-toggle="modal" data-target="#modalRegister" class="btn btn-outline-white btn-lg">Start
                            Buying Now
                        </a>
                    </div>
                    <!-- Content -->

                </div>
                <!-- Mask & flexbox options-->

            </div>
        </div>
        <!--/Second slide-->

        <!--Second slide-->
        <div class="carousel-item">
            <div class="view" style="background-image: url('https://pixabay.com/get/gcfe9d539b6ca49f742cb1fa6f97f4b038b7d312a216b1d8da0f1e95e94ae8dff079e51d1b61187493e95f41febac9a51_1920.jpg'); background-repeat: no-repeat;
            background-size:
            cover;">

                <!-- Mask & flexbox options-->
                <div class="mask rgba-black-strong d-flex justify-content-center align-items-center">

                    <!-- Content -->
                    <div class="text-center white-text mx-5 wow fadeIn">
                        <h1 class="mb-4">
                            <strong>Reading is fun</strong>
                        </h1>

                        <p>
                            <strong>BROWSE OUR PREMIUM PRODUCT</strong>
                        </p>

                        <p class="mb-4 d-none d-md-block">
                            <strong>Us which over of signs divide dominion deep  fill bring <br> they're meat beho upon own earth without morning over third. Their male dry. They are great appear whose land fly grass.</strong>
                        </p>

                        <a data-toggle="modal" data-target="#modalRegister" class="btn btn-outline-white btn-lg">Start
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
            <div class="view" style="background-image: url('https://pixabay.com/get/ge5a4b85f3b50b7d081af299402266beaea4887c175211392d732283ecfb44b529a80f33b3758c776c061bc8abc9ddd43_1920.jpg'); background-repeat: no-repeat;
            background-size: cover;">

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

                        <a data-toggle="modal" data-target="#modalRegister" class="btn btn-outline-white btn-lg">Start
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


        <section class="text-center pt-4 pb-4 mt-4 mb-4">
            <h2 class="blue-text">${category.getCategory()}</h2>
        </section>

        <!--Section: Products v.3-->
        <section class="text-center mb-4">

            <!--Grid row-->
            <div class="row wow fadeIn">

                <!--Grid column-->
                <c:forEach items="${products}" var="product">
                    <div class="col-lg-3 col-md-4 mb-4">
                       <a href="product?id=${product.getIdProduct()}">
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
                                            <span>${Math.round(product.getPrix()-product.getPrix()*product.getPromo()/100)} DH</span>
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



        <!--Section: Products v.3-->
        <section class="text-center mb-4">



        </section>
        <!--Section: Products v.3-->

    </div>
</main>
<!--Main layout-->

<jsp:include page="../Partials/Footer.jsp" />