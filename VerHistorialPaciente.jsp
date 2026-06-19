<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
String usuario = (String) session.getAttribute("usuario");
String rol = (String) session.getAttribute("rol");

if (usuario == null || !"especialista".equals(rol)) {
    response.sendRedirect("login.jsp");
    return;
}

String paciente = request.getParameter("paciente");
String cedula = request.getParameter("cedula");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Historial del Paciente - PSIREG</title>
    <link rel="stylesheet" href="Paciente.css">
</head>

<body>

<header class="topbar">
    <button class="menu-btn" type="button" onclick="toggleMenu()">☰</button>
    <h2>PSIREG</h2>
    <div class="acciones-header">

                <button type="button" class="btn-modo" id="btnModo" onclick="toggleModoOscuro()">
                    🌙 Modo oscuro
                </button>
    <div class="notification-container">
        <button class="notification-btn" type="button" onclick="toggleNotifications()">🔔</button>

        <div class="notification-panel" id="notificationPanel">
            <div class="notification-header">
                <h3>Notificaciones</h3>
            </div>

            <div class="notification-group">
                <h4>📅 Próximas citas</h4>
                <div class="notification-item"><p>Tienes una cita con Ana Martínez en 15 minutos.</p></div>
                <div class="notification-item"><p>Tu próxima sesión inicia en 5 minutos.</p></div>
                <div class="notification-item"><p>La cita de las 2:00 PM está por comenzar.</p></div>
            </div>

            <div class="notification-group">
                <h4>❌ Cancelaciones</h4>
                <div class="notification-item"><p>Carlos Pérez canceló su cita del 31/05/2026.</p></div>
                <div class="notification-item"><p>La cita de mañana fue cancelada por el paciente.</p></div>
            </div>

            <div class="notification-group">
                <h4>🔄 Reprogramaciones</h4>
                <div class="notification-item"><p>María Gómez reprogramó su cita para el 5 de junio.</p></div>
                <div class="notification-item"><p>La secretaria modificó el horario de una cita.</p></div>
            </div>

            <div class="notification-group">
                <h4>🆕 Nuevo paciente asignado</h4>
                <div class="notification-item"><p>Se te asignó un nuevo paciente.</p></div>
                <div class="notification-item"><p>Paciente nuevo registrado en tu agenda.</p></div>
            </div>
        </div>
    </div>
    </div>
</header>

