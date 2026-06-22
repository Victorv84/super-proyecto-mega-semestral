<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<title>Gestión de Expedientes</title>
				<link rel="stylesheet" href="estilos_Gestionar_Expediente.css">
			</head>
	<body>

		<!-- ═══════════════════════════════════════════════════════════
     TOAST CONTENEDOR
═══════════════════════════════════════════════════════════ -->
		<div class="toast-contenedor" id="toastContenedor"></div>

		<!-- ═══════════════════════════════════════════════════════════
     LISTADO DE EXPEDIENTES
═══════════════════════════════════════════════════════════ -->
		<div class="contenedor">

			<h1>Gestión de Expedientes</h1>

			<div class="barra-superior">

				<form action="Especialista.jsp" method="get">
    <button class="btn-menu" type="submit">
        Regresar al Menú Principal
    </button>
</form>

				<div class="buscar-wrapper">
					<input
						type="text"
						class="buscar"
						id="campoBuscar"
						placeholder="Buscar expediente..."
						onkeydown="if(event.key==='Enter') ejecutarBusqueda()"
            >
						<button class="icono-lupa" onclick="ejecutarBusqueda()" title="Buscar">🔍</button>
					</div>

				<button class="btn-crear" onclick="abrirModalCrear()">
					Crear Expediente
				</button>

			</div>

			<table>
				<thead>
					<tr>
						<th>Nombre</th>
						<th>Cédula</th>
						<th>Centro</th>
						<th>Última Actualización</th>
						<th>Psicólogo</th>
						<th>Acciones</th>
					</tr>
				</thead>
				<tbody id="tablaExpedientes">
					<tr>
						<td>María González</td>
						<td>8-123-456</td>
						<td>UTP Central</td>
						<td>20/05/2026</td>
						<td>Andrés Batista</td>
						<td class="acciones">
							<button class="btn-ver">Ver</button>
							<button class="btn-editar">Editar</button>
							<button class="btn-eliminar">Eliminar</button>
						</td>
					</tr>
					<tr>
						<td>Kevin Rodríguez</td>
						<td>8-987-654</td>
						<td>UTP Chiriquí</td>
						<td>18/05/2026</td>
						<td>Ana López</td>
						<td class="acciones">
							<button class="btn-ver">Ver</button>
							<button class="btn-editar">Editar</button>
							<button class="btn-eliminar">Eliminar</button>
						</td>
					</tr>
					<tr>
						<td>Lucía Herrera</td>
						<td>4-567-890</td>
						<td>UTP Veraguas</td>
						<td>16/05/2026</td>
						<td>José Martínez</td>
						<td class="acciones">
							<button class="btn-ver">Ver</button>
							<button class="btn-editar">Editar</button>
							<button class="btn-eliminar">Eliminar</button>
						</td>
					</tr>
				</tbody>
				<!-- F.E. 5.3 — Sin resultados de búsqueda -->
				<tbody id="filaVaciaWrapper">
					<tr class="fila-vacia" id="filaVacia">
						<td colspan="6">No se encontró ningún resultado.</td>
					</tr>
				</tbody>
			</table>

		</div>

		<!-- ═══════════════════════════════════════════════════════════
     MODAL — CREAR EXPEDIENTE
