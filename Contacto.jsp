<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
String usuario = (String) session.getAttribute("usuario");
String rol = (String) session.getAttribute("rol");

boolean sesionIniciada = usuario != null && rol != null;
%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PSIREG - Contacto</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Usa el mismo CSS base de Cliente -->
    <link rel="stylesheet" href="estilos_Cliente.css">

    <!-- Modo oscuro -->
    <link rel="stylesheet" href="ModoOscuro.css">

    <!-- CSS específico de contacto -->
    <link rel="stylesheet" href="Contacto.css">
</head>

<body>

<header>

    <div class="header-izquierda">

        <button class="btn-menu" onclick="toggleMenu()">☰</button>

        <div class="logo-area">
            <a href="Cliente.jsp" class="logo-texto">
                <i class="fa-solid fa-house"></i>
            </a>

            <% if(sesionIniciada){ %>
                <span class="campana">🔔</span>
            <% } %>
        </div>

    </div>

    <div class="header-centro">
        <h1>PSIREG</h1>
    </div>

    <div class="header-derecha header-acciones">

       <button type="button" class="btn-modo" id="btnModoContacto">
    🌙 Modo oscuro
</button>

        <% if(sesionIniciada){ %>

            <a href="logout.jsp" class="btn-header">Cerrar sesión</a>

        <% } else { %>

            <a href="login.jsp" class="btn-header">Iniciar sesión</a>
            <a href="registrarse.jsp" class="btn-header">Registrarse</a>

        <% } %>

    </div>

</header>

<nav class="nav-pestanas">
    <a href="Cliente.jsp">Inicio</a>
    <a href="Descripcion.jsp">Descripción</a>
    <a href="MisionVision.jsp">Misión y visión</a>
    <a href="Personal.jsp">Especialistas</a>
    <a href="Contacto.jsp" class="activo">Contacto</a>
</nav>

<aside id="menuLateral" class="menu-lateral">

    <% if(sesionIniciada){ %>
       <a href="MiPerfil.jsp">Mi perfil</a>
        <a href="CalendarioCita.jsp">Calendario de cita</a>
        <a href="HistorialCitas.jsp">Historial de citas</a>
        <a href="logout.jsp">Cerrar sesión</a>


    <% } else { %>
        <a href="Descripcion.jsp">Descripción</a>
        <a href="MisionVision.jsp">Misión y visión</a>
        <a href="Personal.jsp">Especialistas</a>
        <a href="Contacto.jsp">Contacto</a>
        <a href="SoporteTecnico.jsp">Soporte técnico</a>


    <% } %>

</aside>

<div id="overlay" class="overlay" onclick="toggleMenu()"></div>

<main class="container contacto-container" id="menuPrincipal">

    <section class="contacto-header">
        <h2>Contacto</h2>
        <p>Comunícate con el equipo de PSIREG para recibir orientación o soporte.</p>
    </section>

    <section class="contacto-grid">

        <div class="contacto-card">
            <div class="contacto-icono">
                <i class="fa-solid fa-location-dot"></i>
            </div>

            <div>
                <h3>Dirección</h3>
                <p>Dirección Nacional de Orientación Psicológica</p>
            </div>
        </div>

        <div class="contacto-card">
            <div class="contacto-icono">
                <i class="fa-solid fa-phone"></i>
            </div>

            <div>
                <h3>Teléfono</h3>
                <p>+507 6000-0000</p>
            </div>
        </div>

        <div class="contacto-card">
            <div class="contacto-icono">
                <i class="fa-solid fa-envelope"></i>
            </div>

            <div>
                <h3>Correo</h3>
                <p>contacto@psireg.com</p>
            </div>
        </div>

        <div class="contacto-card">
            <div class="contacto-icono">
                <i class="fa-solid fa-clock"></i>
            </div>

            <div>
                <h3>Horario</h3>
                <p>Lunes a Viernes<br>8:00 a.m. - 5:00 p.m.</p>
            </div>
        </div>

    </section>

    <section class="contacto-nota">
        <h3>Atención psicológica y soporte</h3>
        <p>
            Para consultas relacionadas con citas, actividades, historial de sesiones o problemas técnicos,
            puedes utilizar los medios de contacto disponibles.
        </p>
    </section>

</main>
<script src="Menu.js"></script>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const boton = document.getElementById("btnModoContacto");

    function aplicarTexto() {
        if (!boton) return;

        if (document.body.classList.contains("dark-mode") || document.body.classList.contains("modo-oscuro")) {
            boton.innerHTML = "☀️ Modo claro";
        } else {
            boton.innerHTML = "🌙 Modo oscuro";
        }
    }

    const modoGuardado = localStorage.getItem("modoOscuro");

    if (modoGuardado === "activo") {
        document.body.classList.add("dark-mode");
        document.body.classList.add("modo-oscuro");
    } else {
        document.body.classList.remove("dark-mode");
        document.body.classList.remove("modo-oscuro");
    }

    aplicarTexto();

    if (boton) {
        boton.addEventListener("click", function () {
            document.body.classList.toggle("dark-mode");
            document.body.classList.toggle("modo-oscuro");

            if (document.body.classList.contains("dark-mode") || document.body.classList.contains("modo-oscuro")) {
                localStorage.setItem("modoOscuro", "activo");
            } else {
                localStorage.setItem("modoOscuro", "inactivo");
            }

            aplicarTexto();
        });
    }
});
</script>
<script src="Menu.js"></script>
<script src="Contacto.js"></script>

</body>
</html>