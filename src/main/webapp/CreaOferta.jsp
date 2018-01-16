<%@page import="java.sql.ResultSet"%>
<%
    ResultSet busqueda = (ResultSet) request.getAttribute("busqueda");
    Boolean existeBusqueda = busqueda != null;

    ResultSet busqueda2 = (ResultSet) request.getAttribute("busqueda2");
    Boolean existeBusqueda2 = busqueda2 != null;

%>
<%@page import="com.cice.powersales.dto.ContactoEncontradoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <link href="./css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <script src="./js/bootstrap.min.js" type="text/javascript"></script>
        <title>JSP Page</title>

    </head>
    <body>        
        <a href= "./panelprincipal.jsp">Inicio</a><br>
        <script>
            var f = new Date();
            document.write(f.getFullYear() + "/" + (f.getMonth() + 1) + "/" + f.getDate());
        </script>
        <div class="container">
            <h1>Oferta</h1>
            <form  action="./BusquedaConjunta" method="POST">
                <label>Contacto</label>
                <input name="telefono" type="text" class="form-control" placeholder="Teléfono" required>
                <label>Vehículo</label>
                <input name="matricula" type="text" class="form-control" placeholder="Matrícula" required>
                <button class="btn btn-lg btn-primary btn-block" type="submit">
                    Buscar</button>
            </form>
            <div>
                <table>
                    <thead>
                        <tr>
                            <th>idContacto</th>
                            <th>Nombre</th>
                            <th>Primer Apellido</th>
                            <th>Segundo Apellido</th>                            
                            <th>Teléfono</th>                            
                            <th>E-mail</th>                            
                            <th>Código Postal</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <%if (existeBusqueda) {%>
                        <%while (busqueda.next()) {
                        %>

                        <tr>
                            <td><%=busqueda.getString("idContacto")%></td>
                            <td><%=busqueda.getString("nombre")%></td>
                            <td><%=busqueda.getString("apellido1")%></td>
                            <td><%=busqueda.getString("apellido2")%></td>                        
                            <td><%=busqueda.getString("telefono")%></td>                        
                            <td><%=busqueda.getString("email")%></td>                        
                            <td><%=busqueda.getString("cp")%></td>                        
                        </tr>
                        <%}
                            }%>                    
                    </tbody>
                </table>    
            </div>

            <div>
                <table>
                    <thead>
                        <tr>
                            <th>idVehiculo</th>
                            <th>Matrícula</th>
                            <th>Marca</th>
                            <th>Modelo</th>                            
                            <th>Versión</th>                            
                            <th>Motor</th>                            
                            <th>Potencia</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <%if (existeBusqueda2) {%>
                        <%while (busqueda2.next()) {
                        %>

                        <tr>
                            <td><%=busqueda2.getString("idVehiculo")%></td>
                            <td><%=busqueda2.getString("matricula")%></td>
                            <td><%=busqueda2.getString("marca")%></td>
                            <td><%=busqueda2.getString("modelo")%></td>                        
                            <td><%=busqueda2.getString("version")%></td>                        
                            <td><%=busqueda2.getString("motor")%></td>                        
                            <td><%=busqueda2.getString("potencia")%></td>                        
                        </tr>
                        <%}
                            }%>                    
                    </tbody>
                </table>    
            </div>
                                                
            <form action="./CreaOferta" method="POST" id="creaoferta">
                <label>Precio Final</label>
                <input name="precioFinal" type="text" class="form-control" placeholder="Importe" required>
                <label>Comentarios</label>
                <textarea name="comentario" rows="4" cols="20">Comentarios</textarea>
                <%if (existeBusqueda && existeBusqueda2) {
                %><%while (busqueda.next() && busqueda2.next()) {
                    

                %>
                
                <input type="text" form="creaoferta" name="contactoId" >
                <input type="hidden" form="creaoferta" name="vehiculoId" value="2">
                <%}
                    }%>
                <input type="date" name="fecha"/>
                <button class="btn btn-lg btn-primary btn-block" type="submit">
                    Crear</button>
            </form>     
        </div>




        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/myScript.js"></script>
    </body>
</html>
