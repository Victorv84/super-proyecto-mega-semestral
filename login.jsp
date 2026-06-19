<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
String error = request.getParameter("error");
%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>PSIREG - Iniciar sesión</title>
    <link rel="stylesheet" href="estilos_login_registrarse.css">
</head>

<body>

    <div class="form-container">

        <div class="form-card">

            <h1>PSIREG</h1>

            <p>Inicia sesión para continuar</p>

            <% if(error != null){ %>
                <div class="error">Correo o contraseña incorrectos</div>
            <% } %>

            <form action="validarLogin.jsp" method="post">

                <div class="input-group">
                    <label>Correo electrónico</label>
                    <input type="email" name="correo" placeholder="Ingresa tu correo" required>
                </div>

                <div class="input-group">
                    <label>Contraseña</label>
                    <input type="password" name="password" placeholder="Ingresa tu contraseña" required>
                </div>

                <button type="submit" class="btn-primary">
                    Iniciar sesión
                </button>

            </form>

            <div class="links">

                <a href="Cliente.jsp">
                    Regresar al inicio
                </a>

            </div>

        </div>

    </div>

    
<p style="
position:fixed;
bottom:10px;
left:10px;
font-size:14px;
color:gray;
">
    Correo del Cliente: nombre@cliente.com <br>
    Contraseña: 123
    <br>
    Correo de Secretaria: nombre@secretaria.com <br>
    Contraseña: 123
<br>
    Correo del Especialista: nombre@especialista.com <br>
    Contraseña: 123
<br>
    Correo del Admin: nombre@admin.com <br>
    Contraseña: 123
</p>
</body>
</html>