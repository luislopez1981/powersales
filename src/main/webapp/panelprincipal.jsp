<%
    ResultSet rs = (ResultSet) request.getAttribute("encontrados");

    ResultSet busqueda = (ResultSet) request.getAttribute("busqueda");
    Boolean existeBusqueda = busqueda != null;
    ResultSet busqueda2 = (ResultSet) request.getAttribute("busqueda2");
    Boolean existeBusqueda2 = busqueda2 != null;
    
    ResultSet busqueda3 = (ResultSet) request.getAttribute("busqueda3");
    Boolean existeBusqueda3 = busqueda3 != null;
    String contactoId = "", nombre = "", apellido1 = "", apellido2 = "";

%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cice.powersales.dto.ContactoDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Proyecto</title>

        <!-- Bootstrap -->
        <link href="./css/bootstrap.min.css" rel="stylesheet">

        <script src="http://code.jquery.com/jquery-latest.js"></script>

        <script>
            $(document).ready(function () {
                $('#submit').click(function (event) {
                    var telefonoVar = $('#telefono').val();


                    $.post('./BuscaContacto', {
                        telefono: telefonoVar,

                    }, function (responseText) {
                        $('#tabla').html(responseText);
                    });
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                $('#submit2').click(function (event) {
                    var matriculaVar = $('#matricula').val();


                    $.post('./BuscaVehiculo', {
                        matricula: matriculaVar,

                    }, function (responseText) {
                        $('#tablacoches').html(responseText);
                    });
                });
            });
        </script>
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>

        <div class="container">
            <h1>PowerSales</h1>

            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist" id="myTabs">
                <li role="presentation" class="active">
                    <a href="#ofertas" aria-controls="ofertas" role="tab" data-toggle="tab">Ofertas</a>
                </li>
                <li role="presentation">
                    <a href="#contactos" aria-controls="contactos" role="tab" data-toggle="tab">Contactos</a>
                </li>
                <li role="presentation">
                    <a href="#stock" aria-controls="stock" role="tab" data-toggle="tab">Stock</a>
                </li>
                <li role="presentation">
                    <a href="#ventas" aria-controls="ventas" role="tab" data-toggle="tab">Ventas</a>
                </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content" id="myTabContent">



                <div role="tabpanel" class="tab-pane active" id="ofertas">

                    <div class="span12">
                        <a href="CreaOferta.jsp" class="btn btn-default btn-lg">Crear oferta</a>
                    </div>



                    <form action="./BuscaOferta" method="POST" id="buscaoferta">
                        <label>Buscar Oferta</label>
                        <input name="buscaoferta" type="text" class="form-control" placeholder="Teléfono" required> 
                        <button class="btn btn-lg btn-primary btn-block" type="submit">
                            Buscar</button>
                    </form>

                    <table>
                        <%                            if (existeBusqueda) {%>
                        <%while (busqueda.next()) {%>
                        <%contactoId = busqueda.getString("idContacto");%>
                        <%nombre = busqueda.getString("nombre");%>
                        <%apellido1 = busqueda.getString("apellido1");%>
                        <%apellido2 = busqueda.getString("apellido2");%>


                        <h4>¿Desea buscar ofertas de <%=nombre%> <%=apellido1%> <%=apellido2%> ?</h4>
                        <form action="./BuscaOferta2" method="POST" id="buscaoferta2">
                            <input type="hidden" form="buscaoferta2" name="contactoId" value="<%=contactoId%>"/>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">
                                Si</button>
                        </form>
                                
                            <% }
                            }%>
                            
                            <%if (existeBusqueda2) {%>  
                            
                              <h4>Ofertas encontradas </h4>   
                            
                           
                            
                        <thead>

                            <tr>
                                <th>Precio Final</th>
                                <th>Fecha</th>
                                <th>Modelo</th>
                            </tr>

                        </thead>
                        <%while (busqueda2.next()) {

                        %>

                        <tbody>
                            <tr>
                                <td><%=busqueda2.getString("precioFinal")%></td>
                                <td><%=busqueda2.getString("fecha")%></td>
                                <%String coche = busqueda2.getString("vehiculoId");%>
                                <jsp:forward page="./BuscaOferta3">
                                    <jsp:param name="coche" value="<%=coche%>"/>
                                </jsp:forward>
                                <%if(existeBusqueda3){%>
                                <%while (busqueda3.next()){%>
                                <td><%=busqueda3.getString("modelo")%></td>
                                <%}}%>
                            </tr>
                            <%}
                                }%> 
                        </tbody>
                    </table>
                </div>




                <div role="tabpanel" class="tab-pane" id="contactos"><a name="contactos"></a>   

                    <div class="span12">
                        <a href="formContacto.jsp" class="btn btn-default btn-lg">Crear contacto</a>
                    </div>

                    <h3>Búsqueda de contacto</h3>
                    <form id="form1">
                        Teléfono:<input type="text" id="telefono" />
                        <input type="button" id="submit" value="Buscar" /> 
                        <!--                    </form>-->
                        <br>
                        <div id="tabla"></div>
                        <!--                        <center><input type="button" id="submit" value="Formalizar oferta" />-->
                    </form>
                </div>



                <div role="tabpanel" class="tab-pane" id="stock">
                    <h2>Búsqueda de vehículo</h2>
                    <form id="form1">
                        Matrícula:<input type="text" id="matricula" />
                        <input type="button" id="submit2" value="Buscar" /> 
                    </form>
                    <br>
                    <div id="tablacoches"></div>
                    <!--                    <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Column heading</th>
                                                    <th>Column heading</th>
                                                    <th>Column heading</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr class="active">
                                                    <th scope="row">1</th>
                                                    <td>Column content</td>
                                                    <td>Column content</td>
                                                    <td>Column content</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">2</th>
                                                    <td>Column content</td>
                                                    <td>Column content</td>
                                                    <td>Column content</td>
                                                </tr>
                                                <tr class="success">
                                                    <th scope="row">3</th>
                                                    <td>Column content</td>
                                                    <td>Column content</td>
                                                    <td>Column content</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">4</th>
                                                    <td>Column content</td>
                                                    <td>Column content</td>
                                                    <td>Column content</td>
                                                </tr>
                                                <tr class="info">
                                                    <th scope="row">5</th>
                                                    <td>Column content</td>
                                                    <td>Column content</td>
                                                    <td>Column content</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">6</th>
                                                    <td>Column content</td>
                                                    <td>Column content</td>
                                                    <td>Column content</td>
                                                </tr>
                                                <tr class="warning">
                                                    <th scope="row">7</th>
                                                    <td>Column content</td>
                                                    <td>Column content</td>
                                                    <td>Column content</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">8</th>
                                                    <td>Column content</td>
                                                    <td>Column content</td>
                                                    <td>Column content</td>
                                                </tr>
                                                <tr class="danger">
                                                    <th scope="row">9</th>
                                                    <td>Column content</td>
                                                    <td>Column content</td>
                                                    <td>Column content</td>
                                                </tr>
                                            </tbody>
                                        </table>-->
                </div>
                        
                        
                        
                <div role="tabpanel" class="tab-pane" id="ventas">4</div>
            </div>

        </div>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/myScript.js"></script>
    </body>
</html>