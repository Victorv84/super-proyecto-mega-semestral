<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>

<%!
private Map<String, String> crearPerfil(
        String nombre,
        String cedula,
        String correo,
        String telefono,
        String fechaNacimiento,
        String sexo,
        String estamento,
        String sede,
        String especialista,
        String estado
) {
    Map<String, String> perfil = new HashMap<String, String>();

    perfil.put("nombre", nombre);
    perfil.put("cedula", cedula);
    perfil.put("correo", correo);
    perfil.put("telefono", telefono);
    perfil.put("fechaNacimiento", fechaNacimiento);
    perfil.put("sexo", sexo);
    perfil.put("estamento", estamento);
    perfil.put("sede", sede);
    perfil.put("especialista", especialista);
    perfil.put("estado", estado);

    return perfil;
}
%>

<%
String usuario = (String) session.getAttribute("usuario");
String rol = (String) session.getAttribute("rol");

if (usuario == null || !"cliente".equals(rol)) {
    response.sendRedirect("login.jsp");
    return;
}

/*
    SIMULACIÓN ANTES DE BASE DE DATOS

    IMPORTANTE:
    "cliente1" y "cliente2" deben coincidir con el valor que guardas en sesión.

    Ejemplo:
    session.setAttribute("usuario", "cliente1");
    session.setAttribute("rol", "cliente");

    Si en tu login guardas el correo como usuario, entonces usa el correo como clave:
    perfilesPorCliente.put("ana@gmail.com", perfilCliente1);
*/

Map<String, Map<String, String>> perfilesPorCliente =
        new HashMap<String, Map<String, String>>();

Map<String, String> perfilCliente1 = crearPerfil(
        "Ana Martinez",
        "8-123-456",
        "ana.martinez@gmail.com",
        "6123-4567",
        "15 marzo 2003",
        "Femenino",
        "Estudiante",
        "UTP Central",
        "Dra. Laura Méndez",
        "Activo"
);

Map<String, String> perfilCliente2 = crearPerfil(
        "Carlos Pérez",
        "4-555-222",
        "carlos.perez@gmail.com",
        "6988-1122",
        "20 agosto 2002",
        "Masculino",
        "Estudiante",
        "Centro Regional de Chiriquí",
        "Dr. Carlos Rivera",
        "Activo"
);

perfilesPorCliente.put("cliente1", perfilCliente1);
perfilesPorCliente.put("cliente2", perfilCliente2);


// Obtener únicamente el perfil del cliente actual
Map<String, String> miPerfil = perfilesPorCliente.get(usuario);

if (miPerfil == null) {
    miPerfil = crearPerfil(
            "Cliente no registrado en la maqueta",
            "No disponible",
            usuario,
            "No disponible",
            "No disponible",
            "No disponible",
            "No disponible",
            "No disponible",
            "No asignado",
            "Activo"
    );
}
%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Mi Perfil - PSIREG</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet" href="estilos_Cliente.css">
<link rel="stylesheet" href="ModoOscuro.css">
<link rel="stylesheet" href="MiPerfil.css">
</head>

<body>

<header>

    <div class="header-izquierda">

        <button class="btn-menu" type="button" onclick="toggleMenu()">
            ☰
        </button>

        <div class="logo-area">
            <a href="Cliente.jsp" class="logo-texto">
                <i class="fa-solid fa-house"></i>
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
        <form action="logout.jsp" method="post">
            <button type="submit" class="btn-header">
                Cerrar sesión
            </button>
        </form>
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
    <a href="Cliente.jsp">Inicio</a>
    <a href="MiPerfil.jsp">Mi perfil</a>
    <a href="CalendarioCita.jsp">Calendario de cita</a>
    <a href="HistorialCitas.jsp">Historial de sesiones</a>
    <a href="logout.jsp">Cerrar sesión</a>
</aside>

<div id="overlay" class="overlay" onclick="toggleMenu()"></div>


<main class="container perfil-container">

    <a href="Cliente.jsp" class="volver-link">
        ← Volver al inicio
    </a>

    <section class="perfil-header">
        <div class="perfil-avatar">
            <i class="fa-solid fa-user"></i>
        </div>

        <div>
            <h2>Mi Perfil</h2>
            <p>Información personal registrada en PSIREG.</p>
        </div>
    </section>


    <section class="perfil-card-principal">

        <div class="perfil-nombre">
            <h3><%= miPerfil.get("nombre") %></h3>
            <span class="estado-perfil"><%= miPerfil.get("estado") %></span>
        </div>

        <p class="perfil-subtitulo">
            Cliente / Paciente registrado en el sistema
        </p>

    </section>


    <section class="perfil-grid">

        <div class="perfil-card">
            <i class="fa-solid fa-id-card"></i>
            <div>
                <span>Cédula</span>
                <p><%= miPerfil.get("cedula") %></p>
            </div>
        </div>

        <div class="perfil-card">
            <i class="fa-solid fa-envelope"></i>
            <div>
                <span>Correo electrónico</span>
                <p><%= miPerfil.get("correo") %></p>
            </div>
        </div>

        <div class="perfil-card">
            <i class="fa-solid fa-phone"></i>
            <div>
                <span>Teléfono</span>
                <p><%= miPerfil.get("telefono") %></p>
            </div>
        </div>

        <div class="perfil-card">
            <i class="fa-solid fa-calendar-days"></i>
            <div>
                <span>Fecha de nacimiento</span>
                <p><%= miPerfil.get("fechaNacimiento") %></p>
            </div>
        </div>

        <div class="perfil-card">
            <i class="fa-solid fa-venus-mars"></i>
            <div>
                <span>Sexo</span>
                <p><%= miPerfil.get("sexo") %></p>
            </div>
        </div>

        <div class="perfil-card">
            <i class="fa-solid fa-user-graduate"></i>
            <div>
                <span>Estamento</span>
                <p><%= miPerfil.get("estamento") %></p>
            </div>
        </div>

        <div class="perfil-card">
            <i class="fa-solid fa-building-columns"></i>
            <div>
                <span>Sede</span>
                <p><%= miPerfil.get("sede") %></p>
            </div>
        </div>

        <div class="perfil-card">
            <i class="fa-solid fa-user-doctor"></i>
            <div>
                <span>Especialista asignado</span>
                <p><%= miPerfil.get("especialista") %></p>
            </div>
        </div>

    </section>


    <section class="perfil-nota">
        <h3>Nota</h3>
        <p>
            Esta vista muestra los datos del cliente que inició sesión. 
            Cuando se implemente la base de datos, esta información vendrá directamente
            desde la tabla de clientes o pacientes.
        </p>
    </section>

</main>

<script src="ModoOscuro.js"></script>
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