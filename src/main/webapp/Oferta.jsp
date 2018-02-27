<%
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
        <title>PowerSales</title>

        <!-- Bootstrap -->
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">

        <script src="http://code.jquery.com/jquery-latest.js"></script>
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
                      <a class="active" href="Oferta.jsp" role="button">Ofertas</a>
                   </li>
                   <li role="presentation">
                      <a class="" href="contactos.jsp" role="button">Contactos</a>
                   </li>
                   <li role="presentation">
                      <a class="" href="stock.jsp" role="button">Stock</a>
                   </li>
                   <li role="presentation">
                      <a class="" href="pedidos.jsp " role="button">Pedidos</a>
                   </li>
                </ul>
            </nav>
            </div>
        </header>

       
        <div class="container oferta">

            <div class="btn-100">
                <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
                <a href="CreaOferta.jsp" class="btn btn-default">Crear oferta</a>
            </div>


            <div class="content">
                <form action="./BuscaOferta" method="POST" id="buscaoferta">
                    <div class="form-group">
                        <label>Buscar Oferta</label>
                        <input name="telefono" type="text" class="form-control" placeholder="Teléfono" required>
                    </div>
                    <button class="btn btn-default" type="submit">Buscar</button>
                </form>

                <table class="table table-bordered table-hover">
                    <%                            if (existeBusqueda) {
                    %>
                    <thead>
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
                    </thead>
                    
                    <tbody>
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
                    </tbody>
                </table>
            </div>
            

        </div>


        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/myScript.js"></script>

    </body>
</html>