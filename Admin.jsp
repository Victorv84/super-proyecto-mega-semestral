<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String usuario = (String) session.getAttribute("usuario");
    String rol = (String) session.getAttribute("rol");

    boolean sesionIniciada = usuario != null &&
        rol != null &&
        ("admin".equalsIgnoreCase(rol) || "administrador".equalsIgnoreCase(rol));

    if (!sesionIniciada) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Datos temporales mientras conectas con base de datos
    String[][] usuariosSistema = {
        {"Ana Martínez", "Cliente", "ana@gmail.com", "8-888-1111", "Activo"},
        {"Laura Gómez", "Especialista", "laura@psireg.com", "E-001", "Activo"},
        {"María Torres", "Secretaria", "secretaria@psireg.com", "S-001", "Activo"},
        {"Carlos Pérez", "Cliente", "carlos@gmail.com", "8-777-2222", "Pendiente"}
    };

    String[][] especialistas = {
        {"Dra. Laura Gómez", "Psicología clínica", "12 pacientes", "Disponible"},
        {"Dr. Miguel Ríos", "Orientación vocacional", "8 pacientes", "En cita"},
        {"Dra. Sofía Herrera", "Terapia familiar", "5 pacientes", "Disponible"}
    };

    String[][] actividadReciente = {
        {"Se registró un nuevo paciente", "Hace 10 minutos", "Usuario"},
        {"Secretaria agendó una cita", "Hace 25 minutos", "Cita"},
        {"Especialista actualizó historial", "Hace 1 hora", "Historial"},
        {"Administrador modificó un usuario", "Hace 2 horas", "Sistema"}
    };
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>PSIREG - Administrador</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Iconos -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- CSS propio del administrador -->
    <link rel="stylesheet" href="estilos_Admin.css">
    <link rel="stylesheet" href="ModoOscuro.css">
</head>

<body>

<header class="topbar">
    <button class="btn-menu" type="button" onclick="toggleMenu()">
        <i class="fa-solid fa-bars"></i>
    </button>

    <h1 class="titulo-header">PSIREG</h1>

 <div class="header-derecha">

    <button type="button" class="btn-modo-tema" onclick="toggleModoOscuro()">
    <span class="icono-modo" id="iconoModo">🌙</span>
    <span class="texto-modo" id="textoModo">Modo oscuro</span>
</button>
    <button class="btn-campana" type="button" onclick="toggleNotificaciones(event)">
        <i class="fa-solid fa-bell"></i>
        <span class="punto-notificacion"></span>
    </button>

    


    <a href="Admin.jsp" class="btn-casa">
        <i class="fa-solid fa-house"></i>
    </a>
</div>

    <div class="panel-notificaciones" id="panelNotificaciones">
        <h3>Notificaciones</h3>

        <div class="notificacion">
            <strong>Nuevo usuario</strong>
            <p>Un nuevo cliente fue registrado en el sistema.</p>
        </div>

        <div class="notificacion">
            <strong>Cambio en agenda</strong>
            <p>Una cita fue reprogramada por secretaría.</p>
        </div>

        <div class="notificacion">
            <strong>Actividad del sistema</strong>
            <p>Se modificó información de un usuario.</p>
        </div>
    </div>
</header>

<nav class="menu-lateral" id="menuLateral">
    <div class="perfil-menu">
        <div class="avatar">
            <i class="fa-solid fa-user-shield"></i>
        </div>

        <div>
            <h3>Administrador</h3>
            <p><%= usuario %></p>
        </div>
    </div>

    <a href="Admin.jsp" class="activo">
        <i class="fa-solid fa-house"></i>
        Inicio
    </a>

    <a href="#">
        <i class="fa-solid fa-user-doctor"></i>
        Gestionar empleados
    </a>

    <a href="#">
        <i class="fa-solid fa-users"></i>
        Gestionar usuarios
    </a>

    <a href="#">
        <i class="fa-solid fa-chart-line"></i>
        Reportes
    </a>

    <a href="#">
        <i class="fa-solid fa-gear"></i>
        Configuración
    </a>

    <a href="logout.jsp" class="cerrar-sesion">
        <i class="fa-solid fa-right-from-bracket"></i>
        Cerrar sesión
    </a>
</nav>

<!-- El overlay queda transparente. Sirve para cerrar el menú, pero no oscurece el contenido. -->
<div class="overlay" id="overlay" onclick="cerrarMenu()"></div>

