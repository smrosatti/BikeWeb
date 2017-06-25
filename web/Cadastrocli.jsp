<%-- 
    Document   : Cadastrocli
    Created on : 22/06/2017, 14:31:45
    Author     : Aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro de Clientes</title>
        <link rel="stylesheet" href="css/form.css" type="text/css">
        <script src="js/form.js"></script>
        <link href="css/stylish-portfolio.css" rel="stylesheet">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="css/w3.css">
        <link href="bootstrap/css/font-awesome.min.css" rel="stylesheet">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    </head>

    <body style="background: url('./Image/rua.jpg'); background-repeat: no-repeat; background-attachment: fixed; background-size: 100%;">

        <!-- Menu Bar ( topo ) -->
        <div class="w3-bar w3-black">
            <a href="index.html" class="w3-bar-item w3-button">Home</a>
            <a href="Login.jsp" class="w3-bar-item w3-button">Login</a>
            <a href="CadastroEmp.jsp" class="w3-bar-item w3-button">Cadastro Empreendedor</a>            
        </div>

        <!-- Header -->
        <header id="top" class="header">

            <div class="container" style="margin-top: 100px; opacity: 1;">
                <div class="row">
                    <div class="col-md-12" style="background-color: black; padding: 30px 20px; opacity: 0.9;">
                        <form action="CadastroCliServlet" method="GET" class="form-group">
                            <%
                                try {
                                Boolean erro = (Boolean) request.getAttribute("erro");
                                if (erro) {
                            %>
                            <div class="alert alert-warning alert-dismissible" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <strong>Erro!</strong> Confirmação da senha incorreta!
                            </div>
                                <% }
                                } catch (Exception ex) {
                                    ex.getMessage();
                                }
                            %>
                            <div class="form-login" style="margin: 20px;">
                                <div class="col-md-6">
                                    <!-- Cada campo -->
                                    <div class="group">
                                        <input name="nome" type="text" required="">
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><span class="span-input">Nome</span></label>
                                    </div>
                                    <div class="group">
                                        <input name="sobrenome" type="text" required="">
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><span class="span-input">Sobrenome</span></label>
                                    </div>
                                    <div class="group">
                                        <input requered name="email" type="email" required="">
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><span class="span-input">E-mail</span></label>
                                    </div>
                                    <div class="group" >
                                        <input name="pathimg" type="file" accept="image/*" required="">
                                    </div>

                                </div>
                                <div class="col-md-6">
                                    <div class="group">
                                        <input name="aniversario" type="date" required="">
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><span class="span-input">Data de Nascimento</span></label>
                                    </div>
                                    <div class="group">
                                        <input name="senha" type="password" required="">
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><span class="span-input">Senha</span></label>
                                    </div>
                                    <div class="group">
                                        <input name="consenha" type="password" required="">
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><span class="span-input">Confirmar senha</span></label>
                                    </div>
                                    <div>
                                        <input type="radio" name="gender" value="female" required=""><label><span class="span-input">Mulher</span></label><br>
                                        <input type="radio" name="gender" value="male" required=""><label><span class="span-input">Homem</span></label><br>
                                    </div><br>
                                    <br>
                                    <br>
                                    <div class="group">
                                        <button type="submit" class="w3-btn btn-primary" >Cadastro</button>                             
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
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