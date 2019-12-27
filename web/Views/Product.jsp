<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="App.Entities.Produit" %>

<% Produit produit= (Produit) request.getAttribute("product");%>

<%--
  Created by IntelliJ IDEA.
  User: Oussidi_Mohamed
  Date: 21/12/2019
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<jsp:include page="../Partials/Header.jsp" >
    <jsp:param name="title" value="Shopper | Product Info"/>
</jsp:include>


<!--Main layout-->
<c:set var="produit" value="${produit}" scope="page"/> <br><br><br><br><br>
<c:out value="${produit.getLabel()}"/>
<main class="mt-5 pt-4">
    <div class="container dark-grey-text mt-5">

        <!--Grid row-->
        <div class="row wow fadeIn">

            <!--Grid column-->
            <div class="col-md-6 mb-4">

                <img src="data:image/jpg;base64,${produit.getBase64Image()}" class="img-fluid" alt="">

            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-md-6 mb-4">

                <!--Content-->
                <div class="p-4">

                    <div class="mb-3">
                        <a href="">
                            <span class="badge purple mr-1"><c:out value="${produit.getCategory().getCategory()}"/></span>
                        </a>
                    </div>

                    <p class="lead">
              <span class="mr-1">
                <del><c:out value="${produit.getPrix()}"/></del>
              </span>
                        <span><c:out value="${produit.getPrix()*produit.getPromo()/100}"/></span>
                    </p>

                    <p class="lead font-weight-bold">Description</p>

                    <p><c:out value="${produit.getDescription()}"/></p>

                    <form action="" method="post" class="d-flex justify-content-left">
                        <!-- Default input -->
                        <input type="number" name="qte" value="1" aria-label="Search" class="form-control" style="width: 100px">
                        <button class="btn btn-primary btn-md my-0 p" type="submit">Add to cart
                            <i class="fas fa-shopping-cart ml-1"></i>
                        </button>

                    </form>

                </div>
                <!--Content-->

            </div>
            <!--Grid column-->

        </div>
        <!--Grid row-->

    </div>
</main>
<!--Main layout-->

<jsp:include page="../Partials/Footer.jsp" />