<main class="contenido-principal" id="contenidoPrincipal">

    <section class="resumen">
        <div class="card-resumen">
            <div class="icono-resumen azul">
                <i class="fa-solid fa-users"></i>
            </div>
            <div>
                <h3>48</h3>
                <p>Usuarios registrados</p>
            </div>
        </div>

        <div class="card-resumen">
            <div class="icono-resumen verde">
                <i class="fa-solid fa-user-doctor"></i>
            </div>
            <div>
                <h3>3</h3>
                <p>Especialistas activos</p>
            </div>
        </div>

        <div class="card-resumen">
            <div class="icono-resumen naranja">
                <i class="fa-solid fa-calendar-check"></i>
            </div>
            <div>
                <h3>15</h3>
                <p>Citas programadas</p>
            </div>
        </div>

        <div class="card-resumen">
            <div class="icono-resumen morado">
                <i class="fa-solid fa-triangle-exclamation"></i>
            </div>
            <div>
                <h3>2</h3>
                <p>Alertas pendientes</p>
            </div>
        </div>
    </section>

    <section class="acciones-rapidas">
        <h2>Acciones rápidas</h2>

        <div class="grid-acciones">
            <a href="#" class="accion">
                <i class="fa-solid fa-users-gear"></i>
                <span>Gestionar usuarios</span>
            </a>

            <a href="#" class="accion">
                <i class="fa-solid fa-user-doctor"></i>
                <span>Gestionar empleados</span>
            </a>

            <a href="#" class="accion">
                <i class="fa-solid fa-chart-pie"></i>
                <span>Ver reportes</span>
            </a>

            <a href="#" class="accion">
                <i class="fa-solid fa-circle-plus"></i>
                <span>Agregar actividades</span>
            </a>
        </div>
    </section>

    <section class="contenedor-doble">

        <div class="panel">
            <div class="encabezado-panel">
                <h2>Usuarios del sistema</h2>
                <a href="#">Ver todos</a>
            </div>

            <div class="tabla-contenedor">
                <table>
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Rol</th>
                            <th>Correo</th>
                            <th>Identificación</th>
                            <th>Estado</th>
                            <th>Acción</th>
                        </tr>
                    </thead>

                    <tbody>
                    <% for (int i = 0; i < usuariosSistema.length; i++) {
                        String estadoTexto = usuariosSistema[i][4];
                        String estadoClase = estadoTexto.toLowerCase().replace(" ", "-");
                    %>
                        <tr>
                            <td><%= usuariosSistema[i][0] %></td>
                            <td><%= usuariosSistema[i][1] %></td>
                            <td><%= usuariosSistema[i][2] %></td>
                            <td><%= usuariosSistema[i][3] %></td>
                            <td>
                                <span class="estado <%= estadoClase %>">
                                    <%= estadoTexto %>
                                </span>
                            </td>
                            <td>
                                <a href="EditarUsuario.jsp?id=<%= i + 1 %>" class="btn-tabla">
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
                <h2>Actividad reciente</h2>
                <a href="#">Auditoría</a>
            </div>

            <div class="lista-actividad">
                <% for (int i = 0; i < actividadReciente.length; i++) { %>
                    <div class="actividad">
                        <div class="icono-actividad">
                            <i class="fa-solid fa-clock-rotate-left"></i>
                        </div>

                        <div>
                            <h3><%= actividadReciente[i][0] %></h3>
                            <p><%= actividadReciente[i][1] %></p>
                            <span><%= actividadReciente[i][2] %></span>
                        </div>
                    </div>
                <% } %>
            </div>
        </div>

    </section>

    <section class="panel especialistas-panel">
        <div class="encabezado-panel">
            <h2>Empleados registrados</h2>
            <a href="#">Gestionar empleados</a>
        </div>

        <div class="grid-especialistas">
            <% for (int i = 0; i < especialistas.length; i++) {
                String estadoEspecialista = especialistas[i][3];
                String claseEspecialista = estadoEspecialista.toLowerCase().replace(" ", "-");
            %>
                <div class="card-especialista">
                    <div class="especialista-top">
                        <div class="especialista-avatar">
                            <i class="fa-solid fa-user-doctor"></i>
                        </div>

                        <span class="estado <%= claseEspecialista %>">
                            <%= estadoEspecialista %>
                        </span>
                    </div>

                    <h3><%= especialistas[i][0] %></h3>

                    <p>
                        <i class="fa-solid fa-brain"></i>
                        <%= especialistas[i][1] %>
                    </p>

                    <p>
                        <i class="fa-solid fa-users"></i>
                        <%= especialistas[i][2] %>
                    </p>

                    <div class="botones-card">
                        <a href="#?id=<%= i + 1 %>">Ver</a>
                        <a href="#?id=<%= i + 1 %>">Editar</a>
                    </div>
                </div>
            <% } %>
        </div>
    </section>

</main>

<footer>
    <p>PSIREG &copy; 2026 - Panel de Administración</p>
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
      function aplicarModoGuardado() {
        const modoGuardado = localStorage.getItem("modoOscuroAdmin");
        const icono = document.getElementById("iconoModo");

        if (modoGuardado === "activo") {
            document.body.classList.add("dark-mode");

            if (icono) {
                icono.className = "fa-solid fa-sun";
            }
        } else {
            document.body.classList.remove("dark-mode");

            if (icono) {
                icono.className = "fa-solid fa-moon";
            }
        }
    }

      function actualizarBotonModo() {
        const icono = document.getElementById("iconoModo");
        const texto = document.getElementById("textoModo");

        const oscuro = document.body.classList.contains("dark-mode");

        if (oscuro) {
            icono.textContent = "☀️";
            texto.textContent = "Modo claro";
        } else {
            icono.textContent = "🌙";
            texto.textContent = "Modo oscuro";
        }
    }

    function toggleModoOscuro() {
        document.body.classList.toggle("dark-mode");

        const oscuro = document.body.classList.contains("dark-mode");
        localStorage.setItem("modoOscuroAdmin", oscuro ? "activo" : "inactivo");

        actualizarBotonModo();
    }

    document.addEventListener("DOMContentLoaded", function () {
        const modoGuardado = localStorage.getItem("modoOscuroAdmin");

        if (modoGuardado === "activo") {
            document.body.classList.add("dark-mode");
        }

        actualizarBotonModo();
    });
</script>

</body>
</html>
