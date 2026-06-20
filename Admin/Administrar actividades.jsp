<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrar Actividades</title>
    <link rel="stylesheet" href="Administrar actividades.css">



</head>
<body>

    <!-- HEADER -->

    <header>

        <a href="Admin.jsp" class="regresar">← Regresar al Menú Principal</a>

        <h1>Administrar Actividades</h1>

    </header>

    <!-- BUSCADOR -->

    <div class="search-container">

        <input type="text" class="search-box" placeholder="🔍 Buscar actividad">

    </div>

    <!-- ACTIVIDAD 1 -->

    <section>

        <div class="main">

            <div>

                <p class="overview">Taller de Manejo del Estrés</p>

            </div>

            <div class="status aprobada">

                Aprobada

            </div>

        </div>

        <div class="sub">

            <p>
                <span class="detalle">Fecha:</span>
                25/05/2026
            </p>

            <p>
                <span class="detalle">Hora:</span>
                2:00 PM
            </p>

            <p>
                <span class="detalle">Lugar:</span>
                Salón B-203
            </p>

            <p>
                <span class="detalle">Coordinador:</span>
                Ana López
            </p>

            <div class="botones">

                <div class="boton">Ver</div>

                <div class="boton">Editar</div>

                <div class="boton">Estado</div>

            </div>

        </div>

    </section>

    <!-- ACTIVIDAD 2 -->

    <section>

        <div class="main">

            <div>

                <p class="overview">Charla de Salud Mental</p>

            </div>

            <div class="status pendiente">

                Pendiente

            </div>

        </div>

        <div class="sub">

            <p>
                <span class="detalle">Fecha:</span>
                28/05/2026
            </p>

            <p>
                <span class="detalle">Hora:</span>
                10:00 AM
            </p>

            <p>
                <span class="detalle">Lugar:</span>
                Auditorio
            </p>

            <p>
                <span class="detalle">Coordinador:</span>
                Carlos Pérez
            </p>

            <div class="botones">

                <div class="boton">Ver</div>

                <div class="boton">Editar</div>

                <div class="boton">Estado</div>

            </div>

        </div>

    </section>

    <!-- ACTIVIDAD 3 -->

    <section>

        <div class="main">

            <div>

                <p class="overview">Actividad Recreativa</p>

            </div>

            <div class="status desaprobada">

                Desaprobada

            </div>

        </div>

        <div class="sub">

            <p>
                <span class="detalle">Fecha:</span>
                30/05/2026
            </p>

            <p>
                <span class="detalle">Hora:</span>
                4:00 PM
            </p>

            <p>
                <span class="detalle">Lugar:</span>
                Gimnasio
            </p>

            <p>
                <span class="detalle">Coordinador:</span>
                María Gómez
            </p>

            <div class="botones">

                <div class="boton">Ver</div>

                <div class="boton">Editar</div>

                <div class="boton">Estado</div>

            </div>

        </div>

    </section>

    <!-- FORMULARIO -->

    <form>

        <h2>Crear Actividad</h2>

        <label>Título</label>
        <input type="text">

        <label>Descripción</label>
        <textarea></textarea>

        <label>Fecha</label>
        <input type="date">

        <label>Hora</label>
        <input type="time">

        <label>Lugar</label>
        <input type="text">

        <label>Nombre del coordinador</label>
        <input type="text">

        <label>Correo del coordinador</label>
        <input type="email">

        <label>Cantidad de cupos</label>
        <input type="number">

        <button class="guardar">
            Guardar Actividad
        </button>

    </form>

    <!-- BOTON FLOTANTE -->

    <div class="crear-actividad">

        + Crear Actividad

    </div>

</body>
</html>