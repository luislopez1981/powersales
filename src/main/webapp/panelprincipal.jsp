
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>PowerSales</title>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
        <script src="js/myScript.js"></script>
        <script type="text/javascript"></script>
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script>
            $().ready(function () {
                $.post('./CuentaOfertas',
                        function (responseText) {
                            $('#tablaofertas').html(responseText);

                        });
            });
        </script>
        <script>
            $().ready(function () {
                $.post('./CuentaContactos',
                        function (responseText) {
                            $('#tablacontactos').html(responseText);

                        });
            });
        </script>
        <script>
            $().ready(function () {
                $.post('./CuentaStock',
                        function (responseText) {
                            $('#tablastock').html(responseText);

                        });
            });
        </script><script>
            $().ready(function () {
                $.post('./CuentaPedidos',
                        function (responseText) {
                            $('#tablapedidos').html(responseText);

                        });
            });
        </script>
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
        <div class="container">
            <h4>PANEL DE CONTROL</h4>  
            <div id="tablaofertas"></div>
            <div id="tablacontactos"></div>
            <div id="tablastock"></div>
            <div id="tablapedidos"></div>
        </div>



        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->

    </body>
</html>