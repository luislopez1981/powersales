<%

    ResultSet rs = (ResultSet) request.getAttribute("encontrados");

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
                        <a href="" class="btn btn-default btn-lg">Crear oferta</a>
                    </div>



                    <form>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Buscar oferta</label>
                            <input type="email" class="form-control" id="exampleInputEmail1" placeholder="oferta">
                            <button type="submit" class="btn btn-primary btn-lg active">Buscar</button>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Buscar pedido</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Pedido">
                            <button type="submit" class="btn btn-primary btn-lg active">Buscar</button>
                        </div>


                        <!-- <div class="form-group">
                           <label for="exampleInputFile">File input</label>
                           <input type="file" id="exampleInputFile">
                           <p class="help-block">Example block-level help text here.</p>
                        </div> -->
                        <!-- <div class="checkbox">
                           <label>
                              <input type="checkbox"> Check me out
                           </label>
                        </div> -->
                        <!-- <button type="submit" class="btn btn-primary btn-lg active">Submit</button> -->
                    </form>
                </div>

                <div role="tabpanel" class="tab-pane" id="contactos"><a name="contactos"></a>   

                    <div class="span12">
                        <a href="formContacto.jsp" class="btn btn-default btn-lg">Crear contacto</a>
                    </div>
                    
                    <h2>B�squeda de contacto</h2>
	<form id="form1">
		Tel�fono:<input type="text" id="telefono" /> <br>
		
		<input type="button" id="submit" value="Buscar" /> 
	</form>
	<br>
	<!-- 	En este div metemos el contenido de la tabla con AJAX -->
	<div id="tabla"></div>
                </div>



                <div role="tabpanel" class="tab-pane" id="stock">
                    <table class="table">
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
                    </table>
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