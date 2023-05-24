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

            String sql = "SELECT * FROM prescripciones WHERE idPrescripcion=" + datos;

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {

        %>
        <form action="tratamiento" method="get" class="f_row">
            <div class="f_column" style="width: 40px;visibility: hidden">
                <label>Id</label>
                <input type="text" name="id" class="f_txt" readonly value="<%= rs.getInt("idPrescripcion")%>">
            </div>
            <div class="f_column">
                <label>Medicamento</label>
                <input type="text" name="medi" class="f_txt" value="<%= rs.getString("medicamento")%>">
            </div>
            <div class="f_column" style="width: 60%">
                <label>Cantidad</label>
                <input type="text" name="canti" class="f_txt" value="<%= rs.getString("cantidad")%>">
            </div>
            <div class="f_column" style="width: 35%">
                <label>Dosis</label>
                <input type="text" name="dosi" class="f_txt" value="<%= rs.getString("dosis")%>">
            </div>
            <div class="f_column">
                <label>Frecuencia</label>
                <input type="text" name="fre" class="f_txt" value="<%= rs.getString("frecuencia")%>">
            </div>
            <div class="f_column">
                <label>Categoria</label>
                <input type="text" name="cat" class="f_txt" value="<%= rs.getString("categoria")%>">
            </div>
            <div class="f_column">
                <label>Enfermedad</label>
                <input type="text" class="f_txt" readonly value="<%= rs.getString("enfermedad")%>">
            </div>
            <div class="f_row">
                <button type="submit" name="accion" title="Guardar cambios" style="padding: 4px 10px; background: #04AA6D;color: white;font-weight: bold;border: none;cursor: pointer"><i class="fas fa-check"></i></button>
                <button type="button" name="accion" onclick="hideInputs()" title="Cancelar" style="padding: 4px 10px; background: red;color: white;font-weight: bold;border: none;cursor: pointer"><i class="fas fa-times"></i></button>
            </div>

        </form>
        <%
            }
        %>


    </body>
</html>
