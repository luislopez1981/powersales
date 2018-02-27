
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
        <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">
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
        </script>
        <script>
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

        <div class="container panel-principal">
            
                <div class="panel" id="tablaofertas">

                </div>
                <div class="panel" id="tablacontactos">

                </div>
                <div class="panel" id="tablastock">

                </div>
                <div class="panel" id="tablapedidos">

                </div>
            
        </div>



        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->

    </body>
</html>