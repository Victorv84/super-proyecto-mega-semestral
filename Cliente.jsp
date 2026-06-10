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
  <title>PSIREG - Inicio</title>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <link rel="stylesheet" href="estilos_Cliente.css">
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

  <!-- CONTENIDO -->

  <div class="container" id="menuPrincipal">

    <div class="search-box" id="barraBusqueda">
      <input 
  type="text" 
  id="buscador" 
  placeholder="Buscar Actividad"
  onkeydown="if(event.key === 'Enter') buscarActividad();"
>
      <button type="button" onclick="buscarActividad()">
  <i class="fa-solid fa-magnifying-glass"></i>
</button>
    </div>

    <div class="grid">

      <!-- ACTIVIDAD 1 -->
      <div class="card flip-card" onclick="flipActividad(this)">

        <div class="flip-inner">

          <!-- FRENTE -->
          <div class="flip-front">

            <img src="https://images.unsplash.com/photo-1516321318423-f06f85e504b3">

            <div class="card-content">

              <h3>Taller de Ansiedad</h3>

              <p><strong>Fecha:</strong> 25 Mayo 2026</p>

              <p><strong>Cupos:</strong> 5</p>

              <p class="flip-ayuda">Haz clic para ver detalles</p>

            </div>

          </div>

          <!-- ATRÁS -->
          <div class="flip-back">

            <div>

              <h3>Taller de Ansiedad</h3>

              <p><strong>Lugar:</strong> Salón 204 - UTP Central</p>
              <p><strong>Día:</strong> Lunes 25 Mayo 2026</p>
              <p><strong>Hora:</strong> 10:00 a.m.</p>
              <p><strong>Descripción:</strong> Taller enfocado en técnicas básicas para identificar, comprender y manejar la ansiedad en la vida académica.</p>
              <p><strong>Cupos disponibles:</strong> 5</p>

            </div>

            <button type="button" class="btn-inscribir-card" onclick="inscribirseActividad(event, 'Taller de Ansiedad')">
              Inscribirse Actividad
            </button>

          </div>

        </div>

      </div>

      <!-- ACTIVIDAD 2 -->
      <div class="card flip-card" onclick="flipActividad(this)">

        <div class="flip-inner">

          <!-- FRENTE -->
          <div class="flip-front">

            <img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f">

            <div class="card-content">

              <h3>Manejo del Estrés</h3>

              <p><strong>Fecha:</strong> 27 Mayo 2026</p>

              <p><strong>Cupos:</strong> 8</p>

              <p class="flip-ayuda">Haz clic para ver detalles</p>

            </div>

          </div>

          <!-- ATRÁS -->
          <div class="flip-back">

            <div>

              <h3>Manejo del Estrés</h3>

              <p><strong>Lugar:</strong> Auditorio principal</p>
              <p><strong>Día:</strong> Miércoles 27 Mayo 2026</p>
              <p><strong>Hora:</strong> 2:00 p.m.</p>
              <p><strong>Descripción:</strong> Actividad práctica para aprender herramientas de organización, respiración y control emocional ante cargas académicas.</p>
              <p><strong>Cupos disponibles:</strong> 8</p>

            </div>

            <button type="button" class="btn-inscribir-card" onclick="inscribirseActividad(event, 'Manejo del Estrés')">
              Inscribirse Actividad
            </button>

          </div>

        </div>

      </div>

      <!-- ACTIVIDAD 3 -->
      <div class="card flip-card" onclick="flipActividad(this)">

        <div class="flip-inner">

          <!-- FRENTE -->
          <div class="flip-front">

            <img src="https://images.unsplash.com/photo-1509062522246-3755977927d7">

            <div class="card-content">

              <h3>Charla Motivacional</h3>

              <p><strong>Fecha:</strong> 30 Mayo 2026</p>

              <p><strong>Cupos:</strong> 10</p>

              <p class="flip-ayuda">Haz clic para ver detalles</p>

            </div>

          </div>

          <!-- ATRÁS -->
          <div class="flip-back">

            <div>

              <h3>Charla Motivacional</h3>

              <p><strong>Lugar:</strong> Biblioteca - Sala de conferencias</p>
              <p><strong>Día:</strong> Sábado 30 Mayo 2026</p>
              <p><strong>Hora:</strong> 9:00 a.m.</p>
              <p><strong>Descripción:</strong> Charla orientada a fortalecer la motivación personal, la confianza y la constancia durante el semestre.</p>
              <p><strong>Cupos disponibles:</strong> 10</p>

            </div>

            <button type="button" class="btn-inscribir-card" onclick="inscribirseActividad(event, 'Charla Motivacional')">
              Inscribirse Actividad
            </button>

          </div>

        </div>

      </div>

    </div>

  </div>



<script src="Menu.js"></script>
<script src="ModoOscuro.js"></script>

</body>

</html>