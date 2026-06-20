function toggleMenu() {
    const menu = document.getElementById("menuLateral");
    const overlay = document.getElementById("overlay");

    menu.classList.toggle("active");
    overlay.classList.toggle("active");
}

function toggleModoOscuro() {
    document.body.classList.toggle("dark-mode");

    const btn = document.getElementById("btnModo");

    if (document.body.classList.contains("dark-mode")) {
        btn.innerHTML = "☀️ Modo claro";
        localStorage.setItem("modoOscuro", "activo");
    } else {
        btn.innerHTML = "🌙 Modo oscuro";
        localStorage.setItem("modoOscuro", "inactivo");
    }
}

document.addEventListener("DOMContentLoaded", function () {
    const modoGuardado = localStorage.getItem("modoOscuro");
    const btn = document.getElementById("btnModo");

    if (modoGuardado === "activo") {
        document.body.classList.add("dark-mode");

        if (btn) {
            btn.innerHTML = "☀️ Modo claro";
        }
    }
});