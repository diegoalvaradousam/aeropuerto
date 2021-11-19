<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

    <head>
        <title>Login V3</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->

        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="login_css/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="login_css/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="login_css/fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="login_css/vendor/animate/animate.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="login_css/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="login_css/vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="login_css/vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="login_css/vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="login_css/css/util.css">
        <link rel="stylesheet" type="text/css" href="login_css/css/main.css">
        <!--===============================================================================================-->
    <script type="text/javascript">
    window.history.forward();
    function noBack()
    {
        window.history.forward();
    }
</script>
    </head>

    <body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload="">

        <div class="limiter">
            <div class="container-login100" style="background-image: url('login_css/img/avion.jpg');">
                <div class="wrap-login100">
                    <form  action="clientes?action=login" method="POST" class="login100-form validate-form">
                        <span class="login100-form-logo">
                            <i class="zmdi zmdi-airplane"></i>
                        </span>

                        <span class="login100-form-title p-b-34 p-t-27">
                            Inicio de Sesion
                        </span>
                        
                            <div class="wrap-input100 validate-input" data-validate="Enter username">
                                <input id="username" class="input100" type="text" name="usuario" placeholder="Username" autocomplete="off">
                                <span class="focus-input100" data-placeholder="&#xf207;"></span>
                            </div>

                            <div class="wrap-input100 validate-input" data-validate="Enter password">
                                <input id="password" class="input100" type="password" name="clave" placeholder="Password" autocomplete="off">
                                <span class="focus-input100" data-placeholder="&#xf191;"></span>
                            </div>



                            <div class="container-login100-form-btn">
                                <button type="submit" class="login100-form-btn">
                                    Login
                                </button>
                            </div>
                        </form>





                    </form>
                </div>
            </div>
        </div>


        <div id="dropDownSelect1"></div>

        <!--===============================================================================================-->
        <script src="login_css/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="login_css/vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="login_css/vendor/bootstrap/js/popper.js"></script>
        <script src="login_css/vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="login_css/vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="login_css/vendor/daterangepicker/moment.min.js"></script>
        <script src="login_css/vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="login_css/vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="login_css/js/main.js"></script>

    </body>

</html>