<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
String usuario = (String) session.getAttribute("usuario");
String rol = (String) session.getAttribute("rol");

boolean sesionIniciada = usuario != null && "cliente".equals(rol);

if(!sesionIniciada){
    response.sendRedirect("login.jsp");
    return;
}

String actividad = request.getParameter("actividad");

if(actividad == null){
    actividad = "";
}
%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PSIREG - Inscripción Actividad</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="ModoOscuro.css">
    <link rel="stylesheet" href="InscripcionActividad.css">
</head>

<body>

<header>

    <div class="header-izquierda">

        <button class="btn-menu" onclick="toggleMenu()">☰</button>

        <div class="logo-area">

            <a href="Cliente.jsp" class="logo-texto">
                <i class="fa-solid fa-house icono-casa"></i>
            </a>

            <span class="campana">🔔</span>

        </div>

    </div>

    <div class="header-centro">
        <h1>PSIREG</h1>
    </div>

    <div class="header-derecha header-acciones">
        <button type="button" class="btn-modo" id="btnModo" onclick="toggleModoOscuro()">
    🌙 Modo oscuro
</button>
        <a href="logout.jsp" class="btn-header">Cerrar sesión</a>
    </div>

</header>

<nav class="nav-pestanas">
    <a href="Cliente.jsp">Inicio</a>
    <a href="Descripcion.jsp">Descripción</a>
    <a href="MisionVision.jsp">Misión y visión</a>
    <a href="Personal.jsp">Especialistas</a>
    <a href="Contacto.jsp">Contacto</a>
</nav>

<aside id="menuLateral" class="menu-lateral">

    <a href="MiPerfil.jsp">Mi perfil</a>
    <a href="CalendarioCita.jsp">Calendario de cita</a>
    <a href="HistorialCitas.jsp">Historial de citas</a>
    <a href="logout.jsp">Cerrar sesión</a>

</aside>

<div id="overlay" class="overlay" onclick="toggleMenu()"></div>

<div class="container">

    <div id="formulario">

        <div class="detail-box">

            <h2>Datos de Inscripción</h2>

            <form action="inscribirActividad.jsp" method="post" class="form-inscripcion">

                <input type="hidden" name="actividad" value="<%= actividad %>">

                <div class="input-group">
    <label>Fecha de Nacimiento</label>

    <div class="fecha-wrapper">
        <input 
            type="text" 
            name="fechaNacimiento" 
            id="fechaNacimiento"
            placeholder="dd/mm/aaaa"
            maxlength="10"
            required
        >
        <span class="icono-calendario-custom"></span>
    </div>
</div>

                <div class="input-group">
                    <label>Sexo</label>
                    <select name="sexo" required>
                        <option value="">Seleccione una opción</option>
                        <option value="Masculino">Masculino</option>
                        <option value="Femenino">Femenino</option>
                    </select>
                </div>

                <div class="input-group">
                    <label>Estamento</label>
                    <select name="estamento" required>
                        <option value="">Seleccione una opción</option>
                        <option value="Estudiante">Estudiante</option>
                        <option value="Docente">Docente</option>
                        <option value="Administrativo">Administrativo</option>
                        <option value="Particular">Particular</option>
                    </select>
                </div>

                <div class="input-group">
                    <label>Teléfono de Contacto</label>
                    <input type="text" name="telefono" placeholder="Ingrese su teléfono" required>
                </div>

                <div class="input-group">
                    <label>Dirección</label>
                    <input type="text" name="direccion" placeholder="Ingrese su dirección" required>
                </div>
                
                <div class="buttons">
                    <button type="submit" class="btn-inscribir">Continuar</button>
                    <button type="button" class="btn-salir" onclick="cancelarInscripcion()">Cancelar</button>
                </div>

            </form>

        </div>

    </div>

</div>
<script src="ModoOscuro.js"></script>
<script src="InscripcionActividad.js"></script>

</body>
</html>