<%@ page import="java.util.List" %>
<%@ page import="App.Entities.Category" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% List<Category> categories = (List<Category> ) request.getAttribute("categories"); %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Manage Categories</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <style><%@include file="../css/bootstrap.min.css"%></style>
    <!-- Material Design Bootstrap -->
    <style><%@include file="../css/mdb.min.css"%></style>
    <!-- Your custom styles (optional) -->
    <style><%@include file="../css/style.min.css"%></style>
</head>

<body>

<nav class="nav text-center pt-5">
    <a href="../admin"><i class="fas fa-2x fa-home"></i></a>
</nav>
<main class="mt-2">
    <div class="container wow fadeIn">

        <!-- Heading -->
        <h2 class="my-5 h2 text-center">Manage Categories</h2>

        <!--Grid row-->
        <div class="row justify-content-md-center mb-5">

            <!--Grid column-->
            <div class="col-md-6">

                <!--Card-->
                <div class="card">

                    <!--Card content-->
                    <form class="card-body">

                        <table class="table">
                            <thead class="thead-dark">
                            <tr>
                                <th scope="col">Category</th>
                                <th scope="col" class="text-center">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="category" items="${categories}">
                                <tr>
                                    <td width="70%">${category.getCategory()}</td>
                                    <td class="text-center"><a href="admin/categories?del=${category.getIdCategory()}"><i class="text-danger fas fa-2x fa-trash"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""><i class="text-success fas fa-2x fa-pen"></i></a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <hr class="mb-4">
                        <a class="btn btn-primary btn-lg btn-block">Add Category</a>
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
</body>

</html>
