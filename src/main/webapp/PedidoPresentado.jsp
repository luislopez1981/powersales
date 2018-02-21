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
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <title>PowerSales</title>
    </head>
    <body>
        <header>
            <a href= "./panelprincipal.jsp"><h1 class="pull-left logo">PowerSales</h1></a>
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
        <%            if (existeBusqueda) {
        %>
        <%while (busqueda.next()) {
        %>

        <table class="table">
            <tr>
                <th><h3>PEDIDO DE UN VEHÍCULO DE OCASIÓN</h3></th>
                <th><h4>Fecha emisión:</h4</th>
            </tr>
            <tr>
                <td> </td>
                <td><%=busqueda.getString("fechaFormat")%></td>
            </tr>
        </table>

        <h3>DATOS DEL COMPRADOR</h3>
        <table class="table">
            <tr>
                <th>DNI:</th>
                <th>Nombre:</th>
                <th>Apellidos: </th>
                <th>Teléfono: </th>
                <th>E-mail: </th>
                <th>Calle: </th>
                <th>Piso/Puerta: </th>
                <th>Municipio: </th>
                <th>Provincia: </th>
                <th>Código Postal: </th>
            </tr>
            <tr>
                <td><%=busqueda.getString("dni")%></td>
                <td><%=busqueda.getString("nombre")%></td>
                <td><%=busqueda.getString("apellido1")%> <%=busqueda.getString("apellido2")%></td>
                <td><%=busqueda.getString("telefono")%></td>
                <td><%=busqueda.getString("email")%></td>
                <td><%=busqueda.getString("calle")%></td>
                <td><%=busqueda.getString("piso")%></td>
                <td><%=busqueda.getString("municipio")%></td>
                <td><%=busqueda.getString("provincia")%></td>
                <td><%=busqueda.getString("cp")%></td>
            </tr>
        </table>


        <h3>DESCRIPCIÓN VEHÍCULO</h3>

        <table class="table">
            <tr>
                <th>Marca:</th>
                <th>Modelo: </th>
                <th>Versión: </th>
                <th>Motor: </th>
                <th>Potencia: </th>
                <th>Combustible: </th>
                <th>Color: </th>
                <th>Fecha Primera Matriculación: </th>
                <th>Kilometraje: </th>
            </tr>
            <tr>
                <td><%=busqueda.getString("marca")%></td>
                <td><%=busqueda.getString("modelo")%></td>
                <td><%=busqueda.getString("version")%></td>
                <td><%=busqueda.getString("motor")%></td>
                <td><%=busqueda.getString("potencia")%></td>
                <td><%=busqueda.getString("combustible")%></td>
                <td><%=busqueda.getString("color")%></td>
                <td><%=busqueda.getString("fechamatricula")%></td>
                <td><%=busqueda.getString("kilometraje")%></td>
            </tr>
        </table>

        <h3>DETALLE ECONÓMICO</h3>

        <%
            double gestoria = 149.95;
            double preparacion = 119.95;
            double precioInicial = Double.parseDouble(busqueda.getString("precio")) - gestoria - preparacion;
            DecimalFormat format = new DecimalFormat("#####.##");

        %>
        <table class="table">
            <tr>
                <th>Precio Vehículo seleccionado:</th>
                <th>Preparación y pre-entrega:</th>
                <th>Cambio Titularidad en JPT: </th>
                <th>Precio Venta al Público: </th>
                <th>Total Descuentos: </th>
                <th>PRECIO FINAL (IVA Incluido): </th>

            </tr>
            <tr>
                <td><%=format.format(precioInicial)%> €</td>
                <td><%=preparacion%> €</td>
                <td><%=gestoria%> €</td>
                <td><%=busqueda.getString("precio")%> €</td>
                <%
                    double descuento = Double.parseDouble(busqueda.getString("precio")) - Double.parseDouble(busqueda.getString("precioFinal"));
                %>
                <td>-<%=descuento%>  €</td>
                <td><%=Double.parseDouble(busqueda.getString("precioFinal"))%> €</td>
            </tr>
        </table>

        <h3>RESUMEN FORMA DE PAGO</h3>
        <table class="table">
            <tr>
                <th>Señal:</th>
                <th>Financiado:</th>
                <th>Tasación Entrega V.O.: </th>
                <th>Resto: </th>
            </tr>
            <tr>
                <%
                    double precioFinal = Double.parseDouble(busqueda.getString("precioFinal"));
                    double senal = Double.parseDouble(busqueda.getString("senal"));
                    double financiado = Double.parseDouble(busqueda.getString("financiado"));
                    double tasacion = Double.parseDouble(busqueda.getString("tasacion"));
                    double resto = precioFinal - senal - financiado - tasacion;
                %>
                <td><%=senal%> €</td>
                <td><%=financiado%> €</td>
                <td><%=tasacion%> €</td>
                <td><%=resto%> €</td>
            </tr>
        </table>


        <table class="table">
            <tr>
                <th><h3>OBSERVACIONES</h3></th>
            </tr>
            <tr>
                <td><%=busqueda.getString("comentario")%></td>
            </tr>
        </table> <table class="table">
            <tr>
                <th><h4>FIRMADO COMPRADOR</h4></th>
                <th><h4>FIRMADO POWERMOTOR, S.L.</h4></th>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
        </table>

        <%}
            }%>

        <H4> PowerMotor, S.L. le agradece la confianza depositada.</h4>
        <h4>Alargue la vida de su nuevo vehículo confiando el mantenimiento a PowerMotor, S.L.</h4>

    </body>
</html>
