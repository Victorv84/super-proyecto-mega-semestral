function toggleModoOscuro() {
    const body = document.body;
    const boton = document.getElementById("btnModo");

    body.classList.toggle("modo-oscuro");

    if (body.classList.contains("modo-oscuro")) {
        localStorage.setItem("modoOscuro", "activo");

        if (boton) {
            boton.innerHTML = "☀️ Modo claro";
        }

    } else {
        localStorage.setItem("modoOscuro", "inactivo");

        if (boton) {
            boton.innerHTML = "🌙 Modo oscuro";
        }
    }
}

window.addEventListener("DOMContentLoaded", function () {
    const boton = document.getElementById("btnModo");

    if (localStorage.getItem("modoOscuro") === "activo") {
        document.body.classList.add("modo-oscuro");

        if (boton) {
            boton.innerHTML = "☀️ Modo claro";
        }
    } else {
        if (boton) {
            boton.innerHTML = "🌙 Modo oscuro";
        }
    }
});