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
            String accion = request.getParameter("accion");
            String datos = request.getParameter("datos");
            Conexion con = new Conexion();
            Statement st = con.conectar().createStatement();
            ResultSet rs = null;
            String sql = "";
            switch(accion){
                case "buscar":
                    sql = "SELECT * FROM horario WHERE sanitario_id LIKE '%" + datos + "%'  OR dia_semana LIKE '%"+datos+"%'";
                    break;
                case "eliminar":
                    sql = "DELETE FROM horario WHERE idHorario="+datos;
                    st.executeUpdate(sql);
                    sql = "SELECT * FROM sanitario";
                    break;
                default:
                    throw new AssertionError();
            }

            

            
            rs = st.executeQuery(sql);
            while (rs.next()) {

        %>
    <tr>
        <td><%= rs.getInt("idHorario")%></td>
        <td><%= rs.getString("sanitario_id")%></td>
        <td><%= rs.getString("dia_semana")%></td>
        <td><%= rs.getString("inicio")%></td>
        <td><%= rs.getString("fin")%></td>
        <td class="btn-group-sm">
            <a href="#" onclick="editarHorario(<%= rs.getInt("idHorario")%>)" class="btn btn-success"><i class="fas fa-edit"></i></a>
            <a href="#" onclick="eliminarHorario(<%= rs.getInt("idHorario")%>)" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
        </td>
    </tr>
    <%        }
            con.conectar().close();
    %>


</body>
</html>
