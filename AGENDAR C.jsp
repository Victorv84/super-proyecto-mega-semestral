<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
String usuario = (String) session.getAttribute("usuario");
String rol = (String) session.getAttribute("rol");
String calendarId = (String) session.getAttribute("calendar_id");

if (calendarId == null) {
    calendarId = "TU_CALENDARIO_DE_PRUEBA";
}
if (usuario == null || !"especialista".equals(rol)) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Agenda Especialista</title>
    <link rel="stylesheet" href="estilos_Especialista.css">
</head>
<body>

<div class="layout">

    <aside class="sidebar" id="sidebar">
        <nav>
            <a href="Especialista.jsp">🏠 Inicio</a>
            <a href="AGENDAR C.jsp">📅 Agenda</a>
            <a href="Paciente.jsp">📁 Expediente</a>
            <a href="NuevaSesion.jsp">📝 Nueva sesión</a>

            <form action="logout.jsp" method="post">
                <button type="submit" class="salir-menu">🚪 Cerrar sesión</button>
            </form>
        </nav>
    </aside>

    <main class="main">

        <header class="topbar">

    <button class="menu-btn" onclick="toggleMenu()" type="button">
        ☰
    </button>

    <h2>PSIREG</h2>

    <div class="acciones-header">

        <button type="button" class="btn-modo" id="btnModo" onclick="toggleModoOscuro()">
            🌙 Modo oscuro
        </button>

        <div class="notification-container">

            <button class="notification-btn" type="button" onclick="toggleNotifications()">
                🔔
            </button>

            <div class="notification-panel" id="notificationPanel">

                <div class="notification-header">
                    <h3>Notificaciones</h3>
                </div>

                <div class="notification-group">
                    <h4>📅 Próximas citas</h4>

                    <div class="notification-item">
                        <p>Tienes una cita con Ana Martínez en 15 minutos.</p>
                    </div>

                    <div class="notification-item">
                        <p>Tu próxima sesión inicia en 5 minutos.</p>
                    </div>
                </div>

                <div class="notification-group">
                    <h4>❌ Cancelaciones</h4>

                    <div class="notification-item">
                        <p>Carlos Pérez canceló su cita del 31/05/2026.</p>
                    </div>
                </div>

            </div>

        </div>

    </div>

</header>

        <div class="contenido">

            <section class="tabla-section">
                <h2>Agenda del Especialista</h2>

                <iframe
    src="https://calendar.google.com/calendar/embed?src=victormanuel200073%40gmail.com&ctz=America%2FPanama"
    style="border: 0;"
    width="100%"
    height="650"
    frameborder="0"
    scrolling="no">
</iframe>

            </section>

        </div>

    </main>

</div>

<script>
function toggleMenu() {
    document.body.classList.toggle("menu-abierto");
}

function toggleNotifications() {
    const panel = document.getElementById("notificationPanel");

    if (panel) {
        panel.classList.toggle("show");
    }
}

document.addEventListener("click", function(event) {
    const container = document.querySelector(".notification-container");
    const panel = document.getElementById("notificationPanel");

    if (container && panel && !container.contains(event.target)) {
        panel.classList.remove("show");
    }
});

function aplicarTextoBotonModo() {
    const btn = document.getElementById("btnModo");

    if (!btn) return;

    if (document.body.classList.contains("modo-oscuro")) {
        btn.innerHTML = "☀️ Modo claro";
    } else {
        btn.innerHTML = "🌙 Modo oscuro";
    }
}

function toggleModoOscuro() {
    document.body.classList.toggle("modo-oscuro");

    if (document.body.classList.contains("modo-oscuro")) {
        localStorage.setItem("modoOscuro", "activo");
    } else {
        localStorage.setItem("modoOscuro", "inactivo");
    }

    aplicarTextoBotonModo();
}

document.addEventListener("DOMContentLoaded", function() {
    const modoGuardado = localStorage.getItem("modoOscuro");

    if (modoGuardado === "activo") {
        document.body.classList.add("modo-oscuro");
    }

    aplicarTextoBotonModo();
});
</script>

</body>
</html>