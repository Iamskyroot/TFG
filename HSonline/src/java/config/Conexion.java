/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Skyroot
 */
public class Conexion {
    
    private final String url="jdbc:mysql://localhost:3306/gestion_hospitalaria";
    private final String user="root";
    private final String passw="";
    
    private Connection con= null;
    
    public Connection conectar(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, passw);
            if (con != null) {
                System.out.println("Conectado!");
            }
        return con;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error de conexion: "+e.getMessage());
            return null;
        }
    }

    
}
