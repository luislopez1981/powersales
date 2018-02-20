<%-- 
    Document   : pedidos
    Created on : 20-feb-2018, 17:03:30
    Author     : NYL
--%>
<%@page import="java.sql.ResultSet"%>
<%
    //ResultSet rs = (ResultSet) request.getAttribute("encontrados");

    ResultSet busqueda = (ResultSet) request.getAttribute("busqueda");
    Boolean existeBusqueda = busqueda != null;

//    String contactoId = "", nombre = "", apellido1 = "", apellido2 = "", coche = "";

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedidos</title>
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
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

        <div class="container">
            <form action="./BuscaPedidos" method="POST" id="buscaoferta">
                <label>Buscar Pedido</label>
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
                    <th>Señal</th>
                    <th></th>
                 </tr>
                <%while (busqueda.next()) {%>
                <tr><form  action="./BuscaPedidos2" method="POST">
                    
                    <td><%=busqueda.getString("nombre")%></td>
                    <td><%=busqueda.getString("apellido1")%></td>
                    <td><%=busqueda.getString("apellido2")%></td>
                    <td><%=busqueda.getString("fechaFormat")%></td>
                    <td><%=busqueda.getString("marca")%></td>
                    <td><%=busqueda.getString("modelo")%></td>
                    <td><%=busqueda.getString("senal")%></td>
                    <td><input type="submit" value="Seleccionar"></td>
                    </tr>
                    <input type="hidden" name="idPedido" value="<%=busqueda.getString("idPedido")%>">
                </form>
                <%}
                    }%>
            </table>
        </div>

    </body>
</html>
