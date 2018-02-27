<%@page import="java.sql.ResultSet"%>
<%
    ResultSet busqueda = (ResultSet) request.getAttribute("busqueda");
    Boolean existeBusqueda = busqueda != null;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PowerSales</title>
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">
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
                      <a class="" href="stock.jsp" role="button">Stock</a>
                   </li>
                   <li role="presentation">
                      <a class="active" href="pedidos.jsp " role="button">Pedidos</a>
                   </li>
                </ul>
            </nav>
            </div>
        </header>

        
        <div class="container pedidos">
            <div class="btn-100">
                <h3>Pedidos</h3>
            </div>

            <div class="content">
                <form action="./BuscaPedidos" method="POST" id="buscaoferta">
                    <div class="form-group">
                        <label>Buscar Pedido</label>
                        <input name="telefono" type="text" class="form-control" placeholder="Teléfono" required>
                    </div>
                    
                    <button class="btn btn-default" type="submit">Buscar</button>
                </form>

                <table class="table table-bordered table-hover">
                    <%                            if (existeBusqueda) {
                    %>

                    <tr>
                        <th>Nombre</th>
                        <th>Primer Apellido</th>
                        <th>Segundo Apellido</th>
                        <th>Fecha</th>
                        <th>Marca</th>
                        <th>Modelo</th>
                        <th>Precio Final</th>
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
                        <td><%=busqueda.getString("precioFinal")%></td>
                        <td><input type="submit" value="Seleccionar"></td>
                        </tr>
                        <input type="hidden" name="idPedido" value="<%=busqueda.getString("idPedido")%>">
                    </form>
                    <%}
                        }%>
                </table>
            </div>

            

            
        </div>

    </body>
</html>
