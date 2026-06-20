<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
String usuario = (String) session.getAttribute("usuario");
String rol = (String) session.getAttribute("rol");

if (usuario == null || !"especialista".equals(rol)) {
    response.sendRedirect("../login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel Especialista</title>
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

            <form action="../logout.jsp" method="post">
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

        <div class="contenido">

            <section class="bienvenida">
                <h1>Bienvenido Especialista</h1>

                <div class="acciones">
                    <form action="Paciente.jsp" method="get">
                        <button type="submit">Ver paciente</button>
                    </form>

                    <form action="AGENDAR C.jsp" method="get">
                        <button type="submit">Ver agenda</button>
                    </form>

                    <form action="NuevaSesion.jsp" method="get">
                        <button type="submit">Nueva sesión</button>
                    </form>
                </div>
            </section>

            <section class="cards">

                <div class="card">
                    <h3>Citas hoy</h3>
                    <p>5</p>
                </div>

                <div class="card">
                    <h3>Pendientes</h3>
                    <p>2</p>
                </div>

                <div class="card">
                    <h3>Atendidos</h3>
                    <p>3</p>
                </div>

                <div class="card">
                    <h3>Citas canceladas</h3>
                    <p>0</p>
                </div>

            </section>

            <section class="tabla-section">
                <h2>Próximas citas</h2>

                <div class="tabla-responsive">
                    <table>
                        <thead>
                            <tr>
                                <th>Hora</th>
                                <th>Paciente</th>
                                <th>Motivo</th>
                                <th>Estado</th>
                                <th>Acción</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>8:00 AM</td>
                                <td>Lucía Herrera</td>
                                <td>Ansiedad</td>
                                <td>Pendiente</td>
                                <td>
                                    <form action="VerHistorialPaciente.jsp" method="get">
                                        <input type="hidden" name="paciente" value="Lucía Herrera">
                                        <button class="vermas" type="submit">Ver más</button>
                                    </form>
                                </td>
                            </tr>

                            <tr>
                                <td>9:00 AM</td>
                                <td>Ana Martínez</td>
                                <td>Seguimiento</td>
                                <td>Confirmada</td>
                                <td>
                                    <form action="VerHistorialPaciente.jsp" method="get">
                                        <input type="hidden" name="paciente" value="Ana Martínez">
                                        <button class="vermas" type="submit">Ver más</button>
                                    </form>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

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