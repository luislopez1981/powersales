<%-- 
    Document   : formContacto
    Created on : 21-dic-2017, 20:27:40
    Author     : NYL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="container">
            <h1>Nuevo contacto</h1>
            <form class="form-signin" action="./CreaContacto" method="POST">
                <label>Nombre</label>
                <input name="nombre" type="text" class="form-control" placeholder="Nombre" required>
                <label>Primer Apellido</label>
                <input name="apellido1" type="text" class="form-control" placeholder="Primer Apellido" required>
                <label>Segundo Apellido</label>
                <input name="apellido2" type="text" class="form-control" placeholder="Segundo Apellido" required>
                <label>Teléfono</label>
                <input name="telefono" type="text" class="form-control" placeholder="Teléfono" required>
                <label>Código Postal</label>
                <input name="cp" type="text" class="form-control" placeholder="Codigo Postal" required>
                <label>Correo Electrónico</label>
                <input name="email" type="text" class="form-control" placeholder="Correo electrónico" required>
                <button class="btn btn-lg btn-primary btn-block" type="submit">
                    Crear contacto</button>
            </form>
        </div>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/myScript.js"></script>
    </body>
</html>
