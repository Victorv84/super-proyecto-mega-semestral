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
<title>Soporte Técnico - PSIREG</title>
<link rel="stylesheet" href="estilos_Cliente.css">
<link rel="stylesheet" href="SoporteTecnico.css">
<link rel="stylesheet" href="ModoOscuro.css">
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

  <div id="overlay" class="overlay" onclick="toggleMenu()"></div>

<div class="contenedor">

    <div class="tarjeta">
        <h2>Centro de Soporte Técnico</h2>

        <p><strong>Correo:</strong> soporte@psireg.com</p>
        <p><strong>Teléfono:</strong> +507 6000-0000</p>
        <p><strong>Horario:</strong> Lunes a Viernes de 8:00 a.m. a 5:00 p.m.</p>
    </div>

    <div class="tarjeta">
        <h2>Reportar un Problema</h2>

        <form>
            <input type="text" placeholder="Nombre completo" required>

            <input type="email" placeholder="Correo electrónico" required>

            <select required>
                <option value="">Seleccione el tipo de problema</option>
                <option>Error al iniciar sesión</option>
                <option>Problema con actividades</option>
                <option>Problema con expedientes</option>
                <option>Error del sistema</option>
                <option>Otro</option>
            </select>

            <textarea placeholder="Describa el problema"></textarea>

            <button type="submit">Enviar Solicitud</button>
        </form>
    </div>

    <div class="tarjeta">
        <h2>Preguntas Frecuentes</h2>

        <div class="faq">

            <details>
                <summary>No puedo iniciar sesión</summary>
                <p>Verifique que su correo y contraseña sean correctos.</p>
            </details>

            <details>
                <summary>¿Cómo me registro?</summary>
                <p>Presione el botón "Registrarse" en la página principal.</p>
            </details>

            <details>
                <summary>No puedo inscribirme en una actividad</summary>
                <p>Revise si aún existen cupos disponibles.</p>
            </details>

            <details>
                <summary>¿Cómo contacto a un psicólogo?</summary>
                <p>Puede solicitar orientación desde el módulo de actividades o contacto.</p>
            </details>

        </div>
    </div>

</div>
<script src="Menu.js"></script>
<script src="ModoOscuro.js"></script>
</body>
</html>