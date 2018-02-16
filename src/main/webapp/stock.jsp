<%
    /*ResultSet rs = (ResultSet) request.getAttribute("encontrados");

    ResultSet busqueda = (ResultSet) request.getAttribute("busqueda");
    Boolean existeBusqueda = busqueda != null;

    String contactoId = "", nombre = "", apellido1 = "", apellido2 = "", coche = "";*/

%>
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
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>stock</title>

        <!-- Bootstrap -->
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script>
            $(document).ready(function () {
                $('#submit2').click(function (event) {
                    var matriculaVar = $('#matricula').val();


                    $.post('./BuscaVehiculo', {
                        matricula: matriculaVar,

                    }, function (responseText) {
                        $('#tablacoches').html(responseText);
                    });
                });
            });
        </script>

        
    </head>

    <body>
        <header>
            <h1 class="pull-left logo">PowerSales</h1>
            <div class="loginHome pull-right">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                <p class="user">Nombre Apellidos</p>
            </div>
        </header>
        <main>
            <div class="menuHome">
                <ul>
                    <li role="presentation">
                        <a class="btn btn-default btn-lg" href="Oferta.jsp" role="button">Ofertas</a>
                    </li>
                    <li role="presentation">
                        <a class="btn btn-default btn-lg" href="contactos.jsp" role="button">Contactos</a>
                    </li>
                    <li role="presentation">
                        <a class="btn btn-default btn-lg" href="stock.jsp" role="button">Stock</a>
                    </li>
                </ul>
            </div>

        </main>

        <div class="container">
            

            <h5>Búsqueda de vehículo</h5>
            <form id="form1">
                Matrícula:<input type="text" id="matricula" />
                <input type="button" id="submit2" value="Buscar" />
            </form>
            <br>
                    <div id="tablacoches"></div>

        </div>


        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/myScript.js"></script>
        
    </body>
</html>