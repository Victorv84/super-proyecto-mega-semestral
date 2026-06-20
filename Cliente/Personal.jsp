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
    <title>PSIREG - Especialistas</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- ICONOS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- CSS -->
    <link rel="stylesheet" href="Personal.css">
</head>

<body>

<header>
    <div class="header-izquierda">

    <button class="btn-menu" onclick="toggleMenu()">
        <i class="fa-solid fa-bars"></i>
    </button>

    <a href="<%= sesionIniciada ? "Cliente.jsp" : "index.jsp" %>" class="btn-home">
        <i class="fa-solid fa-house"></i>
    </a>

</div>

    <div class="header-centro">
        <h1>PSIREG</h1>
    </div>

    <div class="header-derecha">

        <% if(sesionIniciada){ %>
            <button class="btn-campana" onclick="toggleNotificaciones()">
                <i class="fa-solid fa-bell"></i>
                <span class="noti-punto"></span>
            </button>
        <% } %>

        <button id="btnModo" class="btn-modo" onclick="toggleModoOscuro()">
            🌙 Modo oscuro
        </button>

        <% if(sesionIniciada){ %>
            <a href="../logout.jsp" class="btn-header">Cerrar sesión</a>
        <% } else { %>
            <a href="../login.jsp" class="btn-header">Iniciar sesión</a>
        <% } %>

    </div>
</header>

<% if(sesionIniciada){ %>
<div class="panel-notificaciones" id="panelNotificaciones">
    <h3>Notificaciones</h3>

    <div class="notificacion-item">
        <i class="fa-solid fa-calendar-check"></i>
        <p>Recuerda revisar tus próximas citas.</p>
    </div>

    <div class="notificacion-item">
        <i class="fa-solid fa-user-doctor"></i>
        <p>Puedes consultar los especialistas disponibles.</p>
    </div>
</div>
<% } %>

<!-- NAV SUPERIOR -->
<nav>
    <a href="<%= sesionIniciada ? "Cliente.jsp" : "index.jsp" %>">Inicio</a>
    <a href="Descripcion.jsp">Descripción</a>
    <a href="MisionVision.jsp">Misión y visión</a>
    <a href="Personal.jsp">Especialistas</a>
    <a href="Contacto.jsp">Contacto</a>
</nav>

<!-- MENÚ LATERAL -->
<aside id="menuLateral" class="menu-lateral">

    <% if(sesionIniciada){ %>
        <a href="MiPerfil.jsp">
            <i class="fa-solid fa-user"></i> Mi perfil
        </a>

        <a href="CalendarioCita.jsp">
            <i class="fa-solid fa-calendar-days"></i> Calendario de cita
        </a>

        <a href="HistorialCitas.jsp">
            <i class="fa-solid fa-clock-rotate-left"></i> Historial de citas
        </a>

        <a href="../logout.jsp">
            <i class="fa-solid fa-right-from-bracket"></i> Cerrar sesión
        </a>
    <% } else { %>
        <a href="Descripcion.jsp">Descripción</a>
        <a href="MisionVision.jsp">Misión y visión</a>
        <a href="Personal.jsp">Especialistas</a>
        <a href="Contacto.jsp">Contacto</a>
        <a href="SoporteTecnico.jsp">Soporte técnico</a>
    <% } %>

</aside>

<div id="overlayMenu" class="overlay-menu" onclick="toggleMenu()"></div>

