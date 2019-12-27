<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Dashboard</title>
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
<main class="mt-5 pt-4">
    <div class="container wow fadeIn">

        <!-- Heading -->
        <h2 class="my-5 h2 text-center">Admin Dashboard</h2>

        <!--Grid row-->
        <div class="row justify-content-md-center mb-5">

            <!--Grid column-->
            <div class="col-md-4">

                <!--Card-->
                <a href="admin/products">
                    <div class="card text-center">
                        <div class=" p-3">
                            <i class="fas  fa-5x fa-box"></i>
                        </div>
                        <div class="p-3 mt-4">
                            <h2>Gestion Products</h2>
                        </div>
                    </div>
                </a>
                <!--/.Card-->

            </div>
            <!--Grid column-->
            <div class="col-md-4">

                <!--Card-->
                <a href="admin/categories">
                    <div class="card text-center">
                        <div class="p-3">
                            <i class="fas fa-5x fa-box"></i>
                        </div>
                        <div class="p-3 mt-4">
                            <h2>Gestion Categories</h2>
                        </div>
                    </div>
                </a>
                <!--/.Card-->

            </div>
            <!--Grid column-->

        </div>
        <!--Grid row-->

    </div>
</main>
<!--Main layout-->
</body>

</html>
