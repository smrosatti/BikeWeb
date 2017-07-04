

<%@page import="Servlets.LoginServlet"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Userr" %>
<%@page import="Dal.Dal" %>
<%@page import="Model.Bikefood" %>
<!DOCTYPE html>
<html>
    <title>Menu Empreendedor</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
        body {font-size:16px;}
        .w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
        .w3-half img:hover{opacity:1}
    </style>
    <body>
        <% Userr us = (Userr) request.getSession().getAttribute("user");
            System.out.print(us.getName());
            Dal d = new Dal();
            ArrayList<Bikefood> bikes = new ArrayList(d.getBikes((int) us.getId()));
        %>

        <!-- Sidebar/menu -->
        <nav class="w3-sidebar w3-black w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
            <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
            <center>
                <div class="w3-container">
                    <h3 class="w3-padding-64"><b>Bem-Vindo<br><%=us.getName() + " " + us.getLastName()%></b></h3>
                </div>
            </center>
            <div class="w3-bar-block">
                <a href="MenuEmp.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Menu</a> 
                <a href="MeusBikes.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Cadastrar Bike Foods</a> 
                <a href="ListaBikes.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Listar Bikefoods</a> 
                <a href="index.html" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Sair</a> 
            </div>
        </nav>

        <!-- Top menu on small screens -->
        <header class="w3-container w3-top w3-hide-large w3-black w3-xlarge w3-padding">
            <a href="javascript:void(0)" class="w3-button w3-black w3-margin-right" onclick="w3_open()">☰</a>
            <span>iBKF</span>
        </header>

        <!-- Overlay effect when opening sidebar on small screens -->
        <div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:340px;margin-right:40px">

            <!-- Header -->
            <div class="w3-container" style="margin-top:40px" id="showcase">
                <h1 class="w3-xxlarge"><b>Você Possui: <%=bikes.size()%> Bike Food(s) Cadastrado(s)</b></h1>
                <center>
                    <hr style="width:150px;border:5px solid blue" class="w3-round">
                </center>
            </div>

            <!-- caroussel-->
            <div class="container">
                <h2>Meus Bike Foods</h2>  
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <%
                            if (bikes.isEmpty()) { %>

                        <div class="item active">
                            <h1 class="w3-xlarge">Você não possui Bikes Cadastrados</h1>
                            <h1 class="w3-xlarge">Obtenha o iBKF para cadastra-los</h1>
                            <img src="./Image/fd.jpg" alt="Bikefood" style="width:100%;">
                        </div>

                        <% } else {
                            for (int i = 0; i < bikes.size(); i++) {
                        %>

                        <div class="item <%if (bikes.get(0) == bikes.get(i)) {
                                out.print("active");
                            }%>">
                            <img src="./ImageBikes/bk<%= bikes.get(i).getId() %>.jpg" alt="Bikefood" style="width:100%; height: 700px;">
                        </div>
                        <%  }
                            }
                        %>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Anterior</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Próximo</span>
                    </a>
                </div>
            </div>



            <div class="w3-container" id="services" style="margin-top:75px">
                <h1 class="w3-xxxlarge w3-text-black"><center><b>Meus Bike Fooods</b></center></h1>
                <center> <hr style="width:150px;border:5px solid blue" class="w3-round"></center>


                <form action="VisualizaBikeServlet" method="POST" class="form-group">
                    <div class="w3-row w3-container" style="margin:50px 0">

                        <% for (int a = 0; a < bikes.size(); a++) {

                        %>

                        <div class="w3-half w3-container">
                            <div class="w3-topbar w3-border-amber">
                                <img src="./ImageBikes/bk<%=bikes.get(a).getId() %>.jpg" style="width:100%; height: 300px;">
                                <h2><%= bikes.get(a).getName()%></h2>

                                <a href="VisualizaBikeServlet?id=<%= bikes.get(a).getId() %>" class="w3-button w3-black w3-padding-large w3-large">Visualizar</a>
                                <p>Tipo: <%=bikes.get(a).getType().getType()%></p>
                            </div>

                        </div>

                        <%}%>

                    </div>
                </form>

            </div>

            <!-- Modal for full size images on click-->
            <div id="modal01" class="w3-modal w3-black" style="padding-top:0" onclick="this.style.display = 'none'">
                <span class="w3-button w3-black w3-xxlarge w3-display-topright">×</span>
                <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
                    <img id="img01" class="w3-image">
                    <p id="caption"></p>
                </div>
            </div>



            <!-- Packages / Pricing Tables -->
            <div class="w3-container" id="packages" style="margin-top:75px">
                <center>
                    <h1 class="w3-xxxlarge w3-text-black"><b>Meu Perfil</b></h1>
                    <hr style="width:50px;border:5px solid blue" class="w3-round">
                </center>
                <p>Cadastre seu Bikefood, suas próximas localizações e produtos! Seja um empreendedor e expanda seu negócio divulgando-o.</p>
            </div>

            <div class="w3-row-padding">
                <div class=" w3-hover-border-blue w3-margin-bottom">
                    <ul class="w3-ul w3-light-grey w3-center">
                        <li class="w3-dark-grey w3-xlarge w3-padding-32">Perfil Empreendedor</li>
                        <li class="w3-padding-16">Nome: <%=us.getName()%></li>
                        <li class="w3-padding-16">Sobrenome: <%=us.getLastName()%></li>
                        <li class="w3-padding-16">Email: <%=us.getEmail()%></li>
                        <li class="w3-padding-16">CPF: <%=us.getCpf()%></li>
                        <li class="w3-padding-16">Data de Nascimento: <%=us.getBirthday()%></li>
                        <li class="w3-padding-16">Tipo de Usuário: <%=us.getIdType().getUserType()%></li>

                        <li class="w3-light-grey w3-padding-24">
                            <button class="w3-button w3-blue w3-padding-large w3-hover-black">Editar Perfil</button>
                        </li>
                    </ul>
                </div>


            </div>

            <!-- Contact -->
            <div class="w3-container" id="contact" style="margin-top:75px">
                <h1 class="w3-xxxlarge w3-text-blue"><b>Obtenha o iBKF para Desktop</b></h1>
                <hr style="width:50px;border:5px solid blue" class="w3-round">
                <p>Você quer gerenciar seus Bike Foods com mais eficiência? Deseja ter controle completo sobre os locais em que seus Bike Foods estarão?
                    Obetenha o iBKF para desktop, instale-o em seu computador e cadastre seus cardápios, Bikes e localizações, edite seu perfil e obtenha informações sobre a modalidade Food Bikes.
                    iBKF - BIKEFOOD DE UM JEITO QUE VOCÊ NUNCA VIU!!!</p>
                <button class="w3-button w3-block w3-blue-gray w3-xxlarge" type="submit" value ="GitHub" 
                        onclick="window.open('https://github.com/samuelleand/Bikefood', '_blank');" style="width:80%">Obter o iBKF para Desktop
                </button>
            </div>

            <!-- End page content -->
        </div>

        <!-- W3.CSS Container -->
        <div class="w3-light-grey w3-container w3-padding-32" style="margin-top:75px;padding-right:58px"><p class="w3-right">Bike Foods <a href="http://bikefood.net/" title="W3.CSS" target="_blank" class="w3-hover-opacity">Empreendedorismo sobre rodas</a></p></div>

        <script>
            // Script to open and close sidebar
            function w3_open() {
                document.getElementById("mySidebar").style.display = "block";
                document.getElementById("myOverlay").style.display = "block";
            }

            function w3_close() {
                document.getElementById("mySidebar").style.display = "none";
                document.getElementById("myOverlay").style.display = "none";
            }

            // Modal Image Gallery
            function onClick(element) {
                document.getElementById("img01").src = element.src;
                document.getElementById("modal01").style.display = "block";
                var captionText = document.getElementById("caption");
                captionText.innerHTML = element.alt;
            }
        </script>

    </body>
</html>