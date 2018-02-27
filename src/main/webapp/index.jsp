<%
    Boolean existeError = request.getParameter("error") != null;
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login PowerSales</title>
        <!--ACHIVOS CSS BOOTSTRAP-->
        <link href="./css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <link href="./css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!--ACHIVOS CSS PROPIOS-->
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <!--ACHIVOS JS BOOTSTRAP-->
        <script src="./js/bootstrap.min.js" type="text/javascript"></script>

        <link href="css/style.css" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">
    </head>
    <body class="login">
        <header>
            <h1 class="logo">PowerSales</h1>
        </header>

        <div class="content-login">
                            
            <div class="account-wall">
                <form class="form-signin" action="./Login" method="POST">
                    <input name="user" type="email" class="form-control" placeholder="Usuario" required autofocus>
                    <input name="pass" type="password" class="form-control" placeholder="Contraseña" required>
                    <!--INSERTAMOS LA ALERTA-->
                    <%if (existeError) {%>
                    <div class="alert alert-danger" role="alert">Usuario o Contraseña erróneos</div>
                    <%}%>
                    <!--FIN DE LA ALERTA-->
                    <button class="btn btn-default" type="submit">
                        Iniciar Sesión</button>
                </form>
            </div>
        </div>
    </body>
</html>
