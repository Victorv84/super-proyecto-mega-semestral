<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
String usuario = (String) session.getAttribute("usuario");
String rol = (String) session.getAttribute("rol");

boolean sesionIniciada = usuario != null && "cliente".equals(rol);
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Misión y Visión | PSIREG</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="estilos_Cliente.css">
<link rel="stylesheet" href="../ModoOscuro.css">
<link rel="stylesheet" href="estilos_MisionVision.css">

</head>

<body>

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

        <a href="../login.jsp" class="btn-header">Iniciar sesión</a>
        <a href="registrarse.jsp" class="btn-header">Registrarse</a>

    <% } else { %>

        <a href="../logout.jsp" class="btn-header">Cerrar sesión</a>

    <% } %>

</div>

</header>
  
<nav class="nav-pestanas">
    <a href="Cliente.jsp">Inicio</a>
    <a href="Descripcion.jsp">Descripción</a>
    <a href="MisionVision.jsp">Misión y visión</a>
    <a href="Personal.jsp">Especialistas</a>
    <a href="Contacto.jsp">Contacto</a>

</nav>

  <!-- MENU LATERAL -->

  <aside id="menuLateral" class="menu-lateral">

    <% if(sesionIniciada){ %>

        <a href="MiPerfil.jsp">Mi perfil</a>
        <a href="CalendarioCita.jsp">Calendario de cita</a>
        <a href="HistorialCitas.jsp">Historial de citas</a>
        <a href="../logout.jsp">Cerrar sesión</a>

    <% } else { %>

        <a href="Descripcion.jsp">Descripción</a>
        <a href="MisionVision.jsp">Misión y visión</a>
        <a href="Personal.jsp">Especialistas</a>
        <a href="Contacto.jsp">Contacto</a>
        <a href="SoporteTecnico.jsp">Soporte técnico</a>

    <% } %>

</aside>

  <div id="overlayMenu" class="overlay-menu" onclick="toggleMenu()"></div>
<!-- BANNER -->

<section class="hero">

    <img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=1600&q=80" alt="Bienestar estudiantil">

    <div class="hero-overlay">
        <h1>Misión y Visión</h1>
        <p>
            Fortaleciendo el bienestar psicológico mediante la innovación,
            la accesibilidad y la excelencia en la gestión de la información.
        </p>
    </div>

</section>

<div class="container">

    <!-- MISIÓN -->

    <div class="card">

        <div class="flex">

            <div class="image">
                <img src="https://images.unsplash.com/photo-1521737604893-d14cc237f11d?auto=format&fit=crop&w=900&q=80" alt="Misión">
            </div>

            <div class="content">

                <h2>
                    <i class="fa-solid fa-bullseye"></i>
                    Misión
                </h2>

                <p>
                    Desarrollar e implementar una plataforma digital integral que permita a la Dirección Nacional de Orientación Psicológica de la Universidad Tecnológica de Panamá gestionar de manera eficiente, segura y organizada la información relacionada con la atención psicológica. El sistema facilita el registro, seguimiento y consulta de datos, optimizando los procesos administrativos y contribuyendo a la mejora continua de los servicios de orientación psicológica y bienestar estudiantil.
                </p>

            </div>

        </div>

    </div>

    <!-- VISIÓN -->

    <div class="card">

        <div class="flex">

            <div class="content">

                <h2>
                    <i class="fa-solid fa-eye"></i>
                    Visión
                </h2>

                <p>
                    Ser la plataforma tecnológica de referencia para la gestión de los servicios de orientación psicológica en la Universidad Tecnológica de Panamá, destacándose por su eficiencia, confiabilidad, accesibilidad e innovación. PSIREG busca fortalecer la atención y el bienestar integral de la comunidad universitaria, apoyando la toma de decisiones mediante el uso de información precisa y oportuna.
                </p>

            </div>

            <div class="image">
                <img src="https://images.unsplash.com/photo-1521737604893-d14cc237f11d?auto=format&fit=crop&w=900&q=80" alt="Visión">
            </div>

        </div>

    </div>

    <!-- VALORES -->

    <div class="card">

        <div class="content">

            <h2>
                <i class="fa-solid fa-star"></i>
                Valores Institucionales
            </h2>

            <div class="valores">

                <div class="valor">
                    <h3><i class="fa-solid fa-lock"></i> Confidencialidad</h3>
                    <p>Protección y manejo seguro de la información psicológica de los usuarios.</p>
                </div>

                <div class="valor">
                    <h3><i class="fa-solid fa-shield-halved"></i> Responsabilidad</h3>
                    <p>Compromiso con la gestión ética y profesional de los datos y procesos.</p>
                </div>

                <div class="valor">
                    <h3><i class="fa-solid fa-lightbulb"></i> Innovación</h3>
                    <p>Aplicación de tecnologías modernas para optimizar los servicios psicológicos.</p>
                </div>

                <div class="valor">
                    <h3><i class="fa-solid fa-universal-access"></i> Accesibilidad</h3>
                    <p>Facilitar el acceso a la información y recursos para toda la comunidad universitaria.</p>
                </div>

                <div class="valor">
                    <h3><i class="fa-solid fa-handshake"></i> Compromiso</h3>
                    <p>Promover el bienestar emocional, académico y social de los estudiantes.</p>
                </div>

            </div>

        </div>

    </div>

</div>

<footer>
    © 2026 PSIREG | Sistema de Registro y Gestión Psicológica
</footer>
<script src="Menu.js"></script>
<script src="../ModoOscuro.js"></script>
</body>
</html>
