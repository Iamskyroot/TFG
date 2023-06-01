<%-- 
    Document   : searchdata
    Created on : 06-feb-2023, 10:46:07
    Author     : Skyroot
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="modelo.Fecha"%>
<%@page import="java.sql.Date"%>
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
            String menu = request.getParameter("menu");
            String datos = request.getParameter("datos");
            Conexion con = new Conexion();
            LocalDate fechaActual = LocalDate.now();
//            Connection conn = con.conectar();
            LocalDateTime fecha = LocalDateTime.now();
            int y = fecha.getYear();
            int m = fecha.getMonthValue();
            int d = fecha.getDayOfMonth();
            int datras = fecha.getDayOfMonth() - 7;
            int h = fecha.getHour();
            int min = fecha.getMinute();
            int seg = fecha.getSecond();
            String sql = "",sql2="";
            switch (menu) {
                case "buscar":
                    sql = "SELECT * FROM hc WHERE paciente_id LIKE '%" + datos + "%'";
                    sql2 = "SELECT COUNT(idHc) FROM hc WHERE paciente_id LIKE '%" + datos + "%'";
                    break;
                case "filtro":
                    if (datos.equals("todo")) {
                        sql = "SELECT * FROM hc";
                        sql2 = "SELECT COUNT(idHc) FROM hc";
                    }
                    if (datos.equals("diario")) {
                        sql = "SELECT * FROM hc WHERE fecha LIKE '%" + fechaActual + "%'";
                        System.out.println("fecha actual: " + fechaActual);
                    }
                    if (datos.equals("semanal")) {
                        sql = "SELECT * FROM hc WHERE fecha BETWEEN '" + fecha.of(y, m, datras, h, min, seg) + "' AND '" + fecha.of(y, m, d, h, min, seg) + "'";
                        System.out.println("Fecha una semana atras: " + fecha.of(y, m, datras, h, min, seg));
                        System.out.println("Fecha hoy " + fecha.of(y, m, d, h, min, seg));
                    }
                    break;
                default:
                    throw new AssertionError();
            }
            
            Statement st = con.conectar().createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            while (rs.next()) {

        %>
    <tr>
        <td>H<%= rs.getString("paciente_id")%><%= rs.getString("consulta_id")%></td>
        <td><%= rs.getInt("consulta_id")%></td>
        <td><%= rs.getString("paciente_id")%></td>
        <td><%= rs.getString("fecha")%></td>
        <td>
            <a class="btn btn-info" href="CtrlHistorial?menu=Historial&accion=Mostrar&hId=<%= rs.getString("idHc")%>&codConsulta=<%= rs.getString("consulta_id")%>&codPaciente=<%= rs.getString("paciente_id")%>&mId=<%= rs.getString("medico_id")%>" title="Ver historial"><i class="fas fa-eye"></i></a>

        </td>

    </tr>
    <%
        }
        con.conectar().close();
    %>


</body>
</html>
