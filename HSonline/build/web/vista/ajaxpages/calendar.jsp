<%-- 
    Document   : calendar
    Created on : 30-mar-2023, 13:17:24
    Author     : Skyroot
--%>

<%@page import="net.sf.json.JSONArray"%>
<%@page import="modelo.Cita"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="modelo.CitaDAO"%>
<%@page import="config.Conexion"%>

<%
    Conexion con = new Conexion();
     String sql = "SELECT * FROM citas WHERE estado='OK'";
             JSONObject object = new JSONObject();
             JSONArray jsonArray = new JSONArray();
            Statement st = con.conectar().createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
               object.put("title", rs.getString("nombre"));
               object.put("start", rs.getString("fecha_inicio"));
               object.put("end", rs.getString("fecha_fin"));
               object.put("allDay", false);
//               object.put("start", rs.getString("fecha_asignada"));
//               object.put("eventBackgroudColor", "#269abc");
               jsonArray.add(object);
            }
            out.print(jsonArray);
            
   
%>
