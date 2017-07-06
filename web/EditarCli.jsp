<%-- 
    Document   : EditarCli
    Created on : 26/06/2017, 07:55:32
    Author     : SARA
--%>

<%@page import="Model.Userr"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Cliente</title>
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
    <body style="background: url('./Image/rua.jpg'); background-repeat: no-repeat; background-attachment: fixed; background-size: 100%;">
        
        <%Userr user = (Userr) request.getSession().getAttribute("user"); %>

        <!-- Menu e seus itens-->
        <nav class="w3-sidebar w3-black w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
            <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
            <center>
                <div class="w3-container">
                    <h3 class="w3-padding-64"><b>Editar Perfil<br><%=user.getName() %></b></h3>
                </div>
            </center>
            <div class="w3-bar-block">
                <a href="IniciaMenuServlet" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Menu/Bikes Favoritos</a>              
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
        <!-- fim do menu-->
        
        <div class="w3-main" style="margin-left:300px;margin-right:40px" >

        <!-- Editar Cliente-->
        <div id="top" class="header" >

            <div class="container" style=" opacity: 1;">
                <div class="row">
                    <div class="col-md-12" style="background-color: black; padding: 15px 15px; opacity: 0.9;">
                        <form action="EditarCliServlet" method="POST" class="form-group">
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
                                <div class="col-md-12">
                                    <!-- Cada campo -->
                                    <div class="group">
                                        <input name="nome" type="text" required="" value="<%=user.getName() %>">
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><span class="span-input">Nome</span></label>
                                    </div>
                                    <div class="group">
                                        <input name="sobrenome" type="text" required="" value="<%=user.getLastName() %>" >
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><span class="span-input">Sobrenome</span></label>
                                    </div>
                                    <div class="group">
                                        <input requered name="email" type="email" required="" value="<%=user.getEmail() %>" >
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><span class="span-input">E-mail</span></label>
                                    </div>
                                
                                    <div class="group">
                                        <input name="aniversario" type="date" required="" value="<%=user.getBirthday() %>" >
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label><span class="span-input">Data de Nascimento</span></label>
                                    </div>
                                    <div class="group">
                                        <input name="senha" type="password" required="" >
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

                                        <input type="radio" name="gender" value="female" required="" ><label><span class="span-input">Mulher</span></label><br>

                                        <input type="radio" name="gender" value="male" required="" ><label><span class="span-input">Homem</span></label><br>
                                        
                                    </div><br>
                                    <br>
                                    <br>
                                    <div class="group">
                                        <button type="submit" class="w3-btn btn-primary" >Salvar</button>                             
                                    </div>                                 
                                </div>
                                
                            </div>
                        </form>
                    </div>
                </div>
            </div>
                            
        </div>
        </div>
        <!-- fim do editar-->




    </body>
</html>
