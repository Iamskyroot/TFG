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
            String accion = request.getParameter("accion");
            String datos = request.getParameter("datos");
            Conexion con = new Conexion();
            Statement st = con.conectar().createStatement();
            ResultSet rs = null;
            String sql = "";
            switch(accion){
                case "buscar":
                    sql = "SELECT * FROM sanitario WHERE nombre LIKE '%" + datos + "%'";
                    break;
                case "eliminar":
                    sql = "DELETE FROM sanitario WHERE idMedico="+datos;
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
        <td><%= rs.getString("idMedico")%></td>
        <td><%= rs.getString("nombre")%></td>
        <td><%= rs.getString("dip_pasaporte")%></td>
        <td><%= rs.getString("especialidad")%></td>
        <td><%= rs.getString("telefono")%></td>
        <td class="btn-group-sm">
            <a class="btn btn-danger" href="CtrlDoctores?menu=Doctores&accion=Eliminar&id=<%= rs.getString("idMedico")%>" title="Eliminar"><i class="far fa-trash-alt"></i></a>
            <a class="btn btn-info" href="CtrlDoctores?menu=Doctores&accion=Detalle&id=<%= rs.getString("idMedico")%>" title="Mostrar detalles"><i class="far fa-eye"></i></a>
        </td>
    </tr>
    <%        }
            con.conectar().close();
    %>


</body>
</html>
