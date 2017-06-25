<%-- 
    Document   : VisualizarBikefood
    Created on : 24/06/2017, 23:18:45
    Author     : SARA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${bike_nome}</title>

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

        <nav class="w3-sidebar w3-black w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
            <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
            <center>
                <div class="w3-container">
                    <h3 class="w3-padding-64"><b>Bike Food: <br>${bike_nome}</b></h3>
                </div>
            </center>
            <div class="w3-bar-block">
                <a href="MenuEmp.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Menu</a>
                <a href="meusbikes.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Meus Bikefoods</a> 
                <a href="listabikes.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Listar Bikefoods</a> 
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
                        <img src="./Image/bk.jpg" alt="Seu Bikefood" style="width:95%">
                        <div class="w3-display-topleft w3-text-black" style="padding:24px 48px">
                            <h1 class="w3-xxxlarge w3-hide-small">${bike_nome} Bike</h1>
                            <h1 class="w3-xlarge">Localização ${bike_local}</h1>
                            <p><a href="" class="w3-button w3-black w3-padding-large w3-large">Novo Bike Food</a></p>
                        </div>
                    </div>
                </div>
            </center>
                            
            <div class="w3-container" style="margin-top:15px" id="showcase">
                <h1 class="w3-xlarge"><center><b>Localização Pelo Mapa</b></center></h1>
                <center>
                    <hr style="width:150px;border:5px solid blue" class="w3-round">
                </center>
            </div>

            <div id="map"  style="height: 100%; margin: 50px;
                 padding: 300px;" ></div>



            <div class="w3-container" style="margin-top:40px" id="showcase">
                <h1 class="w3-xxlarge"><center><b>Cardápio</b></center></h1>
                <center>
                    <hr style="width:150px;border:5px solid blue" class="w3-round">
                </center>
            </div> 

            <br><br>

            <div class="w3-row-padding">
                <div class="w3-third w3-container w3-margin-bottom">
                    <img src="./Image/bk.jpg" alt="Norway" style="width:100%" class="w3-hover-opacity">
                    <div class="w3-container w3-white">
                        <br>
                        <p><b>${nome_prato} Nome</b></p>
                        <p>${ing} Estes São os ingredientes</p>
                    </div>
                </div>
            </div>
        </div>

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
            var map;
            function initMap() {
                map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: -34.397, lng: 150.644},
                    zoom: 8
                });
            }
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYhQxVgG8sVDp6C9UroEtcYfGLtUlEP3U&callback=initMap"
                async defer>
        </script>      

    </body>
</html>
