<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String error = request.getParameter("error");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar sesión - PSIREG</title>
    <link rel="stylesheet" href="estilos_login_registrarse.css">
</head>

<body class="login-microsoft" style="
    background-image: url('Universidad.jfif');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    background-attachment: fixed;
">

    <div class="login-overlay"></div>

    <main class="login-wrapper">

        <section class="ms-card">

            <div class="ms-logo">
                <img src="logo utp.jpg" alt="Logo UTP">
            </div>

            <% if (error != null) { %>
                <div class="ms-error">
                    Correo o contraseña incorrectos.
                </div>
            <% } %>

            <form action="validarLogin.jsp" method="post" id="loginForm">

                <!-- PASO 1: CORREO -->
                <div class="step active" id="stepCorreo">

                    <h1>Iniciar sesión</h1>

                    <div class="ms-input-box">
                        <input
                            type="email"
                            name="correo"
                            id="correo"
                            placeholder="Correo electrónico"
                            autocomplete="email"
                            required>
                    </div>

                    <div class="ms-links">
                        <a href="#">¿No puede acceder a su cuenta?</a>
                    </div>

                    <div class="ms-actions">
                        <a href="Cliente.jsp" class="btn-secondary">Atrás</a>

                        <button type="button" class="btn-primary" onclick="siguientePaso()">
                            Siguiente
                        </button>
                    </div>

                </div>

                <!-- PASO 2: CONTRASEÑA -->
                <div class="step" id="stepPassword">

                    <div class="ms-user-line">
                        <button type="button" class="back-arrow" onclick="volverPaso()">←</button>
                        <span id="correoMostrado"></span>
                    </div>

                    <h1>Escribir contraseña</h1>

                    <div class="ms-input-box">
                        <input
                            type="password"
                            name="password"
                            id="password"
                            placeholder="Contraseña"
                            autocomplete="current-password"
                            required>
                    </div>

                    <div class="ms-links">
                        <a href="#">He olvidado mi contraseña</a>
                    </div>

                    <div class="ms-actions right">
                        <button type="submit" class="btn-primary">
                            Iniciar sesión
                        </button>
                    </div>

                </div>

            </form>

        </section>

    </main>

    <footer class="ms-footer">
        <a href="#">Términos de uso</a>
        <a href="#">Privacidad y cookies</a>
    </footer>

    <script>
        function siguientePaso() {
            const correoInput = document.getElementById("correo");
            const correo = correoInput.value.trim();

            if (correo === "") {
                correoInput.focus();
                return;
            }

            if (!correoInput.checkValidity()) {
                correoInput.reportValidity();
                return;
            }

            document.getElementById("correoMostrado").textContent = correo;

            document.getElementById("stepCorreo").classList.remove("active");
            document.getElementById("stepPassword").classList.add("active");

            setTimeout(function () {
                document.getElementById("password").focus();
            }, 100);
        }

        function volverPaso() {
            document.getElementById("stepPassword").classList.remove("active");
            document.getElementById("stepCorreo").classList.add("active");

            setTimeout(function () {
                document.getElementById("correo").focus();
            }, 100);
        }
    </script>
<div style="
    position: fixed;
    bottom: 18px;
    left: 18px;
    z-index: 5;

    background: rgba(255, 255, 255, 0.88);
    color: #111827;

    padding: 14px 18px;
    border-radius: 10px;

    font-size: 14px;
    line-height: 1.6;
    font-family: 'Segoe UI', Arial, sans-serif;

    box-shadow: 0 4px 14px rgba(0, 0, 0, 0.25);
    border: 1px solid rgba(255, 255, 255, 0.7);

    backdrop-filter: blur(4px);
">
    <strong>Credenciales de prueba</strong><br><br>

    <strong>Cliente:</strong> nombre@cliente.com<br>
    <strong>Contraseña:</strong> 123<br><br>

    <strong>Secretaria:</strong> nombre@secretaria.com<br>
    <strong>Contraseña:</strong> 123<br><br>

    <strong>Especialista:</strong> nombre@especialista.com<br>
    <strong>Contraseña:</strong> 123<br><br>

    <strong>Admin:</strong> nombre@admin.com<br>
    <strong>Contraseña:</strong> 123
</div>

</body>
</html>