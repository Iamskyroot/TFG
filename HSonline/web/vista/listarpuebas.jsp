<%-- 
    Document   : listarpuebas
    Created on : 14-feb-2023, 10:45:36
    Author     : Skyroot
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.Conexion"%>

<%
//            String nombre = request.getParameter("nombre");
    Conexion con = new Conexion();
    Connection conn = con.conectar();

    String sql = "SELECT * FROM enfermedad ";

    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(sql);
%>
<!--<input type="text" id="txtBuscar" onkeyup="buscarTratamientos()" placeholder="Buscar enfermedad.." title="Escriba un tratamiento">-->

    <%
        while (rs.next()) {

//                    out.print("<li><label><input type='checkbox' name='p'> "+rs.getString("nombre")+"<label></li>");

    %>
    <li><label><input type='checkbox' name='p' value="<%= rs.getString("nombre")%>"> <%=rs.getString("nombre")%></label></li>
            <%
                }
            %>


