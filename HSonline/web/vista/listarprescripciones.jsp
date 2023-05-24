<%-- 
    Document   : listarprescripciones
    Created on : 03-feb-2023, 8:41:28
    Author     : Skyroot
--%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String url = "jdbc:mysql://localhost:3306/gestion_hospitalaria";
    String user = "root";
    String passw = "";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, passw);
        if (con != null) {
            System.out.println("Conectado!");
        }
    } catch (Exception e) {
        System.out.println("Error de conexion: " + e.getMessage());
    }

%>
