
<!--Footer-->
<footer class="page-footer text-center font-small mt-4 wow fadeIn">
    <!--Copyright-->
    <div class="footer-copyright py-3">
        © 2019 Copyright:
        <a href="https://Shopper.com/"> Shopper.com </a>
    </div>
    <!--/.Copyright-->


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
                        <button type="submit"  name="login" value="login" class="btn btn-primary">Se Connecter</button>
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
                <form method="post"  id="formRegister" action="register">
                    <div class="form-group row mb-4">
                        <div class="col"><input type="text" class="form-control p-4 " name="nom" placeholder="First Name"></div>
                        <div class="col"><input type="text" class="form-control p-4 " name="prenom" placeholder="Last Name"></div>
                    </div>
                    <div class="form-group row mb-4">
                        <div class="col"><select class="form-control" name="gender">
                            <option selected disabled>--Gender--</option>
                            <option value="f">Female</option>
                            <option value="m">Male</option></select></div>
                        <div class="col"><input type="email" class="form-control p-4 " name="email" placeholder="Email"></div>
                    </div>
                    <div class="form-group row mb-4">
                        <div class="col"><input type="password" id="pwd" class="form-control p-4 " name="pwd" placeholder="Password"></div>
                        <div class="col"><input type="password" id="c_pwd" class="form-control p-4 " name="c_pwd" placeholder="Confirm Password"></div>
                    </div>
                    <div class="form-group row mb-4">
                        <div class="col"><input type="text" class="form-control p-4 " name="country" placeholder="Country" ></div>
                        <div class="col"><input type="text" class="form-control p-4 " name="city" placeholder="City"></div>
                        <div class="col"> <input type="text" class="form-control p-4" name="zipcode" placeholder="ZIPCODE"></div>
                    </div>
                    <div class="form-group row mb-5">
                        <div class="col"><textarea name="address" class="form-control" cols="40" rows="3" placeholder="Address"></textarea></div>
                    </div>

                    <div class="text-center">
                        <button type="submit" name="register" value="register" class="btn btn-primary">Register</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- end modals -->


<!-- SCRIPTS -->
<!-- JQuery -->
<script type="text/javascript"><%@include file="../js/jquery-3.4.1.min.js"%></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript"><%@include file="../js/popper.min.js"%></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript"><%@include file="../js/bootstrap.min.js"%></script>
<!-- MDB core JavaScript -->
<script type="text/javascript"><%@include file="../js/mdb.min.js"%></script>
<!-- Initializations -->
<script type="text/javascript">
    // Animations initialization
    new WOW().init();

    // password same in register
    $("#formRegister").on("submit",function () {

        if ($("#pwd").val().length==0 || $("#pwd").val() != $("#c_pwd").val()){
            $(this).prepend("<div class='alert alert-danger'>Please confirm the password</div>");
            setTimeout(function () {
                $("#formRegister .alert").hide();
            },4000);
            return false;
        }

        return true;

    });

    $("#formLogin").on("submit",function () {

        if ($("#email").val().length<=3 || $("#passwd").val().length<=3){
            $(this).prepend("<div class='alert alert-danger'>Please Enter Login info.</div>");
            setTimeout(function () {
                $("#formLogin .alert").hide();
            },4000);
            return false;
        }
        return true;
    });

    if ($(".myalert").length){
        setTimeout(function () {
            $(".myalert").hide();
        },5000);
    }

</script>
