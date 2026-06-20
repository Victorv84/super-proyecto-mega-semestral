<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
String usuario = (String) session.getAttribute("usuario");
String rol = (String) session.getAttribute("rol");

boolean sesionIniciada = usuario != null && "cliente".equals(rol);

if(!sesionIniciada){
    response.sendRedirect("../login.jsp");
    return;
}

/* 
   Cambia este valor por el ID real de tu calendario.
   Puede ser un correo o un ID tipo:
   abc123@group.calendar.google.com
*/
String calendarId = "victormanuel200073@gmail.com";

%>

<!DOCTYPE html> 
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PSIREG - Calendario de Cita</title>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <link rel="stylesheet" href="estilos_Cliente.css">
  <link rel="stylesheet" href="../ModoOscuro.css">
</head> 

<body>

  <!-- HEADER -->

  <header>

    <!-- IZQUIERDA -->

    <div class="header-izquierda">

        <button class="btn-menu" onclick="toggleMenu()">☰</button>

        <div class="logo-area">

          <a href="Cliente.jsp" class="logo-texto">
            <i class="fa-solid fa-house"></i>
          </a>

          <span class="campana">🔔</span>

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
        <a href="../logout.jsp" class="btn-header">Cerrar sesión</a>

    </div>

  </header>

  <!-- NAV PESTAÑAS -->

  <nav class="nav-pestanas">
    <a href="Cliente.jsp">Inicio</a>
    <a href="Descripcion.jsp">Descripción</a>
    <a href="MisionVision.jsp">Misión y visión</a>
    <a href="Personal.jsp">Especialistas</a>
    <a href="Contacto.jsp">Contacto</a>
  </nav>

  <!-- MENU LATERAL -->

  <aside id="menuLateral" class="menu-lateral">
        <a href="Cliente.jsp">Inicio</a>
      <a href="MiPerfil.jsp">Mi perfil</a>
      <a href="CalendarioCita.jsp">Calendario de cita</a>
      <a href="HistorialCitas.jsp">Historial de citas</a>
      <a href="../logout.jsp">Cerrar sesión</a>

  </aside>

  <div id="overlay" class="overlay" onclick="toggleMenu()"></div>

  <!-- CONTENIDO -->

  <div class="container">

    <div class="detail-box">

      <h2>Calendario de Cita</h2>

      <br>

    <iframe
  src="https://calendar.google.com/calendar/embed?src=<%= java.net.URLEncoder.encode(calendarId, "UTF-8") %>&ctz=America%2FPanama"
  style="border:0;"
  width="100%"
  height="650"
  frameborder="0"
  scrolling="no">
</iframe>

    </div>

  </div>

  <!-- JAVASCRIPT DEL MENÚ -->

  <script src="../ModoOscuro.js"></script>
  <script>
    function toggleMenu() {
        const menu = document.getElementById("menuLateral");
        const overlay = document.getElementById("overlay");

        menu.classList.toggle("active");
        overlay.classList.toggle("active");
    }
  </script>

</body>

</html>