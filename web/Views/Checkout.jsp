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
<jsp:include page="../Partials/Header.jsp" >
    <jsp:param name="title" value="Shopper | Checkout"/>
</jsp:include>

<!--Main layout-->
<main class="mt-5 pt-4">
    <div class="container wow fadeIn">

        <!-- Heading -->
        <h2 class="my-5 h2 text-center">Adresse & Card Informations</h2>

        <!--Grid row-->
        <div class="row justify-content-md-center mb-5">

            <!--Grid column-->
            <div class="col-md-8">

                <!--Card-->
                <div class="card">

                    <!--Card content-->
                    <form class="card-body">
                        <div class="form-group">
                            <textarea name="address" cols="40" rows="3" class="form-control" placeholder="address"></textarea>
                        </div><hr>
                        <div class="form-group row mb-4">
                            <div class="col"><input type="text" class="form-control p-4 " name="nom" placeholder="First Name"></div>
                            <div class="col"><input type="text" class="form-control p-4 " name="prenom" placeholder="Last Name"></div>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control p-4 " name="cardNumber" placeholder="Card Number">
                        </div>
                        <div class="form-group row mb-4">
                            <div class="col"><input type="text" class="form-control p-4 " name="cardExpire" placeholder="06/19"></div>
                            <div class="col"><input type="number" pattern="" class="form-control p-4 " name="cardCCV" placeholder="CCV"></div>
                        </div>
                        <hr class="mb-4">
                        <button class="btn btn-primary btn-lg btn-block" name="checkoutFinal" type="submit">Checkout</button>

                    </form>

                </div>
                <!--/.Card-->

            </div>
            <!--Grid column-->
            <!--Grid column-->

        </div>
        <!--Grid row-->

    </div>
</main>
<!--Main layout-->

<jsp:include page="../Partials/Footer.jsp" />
