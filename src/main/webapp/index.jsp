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
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4">
                    <!--INSERTAMOS LA ALERTA-->
                    <%if (existeError) {%>
                    <div class="alert alert-danger" role="alert">Usuario o Contraseña erróneos</div>
                    <%}%>
                    <!--FIN DE LA ALERTA-->
                    <div class="account-wall">
                        <img class="profile-img" src="./assets/llaves.jpg"
                             alt="logo login">
                        <form class="form-signin" action="./Login" method="POST">
                            <input name="user" type="email" class="form-control" placeholder="Usuario" required autofocus>
                            <input name="pass" type="password" class="form-control" placeholder="Contraseña" required>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">
                                Iniciar Sesión</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
