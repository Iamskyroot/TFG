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

            String sql;
            if (datos.equals("todo")) {
                sql = "SELECT * FROM consulta";
            } else {

                sql = "SELECT * FROM consulta WHERE fecha_consulta LIKE '%" + datos + "%'";
//                System.out.println(datos);
            }

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {

        %>
    <tr>
        <td><%= rs.getString("idConsulta")%></td>
        <td><%= rs.getInt("paciente_id")%></td>
        <td><%= rs.getString("pruebas")%></td>
        <td><%= rs.getString("dianostico")%></td>
        <td><%= rs.getString("fecha_consulta")%></td>
        <td class="btn-group-sm">
            <a class="btn btn-success" href="#" onclick="editConsulta(<%= rs.getInt("paciente_id")%>,<%= rs.getString("idConsulta")%>)" title="Editar"><i class="far fa-edit"></i></a>
            <a class="btn btn-warning" href="archivar?menu=Consultas&accion=Archivar&codConsulta=<%= rs.getString("idConsulta")%>&codPaciente=<%= rs.getInt("paciente_id")%>&page=${pagActual}" title="Archivar"><i style="color:white" class="fas fa-download"></i></a>
            <a class="btn btn-info" href="Controlador?menu=Detalles&accion=Mostrar&codPaciente=<%= rs.getInt("paciente_id")%>&codConsulta=<%= rs.getString("idConsulta")%>" title="Mostrar detalles"><i class="fas fa-eye"></i></a>
        </td>

    </tr>
    <%
        }
    %>


</body>
</html>
