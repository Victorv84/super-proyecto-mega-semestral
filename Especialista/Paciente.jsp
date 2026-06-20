<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
String usuario = (String) session.getAttribute("usuario");
String rol = (String) session.getAttribute("rol");

if (usuario == null || !"especialista".equals(rol)) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Pacientes - PSIREG</title>
    <link rel="stylesheet" href="Paciente.css">
</head>

<body>

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

                            <div class="notification-item">
                                <p>La cita de las 2:00 PM está por comenzar.</p>
                            </div>
                        </div>

                        <div class="notification-group">
                            <h4>❌ Cancelaciones</h4>

                            <div class="notification-item">
                                <p>Carlos Pérez canceló su cita del 31/05/2026.</p>
                            </div>

                            <div class="notification-item">
                                <p>La cita de mañana fue cancelada por el paciente.</p>
                            </div>
                        </div>

                        <div class="notification-group">
                            <h4>🔄 Reprogramaciones</h4>

                            <div class="notification-item">
                                <p>María Gómez reprogramó su cita para el 5 de junio.</p>
                            </div>

                            <div class="notification-item">
                                <p>La secretaria modificó el horario de una cita.</p>
                            </div>
                        </div>

                        <div class="notification-group">
                            <h4>🆕 Nuevo paciente asignado</h4>

                            <div class="notification-item">
                                <p>Se te asignó un nuevo paciente.</p>
                            </div>

                            <div class="notification-item">
                                <p>Paciente nuevo registrado en tu agenda.</p>
                            </div>
                        </div>

                    </div>

                </div>

            </div>

        </header>

<div class="layout">

    <aside id="sidebar" class="sidebar">
        <h3>Especialista</h3>

        <a href="Especialista.jsp">🏠 Inicio</a>
        <a href="AGENDAR C.jsp">📅 Agenda</a>
        <a href="Paciente.jsp">📁 Expediente</a>
        <a href="NuevaSesion.jsp">📝 Nueva sesión</a>

        <form action="logout.jsp" method="post">
            <button type="submit" class="salir-menu">🚪 Cerrar sesión</button>
        </form>
    </aside>

    <main class="content">

        <h1>Expedientes de los Pacientes</h1>
        <p class="subtitle">Pacientes atendidos por este especialista</p>

        <div class="search-box">
            <input type="text" id="buscarPaciente" placeholder="Buscar Paciente">
            <button type="button" class="search-btn" onclick="buscarPacientes()">🔍</button>
        </div>

        <section class="patient-grid">

            <div class="patient-card">
                <h3>Ana Martínez</h3>
                <div class="patient-info">
                    <p><strong>Cédula:</strong> 8-123-456</p>
                    <p><strong>Fecha de nacimiento:</strong> 15/03/1998</p>
                    <p><strong>Sexo:</strong> Femenino</p>
                    <p><strong>Estamento:</strong> Estudiante</p>
                    <p><strong>Última sesión:</strong> 12/05/2026</p>
                </div>

                <form action="VerHistorialPaciente.jsp" method="get">
                    <input type="hidden" name="paciente" value="Ana Martínez">
                    <input type="hidden" name="cedula" value="8-123-456">
                    <button type="submit">Ver expediente</button>
                </form>
            </div>

            <div class="patient-card">
                <h3>Carlos Pérez</h3>
                <div class="patient-info">
                    <p><strong>Cédula:</strong> 8-987-654</p>
                    <p><strong>Fecha de nacimiento:</strong> 22/07/1995</p>
                    <p><strong>Sexo:</strong> Masculino</p>
                    <p><strong>Estamento:</strong> Docente</p>
                    <p><strong>Última sesión:</strong> 10/05/2026</p>
                </div>

                <form action="VerHistorialPaciente.jsp" method="get">
                    <input type="hidden" name="paciente" value="Carlos Pérez">
                    <input type="hidden" name="cedula" value="8-987-654">
                    <button type="submit">Ver expediente</button>
                </form>
            </div>

            <div class="patient-card">
                <h3>María Gómez</h3>
                <div class="patient-info">
                    <p><strong>Cédula:</strong> 8-555-222</p>
                    <p><strong>Fecha de nacimiento:</strong> 08/11/2000</p>
                    <p><strong>Sexo:</strong> Femenino</p>
                    <p><strong>Estamento:</strong> Administrativa</p>
                    <p><strong>Última sesión:</strong> 15/05/2026</p>
                </div>

                <form action="VerHistorialPaciente.jsp" method="get">
                    <input type="hidden" name="paciente" value="María Gómez">
                    <input type="hidden" name="cedula" value="8-555-222">
                    <button type="submit">Ver expediente</button>
                </form>
            </div>

        </section>

    </main>

</div>

<script>
function toggleMenu() {
    const sidebar = document.getElementById("sidebar");
    sidebar.classList.toggle("sidebar-abierto");
    document.body.classList.toggle("menu-abierto");
}

function buscarPacientes() {
    const texto = document.getElementById("buscarPaciente").value.toLowerCase();
    const pacientes = document.querySelectorAll(".patient-card");

    pacientes.forEach(function(card) {
        const contenido = card.innerText.toLowerCase();

        if (contenido.includes(texto)) {
            card.style.display = "";
        } else {
            card.style.display = "none";
        }
    });
}

document.getElementById("buscarPaciente").addEventListener("keydown", function(event) {
    if (event.key === "Enter") {
        event.preventDefault();
        buscarPacientes();
    }
});

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