<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>

<%!
private Map<String, String> crearSesion(
        String numero,
        String fecha,
        String paciente,
        String cedula,
        String especialista,
        String motivo,
        String observacion,
        String diagnostico,
        String recomendacion
) {
    Map<String, String> sesion = new HashMap<String, String>();

    sesion.put("numero", numero);
    sesion.put("fecha", fecha);
    sesion.put("paciente", paciente);
    sesion.put("cedula", cedula);
    sesion.put("especialista", especialista);
    sesion.put("motivo", motivo);
    sesion.put("observacion", observacion);
    sesion.put("diagnostico", diagnostico);
    sesion.put("recomendacion", recomendacion);

    return sesion;
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
    "cliente1" y "cliente2" deben coincidir con el valor real que guardas
    en session.setAttribute("usuario", "...") cuando el cliente inicia sesión.

    Si en tu login guardas el correo, entonces usa el correo como clave.
    Ejemplo:
    historialSesionesPorCliente.put("ana@gmail.com", sesionesCliente1);
*/

Map<String, List<Map<String, String>>> historialSesionesPorCliente =
        new HashMap<String, List<Map<String, String>>>();


// =============================
// HISTORIAL DEL CLIENTE 1
// =============================

List<Map<String, String>> sesionesCliente1 = new ArrayList<Map<String, String>>();

sesionesCliente1.add(crearSesion(
        "3",
        "12 mayo 2026",
        "Ana Martinez",
        "8-123-456",
        "Dra. Laura Méndez",
        "Evaluación de progreso",
        "Mejor manejo del estrés académico.",
        "Se observa reducción de síntomas de ansiedad relacionados con exigencias académicas.",
        "Continuar seguimiento en dos semanas."
));

sesionesCliente1.add(crearSesion(
        "2",
        "24 abril 2026",
        "Ana Martinez",
        "8-123-456",
        "Dra. Laura Méndez",
        "Seguimiento emocional",
        "Presenta avances en organización personal.",
        "Evolución favorable en la organización personal y manejo emocional.",
        "Mantener ejercicios de respiración."
));

sesionesCliente1.add(crearSesion(
        "1",
        "10 abril 2026",
        "Ana Martinez",
        "8-123-456",
        "Dra. Laura Méndez",
        "Ansiedad académica",
        "Dificultad para manejar carga universitaria.",
        "Ansiedad académica moderada asociada a sobrecarga universitaria y dificultades de planificación.",
        "Crear horario de estudio y descanso."
));

historialSesionesPorCliente.put("cliente1", sesionesCliente1);


// =============================
// HISTORIAL DEL CLIENTE 2
// =============================

List<Map<String, String>> sesionesCliente2 = new ArrayList<Map<String, String>>();

sesionesCliente2.add(crearSesion(
        "2",
        "08 mayo 2026",
        "Carlos Pérez",
        "4-555-222",
        "Dr. Carlos Rivera",
        "Manejo de estrés",
        "El paciente expresa mejor control de sus emociones.",
        "Se evidencia avance en la identificación de factores que generan estrés.",
        "Continuar con registro diario de emociones."
));

sesionesCliente2.add(crearSesion(
        "1",
        "20 abril 2026",
        "Carlos Pérez",
        "4-555-222",
        "Dr. Carlos Rivera",
        "Primera sesión",
        "Se realiza entrevista inicial y levantamiento de información.",
        "Paciente presenta estrés relacionado con responsabilidades académicas y personales.",
        "Agendar sesión de seguimiento."
));

historialSesionesPorCliente.put("cliente2", sesionesCliente2);


// =============================
// OBTENER SOLO EL HISTORIAL DEL CLIENTE ACTUAL
// =============================

List<Map<String, String>> misSesiones = historialSesionesPorCliente.get(usuario);

if (misSesiones == null) {
    misSesiones = new ArrayList<Map<String, String>>();
}

String nombrePaciente = "";
String cedulaPaciente = "";

if (!misSesiones.isEmpty()) {
    nombrePaciente = misSesiones.get(0).get("paciente");
    cedulaPaciente = misSesiones.get(0).get("cedula");
}
%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Historial de Sesiones - PSIREG</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="estilos_Cliente.css">
<link rel="stylesheet" href="ModoOscuro.css">
<link rel="stylesheet" href="HistorialCitas.css">
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


<main class="container historial-container">

    <a href="Cliente.jsp" class="volver-link">
        ← Volver al inicio
    </a>

    <section class="historial-header">
        <h2>Historial de Sesiones</h2>

        <% if (!misSesiones.isEmpty()) { %>
            <p>
                Paciente: <strong><%= nombrePaciente %></strong>
                | Cédula: <strong><%= cedulaPaciente %></strong>
            </p>
        <% } else { %>
            <p>
                Aquí aparecerán los apuntes registrados por el especialista después de cada sesión.
            </p>
        <% } %>
    </section>


    <section class="historial-lista">

        <% if (misSesiones.isEmpty()) { %>

            <div class="empty-card">
                <h3>No tienes sesiones registradas</h3>
                <p>
                    Cuando tu especialista registre una sesión, aparecerá en esta sección.
                </p>
            </div>

        <% } else { %>

            <% for (Map<String, String> sesion : misSesiones) { %>

                <article class="sesion-card">

                    <h3>Sesión <%= sesion.get("numero") %></h3>

                    <p>
                        <strong>Fecha:</strong>
                        <%= sesion.get("fecha") %>
                    </p>

                    <p>
                        <strong>Especialista:</strong>
                        <%= sesion.get("especialista") %>
                    </p>

                    <p>
                        <strong>Motivo:</strong>
                        <%= sesion.get("motivo") %>
                    </p>

                    <p>
                        <strong>Observación:</strong>
                        <%= sesion.get("observacion") %>
                    </p>

                    <p>
                        <strong>Diagnóstico / Evaluación:</strong>
                        <%= sesion.get("diagnostico") %>
                    </p>

                    <p>
                        <strong>Recomendación:</strong>
                        <%= sesion.get("recomendacion") %>
                    </p>

                </article>

            <% } %>

        <% } %>

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