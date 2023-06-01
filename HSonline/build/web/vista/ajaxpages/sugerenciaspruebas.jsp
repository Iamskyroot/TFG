<%-- 
    Document   : sugerenciaspruebas
    Created on : 17-may-2023, 7:35:09
    Author     : Skyroot
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.Conexion"%>
<%
//            String nombre = request.getParameter("nombre");
    Conexion con = new Conexion();
//    Connection conn = con.conectar();
    String datos = request.getParameter("datos");

    String sql = "SELECT * FROM enfermedad e, sintoma s, enfermedad_sintoma es "
            + "WHERE (e.nombre=es.enfermedad_id AND s.idSintoma=es.sintoma_id) AND s.descripcion LIKE '%" + datos + "%'";
    try {

        Statement st = con.conectar().createStatement();
        ResultSet rs = st.executeQuery(sql);
%>
<!--<input type="text" id="txtBuscar" onkeyup="buscarTratamientos()" placeholder="Buscar enfermedad.." title="Escriba un tratamiento">-->
<label class="titulo">Mostrando sugerencias para <%=datos%></label>
<%
    while (rs.next()) {

//                    out.print("<li><label><input type='checkbox' name='p'> "+rs.getString("nombre")+"<label></li>");
%>
<ul>
    <li> <%=rs.getString("prueba")%></li>
</ul>
<%

        }
    } catch (Exception e) {
        System.out.println("Error al buscar sugerencias. " + e.getMessage());
    }
    con.conectar().close();
%>
