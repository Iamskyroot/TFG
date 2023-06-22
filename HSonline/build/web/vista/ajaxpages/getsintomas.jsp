<%-- 
    Document   : getsintomas
    Created on : 12-jun-2023, 17:35:04
    Author     : Skyroot
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.Conexion"%>
<%
    Conexion conex = new Conexion();
    Statement stm = null;
    ResultSet rst = null;
    String id = request.getParameter("paciente");

    try {
        String sql = "SELECT idConsulta,sintomas,prioridad FROM consulta WHERE paciente_id=" + id;
        stm = conex.conectar().createStatement();
        rst = stm.executeQuery(sql);
        rst.afterLast();
        if (rst.last()) {
%>
<div class="f_row">Consulta ID: <input type="text" name="cId" readonly style="outline: none; border: none" value="<%= rst.getString("idConsulta")%>"></div>
<div class="f_row">

    <div class="f_column">
        <label><b>Sintomas</b></label>
        <textarea class="textarea" class="f_txt" name="sintomas"><%=rst.getString("sintomas")%></textarea>

    </div>
    <div class="f_column">
        <label>Prioridad</label>
        <%
            String prioridad = rst.getString("prioridad");
            if (prioridad != null) {
                switch (prioridad) {
                    case "1":
                        out.print("<h3 class='f_txt' style='border: 2px solid red'>EMERGENCIA</h3>");
                        break;
                    case "2":
                        out.print("<h3 class='f_txt' style='border: 2px solid orange'>URGENCIA</h3>");
                        break;
                    case "3":
                        out.print("<h3 class='f_txt' style='border: 2px solid yellow'>URGENCIA MENOR</h3>");
                        break;
                    case "4":
                        out.print("<h3 class='f_txt' style='border:2px solid green'>CONSULTA RUTINARIA</h3>");
                        break;
                    case "5":
                        out.print("<h3 class='f_txt' style='border:2px solid blue'>NO PRIORITARIO</h3>");
                        break;
                    default:

                        out.print("<h3 class='f_txt' style='border:2px solid green'>CONSULTA RUTINARIA</h3>");
                }
            } else {
                out.print("<h3 class='f_txt' style='border:2px solid green'>CONSULTA RUTINARIA</h3>");
            }

        %>
        <!--<input type="text" class="f_txt" value="<%= rst.getString("prioridad")%>">-->
    </div>
</div>        
<%
        }
        System.out.println("Datos de sintomas encontrados " + rst.getString("sintomas"));
    } catch (Exception e) {
        System.out.println("Error al cargar datos de sintomas " + e.getMessage());
    }
    conex.conectar().close();
    stm.close();
    rst.close();
%>