<div class="layout">

    <aside class="sidebar" id="sidebar">
        <h3>Especialista</h3>

        <a href="Especialista.jsp">🏠 Inicio</a>
        <a href="AGENDAR C.jsp">📅 Agenda</a>
        <a href="Paciente.jsp">📁 Expediente</a>
        <a href="NuevaSesion.jsp">📝 Nueva sesión</a>
        

        <form action="logout.jsp" method="post">
            <button class="salir-menu" type="submit">🚪 Cerrar sesión</button>
        </form>
    </aside>

    <main class="content">

        <a href="Paciente.jsp" class="back-link">← Volver a pacientes</a>

        <h1>Historial de Sesiones</h1>
        <p class="subtitle">
            Paciente: <strong><%= paciente != null ? paciente : "No seleccionado" %></strong>
            <% if (cedula != null) { %>
                | Cédula: <strong><%= cedula %></strong>
            <% } %>
        </p>

        <% if ("Ana Martínez".equals(paciente)) { %>

    <div class="session-card">
        <h3>Sesión 3</h3>
        <p><strong>Fecha:</strong> 12 mayo 2026</p>
        <p><strong>Motivo:</strong> Evaluación de progreso</p>
        <p><strong>Observación:</strong> Mejor manejo del estrés académico.</p>
        <p><strong>Diagnóstico / Evaluación:</strong> Se observa reducción de síntomas de ansiedad relacionados con exigencias académicas.</p>
        <p><strong>Recomendación:</strong> Continuar seguimiento en dos semanas.</p>
    </div>

    <div class="session-card">
        <h3>Sesión 2</h3>
        <p><strong>Fecha:</strong> 24 abril 2026</p>
        <p><strong>Motivo:</strong> Seguimiento emocional</p>
        <p><strong>Observación:</strong> Presenta avances en organización personal.</p>
        <p><strong>Diagnóstico / Evaluación:</strong> Evolución favorable en la organización personal y manejo emocional.</p>
        <p><strong>Recomendación:</strong> Mantener ejercicios de respiración.</p>
    </div>

    <div class="session-card">
        <h3>Sesión 1</h3>
        <p><strong>Fecha:</strong> 10 abril 2026</p>
        <p><strong>Motivo:</strong> Ansiedad académica</p>
        <p><strong>Observación:</strong> Dificultad para manejar carga universitaria.</p>
        <p><strong>Diagnóstico / Evaluación:</strong> Ansiedad académica moderada asociada a sobrecarga universitaria y dificultades de planificación.</p>
        <p><strong>Recomendación:</strong> Crear horario de estudio y descanso.</p>
    </div>

<% } else if ("Carlos Pérez".equals(paciente)) { %>

    <div class="session-card">
        <h3>Sesión 2</h3>
        <p><strong>Fecha:</strong> 18 mayo 2026</p>
        <p><strong>Motivo:</strong> Seguimiento conductual</p>
        <p><strong>Observación:</strong> Mayor participación durante la sesión.</p>
        <p><strong>Diagnóstico / Evaluación:</strong> Mejora gradual en la expresión emocional y en la participación durante las sesiones.</p>
        <p><strong>Recomendación:</strong> Continuar con registro de emociones.</p>
    </div>

    <div class="session-card">
        <h3>Sesión 1</h3>
        <p><strong>Fecha:</strong> 30 abril 2026</p>
        <p><strong>Motivo:</strong> Estrés familiar</p>
        <p><strong>Observación:</strong> Dificultad para expresar emociones.</p>
        <p><strong>Diagnóstico / Evaluación:</strong> Estrés familiar con dificultades para comunicar emociones y necesidades personales.</p>
        <p><strong>Recomendación:</strong> Practicar comunicación asertiva.</p>
    </div>

<% } else if ("María Gómez".equals(paciente)) { %>

    <div class="session-card">
        <h3>Sesión 4</h3>
        <p><strong>Fecha:</strong> 22 mayo 2026</p>
        <p><strong>Motivo:</strong> Control de progreso</p>
        <p><strong>Observación:</strong> Mejor adaptación a la rutina académica.</p>
        <p><strong>Diagnóstico / Evaluación:</strong> Adaptación positiva a las demandas académicas y estabilidad emocional adecuada.</p>
        <p><strong>Recomendación:</strong> Mantener seguimiento mensual.</p>
    </div>

    <div class="session-card">
        <h3>Sesión 3</h3>
        <p><strong>Fecha:</strong> 8 mayo 2026</p>
        <p><strong>Motivo:</strong> Apoyo emocional</p>
        <p><strong>Observación:</strong> Se muestra más tranquila durante la sesión.</p>
        <p><strong>Diagnóstico / Evaluación:</strong> Disminución de síntomas de ansiedad y fortalecimiento de recursos personales de afrontamiento.</p>
        <p><strong>Recomendación:</strong> Reforzar actividades de autocuidado.</p>
    </div>

    <div class="session-card">
        <h3>Sesión 2</h3>
        <p><strong>Fecha:</strong> 26 abril 2026</p>
        <p><strong>Motivo:</strong> Seguimiento psicológico</p>
        <p><strong>Observación:</strong> Reconoce factores que aumentan su estrés.</p>
        <p><strong>Diagnóstico / Evaluación:</strong> Identifica adecuadamente factores desencadenantes del estrés y muestra disposición al cambio.</p>
        <p><strong>Recomendación:</strong> Aplicar técnicas de relajación.</p>
    </div>

    <div class="session-card">
        <h3>Sesión 1</h3>
        <p><strong>Fecha:</strong> 12 abril 2026</p>
        <p><strong>Motivo:</strong> Primera atención</p>
        <p><strong>Observación:</strong> Solicita apoyo emocional y académico.</p>
        <p><strong>Diagnóstico / Evaluación:</strong> Necesidad de apoyo psicológico inicial para manejo emocional y adaptación académica.</p>
        <p><strong>Recomendación:</strong> Programar seguimiento continuo.</p>
    </div>



        <% } else { %>

            <div class="session-card">
                <h3>No hay historial disponible</h3>
                <p>No se encontraron sesiones para este paciente.</p>
            </div>

        <% } %>

    </main>

</div>

<script>
function toggleMenu() {
    const sidebar = document.getElementById("sidebar");
    sidebar.classList.toggle("sidebar-abierto");
    document.body.classList.toggle("menu-abierto");
}

function toggleNotifications() {
    const panel = document.getElementById("notificationPanel");
    panel.classList.toggle("show");
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
