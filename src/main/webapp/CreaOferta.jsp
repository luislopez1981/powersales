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
        <!-- <link href="./css/bootstrap-theme.css" rel="stylesheet" type="text/css"/> -->
        <!-- <link href="css/login.css" rel="stylesheet" type="text/css"/> -->
        <link href="css/style.css" rel="stylesheet">
        <script src="./js/bootstrap.min.js" type="text/javascript"></script>
        <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">
        <title>PowerSales</title>

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
                      <a class="" href="pedidos.jsp " role="button">Pedidos</a>
                   </li>
                </ul>
            </nav>
            </div>
        </header>      

        <div class="container crearOferta">

            <div class="btn-100">
                <h3>Crear oferta</h3>
            </div>

            <div class="content">
                <form  action="./BusquedaConjunta" method="POST">
                    <div class="form-group">
                        <label>Contacto</label>
                        <input name="telefono" type="text" class="form-control" placeholder="Teléfono" required>
                        <label>Vehículo</label>
                        <input name="matricula" type="text" class="form-control" placeholder="Matrícula" required>
                    </div>                  
                    <button class="btn btn-default" type="submit">Buscar</button>
                </form>

                <%if (existeBusqueda) {%>
                    <%while (busqueda.next()) {
                        idContacto = busqueda.getString("idContacto");
                    %>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Primer Apellido</th>
                                <th>Segundo Apellido</th>                            
                                <th>Teléfono</th>                            
                                <th>E-mail</th>                            
                                <th>Código Postal</th>                            
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><%=busqueda.getString("nombre")%></td>
                                <td><%=busqueda.getString("apellido1")%></td>
                                <td><%=busqueda.getString("apellido2")%></td>          
                                <td><%=busqueda.getString("telefono")%></td>         
                                <td><%=busqueda.getString("email")%></td>             
                                <td><%=busqueda.getString("cp")%></td>         
                            </tr>
                        </tbody>
                    </table>    
                    <%}
                }%> 


                <%if (existeBusqueda2) {%>
                    <%while (busqueda2.next()) {
                        idVehiculo = busqueda2.getString("idVehiculo");
                    %>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Matrícula</th>
                                <th>Marca</th>
                                <th>Modelo</th>                            
                                <th>Versión</th>                            
                                <th>Motor</th>                            
                                <th>Potencia</th>                            
                                <th>Precio</th>                            
                            </tr>  
                        </thead>
                        <tbody>
                            <tr>
                                <td><%=busqueda2.getString("matricula")%></td>
                                <td><%=busqueda2.getString("marca")%></td>
                                <td><%=busqueda2.getString("modelo")%></td>
                                <td><%=busqueda2.getString("version")%></td>            
                                <td><%=busqueda2.getString("motor")%></td>      
                                <td><%=busqueda2.getString("potencia")%></td> 
                                <td><%=busqueda2.getString("precio")%></td> 
                            </tr>
                        </tbody>
                </table>

                <form action="./CreaOferta" method="POST" id="creaoferta">
                    <div class="form-group">
                        <label>Precio Final</label>
                        <input name="precioFinal" type="text" class="form-control" placeholder="Importe" required>
                    </div>
                    <div class="form-group">
                        <label>Comentarios</label>
                        <input name="comentario" class="form-control" placeholder="Observaciones">
                    </div>
                    
                    <input type="hidden" form="creaoferta" name="contactoId" value="<%=idContacto%>"/>
                    <input type="hidden" form="creaoferta" name="vehiculoId" value="<%=idVehiculo%>"/>
                    <button  class="btn btn-default" type="submit">Crear</button>
                </form>          
                    <%}
                }%> 




            </div>

            

                               


            
                               


        </div>




        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/myScript.js"></script>
    </body>
</html>
