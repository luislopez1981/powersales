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
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
        if(existeBusqueda){
        %>
        <table>
           <tr>
                <th>NOMBRE</th>
                <th>1ER APELLIDO</th>
                <th>2DO APELLIDO</th>
                <th>PRECIO</th>
            </tr> 
        <%while(busqueda.next()){%>
        <tr>
            <td><%=busqueda.getString("nombre")%></td>
            <td><%=busqueda.getString("apellido1")%></td>
            <td><%=busqueda.getString("apellido2")%></td>
            <td><%=busqueda.getString("precio")%></td>
            
        </tr>
            
            
        </table>
    </body>
</html>
