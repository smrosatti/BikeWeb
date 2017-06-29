<%--
    Document   : MenuCli
    Created on : 25/06/2017, 15:46:06
    Author     : SARA
--%>

<%@page import="Model.Favorites"%>
<%@page import="Model.Userr"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Bikefood"%>
<%@page import="Model.Bikefood"%>
<%@page import="Dal.Dal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <<title>Menu Cliente</title>
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
    </head>

    <body>

        <% Userr us = (Userr) request.getSession().getAttribute("user");
            Dal dal = new Dal();
            ArrayList<Favorites> bikes = new ArrayList(dal.getFavorites((int)us.getId()));
        %>

        <!-- Sidebar/menu -->
        <nav class="w3-sidebar w3-black w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
            <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
            <center>
                <div class="w3-container">
                    <h3 class="w3-padding-64"><b>Bem-Vindo<br><%=us.getName()%></b></h3>
                </div>
            </center>
            <div class="w3-bar-block">
                <a href="IniciaMenuServlet" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Menu/Bikes Favoritos</a>
                <a href="IniciaEditarServlet" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Meu Perfil</a>
                <a href="IniciaListaBikesServlet" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Listar Bikefoods</a>
                <a href="SairServlet" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Sair</a>
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
                <h1 class="w3-xxlarge"><b>Visualize seus Bike Foods Favoritos</b></h1>
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
                            <h1 class="w3-xlarge">Você não possui Bikes Favoritados</h1>
                            <h1 class="w3-xlarge">Obtenha o iBKF ou vá até a lista de bikefoods para favoritá-los</h1>
                            <img src="./Image/fd.jpg" alt="Bikefood" style="width:100%;">
                        </div>

                        <% } else {
                            for (int i = 0; i < bikes.size(); i++) {
                        %>

                        <div class="item <%if (bikes.get(0) == bikes.get(i)) {
                                out.print("active");
                            }%>">
                            <img src="./ImageBikes/bikef<%= bikes.get(i).getIdFavorites()%>.jpg" alt="Bikefood" style="width:100%; height: 700px;">
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
                <h1 class="w3-xxlarge w3-text-black"><center><b>Meus Bike Foods Favoritos</b></center></h1>
                <center> <hr style="width:150px;border:5px solid blue" class="w3-round"></center>


                <form action="VisualizaBikeServlet" method="POST" class="form-group">
                    <div class="w3-row w3-container" style="margin:50px 0">

                        <% if (bikes.isEmpty()) { %>

                        <h1 class="w3-large w3-text-black"><center><b>Você não possui nenhum Bike Food favoritado</b></center></h1>

                        <% } else {
                            for (int a = 0; a < bikes.size(); a++) {

                        %>

                        <div class="w3-half w3-container">
                            <div class="w3-topbar w3-border-amber">
                                <img src="./ImageBikes/bikef<%=bikes.get(a).getId()%>.jpg" style="width:100%; height: 300px;">
                                <h2><%= bikes.get(a).getIdBikefood().getName()%></h2>

                                <a href="VisualizaBikeServlet?id=<%= bikes.get(a).getId()%>" class="w3-button w3-black w3-padding-large w3-large">Visualizar</a>
                                <a href="RemoverFavServlet?id=<%= bikes.get(a).getIdFavorites() %>" class="w3-button w3-black w3-padding-large w3-large">Remover dos Favoritos</a>
                                <p>Tipo: <%=bikes.get(a).getIdBikefood().getType().getType()%></p>
                            </div>

                        </div>

                        <%}
                            }%>


                </form>

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
                            <li class="w3-dark-grey w3-xlarge w3-padding-32">Perfil Cliente</li>
                            <li class="w3-padding-16">Nome: <%=us.getName()%></li>
                            <li class="w3-padding-16">Sobrenome: <%=us.getLastName()%></li>
                            <li class="w3-padding-16">Email: <%=us.getEmail()%></li>
                            
                            <li class="w3-padding-16">Data de Nascimento: <%=us.getBirthday()%></li>
                            <li class="w3-padding-16">Tipo de Usuário: <%=us.getIdType().getUserType()%></li>

                            <li class="w3-light-grey w3-padding-24">
                                <button href="IniciaEditarServlet" class="w3-button w3-blue w3-padding-large w3-hover-black">Editar Perfil</button>
                            </li>
                        </ul>
                    </div>


                </div>

            </div>
        </div>
   

    <div class="w3-container" id="contact" style="margin-top:75px">
        <h1 class="w3-xxxlarge w3-text-blue"><b>Obtenha o iBKF para Desktop</b></h1>
        <hr style="width:50px;border:5px solid blue" class="w3-round">
        <p>Gostaria de gerenciar seus Bike Foods favoritos de uma maneira mais eficiente? Gostaria de ter acesso as localizações e demais dados de todos os bike foods 
            para encontrar o mais perto de você? Faça download do iBKF versão Desktop e filtre, favorite e exclua da sua lista Bike Foods. 
            iBKF - BIKEFOOD DE UM JEITO QUE VOCÊ NUNCA VIU!!!</p>
        <button class="w3-button w3-block w3-blue-gray w3-xxlarge" type="submit" value ="GitHub" 
                onclick="window.open('https://github.com/samuelleand/Bikefood', '_blank');" style="width:80%">Obter o iBKF para Desktop
        </button>
    </div>

    <!-- End page content -->
</div>
                             

<!-- W3.CSS Container -->
<div class="w3-light-grey w3-container w3-padding-32" style="margin-top:75px;padding-right:58px"><p class="w3-right">Bike Foods <a href="http://bikefood.net/" title="W3.CSS" target="_blank" class="w3-hover-opacity">Empreendedorismo sobre rodas</a></p></div>


</body>
</html>
