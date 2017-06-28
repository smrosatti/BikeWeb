<%-- 
    Document   : ListaBikes
    Created on : 25/06/2017, 15:59:09
    Author     : SARA
--%>

<%@page import="Model.Userr"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Dal.Dal"%>
<%@page import="Model.Bikefood"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Bike Foods</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <body>
        
        <% Userr u = (Userr) request.getSession().getAttribute("user"); %>

        <nav class="w3-sidebar w3-black w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
            <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
            <center>
                <div class="w3-container">
                    <h3 class="w3-padding-64"><b>Bike Foods</b></h3>
                </div>
            </center>
            <div class="w3-bar-block">
                <a href="IniciaMenuServlet" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Menu</a>
                <a href="IniciaEditarServlet" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Meu Perfil</a> 
                <a href="index.html" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Sair</a> 
            </div>
        </nav>

        <header class="w3-container w3-top w3-hide-large w3-black w3-xlarge w3-padding">
            <a href="javascript:void(0)" class="w3-button w3-black w3-margin-right" onclick="w3_open()">☰</a>
            <span>iBKF</span>
        </header>

        <div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay">Fechar Menu</div>

        <div class="w3-main" style="margin-left:340px;margin-right:20px">

            <div class="w3-container" style="margin-top:10px" id="showcase">
                <h1 class="w3-xxlarge"><center><b>Bike Foods Cadastrados</b></center></h1>
                <center>
                    <hr style="width:150px;border:5px solid blue" class="w3-round">
                </center>
            </div>

            <div class="w3-row w3-container" style="margin:50px 0">
                <%  Bikefood bf = new Bikefood();
                    Dal dal = new Dal();
                    ArrayList<Bikefood> bikes = new ArrayList(dal.getList(bf));
                    for (int i = 0; i < bikes.size(); i++) {    %>

                <div class="w3-half w3-container">
                    <div class="w3-topbar w3-border-amber">
                        <img src="./ImageBikes/bk<%=bikes.get(i).getId() %>.jpg" style="width:100%; height: 300px;">
                        <h2>Nome: <%=bikes.get(i).getName() %></h2>
                         <a href="VisualizaBikeServlet?id=<%= bikes.get(i).getId() %>" class="w3-button w3-black w3-padding-large w3-large">Visualizar</a>
                         <p>Localização: <%=bikes.get(i).getLocations().get(bikes.get(i).getLocations().size()-1).getStreet() %> - <%=bikes.get(i).getLocations().get(bikes.get(i).getLocations().size()-1).getDistrict()  %>
                            </p>
                        <p>Número: <%=bikes.get(i).getLocations().get(bikes.get(i).getLocations().size()-1).getNumber() %></p>
                    </div>
                </div>

                <% }%>
            </div>
        </div>

    </body>
</html>
