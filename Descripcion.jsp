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
    <title>PSIREG - Descripción</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- ICONOS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- CSS -->
    <link rel="stylesheet" href="estilos_Cliente.css">
<link rel="stylesheet" href="ModoOscuro.css">
<link rel="stylesheet" href="Descripcion.css">
</head>

<body>

  <!-- HEADER -->

  <header>

    <!-- IZQUIERDA -->

    <div class="header-izquierda">

        <button class="btn-menu" onclick="toggleMenu()">☰</button>

        <div class="logo-area">

         <a href="Cliente.jsp" class="logo-texto"> <i class="fa-solid fa-house"></i> </a>

          <% if(sesionIniciada){ %>
    <span class="campana">🔔</span>
<% } %>

        

</div>

    </div>

    <!-- CENTRO -->

    <div class="header-centro">

        <h1>PSIREG</h1>

    </div>

    <!-- DERECHA -->

    <div class="header-derecha header-acciones">

    <button type="button" class="btn-modo" id="btnModo" onclick="toggleModoOscuro()">
        🌙 Modo oscuro
    </button>

    <% if(!sesionIniciada){ %>

        <a href="login.jsp" class="btn-header">Iniciar sesión</a>
        <a href="registrarse.jsp" class="btn-header">Registrarse</a>

    <% } else { %>

        <a href="logout.jsp" class="btn-header">Cerrar sesión</a>

    <% } %>

</div>

</header>

<!-- MENÚ SUPERIOR -->
<nav class="nav-pestanas">
    <a href="Cliente.jsp">Inicio</a>
    <a href="Descripcion.jsp">Descripción</a>
    <a href="MisionVision.jsp">Misión y visión</a>
    <a href="Personal.jsp">Especialistas</a>
    <a href="Contacto.jsp">Contacto</a>
    <a href="SoporteTecnico.jsp">Soporte técnico</a>

</nav>

 <!-- MENU LATERAL -->

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

<main>

    <!-- HERO -->
    <section class="descripcion-hero">
        <div class="hero-contenido">
            <h2>Descripción del Sistema</h2>
            <p>
                PSIREG es una plataforma diseñada para apoyar la gestión psicológica
                dentro de la comunidad universitaria, facilitando el registro,
                organización y seguimiento de los procesos de atención.
            </p>
        </div>
    </section>

    <!-- ¿QUÉ ES? -->
    <section class="contenedor">
        <div class="tarjeta-principal">
            <h2><i class="fa-solid fa-laptop-medical"></i> ¿Qué es PSIREG?</h2>

            <p>
                PSIREG, Sistema de Registro y Gestión Psicológica, es una herramienta
                web orientada a mejorar la administración de citas, historiales,
                sesiones y comunicación entre los usuarios y el área de atención psicológica.
            </p>

            <p>
                Su propósito principal es centralizar la información de manera organizada,
                segura y accesible, permitiendo que los procesos sean más rápidos,
                claros y eficientes tanto para los pacientes como para el personal encargado.
            </p>
        </div>
    </section>

    <!-- FUNCIONES -->
    <section class="contenedor">
        <h2 class="titulo-seccion">Funciones principales</h2>

        <div class="grid-funciones">

            <div class="funcion-card">
                <i class="fa-solid fa-calendar-check"></i>
                <h3>Gestión de citas</h3>
                <p>
                    Permite organizar solicitudes, programación y seguimiento de citas psicológicas.
                </p>
            </div>

            <div class="funcion-card">
                <i class="fa-solid fa-folder-open"></i>
                <h3>Historial del paciente</h3>
                <p>
                    Facilita el registro de sesiones, observaciones, recomendaciones y evolución del paciente.
                </p>
            </div>

            <div class="funcion-card">
                <i class="fa-solid fa-user-doctor"></i>
                <h3>Área del especialista</h3>
                <p>
                    El especialista puede consultar pacientes asignados, revisar citas y registrar nuevas sesiones.
                </p>
            </div>

            <div class="funcion-card">
                <i class="fa-solid fa-bell"></i>
                <h3>Notificaciones</h3>
                <p>
                    Ayuda a informar sobre citas próximas, cambios, cancelaciones o nuevos avisos importantes.
                </p>
            </div>

        </div>
    </section>

    <!-- OBJETIVO -->
    <section class="contenedor">
        <div class="tarjeta-doble">

            <div class="bloque-info">
                <h2><i class="fa-solid fa-bullseye"></i> Objetivo del sistema</h2>
                <p>
                    El objetivo de PSIREG es optimizar el manejo de la información psicológica,
                    reduciendo procesos manuales y mejorando la organización de los datos.
                </p>
            </div>

            <div class="bloque-info">
                <h2><i class="fa-solid fa-users"></i> ¿A quién va dirigido?</h2>
                <p>
                    Está dirigido a estudiantes, especialistas, secretaría y administradores
                    que forman parte del proceso de atención psicológica institucional.
                </p>
            </div>

        </div>
    </section>

    <!-- PROCESO -->
    <section class="contenedor">
        <h2 class="titulo-seccion">¿Cómo funciona?</h2>

        <div class="pasos">

            <div class="paso">
                <span>1</span>
                <h3>Registro o inicio de sesión</h3>
                <p>El usuario accede al sistema según su rol asignado.</p>
            </div>

            <div class="paso">
                <span>2</span>
                <h3>Solicitud o gestión de cita</h3>
                <p>Se organiza la atención según disponibilidad y necesidad del paciente.</p>
            </div>

            <div class="paso">
                <span>3</span>
                <h3>Atención psicológica</h3>
                <p>El especialista registra los datos importantes de cada sesión.</p>
            </div>

            <div class="paso">
                <span>4</span>
                <h3>Seguimiento</h3>
                <p>El sistema permite consultar el historial y evolución del paciente.</p>
            </div>

        </div>
    </section>

</main>

<footer>
    © 2026 PSIREG | Sistema de Registro y Gestión Psicológica
</footer>

<script src="Menu.js"></script>
<script src="ModoOscuro.js"></script>

</body>
</html>