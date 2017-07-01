<%-- 
    Document   : CadBikefood
    Created on : 26/06/2017, 20:10:01
    Author     : SARA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.City"%>
<%@page import="Model.BFType"%>
<%@page import="Model.State"%>
<%@page import="Model.Country"%>
<%@page import="Dal.Dal"%>
<%@page import="Model.Userr"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Bike Food </title>
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

        <%//Userr user = (Userr) request.getSession().getAttribute("user"); 

            Dal dal = new Dal();
            Country c = new Country();
            State s = new State();
            BFType b = new BFType();
            City ct = new City();

            ArrayList<Country> countrys = new ArrayList(dal.getList(c));
            dal = new Dal();
            ArrayList<State> states = new ArrayList(dal.getList(s));
            dal = new Dal();
            ArrayList<BFType> types = new ArrayList(dal.getList(b));
            dal = new Dal();
            ArrayList<City> citys = new ArrayList(dal.getList(ct));

        %>

        <!-- Menu e seus itens-->
        <nav class="w3-sidebar w3-black w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
            <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
            <center>
                <div class="w3-container">
                    <h3 class="w3-padding-64"><b>Cadastre um Novo Bike Food</b></h3>
                </div>
            </center>
            <div class="w3-bar-block">
                <a href="IniciaMenuServlet" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Menu/Meus Bikes</a>              
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
        <!-- fim do menu-->

        <div class="w3-main" style="margin-left:300px;margin-right:40px" >

            <!-- Cadastro-->
            <div id="top" class="header" >

                <div class="container" style=" opacity: 1;">
                    <div class="row">
                        <div class="col-md-12" style="background-color: black; padding: 15px 15px; opacity: 0.9;">
                            
                            
                           <!-- <form action="UploadImgServlet?bf=" method="POST" enctype="multipart/form-data" style="margin: 40px;">   
                                <img name="setimg" src="./Image/bfpadrao.jpg" style="width:30%; opacity: 1;">
                                <br><br>
                                <input type="file" name="file" class=" w3-border-white w3-large btn-dark" value="img" ><br>
                                  
                               <button type="submit" class="w3-button w3-grey w3-medium w3-hover-blue" >Mudar Imagem</button>      
                            </form>-->
                            
                            
                            <form action="CadBikeServlet" method="POST" class="form-group">
                                <%                                    try {
                                        Boolean errocnpj = (Boolean) request.getAttribute("erro_cnpj");
                                        if (errocnpj) {
                                %>
                                <div class="alert alert-warning alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <strong>Erro!</strong> CNPJ inválido;
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
                                            <input name="nome" type="text" required="">
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label><span class="span-input">Nome Bike Food</span></label>
                                        </div>

                                        <div class="group">
                                            <input name="telefone" type="number" required=""  >
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label><span class="span-input">Telefone</span></label>
                                        </div>

                                        <div class="group">
                                            <input requered name="cnpj" type="number" required=""  >
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label><span class="span-input">CNPJ</span></label>
                                        </div>

                                        <div class="group">
                                            <a class="w3-text-white w3-medium">Especialidade:       </a>
                                            <select name="especialidade" class="form-control">
                                                <%
                                                    for (int i = 0; i < types.size(); i++) {

                                                %>
                                                <option value="<%=types.get(i).getId()%>" ><%=types.get(i).getType()%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>

                                        <div class="group">
                                            <a class="w3-text-white w3-medium">País:       </a>
                                            <select name="pais" class="form-control">
                                                <%
                                                    for (int i = 0; i < countrys.size(); i++) {

                                                %>
                                                <option value="<%=countrys.get(i).getId()%>" ><%=countrys.get(i).getCountryName()%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>

                                        <div class="group">
                                            <a class="w3-text-white w3-medium">Estado:       </a>
                                            <select name="estado" class="form-control">
                                                <%
                                                    for (int i = 0; i < states.size(); i++) {

                                                %>
                                                <option value="<%=states.get(i).getId()%>" ><%=states.get(i).getStateName()%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>

                                        <div class="group">
                                            <a class="w3-text-white w3-medium">Cidade:       </a>
                                            <select name="cidade" class="form-control">
                                                <%
                                                    for (int i = 0; i < citys.size(); i++) {

                                                %>
                                                <option value="<%=citys.get(i).getId()%>" ><%=citys.get(i).getCityName()%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>


                                        <div class="group">
                                            <input name="dtinicio" type="date" required="">
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label><span class="span-input">Inicio de estadia no local</span></label>
                                        </div>

                                        <div class="group">
                                            <input name="dtfinal" type="date" required="" id="data" >
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label><span class="span-input">Fim de estadia no local</span></label>
                                        </div>

                                        <div class="group">
                                            <input name="rua" type="text" required="" >
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label><span class="span-input">Nome da Rua</span></label>
                                        </div>

                                        <div class="group">
                                            <input name="bairro" type="text" required="">
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label><span class="span-input">Nome do Bairro</span></label>
                                        </div>

                                        <div class="group">
                                            <input name="numero" type="text" required="">
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label><span class="span-input">Número</span></label>
                                        </div>

                                        <br>
                                        <center>
                                            <div class="group">
                                                <button type="submit" class="w3-btn btn-primary w3-large w3-hover-white" >Continuar Cadastro</button>                             
                                            </div>    
                                        </center>
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

