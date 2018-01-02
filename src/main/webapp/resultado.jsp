

<%

ResultSet rs  = (ResultSet)request.getAttribute("encontrados");

%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <table>
                <thead>
                    <tr>
                        <th>NOMBRE</th>
                        <th>APELLIDO1</th>
                        <th>APELLIDO2</th>
                        <th>TELEFONO</th>
                    </tr>
                </thead>
                <tbody>



                    <%
                        try{
                            while (rs.next()) {
                    %>

                    <tr>
                        <td><%=rs.getString("nombre")%></td>
                        <td><%=rs.getString("apellido1")%></td>
                        <td><%=rs.getString("apellido2")%></td>
                        <td><%=rs.getString("telefono")%></td>
                    </tr>


                    <%
                                
                            }
                            rs.close();
                            
                        } catch (Exception e) {
                            System.out.println(e.getLocalizedMessage());
                        }
                    %>




                </tbody>
            </table>
        
    </body>
</html>
