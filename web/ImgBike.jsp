<%-- 
    Document   : ImgBike
    Created on : 05/07/2017, 22:58:10
    Author     : Aluno
--%>

<%@page import="Model.Userr"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finalizar Cadastro Bike Food</title>
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
    </head>

    <%
        Userr us = (Userr) request.getSession().getAttribute("user");
    %>

    <body style="background: url('./Image/rua.jpg'); background-repeat: no-repeat; background-attachment: fixed; background-size: 100%;" >
        <!-- Sidebar/menu -->
        <nav class="w3-sidebar w3-black w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
            <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
            <center>
                <div class="w3-container">
                    <h3 class="w3-padding-64"><b>Cadastro Concluído Altere a Imagem do seu Bikefood<br><%=us.getName() + " " + us.getLastName()%></b></h3>
                </div>
            </center>
            <div class="w3-bar-block">
                <a href="IniciaMenuServlet" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Menu</a> 
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

            <div class="row">
                <div class="col-md-12" style="background-color: black; padding: 30px 20px; opacity: 0.9; margin-top: 50px;">
                    <form action="UploadImgServlet?bf=${bike}" method="POST" enctype="multipart/form-data" style="margin: 40px;">   
                        <h3 class="w3-medium"><label><span class="span-input">Esta é a Imagem padrão para Bike Foods</span></label></h3>
                        <img name="setimg" src="./Image/bfpadrao.jpg" style="width:30%; opacity: 1;">
                        <br><br><br>
                        <h3 class="w3-medium"><label><span class="span-input">Escolha uma Imagem para altera-la</span></label></h3><br>
                        <input type="file" name="file" class=" w3-border-white w3-large btn-dark" value="img" ><br>

                        <button type="submit" class="w3-button w3-large btn-primary w3-hover-white" >Confirmar</button>      
                    </form>
                </div>

            </div>
        </div>
    </body>
</html>
