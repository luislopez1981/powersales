<%
    String idOferta = request.getParameter("idOferta");
    String idContacto = request.getParameter("idContacto");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PowerSales</title>
        <link href="css/style.css" rel="stylesheet">
        <link href="./css/bootstrap.min.css" rel="stylesheet">
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
            <h1>Nuevo Pedido</h1>
            <form class="form-signin" action="./CreaPedido" method="POST">
                <label>DNI</label>
                <input name="dni" type="text" class="form-control" placeholder="DNI" required>
                <label>Via</label>
                <input name="calle" type="text" class="form-control" placeholder="Via" required>
                <label>Planta/Puerta</label>
                <input name="piso" type="text" class="form-control" placeholder="Planta/Puerta" required>
                <label>Municipio</label>
                <input name="municipio" type="text" class="form-control" placeholder="Municipio" required>
                <label>Provincia</label>
                <input name="provincia" type="text" class="form-control" placeholder="Provincia" required>
                <label>Señal</label>
                <input name="senal" type="text" class="form-control" placeholder="Señal" required>
                <label>Financiado</label>
                <input name="financiado" type="text" class="form-control" placeholder="Financiado" required>
                <label>Tasación</label>
                <input name="tasacion" type="text" class="form-control" placeholder="Tasación" required>
                <label>Fecha entrega estimada</label>
                <input type="date" class="form-control" name="fechaEntrega">
                <input type="hidden"  name="idOferta" value="<%=idOferta%>"/>
                <input type="hidden"  name="idContacto" value="<%=idContacto%>"/>
                <button class="btn btn-lg btn-primary btn-block" type="submit">
                    Crear Pedido</button>
            </form>
        </div>

    </body>
</html>
