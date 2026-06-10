<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
String correo = request.getParameter("correo");
String password = request.getParameter("password");
String cedula = request.getParameter("cedula");

if(correo == null || password == null){
    response.sendRedirect("login.jsp?error=1");
    return;
}

correo = correo.toLowerCase();

if(correo.endsWith("@cliente.com") && password.equals("123")){

    session.setAttribute("usuario", correo);
    session.setAttribute("rol", "cliente");

    response.sendRedirect("Cliente.jsp");

}else if(correo.endsWith("@secretaria.com") && password.equals("123")){

    session.setAttribute("usuario", correo);
    session.setAttribute("rol", "secretaria");

    response.sendRedirect("Secretaria.jsp");

}else if(correo.endsWith("@especialista.com") && password.equals("123")){

    session.setAttribute("usuario", correo);
    session.setAttribute("rol", "especialista");
if (correo.equals("perez@especialista.com")) {
    session.setAttribute("calendar_id", "CALENDARIO_PEREZ");
} else if (correo.equals("ana@especialista.com")) {
    session.setAttribute("calendar_id", "CALENDARIO_ANA");
}

response.sendRedirect("Especialista.jsp");

}else if(correo.endsWith("@admin.com") && password.equals("123")){

    session.setAttribute("usuario", correo);
    session.setAttribute("rol", "admin");

    response.sendRedirect("Admin.jsp");

}else{

    response.sendRedirect("login.jsp?error=1");

}
%>