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
        <ul>
            <%
//                String paciente = request.getParameter("idPa");
                String consulta = request.getParameter("idCo");
                Conexion con = new Conexion();

                String sql = "SELECT * FROM pruebas_paciente WHERE consulta_id=" + consulta;

                Statement st = con.conectar().createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {

            %>

            <li><label><input type="checkbox" name="p" value="<%= rs.getString("prueba")%>"> <%= rs.getString("prueba")%>  </label></li>


            <%        }
                con.conectar().close();
                st.close();
                rs.close();
            %>
        </ul>

    </body>
</html>
