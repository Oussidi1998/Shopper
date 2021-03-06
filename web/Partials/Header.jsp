<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="App.Utils.PanierItem" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="com.fasterxml.jackson.core.type.TypeReference" %>
<%@ page import="App.Utils.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // for login
    HttpSession UserSession = request.getSession();
    // for cookies cart and nb element in cart
    Cookie panierCookie=Util.getCookie(request,"panier");
    ArrayList<PanierItem> panierItems;
    if (panierCookie!=null){
        panierItems = new ObjectMapper().readValue(URLDecoder.decode(panierCookie.getValue(),"UTF-8"),new TypeReference<ArrayList<PanierItem>>(){});
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>${param.title}</title>
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
            <strong class="blue-text">Books Network</strong>
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
                        <span class="badge red z-depth-1 mr-1"><c:out value="${fn:length(panierItems)}" /></span>
                        <i class="fas fa-shopping-cart"></i>
                        <span class="clearfix d-none d-sm-inline-block"> Cart </span>
                    </a>
                </li>
               <c:choose>
                   <c:when test="${not empty sessionScope.user}">
                       <li class="nav-item">
                           <div class="dropdown">
                               <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                      ${sessionScope.user}
                               </button>
                               <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                   <a class="dropdown-item" href="home?logout=yes">Logout</a>
                               </div>
                           </div>
                       </li>
                   </c:when>
                   <c:otherwise>
                       <li class="nav-item">
                           <a class="nav-link  waves-effect" data-toggle="modal" data-target="#modalLogin">Sign In</a>
                       </li>
                       <li class="nav-item">
                           <button class="nav-link border border-light rounded waves-effect" data-toggle="modal" data-target="#modalRegister">Register</button>
                       </li>
                   </c:otherwise>
               </c:choose>
            </ul>

        </div>

    </div>
</nav>
<!-- Navbar -->