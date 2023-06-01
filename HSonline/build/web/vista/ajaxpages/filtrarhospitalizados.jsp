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
//            Connection conn = con.conectar();

            String sql = "";
           
            switch(datos){
                case "todo":
                    sql = "SELECT * FROM hospitalizacion";
                    break;
                case "hospitalizado":
                    sql = "SELECT * FROM hospitalizacion WHERE estado='hospitalizado'";
                    break;
                case "alta":
                    sql = "SELECT * FROM hospitalizacion WHERE estado='alta'";
                    break;
                case "orden":
                    sql = "SELECT * FROM hospitalizacion ORDER BY nombre";
                    break;
                default:
                    sql = "SELECT * FROM hospitalizacion";
            }

            Statement st = con.conectar().createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {

        %>
    <tr>
        <td><%= rs.getInt("paciente_id")%></td>
        <td><%= rs.getString("nombre")%></td>
        <td><%= rs.getString("sala")%></td>
        <td><%= rs.getString("habitacion")%></td>
        <td><%= rs.getString("cama")%></td>
        <td><%= rs.getString("estado")%></td>
        <td><%= rs.getString("fecha_ingreso")%></td>
        <td class="btn-group-sm"><a class="btn btn-success" href="CtrlHospitalizacion?menu=Hospitalizacion&accion=Editar&paciente=<%= rs.getInt("idHospitalizacion") %>" title="Editar"><i class="far fa-edit"></i></a></td>

    </tr>
    <%
        }
        con.conectar().close();
    %>


</body>
</html>
