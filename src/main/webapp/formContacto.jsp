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

        <header>
            <div class="container">
                <a href= "./panelprincipal.jsp"><h1 class="pull-left logo">PowerSales</h1></a>
                <!-- <div class="loginHome pull-right">
                    <script>
                        var f = new Date();
                        document.write(f.getDate() + "/" + (f.getMonth() + 1) + "/" + f.getFullYear());
                    </script>
                </div> -->
                <nav class="pull-right">
                    <ul class="nav navbar-nav">
                       <li role="presentation">
                          <a class="" href="Oferta.jsp" role="button">Ofertas</a>
                       </li>
                       <li role="presentation">
                          <a class="" href="contactos.jsp" role="button">Contactos</a>
                       </li>
                       <li role="presentation">
                          <a class="" href="stock.jsp" role="button">Stock</a>
                       </li>
                       <li role="presentation">
                          <a class="" href="pedidos.jsp " role="button">Pedidos</a>
                       </li>
                    </ul>
                </nav>
            </div>
        </header>

        <div class="container formContacto">

            <div class="btn-100">
                <h3>Nuevo contacto</h3>
            </div>

            <div class="content">
                <form class="form-signin inline" action="./CreaContacto" method="POST">
                    <div class="form-group">
                        <label>Nombre</label>
                        <input name="nombre" type="text" class="form-control" placeholder="Nombre" required>
                    </div>
                    <div class="form-group">
                        <label>Primer Apellido</label>
                        <input name="apellido1" type="text" class="form-control" placeholder="Primer Apellido" required>
                    </div>
                    <div class="form-group">
                        <label>Segundo Apellido</label>
                        <input name="apellido2" type="text" class="form-control" placeholder="Segundo Apellido" required>
                    </div>
                    <div class="form-group">
                        <label>Teléfono</label>
                        <input name="telefono" type="text" class="form-control" placeholder="Teléfono" required>
                    </div>
                    <div class="form-group">
                        <label>Código Postal</label>
                        <input name="cp" type="text" class="form-control" placeholder="Codigo Postal" required>
                    </div>
                    <div class="form-group">
                        <label>Correo Electrónico</label>
                        <input name="email" type="text" class="form-control" placeholder="Correo electrónico" required>
                    </div>

                    <button class="btn btn-default" type="submit">
                        Crear contacto</button>
                </form>
            </div>

            
        </div>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/myScript.js"></script>
    </body>
</html>