═══════════════════════════════════════════════════════════ -->
		<div class="modal-overlay" id="modalCrear">
			<div class="modal">

				<button class="btn-cerrar-modal" onclick="cerrarModalCrear()">✕</button>
				<h2>📋 Crear Nuevo Expediente</h2>

				<div class="form-grid" id="formCrear">

					<!-- DATOS PERSONALES -->
					<div class="seccion-titulo">Datos Personales</div>

					<div class="form-grupo">
						<label>
							Nombre Completo <span class="requerido">*</span>
						</label>
						<input type="text" id="campo-nombre" placeholder="Ej. María González" oninput="validarFormulario()">
            </div>

					<div class="form-grupo">
						<label>
							Cédula <span class="requerido">*</span>
						</label>
						<input type="text" id="campo-cedula" placeholder="Ej. 8-123-456" oninput="validarFormulario(); ocultarAlertaDuplicado()">
            </div>

					<div class="form-grupo">
						<label>
							Fecha de Nacimiento <span class="requerido">*</span>
						</label>
						<input type="date" id="campo-fecha-nac" oninput="validarFormulario()">
            </div>

					<div class="form-grupo">
						<label>
							Sexo <span class="requerido">*</span>
						</label>
						<select id="campo-sexo" onchange="validarFormulario()">
							<option value="">Seleccionar...</option>
							<option value="Masculino">Masculino</option>
							<option value="Femenino">Femenino</option>
							<option value="Otro">Otro</option>
							<option value="Prefiero no indicar">Prefiero no indicar</option>
						</select>
					</div>

					<div class="form-grupo">
						<label>
							Estamento <span class="requerido">*</span>
						</label>
						<select id="campo-estamento" onchange="validarFormulario()">
							<option value="">Seleccionar...</option>
							<option value="Estudiante">Estudiante</option>
							<option value="Docente">Docente</option>
							<option value="Administrativo">Administrativo</option>
							<option value="Otro">Otro</option>
						</select>
					</div>

					<div class="form-grupo ancho-completo">
						<label>
							Dirección <span class="requerido">*</span>
						</label>
						<input type="text" id="campo-direccion" placeholder="Ej. Barriada Las Palmas, Ciudad de Panamá" oninput="validarFormulario()">
            </div>

					<div class="form-grupo">
						<label>
							Teléfono de Contacto <span class="requerido">*</span>
						</label>
						<input type="tel" id="campo-telefono" placeholder="Ej. 6123-4567" oninput="validarFormulario()">
            </div>

					<div class="form-grupo">
						<label>
							Centro / Sede de Atención <span class="requerido">*</span>
						</label>
						<select id="campo-centro" onchange="validarFormulario()">
							<option value="">Seleccionar...</option>
							<option value="UTP Central">UTP Central</option>
							<option value="UTP Chiriquí">UTP Chiriquí</option>
							<option value="UTP Veraguas">UTP Veraguas</option>
							<option value="UTP Coclé">UTP Coclé</option>
							<option value="UTP Colón">UTP Colón</option>
							<option value="UTP Herrera">UTP Herrera</option>
							<option value="UTP Los Santos">UTP Los Santos</option>
							<option value="UTP Bocas del Toro">UTP Bocas del Toro</option>
							<option value="UTP Darién">UTP Darién</option>
						</select>
					</div>

					<!-- INFORMACIÓN MÉDICA / SOCIAL -->
					<div class="seccion-titulo">Información Médica y de Atención</div>

					<div class="form-grupo ancho-completo">
						<label>Seguro Social</label>
						<input type="text" id="campo-seguro" placeholder="Ej. Número de afiliación CSS" oninput="validarFormulario()">
            </div>

					<div class="form-grupo ancho-completo">
						<label>Historial de Atención Psicológica</label>
						<textarea id="campo-historial" placeholder="Describa brevemente el historial de atención psicológica del usuario..." oninput="validarFormulario()"></textarea>
					</div>

					<div class="form-grupo ancho-completo">
						<label>Notas</label>
						<textarea id="campo-notas" placeholder="Notas adicionales relevantes..." oninput="validarFormulario()"></textarea>
					</div>

					<div class="form-grupo ancho-completo">
						<label>Programas de Acompañamiento Asignados</label>
						<input type="text" id="campo-programas" placeholder="Ej. Programa de Bienestar Estudiantil, Apoyo Académico..." oninput="validarFormulario()">
            </div>

					<!-- ALERTA DUPLICADO (F.E. 5.1) -->
					<div class="alerta-duplicado" id="alertaDuplicado">
						⚠️ Este usuario ya posee un expediente registrado.
					</div>

				</div>

				<div class="acciones-form">
					<button class="btn-cancelar" onclick="cerrarModalCrear()">Cancelar</button>
					<button class="btn-guardar" id="btnGuardar" disabled="" onclick="guardarExpediente()">
						Guardar Expediente
					</button>
				</div>

			</div>
		</div>

		<!-- ═══════════════════════════════════════════════════════════
     MODAL — VER EXPEDIENTE
