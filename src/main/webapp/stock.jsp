<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cice.powersales.dto.ContactoDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>PowerSales</title>
        <!-- Bootstrap -->
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">

        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script>
            $(document).ready(function () {
                $('#submit2').click(function (event) {
                    var matriculaVar = $('#matricula').val();
                    $.post('./BuscaVehiculo', {
                        matricula: matriculaVar
                    }, function (responseText) {
                        $('#tablacoches').html(responseText);
                    });
                });
            });
        </script>

    </head>

    <body>
        <header>
            <div class="container">
                <a href= "./panelprincipal.jsp"><h1 class="pull-left logo">PowerSales</h1></a>
                <!-- <div class="loginHome pull-right">
                    <script>
                        var f = new Date();
                        document.write(f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
                    </script>
                </div> -->
                <nav class="pull-right">
                    <ul class="nav navbar-nav">
                       <li role="presentation">
                          <a class="" href="Oferta.jsp" role="button">Ofertas</a>
                       </li>
                       <li role="presentation">
                          <a class="" href="contactos.jsp" role="button">Contactos</a>
                       </li>
                       <li role="presentation">
                          <a class="active" href="stock.jsp" role="button">Stock</a>
                       </li>
                       <li role="presentation">
                          <a class="" href="pedidos.jsp " role="button">Pedidos</a>
                       </li>
                    </ul>
                </nav>
            </div>
        </header>

        
        <div class="container stock">
            <div class="content">
                <form id="form1">
                    <div class="form-group">
                        <label>Matrícula:</label>
                        <input type="text" id="matricula" />
                    </div>
                    
                    <input  class="btn btn-default" type="button" id="submit2" value="Buscar" />
                </form>
                
                <div class="tablacoches" id="tablacoches">
                   
                </div>
            </div>

            
            

        </div>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/myScript.js"></script>

    </body>
</html>