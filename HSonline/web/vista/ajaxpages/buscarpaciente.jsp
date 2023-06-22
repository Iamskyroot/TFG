<%-- 
    Document   : searchdata
    Created on : 06-feb-2023, 10:46:07
    Author     : Skyroot
--%>

<%@page import="modelo.Sanitario"%>
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
            Sanitario usu = (Sanitario) session.getAttribute("usuario");
            String datos = request.getParameter("nombre");
            String userType = request.getParameter("type");
            Conexion con = new Conexion();

            String sql = "SELECT * FROM paciente WHERE nombre LIKE '%" + datos + "%' OR idPaciente LIKE '%"+datos+"%'";

            Statement st = con.conectar().createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {

        %>
    <tr>
        <td><%= rs.getString("idPaciente")%></td>
        <td><%= rs.getString("nombre")%></td>
        <td><%= rs.getInt("edad")%></td>
        <td><%= rs.getString("sexo")%></td>
        <td><%= rs.getString("documento")%></td>
        <td><%= rs.getString("direccion")%></td>
        <td><%= rs.getString("telefono")%></td>
        <td class="btn-group-sm">
            <a class="btn btn-success" href="Controlador?menu=Pacientes&accion=edit&codPaciente=<%= rs.getString("idPaciente")%>" title="Editar"><i class="far fa-edit"></i></a>
            <%
                if (!usu.getEspecialidad().equalsIgnoreCase("recepcionista")) {
 
            %>
            <a class="btn btn-warning" href="#" onclick="openConsulta(<%= rs.getString("idPaciente")%>, '<%= rs.getString("nombre")%>')" title="Nueva consulta"><i class="fas fa-plus"></i></a>
            <% }%>
        </td>

<!--<td><a class="btn-act btn-delete" style="background: #269abc" href="Controlador?menu=Pacientes&accion=nc&nom=<%= rs.getString("nombre")%>" title="Nueva consulta"><i class="fas fa-plus"></i></a></td>-->
<!--<td><a class="btn-act btn-detail" href="Controlador?menu=Pacientes&accion=ver&codPaciente=${p.getCodigo()}" title="Ver paciente"><i class="far fa-address-card"></i></a></td>-->
    </tr>
    <%
        }
        con.conectar().close();
    %>


</body>
</html>
