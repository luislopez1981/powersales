<%
    String idOferta = request.getParameter("idOferta");
    String idContacto = request.getParameter("idContacto");
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

        <div class="container formPedido">
            <div class="btn-100">
                <h3>Nuevo Pedido</h3>
            </div>
            <div class="content">
                <form class="form-signin inline" action="./CreaPedido" method="POST">
                    <div class="form-group">
                        <label>DNI</label>
                        <input name="dni" type="text" class="form-control" placeholder="DNI" required>
                    </div>
                    <div class="form-group">
                        <label>Via</label>
                        <input name="calle" type="text" class="form-control" placeholder="Via" required>
                    </div>
                    <div class="form-group">
                        <label>Planta/Puerta</label>
                        <input name="piso" type="text" class="form-control" placeholder="Planta/Puerta" required>
                    </div>
                    <div class="form-group">
                        <label>Municipio</label>
                        <input name="municipio" type="text" class="form-control" placeholder="Municipio" required>
                    </div>
                    <div class="form-group">
                        <label>Provincia</label>
                        <input name="provincia" type="text" class="form-control" placeholder="Provincia" required>
                    </div>
                    <div class="form-group">
                        <label>Señal</label>
                        <input name="senal" type="text" class="form-control" placeholder="Señal" required>
                    </div>
                    <div class="form-group">
                        <label>Financiado</label>
                        <input name="financiado" type="text" class="form-control" placeholder="Financiado" required>
                    </div>
                    <div class="form-group">
                        <label>Tasación</label>
                        <input name="tasacion" type="text" class="form-control" placeholder="Tasación" required>
                    </div>
                    <div class="form-group">
                        <label>Fecha entrega estimada</label>
                        <input type="date" class="form-control" name="fechaEntrega">
                    </div>
                    <div class="form-group">
                        <input type="hidden"  name="idOferta" value="<%=idOferta%>"/>
                        <input type="hidden"  name="idContacto" value="<%=idContacto%>"/>
                    </div>

                    <button class="btn btn-default" type="submit">
                        Crear Pedido</button>
                </form>
            </div>
            
        </div>

    </body>
</html>
