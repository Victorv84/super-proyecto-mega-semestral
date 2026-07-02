<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
String usuario = (String) session.getAttribute("usuario");
String rol = (String) session.getAttribute("rol");

if (usuario == null || !"secretaria".equals(rol)) {
    response.sendRedirect("../login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Pacientes - PSIREG</title>
    <link rel="stylesheet" href="Paciente_secretaria.css">
</head>

<body>

<header class="topbar">

    <button class="menu-btn" onclick="toggleMenu()" type="button">
        ☰
    </button>

    <h2>PSIREG</h2>

    <div class="acciones-header">

        <button type="button" class="btn-modo" id="btnModo" onclick="toggleModoOscuro()">
            🌙 Modo oscuro
        </button>

        <div class="notification-container">

            <button class="notification-btn" type="button" onclick="toggleNotifications()">
                🔔
            </button>

            <div class="notification-panel" id="notificationPanel">

                <div class="notification-header">
                    <h3>Notificaciones</h3>
                </div>

                <div class="notification-group">
                    <h4>📅 Próximas citas</h4>

                    <div class="notification-item">
                        <p>Tienes una cita con Ana Martínez en 15 minutos.</p>
                    </div>

                    <div class="notification-item">
                        <p>Tu próxima sesión inicia en 5 minutos.</p>
                    </div>

                    <div class="notification-item">
                        <p>La cita de las 2:00 PM está por comenzar.</p>
                    </div>
                </div>

                <div class="notification-group">
                    <h4>❌ Cancelaciones</h4>

                    <div class="notification-item">
                        <p>Carlos Pérez canceló su cita del 31/05/2026.</p>
                    </div>

                    <div class="notification-item">
                        <p>La cita de mañana fue cancelada por el paciente.</p>
                    </div>
                </div>

                <div class="notification-group">
                    <h4>🔄 Reprogramaciones</h4>

                    <div class="notification-item">
                        <p>María Gómez reprogramó su cita para el 5 de junio.</p>
                    </div>

                    <div class="notification-item">
                        <p>La secretaria modificó el horario de una cita.</p>
                    </div>
                </div>

                <div class="notification-group">
                    <h4>🆕 Nuevo paciente asignado</h4>

                    <div class="notification-item">
                        <p>Se te asignó un nuevo paciente.</p>
                    </div>

                    <div class="notification-item">
                        <p>Paciente nuevo registrado en tu agenda.</p>
                    </div>
                </div>

            </div>

        </div>

    </div>

</header>

<div class="layout">

    <aside id="sidebar" class="sidebar">

        <h3>Secretaria</h3>

        <a href="Secretaria.jsp">🏠 Inicio</a>
        <a href="AGENDAR C.jsp">📅 Agenda</a>
        <a href="Paciente_secretaria.jsp">📁 Ver pacientes</a>
        <a href="RegistrarPaciente.jsp">➕ Registrar paciente</a>

        <form action="../logout.jsp" method="post">
            <button type="submit" class="salir-menu">🚪 Cerrar sesión</button>
        </form>

    </aside>

    <main class="content">

        <h1>Pacientes</h1>
        <p class="subtitle">Listado de pacientes registrados en PSIREG</p>

        <div class="search-box">
            <input type="text" id="buscarPaciente" placeholder="Buscar Paciente">
            <button type="button" class="search-btn" onclick="buscarPacientes()">🔍</button>
        </div>

        <section class="patient-grid">

            <div class="patient-card">
                <h3 data-field="paciente">Ana Martínez</h3>

                <div class="patient-info">
                    <p><strong>Cédula:</strong> <span data-field="cedula">8-123-456</span></p>
                    <p><strong>Fecha de nacimiento:</strong> <span data-field="fechaNacimiento">15/03/1998</span></p>
                    <p><strong>Sexo:</strong> <span data-field="sexo">Femenino</span></p>
                    <p><strong>Estamento:</strong> <span data-field="estamento">Estudiante</span></p>
                    <p><strong>Teléfono de contacto:</strong> <span data-field="telefono">6000-1111</span></p>
                    <p><strong>Dirección:</strong> <span data-field="direccion">Vía España, Panamá</span></p>
                    <p><strong>Última sesión:</strong> <span data-field="ultimaSesion">12/05/2026</span></p>
                </div>

                <button type="button" onclick="abrirEditor(this)">Editar</button>
            </div>

            <div class="patient-card">
                <h3 data-field="paciente">Carlos Pérez</h3>

                <div class="patient-info">
                    <p><strong>Cédula:</strong> <span data-field="cedula">8-987-654</span></p>
                    <p><strong>Fecha de nacimiento:</strong> <span data-field="fechaNacimiento">22/07/1995</span></p>
                    <p><strong>Sexo:</strong> <span data-field="sexo">Masculino</span></p>
                    <p><strong>Estamento:</strong> <span data-field="estamento">Docente</span></p>
                    <p><strong>Teléfono de contacto:</strong> <span data-field="telefono">6000-2222</span></p>
                    <p><strong>Dirección:</strong> <span data-field="direccion">San Miguelito, Panamá</span></p>
                    <p><strong>Última sesión:</strong> <span data-field="ultimaSesion">10/05/2026</span></p>
                </div>

                <button type="button" onclick="abrirEditor(this)">Editar</button>
            </div>

            <div class="patient-card">
                <h3 data-field="paciente">María Gómez</h3>

                <div class="patient-info">
                    <p><strong>Cédula:</strong> <span data-field="cedula">8-555-222</span></p>
                    <p><strong>Fecha de nacimiento:</strong> <span data-field="fechaNacimiento">08/11/2000</span></p>
                    <p><strong>Sexo:</strong> <span data-field="sexo">Femenino</span></p>
                    <p><strong>Estamento:</strong> <span data-field="estamento">Administrativa</span></p>
                    <p><strong>Teléfono de contacto:</strong> <span data-field="telefono">6000-3333</span></p>
                    <p><strong>Dirección:</strong> <span data-field="direccion">Brisas del Golf, Panamá</span></p>
                    <p><strong>Última sesión:</strong> <span data-field="ultimaSesion">15/05/2026</span></p>
                </div>

                <button type="button" onclick="abrirEditor(this)">Editar</button>
            </div>

        </section>

    </main>

</div>

<div class="modal-editar" id="modalEditar">
    <div class="modal-contenido">

        <div class="modal-header">
            <h2>Editar paciente</h2>
            <button type="button" class="btn-cerrar-modal" onclick="cerrarEditor()">×</button>
        </div>

        <form onsubmit="guardarEdicion(event)">

            <div class="form-grid">

                <div class="form-group">
                    <label>Nombre</label>
                    <input type="text" id="editPaciente" required>
                </div>

                <div class="form-group">
                    <label>Cédula</label>
                    <input type="text" id="editCedula" required>
                </div>

                <div class="form-group">
                    <label>Fecha de nacimiento</label>
                    <input type="text" id="editFechaNacimiento" placeholder="dd/mm/aaaa" required>
                </div>

                <div class="form-group">
                    <label>Sexo</label>
                    <select id="editSexo" required>
                        <option value="Femenino">Femenino</option>
                        <option value="Masculino">Masculino</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Estamento</label>
                    <select id="editEstamento" required>
                        <option value="Estudiante">Estudiante</option>
                        <option value="Docente">Docente</option>
                        <option value="Administrativa">Administrativa</option>
                        <option value="Administrativo">Administrativo</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Teléfono de contacto</label>
                    <input type="text" id="editTelefono" required>
                </div>

                <div class="form-group form-full">
                    <label>Dirección</label>
                    <input type="text" id="editDireccion" required>
                </div>

                <div class="form-group form-full">
                    <label>Última sesión</label>
                    <input type="text" id="editUltimaSesion" placeholder="dd/mm/aaaa" required>
                </div>

            </div>

            <div class="botones-editor">
                <button type="submit" class="btn-guardar-edicion">Guardar cambios</button>
                <button type="button" class="btn-cancelar-edicion" onclick="cerrarEditor()">Cancelar</button>
            </div>

        </form>

    </div>
</div>

<script>
let tarjetaEditando = null;

function toggleMenu() {
    const sidebar = document.getElementById("sidebar");
    sidebar.classList.toggle("sidebar-abierto");
    document.body.classList.toggle("menu-abierto");
}

function buscarPacientes() {
    const input = document.getElementById("buscarPaciente");
    const texto = input.value.toLowerCase();
    const pacientes = document.querySelectorAll(".patient-card");

    pacientes.forEach(function(card) {
        const contenido = card.innerText.toLowerCase();

        if (contenido.includes(texto)) {
            card.style.display = "";
        } else {
            card.style.display = "none";
        }
    });
}

function abrirEditor(boton) {
    tarjetaEditando = boton.closest(".patient-card");

    if (!tarjetaEditando) {
        alert("No se encontró la tarjeta del paciente.");
        return;
    }

    document.getElementById("editPaciente").value = obtenerValor("paciente");
    document.getElementById("editCedula").value = obtenerValor("cedula");
    document.getElementById("editFechaNacimiento").value = obtenerValor("fechaNacimiento");
    document.getElementById("editSexo").value = obtenerValor("sexo");
    document.getElementById("editEstamento").value = obtenerValor("estamento");
    document.getElementById("editTelefono").value = obtenerValor("telefono");
    document.getElementById("editDireccion").value = obtenerValor("direccion");
    document.getElementById("editUltimaSesion").value = obtenerValor("ultimaSesion");

    const modal = document.getElementById("modalEditar");
    modal.classList.add("mostrar");
    modal.style.display = "flex";
}

function obtenerValor(campo) {
    if (!tarjetaEditando) return "";

    const elemento = tarjetaEditando.querySelector('[data-field="' + campo + '"]');

    if (elemento) {
        return elemento.textContent.trim();
    }

    return "";
}

function colocarValor(campo, valor) {
    if (!tarjetaEditando) return;

    const elemento = tarjetaEditando.querySelector('[data-field="' + campo + '"]');

    if (elemento) {
        elemento.textContent = valor;
    }
}

function guardarEdicion(event) {
    event.preventDefault();

    if (!tarjetaEditando) {
        alert("No hay ningún paciente seleccionado para editar.");
        return;
    }

    colocarValor("paciente", document.getElementById("editPaciente").value);
    colocarValor("cedula", document.getElementById("editCedula").value);
    colocarValor("fechaNacimiento", document.getElementById("editFechaNacimiento").value);
    colocarValor("sexo", document.getElementById("editSexo").value);
    colocarValor("estamento", document.getElementById("editEstamento").value);
    colocarValor("telefono", document.getElementById("editTelefono").value);
    colocarValor("direccion", document.getElementById("editDireccion").value);
    colocarValor("ultimaSesion", document.getElementById("editUltimaSesion").value);

    guardarPacientesEnLocalStorage();
    cerrarEditor();
}

function cerrarEditor() {
    const modal = document.getElementById("modalEditar");
    modal.classList.remove("mostrar");
    modal.style.display = "none";
    tarjetaEditando = null;
}

function guardarPacientesEnLocalStorage() {
    const pacientes = [];

    document.querySelectorAll(".patient-card").forEach(function(card) {
        pacientes.push({
            paciente: card.querySelector('[data-field="paciente"]').textContent.trim(),
            cedula: card.querySelector('[data-field="cedula"]').textContent.trim(),
            fechaNacimiento: card.querySelector('[data-field="fechaNacimiento"]').textContent.trim(),
            sexo: card.querySelector('[data-field="sexo"]').textContent.trim(),
            estamento: card.querySelector('[data-field="estamento"]').textContent.trim(),
            telefono: card.querySelector('[data-field="telefono"]').textContent.trim(),
            direccion: card.querySelector('[data-field="direccion"]').textContent.trim(),
            ultimaSesion: card.querySelector('[data-field="ultimaSesion"]').textContent.trim()
        });
    });

    localStorage.setItem("pacientesSecretaria", JSON.stringify(pacientes));
}

function cargarPacientesDesdeLocalStorage() {
    const datosGuardados = localStorage.getItem("pacientesSecretaria");

    if (!datosGuardados) return;

    const pacientes = JSON.parse(datosGuardados);
    const tarjetas = document.querySelectorAll(".patient-card");

    pacientes.forEach(function(paciente, index) {
        const card = tarjetas[index];

        if (!card) return;

        card.querySelector('[data-field="paciente"]').textContent = paciente.paciente;
        card.querySelector('[data-field="cedula"]').textContent = paciente.cedula;
        card.querySelector('[data-field="fechaNacimiento"]').textContent = paciente.fechaNacimiento;
        card.querySelector('[data-field="sexo"]').textContent = paciente.sexo;
        card.querySelector('[data-field="estamento"]').textContent = paciente.estamento;
        card.querySelector('[data-field="telefono"]').textContent = paciente.telefono;
        card.querySelector('[data-field="direccion"]').textContent = paciente.direccion;
        card.querySelector('[data-field="ultimaSesion"]').textContent = paciente.ultimaSesion;
    });
}

function toggleNotifications() {
    const panel = document.getElementById("notificationPanel");
    panel.classList.toggle("show");
}

document.addEventListener("click", function(event) {
    const container = document.querySelector(".notification-container");
    const panel = document.getElementById("notificationPanel");
    const modal = document.getElementById("modalEditar");

    if (container && panel && !container.contains(event.target)) {
        panel.classList.remove("show");
    }

    if (event.target === modal) {
        cerrarEditor();
    }
});

function aplicarTextoBotonModo() {
    const btn = document.getElementById("btnModo");

    if (!btn) return;

    if (document.body.classList.contains("modo-oscuro")) {
        btn.innerHTML = "☀️ Modo claro";
    } else {
        btn.innerHTML = "🌙 Modo oscuro";
    }
}

function toggleModoOscuro() {
    document.body.classList.toggle("modo-oscuro");

    if (document.body.classList.contains("modo-oscuro")) {
        localStorage.setItem("modoOscuro", "activo");
    } else {
        localStorage.setItem("modoOscuro", "inactivo");
    }

    aplicarTextoBotonModo();
}

document.addEventListener("DOMContentLoaded", function() {
    cargarPacientesDesdeLocalStorage();

    const inputBuscar = document.getElementById("buscarPaciente");

    if (inputBuscar) {
        inputBuscar.addEventListener("keydown", function(event) {
            if (event.key === "Enter") {
                event.preventDefault();
                buscarPacientes();
            }
        });
    }

    const modoGuardado = localStorage.getItem("modoOscuro");

    if (modoGuardado === "activo") {
        document.body.classList.add("modo-oscuro");
    }

    aplicarTextoBotonModo();
});
</script>

</body>
</html>