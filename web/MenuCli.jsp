<%-- 
    Document   : MenuCli
    Created on : 25/06/2017, 15:46:06
    Author     : SARA
--%>

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
        <!-- Sidebar/menu -->
        <nav class="w3-sidebar w3-black w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
            <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
            <center>
                <div class="w3-container">
                    <h3 class="w3-padding-64"><b>Bem-Vindo<br>${nome_user}</b></h3>
                </div>
            </center>
            <div class="w3-bar-block">
                <a href="MenuCli.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Menu/Bikes Favoritos</a> 
                <a href="EditarCli.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Meu Perfil</a> 
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
                <h1 class="w3-xxlarge"><b>Visualize seus Bike Foods Favoritos ${nome_usuer}</b></h1>
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
                    
                    <% //Userr user = (Userr) request.getAttribute("user");%>
                    
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <% // Dal dal = new Dal();
                        
                           // ArrayList<Bikefood> ar = new ArrayList(dal.getFavorites((int) user.getId()));
                            //for(int i = 0; i<ar.size(); i++){
                        %>
                        <div class="item active">
                            <img src=./ImageBikes/<%// ar.get(i).getImg();%> alt="Bikefood" style="width:100%;">
                        </div>
                        <%//}%>
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
        </div>
        
    </body>
</html>
