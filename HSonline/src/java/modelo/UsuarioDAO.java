/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import config.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Skyroot
 */
public class UsuarioDAO extends Conexion {
    
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public Usuario registrarUsuario(Usuario usu){
        Usuario usuario = new Usuario();
        String sql = "INSERT INTO usuarios(nombre,nom_usuario,contrasena)"
                + "VALUES(?,?,?)";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, usu.getNombre());
            ps.setObject(2, usu.getUsuario());
            ps.setObject(3, usu.getContrasena());
            
            ps.execute();
            System.out.println("Usuario registrado");
            conectar().close();
            return usuario;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            try {
                conectar().close();
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            return null;
        }
        
    }
    
    //selecciona los datos del usuario al que le pasemos como parametro(usuario y contrasena)
    public Usuario validarUsuario(String usuario, String contra){
        
        Usuario usu = new Usuario();
        String sql = "SELECT * FROM usuarios WHERE nom_usuario = ? AND contrasena = ?";
        
        try {
            
            ps = conectar().prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, contra);
            
            rs = ps.executeQuery();
            
            if (rs.next()) {
                usu.setNombre(rs.getString("nombre"));
                usu.setUsuario(rs.getString("nom_usuario"));
                usu.setContrasena(rs.getString("contrasena"));
//                usu.setTipo_usuario(rs.getInt("tipo_usuario"));
//                usu.setCod_registro(rs.getInt("codigo_registro"));
//                usu.setEspecialidad(rs.getString("especialidad"));   
            }
            conectar().close();
        } catch (SQLException e) {
            try {
                conectar().close();
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println("Error al validar usuario "+e.getMessage());
            return null;
        }
        
        return usu;
    }
    
    //comprueba si existe el usuario que le pasamos como parametro
    public boolean existeUsuario(String nombre){
        boolean existe = false;
        String sql = "SELECT * FROM usuarios WHERE nom_usuario = ?";
        
        try {
            ps = conectar().prepareStatement(sql);
            ps.setString(1, nombre);
            rs = ps.executeQuery();
            while (rs.next()) {                
                
                if (rs.getString("nom_usuario").equals(nombre)) {
                    existe = true;
                } else {
                    existe = false;
                }
            }
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error de consulta de usuario: "+e.getMessage());
            try {
                conectar().close();
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return existe;
    }
    
}
