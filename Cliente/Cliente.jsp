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
  <link rel="stylesheet" href="../ModoOscuro.css">
  <%@ page import="java.sql.*"%>
  <%@ page import="java.time.*" %>
  <%@ page import="java.time.format.DateTimeFormatter" %>
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
        🌙
    </button>

    <% if(!sesionIniciada){ %>

        <a href="../login.jsp" class="btn-header">Iniciar sesión</a>

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

    <% } %>

</aside>

   <div id="overlay" class="overlay" onclick="toggleMenu()"></div>

  <!-- CONTENIDO -->

  <div class="container" id="menuPrincipal">
	<h2 style="position:absolute; left:50%; transform:translateX(-50%); auto">Actividades</h2><br><br><br>
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
		<% //Esta sección es para mostrar todas las actividades actualmente existentes en la base de datos
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/psireg","root", "");
	    Statement dbstatement = dbconect.createStatement();
	    ResultSet act = dbstatement.executeQuery("select * from actividades");
	    String imagen;
	    String titulo;
	    String fecha;
	    String hora;
	    String cupos;
	    String lugar;
	    String desc;
	    DateTimeFormatter df = DateTimeFormatter.ofPattern("dd-MM-yyyy");
	    while(act.next()) {
	    	imagen = act.getString("act_imagenUrl");
	    	titulo = act.getString("act_titulo");
	    	fecha = act.getString("act_fecha");
	    	hora = act.getString("act_hora");
	    	cupos = String.valueOf(act.getInt("act_cuposMax"));
	    	lugar = act.getString("act_lugar");
	    	desc = act.getString("act_descripcion");
	    	
	    	out.println("<div class='card flip-card' onclick='flipActividad(this)'>"+
	    	        "<div class='flip-inner'>"+
	    	          "<div class='flip-front'>"+
	    	            "<img src="+imagen+">"+
	    	            "<div class='card-content'>"+
	    	              "<h3>"+titulo+"</h3>"+
	    	              "<p><strong>Fecha:</strong> "+fecha+"</p>"+
	    	              "<p><strong>Cupos:</strong> "+cupos+"</p>"+
	    	              "<p class='flip-ayuda'>Haz clic para ver detalles</p>"+
	    	            "</div>"+
	    	          "</div>"+
	    	          "<div class='flip-back'>"+
	    	            "<div>"+
	    	              "<h3>"+titulo+"</h3>"+
	    	              "<p><strong>Lugar:</strong> "+lugar+"</p>"+
	    	              "<p><strong>Día:</strong> "+fecha+"</p>"+
	    	              "<p><strong>Hora:</strong> "+hora.substring(0, Math.min(hora.length(),5))+"</p>"+
	    	              "<p><strong>Descripción:</strong> "+desc+"</p>"+
	    	              "<p><strong>Cupos disponibles:</strong> "+cupos+"</p>"+
	    	            "</div>"+
	    	            "<button type='button' class='btn-inscribir-card' onclick='inscribirseActividad(event, \"Taller de Ansiedad\")'>"+
	    	              "Inscribirse Actividad"+
	    	            "</button>"+
	    	          "</div>"+
	    	        "</div>"+
	    	      "</div>");
	    }
		%>

    </div>

  </div>



<script src="Menu.js"></script>
<script src="../ModoOscuro.js"></script>

</body>

</html>