<%-- 
    Document   : Login
    Created on : 22/06/2017, 11:14:41
    Author     : SARA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="css/form.css" type="text/css">
    <script src="js/form.js"></script>
    <link href="css/stylish-portfolio.css" rel="stylesheet">
    <link rel="stylesheet" href="css/w3.css">
    <link href="bootstrap/css/font-awesome.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    <body style="background: url('./Image/rua.jpg'); background-repeat: no-repeat; background-attachment: fixed; background-size: 100%;">
        <!-- Menu Bar ( topo ) -->
        <div class="w3-bar w3-black">
            <a href="index.html" class="w3-bar-item w3-button">Home</a>

            <a href="CadastroEmp.jsp" class="w3-bar-item w3-button">Cadastro Empreendedor</a>
            <a href="Cadastrocli.jsp" class="w3-bar-item w3-button">Cadastro Cliente</a>            
        </div><br>

        <header id="top" class="header" style="align-items: center">
            <center>
                <br>
                <center><label><span class="span-input text-uppercase">Login</span></label></center>
                <div class="container" style="margin-top: 100px; opacity: 1;">
                    <div class="row">
                        <div class="col-md-6 " style="background-color: black; padding: 30px 20px; opacity: 0.9;">
                            <div class="form-login" style="margin: 20px;">


                                <!-- Cada campo -->
                                <div class="group">
                                    <input requered name="email" type="text" required>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label><span class="span-input">Email</span></label>
                                </div>
                                <div class="group">
                                    <input requered name="senha" type="password" required>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label><span class="span-input">Senha</span></label>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </center>
        </header>





        <!-- Custom Theme JavaScript -->
        <script>
            // Closes the sidebar menu
            $("#menu-close").click(function (e) {
                e.preventDefault();
                $("#sidebar-wrapper").toggleClass("active");
            });
            // Opens the sidebar menu
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#sidebar-wrapper").toggleClass("active");
            });
            // Scrolls to the selected menu item on the page
            $(function () {
                $('a[href*=#]:not([href=#],[data-toggle],[data-target],[data-slide])').click(function () {
                    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {
                        var target = $(this.hash);
                        target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                        if (target.length) {
                            $('html,body').animate({
                                scrollTop: target.offset().top
                            }, 1000);
                            return false;
                        }
                    }
                });
            });
            //#to-top button appears after scrolling
            var fixed = false;
            $(document).scroll(function () {
                if ($(this).scrollTop() > 250) {
                    if (!fixed) {
                        fixed = true;
                        // $('#to-top').css({position:'fixed', display:'block'});
                        $('#to-top').show("slow", function () {
                            $('#to-top').css({
                                position: 'fixed',
                                display: 'block'
                            });
                        });
                    }
                } else {
                    if (fixed) {
                        fixed = false;
                        $('#to-top').hide("slow", function () {
                            $('#to-top').css({
                                display: 'none'
                            });
                        });
                    }
                }
            });
            // Disable Google Maps scrolling
            // See http://stackoverflow.com/a/25904582/1607849
            // Disable scroll zooming and bind back the click event
            var onMapMouseleaveHandler = function (event) {
                var that = $(this);
                that.on('click', onMapClickHandler);
                that.off('mouseleave', onMapMouseleaveHandler);
                that.find('iframe').css("pointer-events", "none");
            }
            var onMapClickHandler = function (event) {
                var that = $(this);
                // Disable the click handler until the user leaves the map area
                that.off('click', onMapClickHandler);
                // Enable scrolling zoom
                that.find('iframe').css("pointer-events", "auto");
                // Handle the mouse leave event
                that.on('mouseleave', onMapMouseleaveHandler);
            }
            // Enable map zooming with mouse scroll when the user clicks the map
            $('.map').on('click', onMapClickHandler);
        </script>
    </body>
</html>
