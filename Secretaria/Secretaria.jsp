<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String usuario = (String) session.getAttribute("usuario");
    String rol = (String) session.getAttribute("rol");

    boolean sesionIniciada = usuario != null && "secretaria".equals(rol);

    if (!sesionIniciada) {
        response.sendRedirect("../login.jsp");
        return;
    }

    // Datos temporales mientras conectas con base de datos
    String[][] citasHoy = {
        {"08:00 AM", "09:00 AM", "Ana Martínez", "Dra. Laura Gómez", "Confirmada"},
        {"10:30 AM", "11:30 AM", "Carlos Pérez", "Dr. Miguel Ríos", "Pendiente"},
        {"02:00 PM", "03:00 PM", "María González", "Dra. Laura Gómez", "Reprogramada"}
    };

    String[][] especialistas = {
        {"Dra. Laura Gómez", "Psicología clínica", "Disponible"},
        {"Dr. Miguel Ríos", "Orientación vocacional", "En cita"},
        {"Dra. Sofía Herrera", "Terapia familiar", "Disponible"}
    };
%>

<%!
    public String generarIdPaciente(String nombre) {
        if (nombre == null) return "";

        return nombre.toLowerCase()
                .replace("á", "a")
                .replace("é", "e")
                .replace("í", "i")
                .replace("ó", "o")
                .replace("ú", "u")
                .replace("ñ", "n")
                .replaceAll("\\s+", "-");
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>PSIREG - Secretaria</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Iconos -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- CSS -->
    <link rel="stylesheet" href="estilos_Secretaria.css">
    <link rel="stylesheet" href="../ModoOscuro.css">
</head>

<body>

<header class="topbar">
    <button class="btn-menu" onclick="toggleMenu()">
        <i class="fa-solid fa-bars"></i>
    </button>

    <h1 class="titulo-header">PSIREG</h1>

    <div class="header-derecha">

        <button type="button" class="btn-modo" id="btnModo" onclick="toggleModoOscuro()">
            🌙 Modo oscuro
        </button>

        <button class="btn-campana" onclick="toggleNotificaciones(event)">
            <i class="fa-solid fa-bell"></i>
            <span class="punto-notificacion"></span>
        </button>

        <a href="Secretaria.jsp" class="btn-casa">
            <i class="fa-solid fa-house"></i>
        </a>
    </div>

    <div class="panel-notificaciones" id="panelNotificaciones">
        <h3>Notificaciones</h3>

        <div class="notificacion">
            <strong>Cita pendiente</strong>
            <p>Carlos Pérez tiene una cita pendiente por confirmar.</p>
        </div>

        <div class="notificacion">
            <strong>Reprogramación</strong>
            <p>María González solicitó cambio de horario.</p>
        </div>

        <div class="notificacion">
            <strong>Nuevo paciente</strong>
            <p>Se registró un nuevo paciente en el sistema.</p>
        </div>
    </div>
</header>

<nav class="menu-lateral" id="menuLateral">
    <div class="perfil-menu">
        <div class="avatar">
            <i class="fa-solid fa-user-tie"></i>
        </div>

        <div>
            <h3>Secretaria</h3>
            <p><%= usuario %></p>
        </div>
    </div>

    <a href="Secretaria.jsp" class="activo">
        <i class="fa-solid fa-house"></i>
        Inicio
    </a>

    <a href="AGENDAR C.jsp">
        <i class="fa-solid fa-calendar-days"></i>
        Ver Calendario
    </a>

    <a href="#">
        <i class="fa-solid fa-user-doctor"></i>
        Especialistas
    </a>

    <a href="Paciente_secretaria.jsp">
        <i class="fa-solid fa-user-large"></i>
        Pacientes
    </a>

    <a href="../logout.jsp" class="cerrar-sesion">
        <i class="fa-solid fa-right-from-bracket"></i>
        Cerrar sesión
    </a>
</nav>

<div class="overlay" id="overlay" onclick="cerrarMenu()"></div>

<main class="contenido-principal" id="contenidoPrincipal">

    <section class="resumen">
        <div class="card-resumen">
            <div class="icono-resumen azul">
                <i class="fa-solid fa-calendar-day"></i>
            </div>
            <div>
                <h3>3</h3>
                <p>Citas de hoy</p>
            </div>
        </div>

        <div class="card-resumen">
            <div class="icono-resumen verde">
                <i class="fa-solid fa-user-check"></i>
            </div>
            <div>
                <h3>2</h3>
                <p>Especialistas disponibles</p>
            </div>
        </div>

        <div class="card-resumen">
            <div class="icono-resumen naranja">
                <i class="fa-solid fa-clock"></i>
            </div>
            <div>
                <h3>1</h3>
                <p>Cita pendiente</p>
            </div>
        </div>
    </section>

    <section class="acciones-rapidas">
        <h2>Acciones rápidas</h2>

        <div class="grid-acciones">
            <a href="AGENDAR C.jsp" class="accion">
                <i class="fa-solid fa-calendar-days"></i>
                <span>Calendario de Especialistas</span>
            </a>

            <a href="RegistrarPaciente.jsp" class="accion">
                <i class="fa-solid fa-user-plus"></i>
                <span>Registrar paciente</span>
            </a>

            <a href="#" class="accion">
                <i class="fa-solid fa-user-doctor"></i>
                <span>Ver especialistas</span>
            </a>
        </div>
    </section>

    <section class="contenedor-doble">

        <div class="panel">
            <div class="encabezado-panel">
                <h2>Citas de hoy</h2>
                <a href="Paciente_secretaria.jsp">Ver todas</a>
            </div>

            <div class="tabla-contenedor">
                <table>
                    <thead>
                        <tr>
                            <th>Hora inicio</th>
                            <th>Hora fin</th>
                            <th>Paciente</th>
                            <th>Especialista</th>
                            <th>Estado</th>
                            <th>Acción</th>
                        </tr>
                    </thead>

                    <tbody>
                    <% for (int i = 0; i < citasHoy.length; i++) { %>
                        <tr>
                            <td><%= citasHoy[i][0] %></td>
                            <td><%= citasHoy[i][1] %></td>
                            <td><%= citasHoy[i][2] %></td>
                            <td><%= citasHoy[i][3] %></td>
                            <td>
                                <span class="estado <%= citasHoy[i][4].toLowerCase() %>">
                                    <%= citasHoy[i][4] %>
                                </span>
                            </td>
                            <td>
                                <a href="Paciente_secretaria.jsp?editar=<%= generarIdPaciente(citasHoy[i][2]) %>" class="btn-tabla">
                                    Editar
                                </a>
                            </td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="panel">
            <div class="encabezado-panel">
                <h2>Especialistas</h2>
            </div>

            <div class="lista-cards">
                <% for (int i = 0; i < especialistas.length; i++) { %>
                    <div class="mini-card">
                        <div class="mini-icono">
                            <i class="fa-solid fa-user-doctor"></i>
                        </div>

                        <div class="mini-info">
                            <h3><%= especialistas[i][0] %></h3>
                            <p><%= especialistas[i][1] %></p>
                            <span class="estado-especialista">
                                <%= especialistas[i][2] %>
                            </span>
                        </div>
                    </div>
                <% } %>
            </div>
        </div>

    </section>

</main>

<footer>
    <p>PSIREG &copy; 2026 - Centro de Psicología</p>
</footer>

<script>
    function toggleMenu() {
        document.body.classList.toggle("menu-abierto");
    }

    function cerrarMenu() {
        document.body.classList.remove("menu-abierto");
    }

    function toggleNotificaciones(event) {
        event.stopPropagation();

        const panel = document.getElementById("panelNotificaciones");
        panel.classList.toggle("mostrar");
    }

    document.addEventListener("click", function(event) {
        const panel = document.getElementById("panelNotificaciones");
        const campana = document.querySelector(".btn-campana");

        if (panel && campana && !panel.contains(event.target) && !campana.contains(event.target)) {
            panel.classList.remove("mostrar");
        }
    });
</script>

<script src="../ModoOscuro.js"></script>

</body>
</html>