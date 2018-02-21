<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%
    ResultSet busqueda = (ResultSet) request.getAttribute("busqueda");
    Boolean existeBusqueda = busqueda != null;

    ResultSet busqueda2 = (ResultSet) request.getAttribute("busqueda2");
    Boolean existeBusqueda2 = busqueda2 != null;

    Date fecha = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String fechaFormat = sdf.format(fecha);

    String idVehiculo = "", idContacto = "";
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <link href="./css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet">
        <script src="./js/bootstrap.min.js" type="text/javascript"></script>
        <title>PowerSales</title>

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
            <h1>Oferta</h1>
            <form  action="./BusquedaConjunta" method="POST">
                <label>Contacto</label>
                <input name="telefono" type="text" class="form-control" placeholder="Teléfono" required>
                <label>Vehículo</label>
                <input name="matricula" type="text" class="form-control" placeholder="Matrícula" required>

                <button  type="submit">Buscar</button>
            </form>

            <%if (existeBusqueda) {%>
            <%while (busqueda.next()) {
                    idContacto = busqueda.getString("idContacto");
            %>

            <div>
                <table class="table">

                    <tr>
                        <th>Nombre</th>
                        <th>Primer Apellido</th>
                        <th>Segundo Apellido</th>                            
                        <th>Teléfono</th>                            
                        <th>E-mail</th>                            
                        <th>Código Postal</th>                            
                    </tr>


                    <tr>
                        <td><%=busqueda.getString("nombre")%></td>
                        <td><%=busqueda.getString("apellido1")%></td>
                        <td><%=busqueda.getString("apellido2")%></td>                        
                        <td><%=busqueda.getString("telefono")%></td>                        
                        <td><%=busqueda.getString("email")%></td>                        
                        <td><%=busqueda.getString("cp")%></td>                        
                    </tr>
                </table>    
            </div>
            <%}
                }%>                    


            <%if (existeBusqueda2) {%>
            <%while (busqueda2.next()) {
                    idVehiculo = busqueda2.getString("idVehiculo");
            %>
            <div>
                <table class="table">

                    <tr>
                        <th>Matrícula</th>
                        <th>Marca</th>
                        <th>Modelo</th>                            
                        <th>Versión</th>                            
                        <th>Motor</th>                            
                        <th>Potencia</th>                            
                        <th>Precio</th>                            
                    </tr>

                    <tr>
                        <td><%=busqueda2.getString("matricula")%></td>
                        <td><%=busqueda2.getString("marca")%></td>
                        <td><%=busqueda2.getString("modelo")%></td>                        
                        <td><%=busqueda2.getString("version")%></td>                        
                        <td><%=busqueda2.getString("motor")%></td>                        
                        <td><%=busqueda2.getString("potencia")%></td>                        
                        <td><%=busqueda2.getString("precio")%></td> 

                    </tr>
                </table> 
            </div>
            <form action="./CreaOferta" method="POST" id="creaoferta">
                <label>Precio Final</label>
                <input name="precioFinal" type="text" class="form-control" placeholder="Importe" required>
                <label>Comentarios</label>
                <input name="comentario" class="form-control" placeholder="Observaciones">
                <input type="hidden" form="creaoferta" name="contactoId" value="<%=idContacto%>"/>
                <input type="hidden" form="creaoferta" name="vehiculoId" value="<%=idVehiculo%>"/>
                <button type="submit">Crear</button>
            </form>          
            <%}
                }%>                    


        </div>




        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/myScript.js"></script>
    </body>
</html>
