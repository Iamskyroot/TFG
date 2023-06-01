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
            String userType = request.getParameter("type");
            Conexion con = new Conexion();
//            Connection conn = con.conectar();

            String sql = "";
            if (datos.equals("todo")) {
                  sql = "SELECT * FROM paciente";  
            }else{
                
                sql = "SELECT * FROM paciente ORDER BY nombre";
//                System.out.println(datos);
            }

            Statement st = con.conectar().createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {

        %>
    <tr>
        <td><%= rs.getString("nombre")%></td>
        <td><%= rs.getInt("edad")%></td>
        <td><%= rs.getString("sexo")%></td>
        <td><%= rs.getString("documento")%></td>
        <td><%= rs.getString("direccion")%></td>
        <td><%= rs.getString("telefono")%></td>
        <td>
            <a class="btn btn-success" href="Controlador?menu=Pacientes&accion=edit&codPaciente=<%= rs.getString("idPaciente")%>" title="Editar"><i class="far fa-edit"></i></a>
            <%
                if (userType.equalsIgnoreCase("admin") && userType.contains("Medico general")) {
 
            %>
            <a class="btn btn-warning" href="Controlador?menu=Pacientes&accion=nc&nom=<%= rs.getString("nombre")%>" title="Nueva consulta"><i class="fas fa-plus"></i></a>
            <% }%>
        </td>
<!--        <td><a style="color: green" href="#" onclick="openFormEdit(<%= rs.getInt("idPaciente")%>, '<%= rs.getString("nombre")%>',<%= rs.getInt("edad")%>, '<%= rs.getString("sexo")%>', '<%= rs.getString("documento")%>', '<%= rs.getString("direccion")%>', '<%= rs.getString("telefono")%>', '<%= rs.getString("usuario")%>', '<%= rs.getString("contrasena")%>')"  title="Editar"><i style="font-size: 24px" class="far fa-edit"></i></a></td>
        <td><a href="#" onclick="openConsulta(<%= rs.getInt("idPaciente")%>, '<%= rs.getString("nombre")%>')" title="Nueva consulta"><i style="font-size: 24px" class="far fa-plus-square"></i></a></td>-->
        <!--<td><a class="btn-act btn-delete" style="background: #269abc" href="Controlador?menu=Pacientes&accion=nc&nom=<%= rs.getString("nombre")%>" title="Nueva consulta"><i class="fas fa-plus"></i></a></td>-->

    </tr>
    <%
        }
        con.conectar().close();
    %>


</body>
</html>
