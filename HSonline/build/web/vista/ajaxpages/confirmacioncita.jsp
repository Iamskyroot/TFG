<%-- 
    Document   : confirmacioncita
    Created on : 20-mar-2023, 1:13:37
    Author     : Skyroot
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="modelo.Paciente"%>
<%@page import="modelo.Sanitario"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.Conexion"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Paciente usu = (Paciente) session.getAttribute("usuario");
            String datos = request.getParameter("doc");
            Conexion con = new Conexion();
//            Connection conn = con.conectar();
            LocalDate fechaActual = LocalDate.now();
            LocalDateTime fecha = LocalDateTime.now();
            int y = fecha.getYear();
            int m = fecha.getMonthValue();
            int d = fecha.getDayOfMonth() - 4;
            int d5=4;
            if(d <= 24){
             d5 = d + 4;
            }
            int h = fecha.getHour();
            int min = fecha.getMinute();
            int seg = fecha.getSecond();
            
            try {
                
                String sql = "SELECT * FROM citas WHERE (documento='" + usu.getDocumento() + "') AND (fecha_inicio BETWEEN '" + fecha.of(y, m, d, h, min, seg) + "' AND '" + fecha.of(y, m, d5, h, min, seg) + "')";
                Statement st = con.conectar().createStatement();
                ResultSet rs = st.executeQuery(sql);
                if (rs.last()) {

        %>
        <p>Fecha: <%=rs.getString("fecha_inicio")%></p>
        <!--<p>Fecha de vigencia: <%=rs.getString("fecha_fin")%></p>-->
        <p>Fecha: <%=rs.getString("medico")%> </p>
        <%
        } else {

        %>
        <p>Ninguna cita pendiente</p>
        <% }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
            con.conectar().close();
        %>
    </body>
</html>
