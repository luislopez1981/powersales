<%
    //ResultSet rs = (ResultSet) request.getAttribute("encontrados");

    ResultSet busqueda = (ResultSet) request.getAttribute("busqueda");
    Boolean existeBusqueda = busqueda != null;

    String contactoId = "", nombre = "", apellido1 = "", apellido2 = "", coche = "";

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
        <title>Oferta</title>

        <!-- Bootstrap -->
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script>
            $().ready(function () {
                $.post('./CuentaOfertas',
                        function (responseText) {
                            $('#tablatotal').html(responseText);

                        });
            });
        </script>

        
    </head>

    <body>
        <header>
            <a href= "./Oferta.jsp"><h1 class="pull-left logo">PowerSales</h1></a>
            <div class="loginHome pull-right">
                <script>
                    var f = new Date();
                    document.write(f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
                </script>
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

        <div id="tablatotal"></div>
        <div class="container">

            <a href="CreaOferta.jsp" class="btn btn-default btn-lg">Crear oferta</a>

            <h5>Búsqueda de Ofertas</h5>
            

            <form action="./BuscaOferta" method="POST" id="buscaoferta">
                <label>Buscar Oferta</label>
                <input name="telefono" type="text" class="form-control" placeholder="Teléfono" required>
                <button type="submit">Buscar</button>
            </form>

            <table class="table">
                <%                            if (existeBusqueda) {
                %>

                <tr>
                    <th>Nombre</th>
                    <th>Primer Apellido</th>
                    <th>Segundo Apellido</th>
                    <th>Fecha</th>
                    <th>Marca</th>
                    <th>Modelo</th>
                    <th>Precio</th>
                    <th></th>
                 </tr>
                <%while (busqueda.next()) {%>
                <tr><form  action="./BuscaOferta2" method="POST">
                    
                    <td><%=busqueda.getString("nombre")%></td>
                    <td><%=busqueda.getString("apellido1")%></td>
                    <td><%=busqueda.getString("apellido2")%></td>
                    <td><%=busqueda.getString("fechaFormat")%></td>
                    <td><%=busqueda.getString("marca")%></td>
                    <td><%=busqueda.getString("modelo")%></td>
                    <td><%=busqueda.getString("precioFinal")%></td>
                    <td><input type="submit" value="Seleccionar"></td>
                    </tr>
                    <input type="hidden" name="idOferta" value="<%=busqueda.getString("idOferta")%>">
                </form>
                <%}
                    }%>
            </table>

        </div>


        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/myScript.js"></script>
        
    </body>
</html>