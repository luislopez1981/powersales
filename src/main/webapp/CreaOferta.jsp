<%@page import="java.sql.ResultSet"%>
<%
    ResultSet busqueda = (ResultSet) request.getAttribute("busqueda");
    Boolean existeBusqueda = busqueda!=null;
    
    ResultSet busqueda2 = (ResultSet) request.getAttribute("busqueda2");
    Boolean existeBusqueda2 = busqueda2!=null;
%>
<%@page import="com.cice.powersales.dto.ContactoEncontradoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <title>JSP Page</title>

    </head>
    <body>

        <a href= "./panelprincipal.jsp">Inicio</a>
        <div class="container">
            <h1>Oferta</h1>
            <form class="form-signin" action="./BusquedaConjunta" method="POST">
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
                            <th>Nombre</th>
                            <th>Primer Apellido</th>
                            <th>Segundo Apellido</th>                            
                            <th>Teléfono</th>                            
                            <th>E-mail</th>                            
                            <th>Código Postal</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <%if(existeBusqueda){%>
                        <%while (busqueda.next()) {
                        %>

                        <tr>
                            <td><%=busqueda.getString("nombre")%></td>
                            <td><%=busqueda.getString("apellido1")%></td>
                            <td><%=busqueda.getString("apellido2")%></td>                        
                            <td><%=busqueda.getString("telefono")%></td>                        
                            <td><%=busqueda.getString("email")%></td>                        
                            <td><%=busqueda.getString("cp")%></td>                        
                        </tr>
                        <%}}%>                    
                    </tbody>
                </table>    
            </div>
               
            <div>
                <table>
                    <thead>
                        <tr>
                            <th>Matrícula</th>
                            <th>Marca</th>
                            <th>Modelo</th>                            
                            <th>Versión</th>                            
                            <th>Motor</th>                            
                            <th>Potencia</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <%if(existeBusqueda2){%>
                        <%while (busqueda2.next()) {
                        %>

                        <tr>
                            <td><%=busqueda2.getString("matricula")%></td>
                            <td><%=busqueda2.getString("marca")%></td>
                            <td><%=busqueda2.getString("modelo")%></td>                        
                            <td><%=busqueda2.getString("version")%></td>                        
                            <td><%=busqueda2.getString("motor")%></td>                        
                            <td><%=busqueda2.getString("potencia")%></td>                        
                        </tr>
                        <%}}%>                    
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
