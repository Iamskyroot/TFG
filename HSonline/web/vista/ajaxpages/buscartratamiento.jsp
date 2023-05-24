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
            String accion = request.getParameter("accion");
            String datos = request.getParameter("datos");
            Conexion con = new Conexion();
            Connection conn = con.conectar();
            Statement st = null;
            String sql = "";
            try {
                st = conn.createStatement();
                switch (accion) {
                    case "buscar":
                        sql = "SELECT * FROM prescripciones WHERE medicamento LIKE '%" + datos + "%' OR enfermedad LIKE '%" + datos + "%'"
                                + " OR categoria LIKE '%" + datos + "%'";
                        break;
                    case "eliminar":
                        sql = "DELETE FROM prescripciones WHERE idPrescripcion=" + datos;
                        st.executeUpdate(sql);
                        System.out.println("Datos eliminados");
                        sql = "SELECT * FROM prescripciones";
                        break;
                    default:
                        throw new AssertionError();
                }
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
            <a class="btn btn-danger" href="#" onclick="eliminarPrescripcion(<%= rs.getInt("idPrescripcion")%>, '<%= rs.getString("medicamento")%>')" title="Eliminar"><i class="far fa-trash-alt"></i></a>
        </td>
    </tr>
    <%
            }
        } catch (Exception e) {
            System.out.println("Error al buscar o eliminar presscripcion. " + e.getMessage());
        }
    %>


</body>
</html>