═══════════════════════════════════════════════════════════ -->
		<div class="modal-overlay" id="modalVer">
			<div class="modal">

				<button class="btn-cerrar-modal" onclick="cerrarModalVer()">✕</button>

				<div class="ver-header">
					<div class="icono">📋</div>
					<div>
						<h2 id="ver-titulo-nombre">Expediente</h2>
						<div class="ver-meta" id="ver-meta-creacion"></div>
					</div>
				</div>

				<div class="ver-grid">

					<!-- DATOS PERSONALES -->
					<div class="ver-seccion-titulo">Datos Personales</div>

					<div class="ver-campo">
						<span class="etiqueta">Nombre Completo</span>
						<div class="valor" id="ver-nombre"></div>
					</div>

					<div class="ver-campo">
						<span class="etiqueta">Cédula</span>
						<div class="valor" id="ver-cedula"></div>
					</div>

					<div class="ver-campo">
						<span class="etiqueta">Fecha de Nacimiento</span>
						<div class="valor" id="ver-fecha-nac"></div>
					</div>

					<div class="ver-campo">
						<span class="etiqueta">Sexo</span>
						<div class="valor" id="ver-sexo"></div>
					</div>

					<div class="ver-campo">
						<span class="etiqueta">Estamento</span>
						<div class="valor" id="ver-estamento"></div>
					</div>

					<div class="ver-campo">
						<span class="etiqueta">Teléfono de Contacto</span>
						<div class="valor" id="ver-telefono"></div>
					</div>

					<div class="ver-campo ancho-completo">
						<span class="etiqueta">Dirección</span>
						<div class="valor" id="ver-direccion"></div>
					</div>

					<div class="ver-campo">
						<span class="etiqueta">Centro / Sede de Atención</span>
						<div class="valor" id="ver-centro"></div>
					</div>

					<div class="ver-campo">
						<span class="etiqueta">Seguro Social</span>
						<div class="valor" id="ver-seguro"></div>
					</div>

					<!-- INFORMACIÓN MÉDICA -->
					<div class="ver-seccion-titulo">Información Médica y de Atención</div>

					<div class="ver-campo ancho-completo">
						<span class="etiqueta">Historial de Atención Psicológica</span>
						<div class="valor texto-largo" id="ver-historial"></div>
					</div>

					<div class="ver-campo ancho-completo">
						<span class="etiqueta">Notas</span>
						<div class="valor texto-largo" id="ver-notas"></div>
					</div>

					<div class="ver-campo ancho-completo">
						<span class="etiqueta">Programas de Acompañamiento Asignados</span>
						<div class="valor" id="ver-programas"></div>
					</div>

				</div>

				<div class="acciones-form">
					<button class="btn-cancelar" onclick="cerrarModalVer()">← Regresar al listado</button>
				</div>

			</div>
		</div>


		<!-- ═══════════════════════════════════════════════════════════
     MODAL — EDITAR EXPEDIENTE (4.3)
