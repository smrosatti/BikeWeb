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
    <body>

        <!--<header class="w3-container w3-teal">
            <h1>Login</h1>
        </header>-->
        
         <div class="w3-bar w3-black">
            <a href="index.html" class="w3-bar-item w3-button">Home</a>
            <a href="CadastroEmp.jsp" class="w3-bar-item w3-button">Cadastro Empreendedor</a>
            <a href="CadastroCli.jsp" class="w3-bar-item w3-button">Cadastro Cliente</a>            
        </div>

        <div class="w3-container w3-half w3-margin-top">
                <div class="text-center"></div>
            <form class="w3-container w3-card-4">

                <p>
                    <input name="login_usuario" class="w3-input" type="text" style="width:90%" required>
                    <label>Usuário</label>
                </p>
        
                <p>
                     <input name="login_senha" class="w3-input" type="password" style="width:90%" required>
                     <label>Senha</label>
                </p>

                <p>
                    <button class="w3-button w3-section w3-teal w3-ripple"> Login </button>
                </p>

            </form>
        </div>
    </body>
</html>
