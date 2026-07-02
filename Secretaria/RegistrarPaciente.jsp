<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<%
String mensaje = "";

if ("POST".equalsIgnoreCase(request.getMethod())) {

    String nombre = request.getParameter("nombre");
    String cedula = request.getParameter("cedula");
    String fechaNacimiento = request.getParameter("fechaNacimiento");
    String sexo = request.getParameter("sexo");
    String anioCursa = request.getParameter("anioCursa");
    String direccion = request.getParameter("direccion");
    String contacto = request.getParameter("contacto");
    String correo = request.getParameter("correo");

    Map<String, String> nuevoPaciente = new HashMap<>();

    nuevoPaciente.put("nombre", nombre);
    nuevoPaciente.put("cedula", cedula);
    nuevoPaciente.put("fechaNacimiento", fechaNacimiento);
    nuevoPaciente.put("sexo", sexo);
    nuevoPaciente.put("anioCursa", anioCursa);
    nuevoPaciente.put("direccion", direccion);
    nuevoPaciente.put("contacto", contacto);
    nuevoPaciente.put("correo", correo);

    ArrayList<Map<String, String>> pacientes =
        (ArrayList<Map<String, String>>) session.getAttribute("pacientes_registrados");

    if (pacientes == null) {
        pacientes = new ArrayList<>();
    }

    pacientes.add(0, nuevoPaciente);
    session.setAttribute("pacientes_registrados", pacientes);

    mensaje = "Paciente registrado exitosamente.";
}
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Paciente - PSIREG</title>
    <link rel="stylesheet" href="estilos_RegistrarPaciente.css">
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

                <p><strong>🆕 Registro de pacientes</strong></p>
                <p>Desde esta sección puedes registrar nuevos pacientes en el sistema.</p>

                <p><strong>📅 Gestión de citas</strong></p>
                <p>Recuerda verificar la disponibilidad antes de asignar una nueva cita.</p>

                <p><strong>📁 Expediente</strong></p>
                <p>Después del registro, el paciente podrá ser usado en expedientes y sesiones.</p>
            </div>
        </div>

    </div>

</header>

<div class="layout">

    <aside class="sidebar" id="sidebar">
        <h3>Secretaría</h3>

        <nav>
            <a href="Secretaria.jsp">🏠 Inicio</a>
            <a href="RegistrarPaciente.jsp" class="active">🧑‍⚕️ Registrar paciente</a>

            <form action="../logout.jsp" method="post">
                <button class="salir-menu" type="submit">🚪 Salir</button>
            </form>
        </nav>
    </aside>

    <main class="content">

        <section class="form-section">
            <h1>Registrar paciente</h1>
            <p>Registra un nuevo paciente para que pueda ser gestionado dentro del sistema PSIREG.</p>

            <% if (!mensaje.equals("")) { %>
                <div class="mensaje-exito">
                    <%= mensaje %>
                </div>
            <% } %>

            <form action="RegistrarPaciente.jsp" method="post" class="session-form">

                <div class="form-group">
                    <label>Nombre completo</label>
                    <input type="text" name="nombre" placeholder="Ingrese nombre completo" required>
                </div>

                <div class="form-group">
                    <label>Cédula</label>
                    <input type="text" name="cedula" placeholder="Ingrese cédula" required>
                </div>

                <div class="form-group">
                    <label>Fecha de nacimiento</label>
                    <input type="date" name="fechaNacimiento" id="fechaNacimiento" required>
                </div>

                <div class="form-group">
                    <label>Sexo</label>
                    <select name="sexo" required>
                        <option value="">Seleccione el sexo</option>
                        <option value="Masculino">Masculino</option>
                        <option value="Femenino">Femenino</option>
                    </select>
                </div>

               

                <div class="form-group">
                    <label>Dirección</label>
                    <textarea name="direccion" placeholder="Ingrese la dirección del paciente" required></textarea>
                </div>

                <div class="form-group">
                    <label>Contacto</label>
                    <input type="text" name="contacto" placeholder="Ingrese número de contacto" required>
                </div>

                <div class="form-group">
                    <label>Correo electrónico</label>
                    <input type="email" name="correo" placeholder="Ingrese correo electrónico" required>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn-guardar">Guardar paciente</button>
                    <a href="Secretaria.jsp" class="btn-cancelar">Cancelar</a>
                </div>

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

document.addEventListener("DOMContentLoaded", function() {
    const modoGuardado = localStorage.getItem("modoOscuro");

    if (modoGuardado === "activo") {
        document.body.classList.add("modo-oscuro");
    }

    aplicarTextoBotonModo();

    const fechaInput = document.getElementById("fechaNacimiento");

    if (fechaInput) {
        const hoy = new Date().toISOString().split("T")[0];
        fechaInput.setAttribute("max", hoy);
    }
});
</script>

</body>
</html>
