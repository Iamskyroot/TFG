<%-- 
    Document   : listarhorarios
    Created on : 25-jun-2023, 10:34:09
    Author     : Skyroot
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="config.Conexion"%>
<%@page import="java.sql.Statement"%>
<%
    Statement st = null;
    String sql = "";
    Conexion con = new Conexion();
    if (request.getParameter("dia") != null) {
        String dia = request.getParameter("dia");
        try {

            sql = "SELECT idHorario,nombre,dia_semana,inicio,fin FROM sanitario s, horario h"
                    + " WHERE (s.idMedico=h.sanitario_id) AND (h.dia_semana='" + dia + "')";
            st = con.conectar().createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {


%>
<tr>
    <td><%= rs.getInt("idHorario")%></td>
    <td><%= rs.getString("nombre")%></td>
    <td><%= rs.getString("dia_semana")%></td>
    <td><%= rs.getString("inicio")%></td>
    <td><%= rs.getString("fin")%></td>

</tr>
<% }

        } catch (Exception e) {
            out.print("<p>" + e.getMessage() + "</p>");
            System.out.println(e.getMessage());
        }
    }
con.conectar().close();
%>
