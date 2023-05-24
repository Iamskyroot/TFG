<%-- 
    Document   : searchdata
    Created on : 06-feb-2023, 10:46:07
    Author     : Skyroot
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.Conexion"%>
<%@page import="modelo.Paciente"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="modelo.PacienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String datos = request.getParameter("datos");
            Conexion con = new Conexion();
            Connection conn = con.conectar();

            String sql = "";
            switch (datos) {
                case "todo":
                    sql = "SELECT * FROM prescripciones";
                    break;
                case "orden":
                    sql = "SELECT * FROM prescripciones ORDER BY medicamento";
                    break;
                case "adult":
                    sql = "SELECT * FROM prescripciones WHERE categoria LIKE '%adultos%'";
                    break;
                case "nn":
                    sql = "SELECT * FROM prescripciones WHERE categoria LIKE '%ninos%'";
                    break;
                case "bb":
                    sql = "SELECT * FROM prescripciones WHERE categoria LIKE '%bebes%'";
                    break;
                default:
                    sql = "SELECT * FROM prescripciones";

            }

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {

        %>
    <tr>
        <td><%= rs.getString("idPrescripcion")%></td>
        <td><%= rs.getString("medicamento")%></td>
        <td><%= rs.getInt("cantidad")%></td>
        <td><%= rs.getString("dosis")%></td>
        <td><%= rs.getString("frecuencia")%></td>
        <td><%= rs.getString("categoria")%></td>
        <td><%= rs.getString("enfermedad")%></td>
        <td class="btn-group-sm">
            <a class="btn btn-success" href="CtrlTratamiento?menu=Tratamiento&accion=Editar&id=<%= rs.getInt("idPrescripcion")%>" title="Editar"><i class="far fa-edit"></i></a>
            <a class="btn btn-danger" href="CtrlTratamiento?menu=Tratamiento&accion=Eliminar&id=<%= rs.getInt("idPrescripcion")%>" title="Eliminar"><i class="far fa-trash-alt"></i></a>
        </td>
    </tr>
    <%
        }
    %>


</body>
</html>