<main>

    <!-- HERO -->
    <section class="especialistas-hero">
        <div class="hero-contenido">
            <h2>Especialistas</h2>
            <p>
                Conoce al equipo de profesionales encargados de brindar orientación,
                acompañamiento y seguimiento psicológico dentro de PSIREG.
            </p>
        </div>
    </section>

    <!-- INTRO -->
    <section class="contenedor">
        <div class="tarjeta-principal">
            <h2><i class="fa-solid fa-user-doctor"></i> Nuestro equipo profesional</h2>
            <p>
                En esta sección se muestran los especialistas disponibles dentro del sistema.
                Cada profesional cuenta con un área de atención, horario y modalidad de servicio.
            </p>
            <p>
                En una versión conectada a base de datos, esta información podrá cargarse
                automáticamente desde la tabla de especialistas registrados.
            </p>
        </div>
    </section>

    <!-- BUSCADOR -->
    <section class="contenedor">
        <div class="buscador-especialistas">
            <i class="fa-solid fa-magnifying-glass"></i>
            <input type="text" id="buscarEspecialista" placeholder="Buscar por nombre o especialidad...">
        </div>
    </section>

    <!-- CARDS -->
    <section class="contenedor">
        <h2 class="titulo-seccion">Especialistas disponibles</h2>

        <div class="grid-especialistas" id="listaEspecialistas">

            <div class="especialista-card" data-info="ana martinez psicologia clinica ansiedad estres utp central presencial virtual">
                <div class="avatar">
                    <i class="fa-solid fa-user-doctor"></i>
                </div>

                <div class="especialista-info">
                    <h3>Dra. Ana Martínez</h3>
                    <span class="especialidad">Psicología clínica</span>

                    <p>
                        Atención enfocada en ansiedad, estrés académico, adaptación universitaria
                        y acompañamiento emocional.
                    </p>

                    <div class="datos">
                        <p><i class="fa-solid fa-location-dot"></i> Sede: UTP Central</p>
                        <p><i class="fa-solid fa-clock"></i> Horario: Lunes a Viernes</p>
                        <p><i class="fa-solid fa-video"></i> Modalidad: Presencial / Virtual</p>
                    </div>

                    <% if(sesionIniciada){ %>
                        <a href="CalendarioCita.jsp" class="btn-cita">Solicitar cita</a>
                    <% } else { %>
                        <a href="../login.jsp" class="btn-cita">Iniciar sesión para cita</a>
                    <% } %>
                </div>
            </div>

            <div class="especialista-card" data-info="carlos perez orientacion academica rendimiento motivacion panama oeste presencial">
                <div class="avatar">
                    <i class="fa-solid fa-user-doctor"></i>
                </div>

                <div class="especialista-info">
                    <h3>Lic. Carlos Pérez</h3>
                    <span class="especialidad">Orientación académica</span>

                    <p>
                        Apoyo en rendimiento académico, organización del tiempo,
                        hábitos de estudio y motivación personal.
                    </p>

                    <div class="datos">
                        <p><i class="fa-solid fa-location-dot"></i> Sede: Panamá Oeste</p>
                        <p><i class="fa-solid fa-clock"></i> Horario: Martes y Jueves</p>
                        <p><i class="fa-solid fa-user-group"></i> Modalidad: Presencial</p>
                    </div>

                    <% if(sesionIniciada){ %>
                        <a href="CalendarioCita.jsp" class="btn-cita">Solicitar cita</a>
                    <% } else { %>
                        <a href="../login.jsp" class="btn-cita">Iniciar sesión para cita</a>
                    <% } %>
                </div>
            </div>

            <div class="especialista-card" data-info="maria gomez bienestar emocional autoestima duelo relaciones chiriqui virtual">
                <div class="avatar">
                    <i class="fa-solid fa-user-doctor"></i>
                </div>

                <div class="especialista-info">
                    <h3>Licda. María Gómez</h3>
                    <span class="especialidad">Bienestar emocional</span>

                    <p>
                        Orientación en autoestima, manejo emocional, relaciones interpersonales
                        y procesos de cambio personal.
                    </p>

                    <div class="datos">
                        <p><i class="fa-solid fa-location-dot"></i> Sede: Chiriquí</p>
                        <p><i class="fa-solid fa-clock"></i> Horario: Lunes, Miércoles y Viernes</p>
                        <p><i class="fa-solid fa-video"></i> Modalidad: Virtual</p>
                    </div>

                    <% if(sesionIniciada){ %>
                        <a href="CalendarioCita.jsp" class="btn-cita">Solicitar cita</a>
                    <% } else { %>
                        <a href="../login.jsp" class="btn-cita">Iniciar sesión para cita</a>
                    <% } %>
                </div>
            </div>

            <div class="especialista-card" data-info="laura rodriguez psicologia educativa estudiantes docentes cocle presencial virtual">
                <div class="avatar">
                    <i class="fa-solid fa-user-doctor"></i>
                </div>

                <div class="especialista-info">
                    <h3>Mgtr. Laura Rodríguez</h3>
                    <span class="especialidad">Psicología educativa</span>

                    <p>
                        Atención dirigida a estudiantes y docentes en procesos de aprendizaje,
                        adaptación y convivencia académica.
                    </p>

                    <div class="datos">
                        <p><i class="fa-solid fa-location-dot"></i> Sede: Coclé</p>
                        <p><i class="fa-solid fa-clock"></i> Horario: Miércoles y Viernes</p>
                        <p><i class="fa-solid fa-video"></i> Modalidad: Presencial / Virtual</p>
                    </div>

                    <% if(sesionIniciada){ %>
                        <a href="CalendarioCita.jsp" class="btn-cita">Solicitar cita</a>
                    <% } else { %>
                        <a href="../login.jsp" class="btn-cita">Iniciar sesión para cita</a>
                    <% } %>
                </div>
            </div>

        </div>

        <p id="mensajeSinResultados" class="sin-resultados">
            No se encontraron especialistas con esa búsqueda.
        </p>

    </section>

</main>

<footer>
    © 2026 PSIREG | Sistema de Registro y Gestión Psicológica
</footer>

<script>
const buscador = document.getElementById("buscarEspecialista");
const cards = document.querySelectorAll(".especialista-card");
const mensaje = document.getElementById("mensajeSinResultados");

function buscarEspecialistas(){
    const texto = buscador.value.toLowerCase().trim();
    let encontrados = 0;

    cards.forEach(card => {
        const nombre = card.querySelector("h3").textContent.toLowerCase();
        const profesion = card.querySelector(".especialidad").textContent.toLowerCase();

        if(nombre.includes(texto) || profesion.includes(texto)){
            card.style.display = "flex";
            encontrados++;
        }else{
            card.style.display = "none";
        }
    });

    mensaje.style.display = encontrados === 0 ? "block" : "none";
}

buscador.addEventListener("keydown", function(e){
    if(e.key === "Enter"){
        e.preventDefault();
        buscarEspecialistas();
    }
});
</script>

<script src="../ModoOscuro.js"></script>

</body>
</html>