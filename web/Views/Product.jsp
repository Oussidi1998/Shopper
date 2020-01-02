<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="App.Entities.Product" %>

<% Product product= (Product) request.getAttribute("product");%>

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
<c:set var="product" value="${product}" scope="page"/>
<main class="mt-5 pt-4">
    <div class="container dark-grey-text mt-5">

        <!--Grid row-->
        <div class="row wow fadeIn">

            <!--Grid column-->
            <div class="col-md-6 mb-4">

                <img src="data:image/jpg;base64,${product.getBase64Image()}" class="img-fluid" alt="">

            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-md-6 mb-4">

                <!--Content-->
                <div class="p-4">

                    <div class="mb-3">
                        <a href="home?cat=${product.getCategory().getIdCategory()}">
                            <span class="badge purple mr-1">${product.getCategory().getCategory()}</span>
                        </a>
                    </div>

                    <p class="lead">
                          <c:if test="${product.getPromo()>0}" >
                              <span class="mr-1">
                                <del>${product.getPrix()} DH</del>
                              </span>
                              <span>${product.getPrix()-product.getPrix()*product.getPromo()/100} DH</span>
                          </c:if>
                        <c:if test="${product.getPromo()==0}" >
                            <span>${product.getPrix()} DH</span>
                        </c:if>
                    </p>

                    <p class="lead font-weight-bold">Description</p>

                    <p>${product.getDescription()}</p>

                    <form action="product" method="post" class="d-flex justify-content-left">
                        <!-- Default input -->
                        <input type="hidden" name="id_produit" value="${product.getIdProduit()}" >
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