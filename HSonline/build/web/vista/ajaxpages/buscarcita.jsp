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

            String sql = "SELECT * FROM citas WHERE nombre LIKE '%" + datos + "%'";

            Statement st = con.conectar().createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {

        %>
    <tr>
        <td><%= rs.getString("nombre")%></td>
        <td><%= rs.getString("motivo")%></td>
        <td><%= rs.getString("servicio")%></td>
        <td><%= rs.getString("fecha_solicitud")%></td>
        <td>
            <%
                if (rs.getString("fecha_inicio").isEmpty()) {
                    out.print("<span class='btn-warning' style='padding:2px 10px'>No asignado</span>");
                } else {
                    out.print(rs.getString("fecha_inicio"));
                }
            %>
        </td>
        <td>
            <%
                if (rs.getString("fecha_fin")==null) {
                    out.print("<span class='btn-warning' style='padding:2px 10px'>No asignado</span>");
                } else {
                    out.print(rs.getString("fecha_fin"));
                }
            %>
        </td>
        <td><%= rs.getString("medico")%></td>
        <td class="btn-group-sm">
            <a href="CtrlCitas?menu=Citas&accion=editar&id=<%= rs.getString("idCita")%>" target="blank" class="btn btn-success" title="Editar solicitud"><i class="far fa-edit"></i></a>
            <a href="CtrlCitas?menu=Citas&accion=cancelar&id=<%= rs.getString("idCita")%>" class="btn btn-danger" title="Cancelar"><i class="fas fa-times"></i></a>
        </td>

    </tr>
    <%
        }
        con.conectar().close();
    %>


</body>
</html>
