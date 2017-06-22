<%-- 
    Document   : Cadastrocli
    Created on : 22/06/2017, 14:31:45
    Author     : Aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Cliente</title>
        <link rel="stylesheet" href="css/form.css" type="text/css">
        <script src="js/form.js"></script>
        <link href="css/stylish-portfolio.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    </head>
    <body>
    <body>
        <!-- Cada campo -->
        <div class="group">
            <input requered name="nome" type="text" required>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label><span class="span-input">Nome</span></label>
        </div>
        <div class="group">
            <input requered name="sobrenome" type="text" required>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label><span class="span-input">Sobrenome</span></label>
        </div>
        <div class="group">
            <input requered name="email" type="text" required>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label><span class="span-input">E-mail</span></label>
        </div>

    </div>
    <div class="col-md-6">
        <div class="group">
            <input requered name="login" type="text" required>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label><span class="span-input">Login</span></label>
        </div>
        <div class="group">
            <input requered name="senha" type="password" required>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label><span class="span-input">Senha</span></label>
        </div>
        <div class="group">
            <input requered name="consenha" type="password" required>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label><span class="span-input">Confirmar senha</span></label>
        </div>
        <div class="wrapper">
            <span class="group-btn">     
                <a href="#" class="btn btn-primary btn-md">Cadastrar<i class="fa fa-sign-in"></i></a>
            </span>
        </div>
    </div>
</div>

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
</body>
</html>
