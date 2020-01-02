<%@ page import="java.util.List" %>
<%@ page import="App.Entities.Client" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% List<Client> clients = (List<Client> ) request.getAttribute("clients"); %>
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


<main class="mt-5 pt-4">
    <div class="container wow fadeIn">

        <!-- Heading -->
        <h2 class="my-5 h2 text-center">Manage Clients</h2>

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
                                <th scope="col">First Name </th>
                                <th scope="col">Last Name</th>
                                <th scope="col">Email</th>
                                <th scope="col">Category</th>
                                <th scope="col">Category</th>
                                <th scope="col">Category</th>
                                <th scope="col" class="text-center">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="client" items="${clients}">
                                <tr>
                                    <td width="70%">${client.getIdClient()}</td>
                                    <td class="text-center"><a href="admin/categories?del=${client.getIdClient()}"><i class="text-danger fas fa-2x fa-trash"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""><i class="text-success fas fa-2x fa-pen"></i></a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
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