═══════════════════════════════════════════════════════════ -->
		<div class="modal-overlay" id="modalEditar">
			<div class="modal">

				<button class="btn-cerrar-modal" onclick="cerrarModalEditar()">✕</button>
				<h2>✏️ Editar Expediente</h2>

				<div class="form-grid">

					<div class="seccion-titulo">Datos Personales</div>

					<div class="form-grupo">
						<label>
							Nombre Completo <span class="requerido">*</span>
						</label>
						<input type="text" id="edit-nombre" oninput="limpiarAlertaEdicion()">
            </div>

					<div class="form-grupo">
						<label>
							Cédula <span class="requerido">*</span>
						</label>
						<input type="text" id="edit-cedula" oninput="limpiarAlertaEdicion()">
            </div>

					<div class="form-grupo">
						<label>
							Fecha de Nacimiento <span class="requerido">*</span>
						</label>
						<input type="date" id="edit-fecha-nac" oninput="limpiarAlertaEdicion()">
            </div>

					<div class="form-grupo">
						<label>
							Sexo <span class="requerido">*</span>
						</label>
						<select id="edit-sexo" onchange="limpiarAlertaEdicion()">
							<option value="">Seleccionar...</option>
							<option value="Masculino">Masculino</option>
							<option value="Femenino">Femenino</option>
							<option value="Otro">Otro</option>
							<option value="Prefiero no indicar">Prefiero no indicar</option>
						</select>
					</div>

					<div class="form-grupo">
						<label>
							Estamento <span class="requerido">*</span>
						</label>
						<select id="edit-estamento" onchange="limpiarAlertaEdicion()">
							<option value="">Seleccionar...</option>
							<option value="Estudiante">Estudiante</option>
							<option value="Docente">Docente</option>
							<option value="Administrativo">Administrativo</option>
							<option value="Otro">Otro</option>
						</select>
					</div>

					<div class="form-grupo ancho-completo">
						<label>
							Dirección <span class="requerido">*</span>
						</label>
						<input type="text" id="edit-direccion" oninput="limpiarAlertaEdicion()">
            </div>

					<div class="form-grupo">
						<label>
							Teléfono de Contacto <span class="requerido">*</span>
						</label>
						<input type="tel" id="edit-telefono" oninput="limpiarAlertaEdicion()">
            </div>

					<div class="form-grupo">
						<label>
							Centro / Sede de Atención <span class="requerido">*</span>
						</label>
						<select id="edit-centro" onchange="limpiarAlertaEdicion()">
							<option value="">Seleccionar...</option>
							<option value="UTP Central">UTP Central</option>
							<option value="UTP Chiriquí">UTP Chiriquí</option>
							<option value="UTP Veraguas">UTP Veraguas</option>
							<option value="UTP Coclé">UTP Coclé</option>
							<option value="UTP Colón">UTP Colón</option>
							<option value="UTP Herrera">UTP Herrera</option>
							<option value="UTP Los Santos">UTP Los Santos</option>
							<option value="UTP Bocas del Toro">UTP Bocas del Toro</option>
							<option value="UTP Darién">UTP Darién</option>
						</select>
					</div>

					<div class="seccion-titulo">Información Médica y de Atención</div>

					<div class="form-grupo ancho-completo">
						<label>Seguro Social</label>
						<input type="text" id="edit-seguro">
            </div>

					<div class="form-grupo ancho-completo">
						<label>Historial de Atención Psicológica</label>
						<textarea id="edit-historial"></textarea>
					</div>

					<div class="form-grupo ancho-completo">
						<label>Notas</label>
						<textarea id="edit-notas"></textarea>
					</div>

					<div class="form-grupo ancho-completo">
						<label>Programas de Acompañamiento Asignados</label>
						<input type="text" id="edit-programas">
            </div>

					<!-- F.E. 5.2 campos obligatorios / F.E. 5.4 formato -->
					<div class="alerta-edicion" id="alertaEdicion"></div>

				</div>

				<div class="acciones-form">
					<button class="btn-cancelar" onclick="cerrarModalEditar()">Cancelar</button>
					<button class="btn-guardar habilitado" onclick="solicitarConfirmacionEdicion()">
						Guardar Cambios
					</button>
				</div>

			</div>
		</div>

		<!-- ═══════════════════════════════════════════════════════════
     DIÁLOGO — CONFIRMAR GUARDAR CAMBIOS (4.3.3)
═══════════════════════════════════════════════════════════ -->
		<div class="dialogo-overlay" id="dialogoConfirmarEdicion">
			<div class="dialogo">
				<div class="dialogo-icono">💾</div>
				<h3>Confirmar cambios</h3>
				<p>¿Desea guardar los cambios realizados en este expediente?</p>
				<div class="dialogo-botones">
					<button class="btn-dialogo-cancelar" onclick="cancelarConfirmacionEdicion()">No, seguir editando</button>
					<button class="btn-dialogo-guardar"  onclick="confirmarGuardarEdicion()">Guardar</button>
				</div>
			</div>
		</div>

		<!-- ═══════════════════════════════════════════════════════════
     DIÁLOGO — CONFIRMAR ELIMINAR (4.4.1)
═══════════════════════════════════════════════════════════ -->
		<div class="dialogo-overlay" id="dialogoEliminar">
			<div class="dialogo">
				<div class="dialogo-icono">⚠️</div>
				<h3>Eliminar expediente</h3>
				<p>¿Está seguro que desea eliminar este expediente? Esta acción quedará registrada en el historial del sistema.</p>
				<div class="dialogo-botones">
					<button class="btn-dialogo-cancelar" onclick="cancelarEliminar()">Cancelar</button>
					<button class="btn-dialogo-eliminar" onclick="confirmarEliminar()">Aceptar</button>
				</div>
			</div>
		</div>

	<script src="Gestionar Expediente.js"></script>
	</body>
</html>
