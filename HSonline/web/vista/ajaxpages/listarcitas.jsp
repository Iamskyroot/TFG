<%-- 
    Document   : calendar
    Created on : 30-mar-2023, 13:17:24
    Author     : Skyroot
--%>

<%@page import="net.sf.json.JSONArray"%>
<%@page import="modelo.Cita"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="modelo.CitaDAO"%>
<%@page import="config.Conexion"%>

<%
    CitaDAO cita = new CitaDAO();
    String accion = request.getParameter("accion");
    switch(accion){
        case "todo":
            out.print(cita.listarCitas2());
            break;
        case "asignado":
            out.print(cita.listarCitasAgendadas());
            break;
        case "noasignado":
            out.print(cita.listarCitasNoAgendadas());
            break;
        default:
            throw new AssertionError();
    }


%>
