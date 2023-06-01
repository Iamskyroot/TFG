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
                String nombre = request.getParameter("nombre");
                Conexion con = new Conexion();
//                Connection conn = con.conectar();

                String sql = "SELECT * FROM tratamiento";

                Statement st = con.conectar().createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {

            %>

            <li><label><input type="checkbox" name="t" value="<%= rs.getInt("idTratamiento")%>"> <%= rs.getString("enfermedad")%> <%= rs.getString("categoria")%> </label></li>


            <%        }
                con.conectar().close();
            %>
        </ul>

    </body>
</html>
