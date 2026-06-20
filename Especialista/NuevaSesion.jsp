<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<%
String usuario = (String) session.getAttribute("usuario");
String rol = (String) session.getAttribute("rol");

if (usuario == null || !"especialista".equals(rol)) {
    response.sendRedirect("../login.jsp");
    return;
}

String mensaje = "";

if ("POST".equalsIgnoreCase(request.getMethod())) {

    String nombre = request.getParameter("nombre");
    String cedula = request.getParameter("cedula");
    String fechaSesion = request.getParameter("fechaSesion");
    String horaSesion = request.getParameter("horaSesion");
    String motivo = request.getParameter("motivo");
    String observaciones = request.getParameter("observaciones");
    String diagnostico = request.getParameter("diagnostico");
    String recomendaciones = request.getParameter("recomendaciones");

    Map<String, String> nuevaSesion = new HashMap<>();

    nuevaSesion.put("nombre", nombre);
    nuevaSesion.put("cedula", cedula);
    nuevaSesion.put("fechaSesion", fechaSesion);
    nuevaSesion.put("horaSesion", horaSesion);
    nuevaSesion.put("motivo", motivo);
    nuevaSesion.put("observaciones", observaciones);
    nuevaSesion.put("diagnostico", diagnostico);
    nuevaSesion.put("recomendaciones", recomendaciones);

    ArrayList<Map<String, String>> sesiones =
        (ArrayList<Map<String, String>>) session.getAttribute("sesiones_" + cedula);

    if (sesiones == null) {
        sesiones = new ArrayList<>();
    }

    sesiones.add(0, nuevaSesion);

    session.setAttribute("sesiones_" + cedula, sesiones);

    mensaje = "Sesión guardada exitosamente.";
}
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Nueva Sesión - PSIREG</title>
    <link rel="stylesheet" href="NuevaSesion.css">
</head>

<body>

<header class="topbar">

    <button class="menu-btn" onclick="toggleMenu()" type="button">☰</button>

    <h2>PSIREG</h2>

    <div class="acciones-header">

        <button type="button" class="btn-modo" id="btnModo" onclick="toggleModoOscuro()">
            🌙 Modo oscuro
        </button>

        <div class="notification-container">
            <button class="notification-btn" onclick="toggleNotifications(event)" type="button">🔔</button>

            <div class="notification-panel" id="notificationPanel">
                <h3>Notificaciones</h3>

                <p><strong>📅 Próximas citas</strong></p>
                <p>Tienes una cita con Ana Martínez en 15 minutos.</p>
                <p>Tu próxima sesión inicia en 5 minutos.</p>

                <p><strong>❌ Cancelaciones</strong></p>
                <p>Carlos Pérez canceló su cita del 31/05/2026.</p>

                <p><strong>🔄 Reprogramaciones</strong></p>
                <p>María Gómez reprogramó su cita para el 5 de junio.</p>

                <p><strong>🆕 Nuevo paciente</strong></p>
                <p>Se te asignó un nuevo paciente.</p>
            </div>
        </div>

    </div>

</header>

<div class="layout">

    <aside class="sidebar" id="sidebar">
        <h3>Especialista</h3>

        <nav>
            <a href="Especialista.jsp">🏠 Inicio</a>
            <a href="AGENDAR C.jsp">📅 Agenda</a>
            <a href="Paciente.jsp">📁 Expediente</a>
            <a href="NuevaSesion.jsp" class="active">📝 Nueva sesión</a>

            <form action="../logout.jsp" method="post">
                <button class="salir-menu" type="submit">🚪 Salir</button>
            </form>
        </nav>
    </aside>

    <main class="content">

        <section class="form-section">
            <h1>Nueva sesión</h1>
            <p>Registra una nueva sesión para el expediente del paciente.</p>

            <% if (!mensaje.equals("")) { %>
                <div class="mensaje-exito">
                    <%= mensaje %>
                </div>
            <% } %>

            <form action="NuevaSesion.jsp" method="post" class="session-form">

                <div class="form-group">
                    <label>Paciente</label>
                    <select name="nombre" id="nombre" onchange="actualizarCedula()" required>
                        <option value="">Seleccione un paciente</option>
                        <option value="Ana Martínez">Ana Martínez</option>
                        <option value="Carlos Pérez">Carlos Pérez</option>
                        <option value="María Gómez">María Gómez</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Cédula</label>
                    <input type="text" name="cedula" id="cedula" readonly required>
                </div>

                <div class="form-group">
                    <label>Fecha de sesión</label>
                    <input type="date" name="fechaSesion" id="fechaSesion" required>
                </div>

                <div class="form-group">
                    <label>Hora de sesión</label>
                    <input type="time" name="horaSesion" required>
                </div>

                <div class="form-group">
                    <label>Motivo</label>
                    <textarea name="motivo" required></textarea>
                </div>

                <div class="form-group">
                    <label>Observaciones</label>
                    <textarea name="observaciones" required></textarea>
                </div>

                <div class="form-group">
                    <label>Diagnóstico / Evaluación</label>
                    <textarea name="diagnostico" required></textarea>
                </div>

                <div class="form-group">
                    <label>Recomendaciones</label>
                    <textarea name="recomendaciones" required></textarea>
                </div>

                <button type="submit" class="btn-guardar">Guardar sesión</button>

            </form>
        </section>

    </main>

</div>

<script>
function toggleMenu() {
    document.body.classList.toggle("menu-abierto");
}

function toggleNotifications(event) {
    if (event) {
        event.stopPropagation();
    }

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

function actualizarCedula() {
    const nombre = document.getElementById("nombre").value;
    const cedula = document.getElementById("cedula");

    if (nombre === "Ana Martínez") {
        cedula.value = "8-123-456";
    } else if (nombre === "Carlos Pérez") {
        cedula.value = "8-456-789";
    } else if (nombre === "María Gómez") {
        cedula.value = "8-789-123";
    } else {
        cedula.value = "";
    }
}

document.addEventListener("DOMContentLoaded", function() {
    const modoGuardado = localStorage.getItem("modoOscuro");

    if (modoGuardado === "activo") {
        document.body.classList.add("modo-oscuro");
    }

    aplicarTextoBotonModo();

    const fechaInput = document.getElementById("fechaSesion");

    if (fechaInput) {
        const hoy = new Date().toISOString().split("T")[0];
        fechaInput.setAttribute("min", hoy);
    }
});
</script>

</body>
</html>