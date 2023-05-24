<%-- 
    Document   : no_session
    Created on : 29-dic-2022, 11:02:15
    Author     : Skyroot
--%>

<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("Controlador?menu=Login&accion=0");
    }
%>
