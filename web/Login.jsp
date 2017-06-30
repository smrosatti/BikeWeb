<%-- 
    Document   : Login
    Created on : 22/06/2017, 11:14:41
    Author     : SARA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <body style="background: url('./Image/rua.jpg'); background-repeat: no-repeat; background-attachment: fixed; background-size: 100%;">
    <!-- Menu Bar ( topo ) -->
    <div class="w3-bar w3-black">
        <a href="index.html" class="w3-bar-item w3-button">Home</a>

        <a href="CadastroEmp.jsp" class="w3-bar-item w3-button">Cadastro Empreendedor</a>
        <a href="Cadastrocli.jsp" class="w3-bar-item w3-button">Cadastro Cliente</a>            
    </div><br>

    <br>
    <center>
        <div class="container">
            <div class="row vertical-offset-100">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Login</h3>
                        </div>
                        <div class="panel-body">
                            <form accept-charset="UTF-8" role="form">
                                <fieldset>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="E-mail" name="email" type="text">
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Password" name="senha" type="password" value="">
                                    </div>
                                    
                                    <input class="btn btn-lg btn-success btn-block" type="submit" value="Login">
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </center>
</body>
</html>
