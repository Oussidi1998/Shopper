<%@ page import="java.util.List" %>
<%@ page import="App.Entities.Product" %>
<%@ page import="App.Entities.Category" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% List<Product> products = (List<Product> ) request.getAttribute("products"); %>
<% List<Category> cats = (List<Category> ) request.getAttribute("cats"); %>
<% String msg = (String ) request.getAttribute("msg"); %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Manage Products</title>
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
        <h2 class="my-5 h2 text-center">Manage Products</h2>

        <!--Grid row-->
        <div class="row justify-content-md-center mb-5">

            <!--Grid column-->
            <div class="col-md-6">

                <!--Card-->
                <div class="card">

                    <!--Card content-->
                    <form class="card-body">
                        <c:if test="${not empty msg}">
                            <div class="alert alert-danger">${msg}</div>
                        </c:if>
                        <table class="table">
                            <thead class="thead-dark">
                            <tr>
                                <th scope="col">Image</th>
                                <th scope="col">Label</th>
                                <th scope="col">Price</th>
                                <th scope="col">Promo (%)</th>
                                <th scope="col" class="text-center">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="product" items="${products}">
                                <tr>
                                    <td><%--<img src="data:image/jpg;base64,${product.getBase64Image()}" width="150px" height="auto" alt="">--%> ...</td>
                                    <td>${product.getLabel()}</td>
                                    <td>${product.getPrix()}</td>
                                    <td>${product.getPromo()}</td>
                                    <td class="text-center"><a href="admin/products?del=${product.getIdProduct()}"><i class="text-danger fas fa-2x fa-trash"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""><i class="text-success fas fa-2x fa-pen"></i></a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <hr class="mb-4">
                        <a class="btn btn-primary btn-lg btn-block" data-toggle="modal" data-target="#modalAddProduct">Add Product</a>
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

<div class="modal fade" id="modalAddProduct" tabindex="-1" aria-hidden="true" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Product</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body pt-4">
                <form method="post"  id="formAddProduct" enctype="multipart/form-data">
                    <div class="form-group row mb-4">
                        <div class="col"><input type="text" class="form-control p-4 " name="label" placeholder="Label"></div>
                        <div class="col"><input type="number"  step="0.00" class="form-control p-4 " name="prix" placeholder="Prix"></div>
                    </div>
                    <div class="form-group row mb-4">
                        <div class="col"><select class="form-control" name="gender">
                            <option selected disabled>--Category--</option>
                            <c:forEach var="cat" items="${cats}">
                                <option value="${cat.getIdCategory()}">${cat.geCategory()}</option>
                            </c:forEach></select>
                        </div>
                        <div class="col"><input type="number" class="form-control p-4 " name="promo" placeholder="Promo (%)"></div>
                    </div>
                    <div class="form-group mb-4">
                        <label for="">Product image</label>
                        <input type="file" class="form-control p-4 " name="image">
                    </div>
                    <div class="form-group row mb-5">
                        <div class="col"><textarea name="description" class="form-control" cols="40" rows="3" placeholder="Description"></textarea></div>
                    </div>

                    <div class="text-center">
                        <button type="submit" name="ajouter" value="ajouter" class="btn btn-primary">Ajouter</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!--Main layout-->
</body>

</html>
