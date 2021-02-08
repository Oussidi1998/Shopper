<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page import="App.Utils.PanierItem" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="com.fasterxml.jackson.core.type.TypeReference" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="App.Utils.Util" %>

<%
    Cookie panierCookie= Util.getCookie(request,"panier");
    ArrayList<PanierItem> panierItems=new ArrayList<>();
    if (panierCookie!=null){
        panierItems = new ObjectMapper().readValue(URLDecoder.decode(panierCookie.getValue(),"UTF-8"),new TypeReference<ArrayList<PanierItem>>(){});
    }
%>

<%--
  Created by IntelliJ IDEA.
  User: Oussidi_Mohamed
  Date: 21/12/2019
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<jsp:include page="../Partials/Header.jsp" >
    <jsp:param name="title" value="Shopper | Cart"/>
</jsp:include>

<!--Main layout-->
<main class="mt-5 pt-4">
    <div class="container wow fadeIn">

        <!-- Heading -->
        <h2 class="my-5 h2 text-center">Cart</h2>

        <!--Grid row-->
        <c:choose>
            <c:when test="${panierItems.size()>=1}">
                <div class="row justify-content-md-center mb-5">
                    <!--Grid column-->
                    <div class="col">
                        <!--Card-->
                        <div class="card">
                            <!--Card content-->
                            <form method="post" class="card-body">

                                <table class="table">
                                    <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">Action</th>
                                        <th scope="col">Product</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:set var="count" value="0" scope="page" />
                                    <c:forEach var="item" items="${panierItems}" >
                                        <tr>
                                            <td><a href="cart?sup=${item.getIdProduct()}"><i class="fas fa-trash"></i></a></td>
                                            <td>${item.getLabel()}</td>
                                            <td>${item.getPrice()} DH</td>
                                            <td width="150px"><input type="hidden" name="id_product_${count}" value="${item.getIdProduct()}"><input type="number" value="${item.getQte()}" class="form-control" name="qt_${count}" /></td>
                                            <td>${item.getPrice()*item.getQte()} DH</td>
                                        </tr>
                                        <c:set var="count" value="${count + 1}" scope="page"/>
                                    </c:forEach>
                                    </tbody>
                                </table>

                                <hr class="mb-4">
                                <div class="row">
                                    <div class="col">
                                        <a href="home" class="btn btn-primary btn-lg btn-block">Continue Buying</a>
                                    </div>
                                    <div class="col">
                                        <button class="btn btn-default btn-lg btn-block" name="refreshCart" value="refreshCart" type="submit">Refresh Cart</button>
                                    </div>
                                    <div class="col">
                                        <a href="cart?empty=1" class="btn btn-default btn-lg btn-block" >Empty Cart</a>
                                    </div>
                                    <div class="col">
                                        <a class="btn btn-primary btn-lg btn-block" href="checkout">Checkout</a>
                                    </div>

                                </div>

                            </form>

                        </div>
                        <!--/.Card-->

                    </div>
                    <!--Grid column-->
                    <!--Grid column-->

                </div>
            </c:when>
            <c:otherwise>
                <div class="row justify-content-md-center mb-5">
                    <!--Grid column-->
                    <div class="col">
                        <!--Card-->
                        <div class="card">
                            <!--Card content-->
                            <form class="card-body">
                                <div>
                                    Your cart Is empty add some items now
                                </div>
                                <hr class="mb-4">
                                <div class="row">
                                    <div class="col">
                                        <a href="home" class="btn btn-primary btn-lg btn-block">Continue Buying</a>
                                    </div>
                                </div>

                            </form>

                        </div>
                        <!--/.Card-->

                    </div>
                    <!--Grid column-->
                    <!--Grid column-->

                </div>
            </c:otherwise>
        </c:choose>
        <!--Grid row-->

    </div>
</main>
<!--Main layout-->
<jsp:include page="../Partials/Footer.jsp" />