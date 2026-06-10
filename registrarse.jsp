<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro - PSIREG</title>

    <link rel="stylesheet" href="estilos_login_registrarse.css">
</head>

<body>

<div class="form-container">

    <div class="form-card">

        <h1>PSIREG</h1>

        <p>Crea tu cuenta para continuar</p>

        <form action="registrarse.jsp" method="post">

            <div class="input-group">
                <label>Nombre Completo</label>
                <input type="text" name="nombre" placeholder="Ingresa tu nombre" required>
            </div>

            <div class="input-group">
                <label>Cédula</label>
                <input type="text" name="cedula" placeholder="Ingresa tu cédula" required>
            </div>

            <div class="input-group">
                <label>Correo electrónico</label>
                <input type="email" name="correo" placeholder="Ingresa tu correo" required>
            </div>

            <div class="input-group">
                <label>Contraseña</label>
                <input type="password" name="password" placeholder="Crea una contraseña" required>
            </div>

            <div class="input-group">
                <label>Confirmar Contraseña</label>
                <input type="password" name="confirmarpassword" placeholder="Repite la contraseña" required>
            </div>

            <button type="submit" class="btn-primary">
                Registrarse
            </button>

        </form>

        <div class="links">

            <a href="login.jsp">
                ¿Ya tienes una cuenta? Inicia sesión
            </a>

            <a href="Cliente.jsp">
                Regresar al inicio
            </a>

        </div>

    </div>

</div>

</body>

</html>