<%-- 
    Document   : VisualizarBikefood
    Created on : 24/06/2017, 23:18:45
    Author     : SARA
--%>

<%@page import="Model.Userr"%>
<%@page import="Model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Bikefood"%>
<%@page import="Dal.Dal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Visualiza Bike Food</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <style>
            #map {
                height: 100%;
            }
            body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
            body {font-size:16px;}
            .w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
            .w3-half img:hover{opacity:1}
        </style>
    </head>

    <body>

        <% Bikefood bf = (Bikefood) request.getAttribute("bike");

            Dal dal = new Dal();
            ArrayList<Product> c = new ArrayList(dal.getProducts((int) bf.getId()));

            Userr u = (Userr) request.getSession().getAttribute("user");

        %>

        <nav class="w3-sidebar w3-black w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
            <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
            <center>
                <div class="w3-container">
                    <h3 class="w3-padding-64"><b>Bike Food: <br><%=bf.getName()%></b></h3>
                </div>
            </center>
            <div class="w3-bar-block">

                <a href= "IniciaMenuServlet" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Menu Inicial</a>
                <a href= "GerarPdfServlet?id=<%=bf.getId()%>" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Gerar PDF do Cardápio</a>
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
                <h1 class="w3-xxlarge"><center><b>Bike Food</b></center></h1>
                <center>
                    <hr style="width:150px;border:5px solid blue" class="w3-round">
                </center>
            </div>

            <center>
                <div class="w3-container" style="margin-top:10px" >
                    <div class="w3-display-container w3-container">
                        <img src="./ImageBikes/bk<%=bf.getId()%>.jpg" alt="Seu Bikefood" style="width:70%; height: 70%;">
                        <div class="w3-left-align w3-text-black" style="padding:24px 48px">
                            <h1 class="w3-xxxlarge w3-hide-small"><%=bf.getName()%></h1>
                            <h1 class="w3-xlarge">Telefone: <%=bf.getTel()%></h1>
                            <h1 class="w3-xlarge">Localização: <%=bf.getLocations().get(bf.getLocations().size() - 1).getStreet()%> - <%=bf.getLocations().get(bf.getLocations().size() - 1).getDistrict()%></h1>
                            <h1 class="w3-xlarge">Número: <%=bf.getLocations().get(bf.getLocations().size() - 1).getNumber()%></h1>
                            <!-- <p><a href="" class="w3-button w3-black w3-padding-large w3-large">Novo Bike Food</a></p>-->
                        </div>
                    </div>
                </div>
            </center>

            <div class="w3-container" style="margin-top:15px" id="showcase">
                <h1 class="w3-xxlarge"><center><b>Localização Pelo Mapa</b></center></h1>
                <center>
                    <hr style="width:150px;border:5px solid blue" class="w3-round">
                </center>
            </div>
            <!-- GOOGLE MAPS -->
            <!--<div id="map"  style="height: 100%; margin: 50px;
                 padding: 300px;" >

            </div>-->


            <!-- iNICIA CARDAPIO-->
            <div class="w3-container" style="margin-top:40px" id="showcase">
                <h1 class="w3-xxlarge"><center><b>Cardápio</b></center></h1>
                <center>
                    <hr style="width:150px;border:5px solid blue" class="w3-round">
                </center>
            </div> 

            <br><br>

            <div class="w3-row-padding">
                <%                    if (c.isEmpty()) { %>

                <div class="w3-container" style="margin-top:10px" >
                    <div class="w3-display-container w3-container">
                        <img src="./Image/fd.jpg" alt="Seu Bikefood" style="width:95%">
                        <div class="w3-display-topleft w3-text-black" style="padding:24px 48px">
                            <h1 class="w3-xxxlarge w3-hide-small">Este Bike Food não possui cardápio</h1>
                            <h1 class="w3-xlarge">Obtenha o iBKF para Desktop e cadastre um Cardápio</h1>
                            <p><a href="https://github.com/samuelleand/Bikefood" class="w3-button w3-black w3-padding-large w3-large">Obter o iBKF para Desktop</a></p>
                        </div>
                    </div>
                </div>

                <%  } else {
                    for (int i = 0; i < c.size(); i++) {%>

                <div class="w3-third w3-container w3-margin-bottom">
                    <img src="./ImageCardapios/product<%=c.get(i).getId()%>.jpg" alt="Norway" style="width:100%; height: 270px;" class="w3-hover-opacity">
                    <div class="w3-container w3-white">
                        <br>
                        <p><b>Nome: <%=c.get(i).getName()%></b></p>
                        <p><b>Preço: <%= c.get(i).getPrice()%></b></p>
                        <p> Ingredientes: <%=c.get(i).getIngredients()%></p>
                        <% if (c.get(i).getIdBikefood().getIdUser().getId() == u.getId()) {%>
                        <p><a href="ExcluiItemServlet?idp=<%=c.get(i).getId()%>&idb=<%=c.get(i).getIdBikefood().getId()%>" class="w3-button w3-black w3-padding-large w3-large">Excluir Item do Cardápio</a></p>
                        <% } %>
                    </div>
                </div>

                <% }
                    }
                %>
            </div>
        </div>
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

            //mapa
            //var map;
            // function initMap() {
            // map = new google.maps.Map(document.getElementById('map'), {

            // center: {lat: -34.397, lng: 150.644},
            //zoom: 8
            // });
            // }
        </script>

        <script src='https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyBhKy4iSWcZp6EX9RY_pRJ1ZKlKl9htZ4U'></script>
        <div style='overflow:hidden;height:400px;width:520px;'>
            <div id='gmap_canvas' style='height:400px;width:520px;'></div>
            <style>#gmap_canvas img{max-width:none!important;background:none!important}</style>
        </div> 
        <a href='http://maps-generator.com/pt'>www.maps-generator.com</a> 
        <script type='text/javascript' src='https://embedmaps.com/google-maps-authorization/script.js?id=430973df6ff1f8f8d8fe62675df12476dc3aa95b'></script>
        <script type='text/javascript'>
            function init_map() {
                var myOptions = {zoom: 12, center: new google.maps.LatLng(-25.3704069, -49.07567130000001), mapTypeId: google.maps.MapTypeId.ROADMAP};
                map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);
                marker = new google.maps.Marker({map: map, position: new google.maps.LatLng(-25.3704069, -49.07567130000001)});
                infowindow = new google.maps.InfoWindow({content: '<strong>mapa</strong><br> Vinte e Cinco de Janeiro <br> Quatro Barras<br>'});
                google.maps.event.addListener(marker, 'click', function () {
                    infowindow.open(map, marker);
                });
                infowindow.open(map, marker);
            }
            google.maps.event.addDomListener(window, 'load', init_map);</script>

        <!--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYhQxVgG8sVDp6C9UroEtcYfGLtUlEP3U&callback=initMap"
                
                async defer>
        </script>-->

    </body>
</html>
