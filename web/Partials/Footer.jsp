
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
                <form action="login">
                    <div class="form-group mb-4">
                        <input type="email" class="form-control p-4 " name="email" placeholder="Enter email">
                    </div>
                    <div class="form-group  mb-5">
                        <input type="password" class="form-control p-4" name="pwd" placeholder="Enter password">
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Se Connecter</button>
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
                <form action="register">
                    <div class="form-group row mb-4">
                        <div class="col"><input type="text" class="form-control p-4 " name="nom" placeholder="First Name"></div>
                        <div class="col"><input type="text" class="form-control p-4 " name="prenom" placeholder="Last Name"></div>
                    </div>
                    <div class="form-group row mb-4">
                        <div class="col"><input type="text" class="form-control p-4 " name="username" placeholder="User Name"></div>
                        <div class="col"><input type="email" class="form-control p-4 " name="email" placeholder="Email"></div>
                    </div>
                    <div class="form-group row mb-4">
                        <div class="col"><input type="password" class="form-control p-4 " name="pwd" placeholder="Password"></div>
                        <div class="col"><input type="password" class="form-control p-4 " name="c_pwd" placeholder="Confirm Password"></div>
                    </div>
                    <div class="form-group row mb-4">
                        <div class="col"><select class="form-control" name="civil" id=""><option selected disabled>--Gender--</option><option value="f">Female</option><option value="m">Male</option></select></div>
                        <div class="col"><input type="file" class="form-control" name="avatar"><label for="">profil picture</label></div>
                    </div>
                    <div class="form-group row mb-4">
                        <div class="col"><input type="text" class="form-control p-4 " name="pays" placeholder=" Pays" ></div>
                        <div class="col"><input type="text" class="form-control p-4 " name="ville" placeholder=" City"></div>
                        <div class="col"> <input type="number" class="form-control p-4" name="zipcode" placeholder=" ZIPCODE"></div>
                    </div>
                    <div class="form-group row mb-5">
                        <div class="col"><textarea name="adresse" class="form-control" cols="40" rows="3" placeholder="Address"></textarea></div>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Register</button>
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

</script>
