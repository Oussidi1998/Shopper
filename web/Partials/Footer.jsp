<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="App.Entities.Category" %>
<%@ page import="java.util.List" %>
<%
    List<Category> categories=(List<Category>) request.getAttribute("categories");
%>

<!--Footer-->
<footer class="site-footer">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-6">
                <h6>About</h6>
                <p class="text-justify">Scanfcode.com <i>CODE WANTS TO BE SIMPLE </i> is an initiative to help the
                    upcoming programmers with the code. Scanfcode focuses on providing the most efficient code or
                    snippets as the code wants to be simple. We will help programmers build up concepts in different
                    programming languages that include C, C++, Java, HTML, CSS, Bootstrap, JavaScript, PHP, Android, SQL
                    and Algorithm.</p>
            </div>

            <div class="col-xs-6 col-md-3">
                <h6>Categories</h6>
                <ul class="footer-links">
                    <c:forEach var="cat" items="${categories}">
                        <li>
                            <a href="home?cat=${cat.getIdCategory()} ">${cat.getCategory()}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>

            <div class="col-xs-6 col-md-3">
                <h6>Quick Links</h6>
                <ul class="footer-links">
                    <li><a href="http://scanfcode.com/about/">About Us</a></li>
                    <li><a href="http://scanfcode.com/contact/">Contact Us</a></li>
                    <li><a href="http://scanfcode.com/contribute-at-scanfcode/">Contribute</a></li>
                    <li><a href="http://scanfcode.com/privacy-policy/">Privacy Policy</a></li>
                    <li><a href="http://scanfcode.com/sitemap/">Sitemap</a></li>
                </ul>
            </div>
        </div>
        <hr>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-sm-6 col-xs-12">
                <p class="copyright-text">Copyright &copy; 2021 All Rights Reserved by
                    <a href="#">Books Network</a>.
                </p>
            </div>

            <div class="col-md-4 col-sm-6 col-xs-12">
                <ul class="social-icons">
                    <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
                    <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>
<!--/.Footer-->

<!-- modals -->
<div class="modal fade" id="modalLogin" tabindex="-1" aria-hidden="true" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Login</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body pt-4">
                <form method="post" action="login">
                    <div class="form-group mb-4">
                        <input type="email" class="form-control p-4 " id="email" name="email" placeholder="Email">
                    </div>
                    <div class="form-group  mb-5">
                        <input type="password" class="form-control p-4" id="passwd" name="pwd" placeholder="Password">
                    </div>
                    <div class="text-center">
                        <button type="submit" name="login" value="login" class="btn w-100 btn-primary">Se
                            Connecter
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modalRegister" tabindex="-1" aria-hidden="true" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Register</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body pt-4">
                <form method="post" id="formRegister" action="register">
                    <div class="form-group row mb-4">
                        <div class="col"><input type="text" class="form-control p-4 " name="nom"
                                                placeholder="First Name"></div>
                        <div class="col"><input type="text" class="form-control p-4 " name="prenom"
                                                placeholder="Last Name"></div>
                    </div>
                    <div class="form-group row mb-4">
                        <div class="col"><select class="form-control" name="gender">
                            <option selected disabled>--Gender--</option>
                            <option value="f">Female</option>
                            <option value="m">Male</option>
                        </select></div>
                        <div class="col"><input type="email" class="form-control p-4 " name="email" placeholder="Email">
                        </div>
                    </div>
                    <div class="form-group row mb-4">
                        <div class="col"><input type="password" id="pwd" class="form-control p-4 " name="pwd"
                                                placeholder="Password"></div>
                        <div class="col"><input type="password" id="c_pwd" class="form-control p-4 " name="c_pwd"
                                                placeholder="Confirm Password"></div>
                    </div>
                    <div class="form-group row mb-4">
                        <div class="col"><input type="text" class="form-control p-4 " name="country"
                                                placeholder="Country"></div>
                        <div class="col"><input type="text" class="form-control p-4 " name="city" placeholder="City">
                        </div>
                        <div class="col"><input type="text" class="form-control p-4" name="zipcode"
                                                placeholder="ZIPCODE"></div>
                    </div>
                    <div class="form-group row mb-5">
                        <div class="col"><textarea name="address" class="form-control" cols="40" rows="3"
                                                   placeholder="Address"></textarea></div>
                    </div>

                    <div class="text-center">
                        <button type="submit" name="register" value="register" class="btn w-100 btn-primary">Register
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- end modals -->


<!-- SCRIPTS -->
<!-- JQuery -->
<script type="text/javascript">
    <%@include file="../js/jquery-3.4.1.min.js" %>
</script>
<!-- Bootstrap tooltips -->
<script type="text/javascript">
    <%@include file="../js/popper.min.js" %>
</script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript">
    <%@include file="../js/bootstrap.min.js" %>
</script>
<!-- MDB core JavaScript -->
<script type="text/javascript">
    <%@include file="../js/mdb.min.js" %>
</script>
<!-- Initializations -->
<script type="text/javascript">
    // Animations initialization
    new WOW().init();

    // password same in register
    $("#formRegister").on("submit", function () {

        if ($("#pwd").val().length == 0 || $("#pwd").val() != $("#c_pwd").val()) {
            $(this).prepend("<div class='alert alert-danger'>Please confirm the password</div>");
            setTimeout(function () {
                $("#formRegister .alert").hide();
            }, 4000);
            return false;
        }

        return true;

    });

    $("#formLogin").on("submit", function () {

        if ($("#email").val().length <= 3 || $("#passwd").val().length <= 3) {
            $(this).prepend("<div class='alert alert-danger'>Please Enter Login info.</div>");
            setTimeout(function () {
                $("#formLogin .alert").hide();
            }, 4000);
            return false;
        }
        return true;
    });

    if ($(".myalert").length) {
        setTimeout(function () {
            $(".myalert").hide();
        }, 5000);
    }

</script>
