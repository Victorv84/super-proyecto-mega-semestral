function toggleMenu() {
    const menu = document.getElementById("menuLateral");
    const overlay = document.getElementById("overlay");

    menu.classList.toggle("active");
    overlay.classList.toggle("active");
}

function cancelarInscripcion() {
    window.location.href = "Cliente.jsp";
}

document.addEventListener("DOMContentLoaded", function () {

    const iconosCalendario = document.querySelectorAll(".icono-calendario-custom");

    iconosCalendario.forEach(function (icono) {
        icono.addEventListener("click", function () {
            const inputFecha = icono.closest(".fecha-wrapper").querySelector('input[type="date"]');

            inputFecha.focus();

            if (inputFecha.showPicker) {
                inputFecha.showPicker();
            }
        });
    });

});

document.addEventListener("DOMContentLoaded", function () {

    const fechaNacimiento = document.getElementById("fechaNacimiento");

    if (fechaNacimiento) {
        fechaNacimiento.addEventListener("input", function () {
            let valor = fechaNacimiento.value.replace(/\D/g, "");

            if (valor.length > 2 && valor.length <= 4) {
                valor = valor.slice(0, 2) + "/" + valor.slice(2);
            } else if (valor.length > 4) {
                valor = valor.slice(0, 2) + "/" + valor.slice(2, 4) + "/" + valor.slice(4, 8);
            }

            fechaNacimiento.value = valor;
        });
    }

});