function toggleMenu() {
    const menu = document.getElementById("menuLateral");
    const overlay = document.getElementById("overlay");

    menu.classList.toggle("active");
    overlay.classList.toggle("active");
}

const actividades = [
    {
        nombre: "Taller de Ansiedad",
        lugar: "Auditorio A",
        dia: "25 Mayo 2026",
        hora: "14:00",
        descripcion: "Taller para el manejo de ansiedad y emociones.",
        cupos: 5
    },
    {
        nombre: "Manejo del Estrés",
        lugar: "Sala B",
        dia: "27 Mayo 2026",
        hora: "10:00",
        descripcion: "Actividad enfocada en reducir el estrés académico.",
        cupos: 8
    },
    {
        nombre: "Charla Motivacional",
        lugar: "Salón Principal",
        dia: "30 Mayo 2026",
        hora: "16:00",
        descripcion: "Charla para mejorar autoestima y motivación.",
        cupos: 10
    }
];

function verActividad(index) {
    const actividad = actividades[index];

    document.querySelector(".grid").classList.add("hidden");
    document.getElementById("barraBusqueda").style.display = "none";
    document.getElementById("detalle").classList.remove("hidden");

    document.getElementById("nombreActividad").innerText = actividad.nombre;
    document.getElementById("lugar").innerText = actividad.lugar;
    document.getElementById("dia").innerText = actividad.dia;
    document.getElementById("hora").innerText = actividad.hora;
    document.getElementById("descripcion").innerText = actividad.descripcion;
    document.getElementById("cupos").innerText = actividad.cupos;
}

function salirDetalle() {
    document.getElementById("detalle").classList.add("hidden");
    document.querySelector(".grid").classList.remove("hidden");
    document.getElementById("barraBusqueda").style.display = "flex";
    document.getElementById("menuPrincipal").style.display = "block";
}

function buscarActividad() {
    const texto = document.getElementById("buscador").value.toLowerCase();
    const tarjetas = document.querySelectorAll(".card");

    tarjetas.forEach(function(card) {
        const contenido = card.innerText.toLowerCase();

        if (contenido.includes(texto)) {
            card.style.display = "block";
        } else {
            card.style.display = "none";
        }
    });
}

function mostrarFormulario() {
    const actividad = document.getElementById("nombreActividad").innerText;

    window.location.href = "inscribirActividad.jsp?actividad=" + encodeURIComponent(actividad);
}

 function flipActividad(card) {
    card.classList.toggle("flipped");
  }

  function inscribirseActividad(event, nombreActividad) {
    event.stopPropagation();

    /*
      Esto manda el nombre de la actividad a tu JSP de inscripción.
      Si tu archivo tiene otro nombre, cambia InscribirseActividad.jsp por el tuyo.
    */
    window.location.href = "inscribirActividad.jsp?actividad=" + encodeURIComponent(nombreActividad);
  }