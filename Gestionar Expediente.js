// ── USUARIO SIMULADO (quien está logueado) ─────────────
			const USUARIO_ACTUAL = "Andrés Batista";

			// ── ESTADO: expedientes en memoria ────────────────────
			let expedientes = [
			{
			nombre:     "María González",
			cedula:     "8-123-456",
			fechaNac:   "1998-03-15",
			sexo:       "Femenino",
			estamento:  "Estudiante",
			direccion:  "Barriada Las Cumbres, Ciudad de Panamá",
			telefono:   "6123-4567",
			centro:     "UTP Central",
			seguro:     "1-23-456789",
			historial:  "Paciente con antecedentes de ansiedad generalizada. Atendida previamente en el centro de salud San Miguelito en 2024.",
			notas:      "Solicita apoyo académico y emocional por situación familiar compleja.",
			programas:  "Programa de Bienestar Estudiantil, Apoyo Académico",
			fecha:      "20/05/2026",
			psicologo:  "Andrés Batista",
			creadoPor:  "Andrés Batista",
			creadoEn:   "20/05/2026 09:14",
			},
			{
			nombre:     "Kevin Rodríguez",
			cedula:     "8-987-654",
			fechaNac:   "2001-07-22",
			sexo:       "Masculino",
			estamento:  "Estudiante",
			direccion:  "David, Chiriquí",
			telefono:   "6234-5678",
			centro:     "UTP Chiriquí",
			seguro:     "2-34-567890",
			historial:  "Sin historial previo de atención psicológica.",
			notas:      "Dificultades de adaptación al nuevo entorno universitario.",
			programas:  "Programa de Bienvenida e Integración",
			fecha:      "18/05/2026",
			psicologo:  "Ana López",
			creadoPor:  "Ana López",
			creadoEn:   "18/05/2026 10:30",
			},
			{
			nombre:     "Lucía Herrera",
			cedula:     "4-567-890",
			fechaNac:   "1995-11-08",
			sexo:       "Femenino",
			estamento:  "Docente",
			direccion:  "Santiago, Veraguas",
			telefono:   "6345-6789",
			centro:     "UTP Veraguas",
			seguro:     "3-45-678901",
			historial:  "Seguimiento por episodio depresivo leve en 2023, en remisión.",
			notas:      "Mantiene control con psiquiatra externo. Asiste a sesiones de apoyo cada mes.",
			programas:  "Programa de Salud Mental Docente",
			fecha:      "16/05/2026",
			psicologo:  "José Martínez",
			creadoPor:  "José Martínez",
			creadoEn:   "16/05/2026 14:00",
			},
			];

			// ── CAMPOS OBLIGATORIOS MÍNIMOS (hasta campo-centro) ──
			const CAMPOS_MINIMOS = [
			"campo-nombre",
			"campo-cedula",
			"campo-fecha-nac",
			"campo-sexo",
			"campo-estamento",
			"campo-direccion",
			"campo-telefono",
			"campo-centro",
			];

			// ── ABRIR / CERRAR MODAL ───────────────────────────────
			function abrirModalCrear() {
			limpiarFormulario();
			document.getElementById("modalCrear").classList.add("activo");
			document.body.style.overflow = "hidden";
			}

			function cerrarModalCrear() {
			document.getElementById("modalCrear").classList.remove("activo");
			document.body.style.overflow = "";
			}

			// Cerrar al hacer clic fuera del modal
			document.getElementById("modalCrear").addEventListener("click", function(e) {
			if (e.target === this) cerrarModalCrear();
			});

			// ── LIMPIAR FORMULARIO ─────────────────────────────────
			function limpiarFormulario() {
			const ids = [
			"campo-nombre","campo-cedula","campo-fecha-nac","campo-sexo",
			"campo-estamento","campo-direccion","campo-telefono","campo-centro",
			"campo-seguro","campo-historial","campo-notas","campo-programas"
			];
			ids.forEach(id => {
			const el = document.getElementById(id);
			if (el) el.value = "";
			});
			ocultarAlertaDuplicado();
			actualizarBotonGuardar(false);
			}

			// ── VALIDAR FORMULARIO (en tiempo real) ────────────────
			function validarFormulario() {
			const todosLlenos = CAMPOS_MINIMOS.every(id => {
			const el = document.getElementById(id);
			return el && el.value.trim() !== "";
			});
			actualizarBotonGuardar(todosLlenos);
			}

			function actualizarBotonGuardar(habilitar) {
			const btn = document.getElementById("btnGuardar");
			if (habilitar) {
			btn.classList.add("habilitado");
			btn.disabled = false;
			} else {
			btn.classList.remove("habilitado");
			btn.disabled = true;
			}
			}

			// ── ALERTA DUPLICADO ───────────────────────────────────
			function mostrarAlertaDuplicado() {
			document.getElementById("alertaDuplicado").classList.add("visible");
			}

			function ocultarAlertaDuplicado() {
			document.getElementById("alertaDuplicado").classList.remove("visible");
			}

			// ── VER EXPEDIENTE ─────────────────────────────────────
			function verExpediente(cedula) {
			const exp = expedientes.find(e => e.cedula === cedula);
			if (!exp) return;

			// Helper: muestra valor o texto vacío estilizado
			function llenar(id, valor) {
			const el = document.getElementById(id);
			if (!el) return;
			if (valor && valor.trim() !== "") {
			el.textContent = valor;
			el.classList.remove("vacio");
			} else {
			el.textContent = "No especificado";
			el.classList.add("vacio");
			}
			}

			// Formatear fecha de nacimiento
			let fechaNacFormato = "No especificado";
			if (exp.fechaNac) {
			const [anio, mes, dia] = exp.fechaNac.split("-");
			fechaNacFormato = `${dia}/${mes}/${anio}`;
			}

			// Header
			document.getElementById("ver-titulo-nombre").textContent = exp.nombre;
			document.getElementById("ver-meta-creacion").textContent =
			exp.creadoEn
			? `Creado por ${exp.creadoPor} · ${exp.creadoEn}`
			: `Psicólogo: ${exp.psicologo} · Última actualización: ${exp.fecha}`;

			// Campos
			llenar("ver-nombre",    exp.nombre);
			llenar("ver-cedula",    exp.cedula);
			llenar("ver-fecha-nac", fechaNacFormato);
			llenar("ver-sexo",      exp.sexo);
			llenar("ver-estamento", exp.estamento);
			llenar("ver-telefono",  exp.telefono);
			llenar("ver-direccion", exp.direccion);
			llenar("ver-centro",    exp.centro);
			llenar("ver-seguro",    exp.seguro);
			llenar("ver-historial", exp.historial);
			llenar("ver-notas",     exp.notas);
			llenar("ver-programas", exp.programas);

			// Abrir modal
			document.getElementById("modalVer").classList.add("activo");
			document.body.style.overflow = "hidden";
			}

			function cerrarModalVer() {
			document.getElementById("modalVer").classList.remove("activo");
			document.body.style.overflow = "";
			}

			// Cerrar al hacer clic fuera del modal Ver
			document.getElementById("modalVer").addEventListener("click", function(e) {
			if (e.target === this) cerrarModalVer();
			});


			function guardarExpediente() {

			const cedula = document.getElementById("campo-cedula").value.trim();
			const nombre = document.getElementById("campo-nombre").value.trim();
			const centro = document.getElementById("campo-centro").value.trim();

			// F.E. 5.1 — Cédula duplicada
			const existe = expedientes.some(e => e.cedula === cedula);
			if (existe) {
			mostrarAlertaDuplicado();
			document.getElementById("campo-cedula").focus();
			return;
			}

			// Obtener fecha y hora actuales
			const ahora = new Date();
			const fecha = ahora.toLocaleDateString("es-PA");
			const hora  = ahora.toLocaleTimeString("es-PA", { hour: "2-digit", minute: "2-digit" });

			// Construir registro completo (incluyendo todos los campos para Ver)
			const nuevoExpediente = {
			nombre:    nombre,
			cedula:    cedula,
			fechaNac:  document.getElementById("campo-fecha-nac").value,
			sexo:      document.getElementById("campo-sexo").value,
			estamento: document.getElementById("campo-estamento").value,
			direccion: document.getElementById("campo-direccion").value.trim(),
			telefono:  document.getElementById("campo-telefono").value.trim(),
			centro:    centro,
			seguro:    document.getElementById("campo-seguro").value.trim(),
			historial: document.getElementById("campo-historial").value.trim(),
			notas:     document.getElementById("campo-notas").value.trim(),
			programas: document.getElementById("campo-programas").value.trim(),
			fecha:     fecha,
			psicologo: USUARIO_ACTUAL,
			creadoPor: USUARIO_ACTUAL,
			creadoEn:  `${fecha} ${hora}`,
			};

			// Guardar en memoria
			expedientes.push(nuevoExpediente);

			// Agregar fila a la tabla
			agregarFilaTabla(nuevoExpediente);

			// Cerrar modal
			cerrarModalCrear();

			// Mostrar toast éxito
			mostrarToast("✅ Expediente creado exitosamente", "exito");
			}

			// ── AGREGAR FILA A LA TABLA ────────────────────────────
			function agregarFilaTabla(exp) {
			const tbody = document.getElementById("tablaExpedientes");
			const tr = document.createElement("tr");
			tr.innerHTML = `
			<td>${exp.nombre}</td>
			<td>${exp.cedula}</td>
			<td>${exp.centro}</td>
			<td>${exp.fecha}</td>
			<td>${exp.psicologo}</td>
			<td class="acciones">
				<button class="btn-ver">Ver</button>
				<button class="btn-editar">Editar</button>
				<button class="btn-eliminar">Eliminar</button>
			</td>
			`;
			// Resaltar fila nueva brevemente
			tr.style.animation = "toastIn 0.4s ease";
			tr.style.backgroundColor = "#ecfdf5";
			setTimeout(() => { tr.style.backgroundColor = ""; }, 2500);
			tbody.appendChild(tr);
			}

			// ── EDITAR: estado interno ─────────────────────────────
			let cedulaEnEdicion = null; // cédula original del expediente que se está editando

			// Campos obligatorios para edición (mismos que creación)
			const CAMPOS_EDIT_MINIMOS = [
			{ id: "edit-nombre",    label: "Nombre completo" },
			{ id: "edit-cedula",    label: "Cédula" },
			{ id: "edit-fecha-nac", label: "Fecha de nacimiento" },
			{ id: "edit-sexo",      label: "Sexo" },
			{ id: "edit-estamento", label: "Estamento" },
			{ id: "edit-direccion", label: "Dirección" },
			{ id: "edit-telefono",  label: "Teléfono de contacto" },
			{ id: "edit-centro",    label: "Centro o sede de atención" },
			];

			// ── ABRIR MODAL EDITAR ─────────────────────────────────
			function abrirModalEditar(cedula) {
			const exp = expedientes.find(e => e.cedula === cedula);
			if (!exp) return;

			cedulaEnEdicion = cedula;

			// Poblar campos
			document.getElementById("edit-nombre").value    = exp.nombre    || "";
			document.getElementById("edit-cedula").value    = exp.cedula    || "";
			document.getElementById("edit-fecha-nac").value = exp.fechaNac  || "";
			document.getElementById("edit-sexo").value      = exp.sexo      || "";
			document.getElementById("edit-estamento").value = exp.estamento || "";
			document.getElementById("edit-direccion").value = exp.direccion || "";
			document.getElementById("edit-telefono").value  = exp.telefono  || "";
			document.getElementById("edit-centro").value    = exp.centro    || "";
			document.getElementById("edit-seguro").value    = exp.seguro    || "";
			document.getElementById("edit-historial").value = exp.historial || "";
			document.getElementById("edit-notas").value     = exp.notas     || "";
			document.getElementById("edit-programas").value = exp.programas || "";

			limpiarAlertaEdicion();
			document.getElementById("modalEditar").classList.add("activo");
			document.body.style.overflow = "hidden";
			}

			function cerrarModalEditar() {
			document.getElementById("modalEditar").classList.remove("activo");
			document.body.style.overflow = "";
			cedulaEnEdicion = null;
			}

			document.getElementById("modalEditar").addEventListener("click", function(e) {
			if (e.target === this) cerrarModalEditar();
			});

			// ── VALIDAR Y SOLICITAR CONFIRMACIÓN (4.3.3) ───────────
			function solicitarConfirmacionEdicion() {

			// F.E. 5.2 — Campos obligatorios vacíos
			const vacios = CAMPOS_EDIT_MINIMOS.filter(c => {
			const el = document.getElementById(c.id);
			return !el || el.value.trim() === "";
			});

			if (vacios.length > 0) {
			mostrarAlertaEdicion("⚠️ Rellene todos los campos requeridos.");
			return;
			}

			// F.E. 5.4 — Validación de formato
			const telefono = document.getElementById("edit-telefono").value.trim();
			const cedula   = document.getElementById("edit-cedula").value.trim();

			const telefonoValido = /^[\d\-\+\s\(\)]{6,15}$/.test(telefono);
			const cedulaValida   = /^[\d\-]+$/.test(cedula);

			if (!telefonoValido) {
			mostrarAlertaEdicion("⚠️ Formato de datos no soportado. El teléfono solo debe contener números y guiones (ej. 6123-4567).");
			document.getElementById("edit-telefono").focus();
			return;
			}

			if (!cedulaValida) {
			mostrarAlertaEdicion("⚠️ Formato de datos no soportado. La cédula solo debe contener números y guiones (ej. 8-123-456).");
			document.getElementById("edit-cedula").focus();
			return;
			}

			// Todo válido → mostrar diálogo de confirmación
			document.getElementById("dialogoConfirmarEdicion").classList.add("activo");
			}

			function cancelarConfirmacionEdicion() {
			// 4.3.4 Cancelar → solo cierra el diálogo, regresa al formulario de edición sin guardar
			document.getElementById("dialogoConfirmarEdicion").classList.remove("activo");
			}

			// ── GUARDAR EDICIÓN CONFIRMADA (4.3.4) ────────────────
			function confirmarGuardarEdicion() {
			const idx = expedientes.findIndex(e => e.cedula === cedulaEnEdicion);
			if (idx === -1) return;

			const ahora = new Date();
			const fecha = ahora.toLocaleDateString("es-PA");
			const hora  = ahora.toLocaleTimeString("es-PA", { hour: "2-digit", minute: "2-digit" });

		// Actualizar registro en memoria
expedientes[idx] = Object.assign({}, expedientes[idx], {
    nombre:    document.getElementById("edit-nombre").value.trim(),
    cedula:    document.getElementById("edit-cedula").value.trim(),
    fechaNac:  document.getElementById("edit-fecha-nac").value,
    sexo:      document.getElementById("edit-sexo").value,
    estamento: document.getElementById("edit-estamento").value,
    direccion: document.getElementById("edit-direccion").value.trim(),
    telefono:  document.getElementById("edit-telefono").value.trim(),
    centro:    document.getElementById("edit-centro").value,
    seguro:    document.getElementById("edit-seguro").value.trim(),
    historial: document.getElementById("edit-historial").value.trim(),
    notas:     document.getElementById("edit-notas").value.trim(),
    programas: document.getElementById("edit-programas").value.trim(),
    fecha:     fecha,
    psicologo: USUARIO_ACTUAL,
    editadoPor: USUARIO_ACTUAL,
    editadoEn: fecha + " " + hora
});

			// Actualizar fila en tabla
			actualizarFilaTabla(cedulaEnEdicion, expedientes[idx]);

			// Cerrar diálogo y modal
			document.getElementById("dialogoConfirmarEdicion").classList.remove("activo");
			cerrarModalEditar();

			mostrarToast("✅ Cambios guardados exitosamente", "exito");
			}

			function actualizarFilaTabla(cedulaOriginal, exp) {
			const filas = document.querySelectorAll("#tablaExpedientes tr");
			filas.forEach(fila => {
			const celdaCedula = fila.querySelector("td:nth-child(2)");
			if (celdaCedula && celdaCedula.textContent.trim() === cedulaOriginal) {
			fila.querySelector("td:nth-child(1)").textContent = exp.nombre;
			fila.querySelector("td:nth-child(2)").textContent = exp.cedula;
			fila.querySelector("td:nth-child(3)").textContent = exp.centro;
			fila.querySelector("td:nth-child(4)").textContent = exp.fecha;
			fila.querySelector("td:nth-child(5)").textContent = exp.psicologo;

			// Animación breve
			fila.style.backgroundColor = "#eff6ff";
			setTimeout(() => { fila.style.backgroundColor = ""; }, 2000);
			}
			});
			}

			// ── ALERTAS EDICIÓN ────────────────────────────────────
			function mostrarAlertaEdicion(html) {
			const el = document.getElementById("alertaEdicion");
			el.innerHTML = html;
			el.classList.add("visible");
			el.scrollIntoView({ behavior: "smooth", block: "nearest" });
			}

			function limpiarAlertaEdicion() {
			document.getElementById("alertaEdicion").classList.remove("visible");
			}

			// ── ELIMINAR: estado interno ───────────────────────────
			let cedulaAEliminar  = null;
			let filaAEliminar    = null;
			let historialEliminados = []; // 4.4.2 — registro en "base de datos"

			function abrirDialogoEliminar(cedula, fila) {
			cedulaAEliminar = cedula;
			filaAEliminar   = fila;
			document.getElementById("dialogoEliminar").classList.add("activo");
			}

			function cancelarEliminar() {
			// 4.4.3 — cierra sin eliminar
			document.getElementById("dialogoEliminar").classList.remove("activo");
			cedulaAEliminar = null;
			filaAEliminar   = null;
			}

			function confirmarEliminar() {
			if (!cedulaAEliminar) return;

			const idx = expedientes.findIndex(e => e.cedula === cedulaAEliminar);
			if (idx === -1) return;

			const ahora = new Date();
			const fecha = ahora.toLocaleDateString("es-PA");
			const hora  = ahora.toLocaleTimeString("es-PA", { hour: "2-digit", minute: "2-digit" });

			// 4.4.2 — Registrar en historial (simulación de BD)
historialEliminados.push(
    Object.assign({}, expedientes[idx], {
        eliminadoPor: USUARIO_ACTUAL,
        eliminadoEn: fecha + " " + hora
    })
);

			// Quitar de arreglo
			expedientes.splice(idx, 1);

			// Quitar fila de tabla con animación
			if (filaAEliminar) {
			filaAEliminar.style.transition = "opacity 0.3s, transform 0.3s";
			filaAEliminar.style.opacity    = "0";
			filaAEliminar.style.transform  = "translateX(20px)";
			setTimeout(() => filaAEliminar.remove(), 320);
			}

			// Cerrar diálogo
			document.getElementById("dialogoEliminar").classList.remove("activo");
			cedulaAEliminar = null;
			filaAEliminar   = null;

			mostrarToast("🗑️ Expediente eliminado y registrado en historial", "error");
			}

			// ── BÚSQUEDA (4.5) ─────────────────────────────────────
			// 6.4: Los criterios de búsqueda se conservan hasta que el usuario los modifique
			// o los borre explícitamente (Enter / lupa con campo vacío).
			function ejecutarBusqueda() {
			const termino   = document.getElementById("campoBuscar").value.trim().toLowerCase();
			const filas     = document.querySelectorAll("#tablaExpedientes tr");
			const filaVacia = document.getElementById("filaVacia");

			let encontrados = 0;

			filas.forEach(fila => {
			if (!fila.querySelector("td:nth-child(2)")) return; // ignorar la fila-vacia
			const texto    = fila.textContent.toLowerCase();
			const coincide = termino === "" || texto.includes(termino);
			fila.style.display = coincide ? "" : "none";
			if (coincide) encontrados++;
			});

			// F.E. 5.3 — Sin resultados solo cuando hay término activo
			if (encontrados === 0 && termino !== "") {
			filaVacia.classList.add("visible");
			} else {
			filaVacia.classList.remove("visible");
			}
			}

			// ── EXTENDER DELEGACIÓN DE EVENTOS ────────────────────
			// (reemplaza el listener anterior que solo manejaba Ver)
			document.getElementById("tablaExpedientes").addEventListener("click", function(e) {
			const btn = e.target.closest("button");
			if (!btn) return;

			const fila   = btn.closest("tr");
			const cedula = fila ? fila.querySelector("td:nth-child(2)").textContent.trim() : null;

			if (!cedula) return;

			if (btn.classList.contains("btn-ver"))      verExpediente(cedula);
			if (btn.classList.contains("btn-editar"))   abrirModalEditar(cedula);
			if (btn.classList.contains("btn-eliminar")) abrirDialogoEliminar(cedula, fila);
			});


			function mostrarToast(mensaje, tipo = "exito") {
			const contenedor = document.getElementById("toastContenedor");
			const toast = document.createElement("div");
			toast.className = `toast ${tipo}`;
			toast.textContent = mensaje;
			contenedor.appendChild(toast);
			setTimeout(() => toast.remove(), 3800);
			}

	
