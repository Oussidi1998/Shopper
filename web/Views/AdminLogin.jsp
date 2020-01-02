<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String msg  = (String) request.getAttribute("msg"); %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Admin login</title>
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


<!--Main layout-->
<main class="container mt-5">
    <div class="row justify-content-md-center">
        <div class="col-md-6 ">
            <div class="card mt-5 p-5">
                <c:if test="${not empty msg}" >
                    <div class="alert alert-danger" >${msg}</div>
                </c:if>
                <form action="admin" method="post">
                    <div class="form-group mb-4">
                        <input type="text" name="username" class="form-control p-4 " placeholder="username" id="username">
                    </div>
                    <div class="form-group  mb-5">
                        <input type="password" name="pwd" class="form-control p-4" placeholder="Password" id="pwd">
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Se Connecter</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>
<!--Main layout-->
</body>

</html>
