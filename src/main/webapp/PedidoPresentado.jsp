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
        <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">
        <title>PowerSales</title>
    </head>
    <body>


        <div class="container contenido-presentado"> 
            <div class="content">
                <a href= "./panelprincipal.jsp"><h1 class="pull-right logo logo-black">PowerMotor</h1></a>
                <%            if (existeBusqueda) {
                %>
                <%while (busqueda.next()) {
                %>
                <h3 class="title">PEDIDO DE UN VEHÍCULO DE OCASIÓN</h3>
                <div class="fecha-emision">
                    <p>Fecha emisión:</p>
                    <span><%=busqueda.getString("fechaFormat")%></span>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <h4>DATOS DEL COMPRADOR</h4>
                        <table class="table  table-bordered table-hover">
                            <tr>
                                <th>DNI:</th>
                                <td><%=busqueda.getString("dni")%></td>
                            </tr>
                            <tr>
                                <th>Nombre:</th>
                                <td><%=busqueda.getString("nombre")%></td>
                            </tr>
                            <tr>
                                <th>Apellidos: </th>
                                <td><%=busqueda.getString("apellido1")%> <%=busqueda.getString("apellido2")%></td>
                            </tr>
                            <tr>
                                <th>Teléfono: </th>
                                <td><%=busqueda.getString("telefono")%></td>
                            </tr>
                            <tr>
                                <th>E-mail: </th>
                                <td><%=busqueda.getString("email")%></td>
                            </tr>    
                            <tr>
                                <th>Calle: </th>
                                <td><%=busqueda.getString("calle")%></td>
                            </tr>    
                            <tr>
                                <th>Piso/Puerta: </th>
                                <td><%=busqueda.getString("piso")%></td>
                            </tr>    
                            <tr>
                                <th>Municipio: </th>
                                <td><%=busqueda.getString("municipio")%></td>
                            </tr>    
                            <tr>
                                <th>Provincia: </th>
                                <td><%=busqueda.getString("provincia")%></td>
                            </tr>
                            <tr>
                                <th>Código Postal: </th>
                                <td><%=busqueda.getString("cp")%></td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-md-6">
                        <h4>DESCRIPCIÓN VEHÍCULO</h4>
                        <table class="table table-bordered table-hover">
                            <tr>
                                <th>Marca:</th>
                                <td><%=busqueda.getString("marca")%></td>
                            </tr>
                            <tr>
                                <th>Modelo: </th>
                                <td><%=busqueda.getString("modelo")%></td>
                            </tr>
                            <tr>
                                <th>Versión: </th>
                                <td><%=busqueda.getString("version")%></td>
                            </tr>
                            <tr>
                                <th>Motor: </th>
                                <td><%=busqueda.getString("motor")%></td>
                            </tr>    
                            <tr>
                                <th>Potencia: </th>
                                <td><%=busqueda.getString("potencia")%></td>
                            </tr>    
                            <tr>
                                <th>Combustible: </th>
                                <td><%=busqueda.getString("combustible")%></td>
                            </tr>    
                            <tr>
                                <th>Color: </th>
                                <td><%=busqueda.getString("color")%></td>
                            </tr>    
                            <tr>
                                <th>Fecha Primera Matriculación: </th>
                                <td><%=busqueda.getString("fechamatricula")%></td>
                            </tr>    
                            <tr>
                                <th>Kilometraje: </th>
                                <td><%=busqueda.getString("kilometraje")%></td>
                            </tr>    
                        </table>
                    </div>    
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <h4>DETALLE ECONÓMICO</h4>
                        <%
                            double gestoria = 149.95;
                            double preparacion = 119.95;
                            double precioInicial = Double.parseDouble(busqueda.getString("precio")) - gestoria - preparacion;
                            DecimalFormat format = new DecimalFormat("#####.##");

                        %>
                        <table class="table table-bordered table-hover">
                            <tr>
                                <th>Precio Vehículo seleccionado:</th>
                                <td><%=format.format(precioInicial)%> €</td>
                            </tr>
                            <tr>
                                <th>Preparación y pre-entrega:</th>
                                <td><%=preparacion%> €</td>
                            </tr>    
                            <tr>
                                <th>Cambio Titularidad en JPT: </th>
                                <td><%=gestoria%> €</td>
                            </tr>    
                            <tr>
                                <th>Precio Venta al Público: </th>
                                <td><%=busqueda.getString("precio")%> €</td>
                            </tr>    
                            <tr>
                                <th>Total Descuentos: </th>
                                 <%
                                    double descuento = Double.parseDouble(busqueda.getString("precio")) - Double.parseDouble(busqueda.getString("precioFinal"));
                                %>
                                <td>-<%=descuento%>  €</td>
                            </tr>    
                            <tr>
                                <th>PRECIO FINAL (IVA Incluido): </th>
                                <td><%=Double.parseDouble(busqueda.getString("precioFinal"))%> €
                                </td>
                            </tr>    

                        </table>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <h4>RESUMEN FORMA DE PAGO</h4>
                        <table class="table table-bordered table-hover">
                            <tr>
                                <th>Señal:</th>
                                <%
                                    double precioFinal = Double.parseDouble(busqueda.getString("precioFinal"));
                                    double senal = Double.parseDouble(busqueda.getString("senal"));
                                    double financiado = Double.parseDouble(busqueda.getString("financiado"));
                                    double tasacion = Double.parseDouble(busqueda.getString("tasacion"));
                                    double resto = precioFinal - senal - financiado - tasacion;
                                %>
                                <td><%=senal%> €</td>
                            </tr>
                            <tr>
                                <th>Financiado:</th>
                                <td><%=financiado%> €</td>
                            </tr>
                            <tr>
                                <th>Tasación Entrega V.O.: </th>
                                <td><%=tasacion%> €</td>
                            </tr>    
                            <tr>
                                <th>Resto: </th>
                                <td><%=resto%> €</td>
                            </tr>    
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="comentario">
                            <h4>OBSERVACIONES</h4>
                            <p><%=busqueda.getString("comentario")%></p>
                        </div>
                    </div>
                    <div class="col-sm-6 firma">
                        <h4>FIRMADO COMPRADOR</h4>
                        <span class="campo-firma"></span>
                    </div>
                    <div class="col-sm-6 firma">
                        <h4>FIRMADO POWERMOTOR, S.L.</h4>
                        <span class="campo-firma"></span>
                    </div>
                    <%}
                        }%>
                    <div class="footer">
                        <p>PowerMotor, S.L. le agradece la confianza depositada.</p>
                        <p>Alargue la vida de su nuevo vehículo confiando el mantenimiento a PowerMotor, S.L.</p>
                    </div>   
                </div>
            </div>
        </div>


        

    </body>
</html>
