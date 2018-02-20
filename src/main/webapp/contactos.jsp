<%
//    ResultSet rs = (ResultSet) request.getAttribute("encontrados");

    ResultSet busqueda = (ResultSet) request.getAttribute("busqueda");
    Boolean existeBusqueda = busqueda != null;

    String idContacto = "", nombre = "", apellido1 = "", apellido2 = "", coche = "";

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

        <title>contactos</title>

        <!-- Bootstrap -->
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

        <script src="http://code.jquery.com/jquery-latest.js"></script> 
        <!--                <script>
                            $(document).ready(function () {
                                $('#submit').click(function (event) {
                                    var telefonoVar = $('#telefono').val();
                
                
                                    $.post('./BuscaContacto', {
                                        telefono: telefonoVar,
                                    }, function (responseText) {
                                        $('#tabla').html(responseText);
                                    });
                                });
                            });
                        </script>-->
        <script>
            $().ready(function () {
                $.post('./CuentaContactos',
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
                    <li role="presentation">
                        <a class="btn btn-default btn-lg" href="pedidos.jsp" role="button">Pedidos</a>
                    </li>
                </ul>
            </div>
        </main>
        <div id="tablatotal"></div>
        <div class="container">

            <a href="formContacto.jsp" class="btn btn-default btn-lg">Crear contacto</a>



            <h5>Búsqueda de contacto</h5>

            <form action="./BuscaContacto" method="POST" id="buscacontacto">
                <label>Buscar Contacto</label>
                <input name="telefono" type="text" class="form-control" placeholder="Teléfono" required>
                <button type="submit">Buscar</button>
            </form>
            <!--            <form id="form1">
                            Teléfono:<input type="text" id="telefono" />
                            <input type="button" id="submit" value="Buscar" />
                            <br>
                            <div id="tabla"></div>             
                        </form>-->

            <table class="table">
                <%                            if (existeBusqueda) {
                %>

                <tr>
                    <th>Nombre</th>
                    <th>Primer Apellido</th>
                    <th>Segundo Apellido</th>
                    <th>Teléfono</th>
                    <th>Email</th>
                    <th>Código Postal</th>
                    <th></th>
                </tr>
                <%while (busqueda.next()){%>
               
                <tr>
                    <td><%=busqueda.getString("nombre")%></td>
                    <td><%=busqueda.getString("apellido1")%></td>
                    <td><%=busqueda.getString("apellido2")%></td>
                    <td><%=busqueda.getString("telefono")%></td>
                    <td><%=busqueda.getString("email")%></td>
                    <td><%=busqueda.getString("cp")%></td>
                    <td></td>                    
                </tr>
                <tr><form action="./EditarContacto" method="POST">
                    <td><input name="nombre" type="text"  placeholder="Nombre" required></td>
                    <td><input name="apellido1" type="text"  placeholder="Primer Apellido" required></td>
                    <td><input name="apellido2" type="text"  placeholder="Segundo Apellido" required></td>
                    <td><input name="telefono" type="text"  placeholder="Teléfono" required></td>
                    <td><input name="email" type="text"  placeholder="E-Mail" required></td>
                    <td><input name="cp" type="text"  placeholder="Código Postal" required></td>
                    <td><input type="submit" value="Editar"></td>
                    </tr>
                    <input type="hidden"  name="idContacto" value="<%=busqueda.getString("idContacto")%>"/>
                    
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