

    let datosCita = {};

    function mostrarResumen(){

      let psicologo = document.getElementById("psicologo");
      let fecha = document.getElementById("fecha");
      let hora = document.getElementById("hora");

      let mensaje = document.getElementById("mensajePaso1");

      mensaje.innerHTML = "";

      if(
        psicologo.value === "" ||
        fecha.value === "" ||
        hora.value === ""
      ){
        mensaje.innerHTML = `
          <div class="message error">
            Complete todos los campos obligatorios.
          </div>
        `;
        return;
      }

      datosCita = {
        psicologo: psicologo.value,
        fecha: fecha.value,
        hora: hora.value
      };

      document.getElementById("textoResumen").innerHTML = `
        <strong>Resumen:</strong><br><br>
        ${datosCita.psicologo}<br>
        ${datosCita.fecha} a las ${datosCita.hora}
      `;

      document.getElementById("paso1").classList.add("hidden");
      document.getElementById("resumen").classList.remove("hidden");
    }

    function regresarPaso1(){
      document.getElementById("resumen").classList.add("hidden");
      document.getElementById("paso1").classList.remove("hidden");
    }

    function mostrarFormulario(){
      document.getElementById("resumen").classList.add("hidden");
      document.getElementById("paso2").classList.remove("hidden");
    }

    function confirmarCita(){

      let nombre = document.getElementById("nombre");
      let profesion = document.getElementById("profesion");
      let asunto = document.getElementById("asunto");
      let descripcion = document.getElementById("descripcion");

      let campos = [
        nombre,
        profesion,
        asunto,
        descripcion
      ];

      campos.forEach(campo => {
        campo.classList.remove("required");
      });

      let incompleto = false;

      campos.forEach(campo => {
        if(campo.value.trim() === ""){
          campo.classList.add("required");
          incompleto = true;
        }
      });

      if(incompleto){
        document.getElementById("mensajeFinal").innerHTML = `
          <div class="message error">
            Complete todos los campos obligatorios antes de confirmar la cita.
          </div>
        `;
        return;
      }

      // Simulación de validación de hora ocupada
      if(datosCita.hora === "10:00"){

        document.getElementById("mensajeFinal").innerHTML = `
          <div class="message warning">
            La hora seleccionada ya no está disponible, seleccione otra.
          </div>
        `;

        setTimeout(() => {
          document.getElementById("paso2").classList.add("hidden");
          document.getElementById("paso1").classList.remove("hidden");
        }, 3000);

        return;
      }

      // Simulación de encriptación simple
      let datosEncriptados = btoa(
        nombre.value +
        profesion.value +
        asunto.value +
        descripcion.value
      );

      console.log("Datos encriptados:", datosEncriptados);

      document.querySelector(".container").innerHTML = `
        <h2>Página Principal</h2>

        <div class="message success">
          ¡Cita confirmada! Cita agendada con 
          <strong>${datosCita.psicologo}</strong> el 
          <strong>${datosCita.fecha}</strong> a las 
          <strong>${datosCita.hora}</strong>.
        </div>
      `;
    }

    function cancelarCita(){

      alert("La cita fue cancelada.");

      location.reload();
    }

    function volverInicio(){

      alert("Regresando a la página principal.");

      location.reload();
    }

 