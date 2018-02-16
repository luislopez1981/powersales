<%@page import="java.text.DecimalFormat"%>
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
        <%while(busqueda.next()){
        %>
        <h3>SOLICITUD DE INFORMACIÓN DE UN VEHÍCULO DE OCASIÓN</h3>
        <h4>Emitida el:</h4><p> <%=busqueda.getString("fecha")%> </p>
        <h3>DATOS DEL COMPRADOR</h3>
        <h4>Nombre: </h4> <p><%=busqueda.getString("nombre")%></p>
        <h4>Apellidos: </h4> <p><%=busqueda.getString("apellido1")%> <p><%=busqueda.getString("apellido2")%></p></p>
        <h4>Teléfono: </h4> <p><%=busqueda.getString("telefono")%></p>
        <h4>E-mail: </h4> <p><%=busqueda.getString("email")%></p>
        <h4>Código Postal: </h4> <p><%=busqueda.getString("cp")%></p>
        
        <h3>DESCRIPCIÓN VEHÍCULO</h3>
        
        <H4>Marca: </H4><p><%=busqueda.getString("marca")%></p>
        <H4>Modelo: </H4><p><%=busqueda.getString("modelo")%></p>
        <H4>Versión: </H4><p><%=busqueda.getString("version")%></p>
        <H4>Motor: </H4><p><%=busqueda.getString("motor")%></p>
        <H4>Potencia: </H4><p><%=busqueda.getString("potencia")%></p>
        <H4>Combustible: </H4><p><%=busqueda.getString("combustible")%></p>
        <H4>Color: </H4><p><%=busqueda.getString("color")%></p>
        <H4>Fecha Primera Matriculación: </H4><p><%=busqueda.getString("fechamatricula")%></p>
        <H4>Kilometraje: </H4><p><%=busqueda.getString("kilometraje")%></p>
        
        <h3>DETALLE ECONÓMICO</h3>
        
        <%
            double gestoria = 149.95;
            double preparacion = 119.95;
            double precioInicial = Double.parseDouble(busqueda.getString("precio"))-gestoria-preparacion;
            DecimalFormat format = new DecimalFormat("#####.##");
            
        %>
        <H4>Precio Venta al Público:</H4><p><%=format.format(precioInicial)%> €</p>
        <H4>Preparación y pre-entrega:</H4><p><%=preparacion%> €</p>
        <H4>Cambio Titularidad en JPT:</H4><p><%=gestoria%> €</p>
        <%
            double descuento = Double.parseDouble(busqueda.getString("precio"))-Double.parseDouble(busqueda.getString("precioFinal"));
        %>
        <H4>Total Descuentos: </H4><p>-<%=descuento%>  €</p>
        <H4>PRECIO FINAL (IVA Incluido):</H4> <p><%=Double.parseDouble(busqueda.getString("precioFinal"))%> €</p>
        <form action="./ModificaPrecio" method="POST">
           <input name="precioFinal" type="text" class="form-control" placeholder="Importe" required>
           <input type="hidden"  name="idOferta" value="<%=busqueda.getString("idOferta")%>"/>
           <button  type="submit">Modificar</button>
        </form>
        
        <h3>OBSERVACIONES</h3>
        <p><%=busqueda.getString("comentario")%></p>
        <form action="./ModificaComentario" method="POST">
           <textarea name="comentario" rows="4" cols="20">Comentarios</textarea>
           <input type="hidden"  name="idOferta" value="<%=busqueda.getString("idOferta")%>"/>
           <button  type="submit">Modificar</button>
        </form>
        
        <%}}%>
        
        <H4> PowerMotor, S.L. le agradece la confianza depositada. Estamos a su entera disposición para continuar ayudándole a elegir su coche.</h4>
        <h4>Si lo desea, solicite una prueba a su asesor comercial.</h4>
    </body>
</html>
