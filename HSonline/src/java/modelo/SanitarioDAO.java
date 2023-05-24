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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Skyroot
 */
public class SanitarioDAO extends Conexion {
    
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private int numeroFilas;

    public int getNumeroFilas() {
        return numeroFilas;
    }

    public void setNumeroFilas(int numeroFilas) {
        this.numeroFilas = numeroFilas;
    }
    
    
    public boolean registrarSanitario(Sanitario s){
        
        String sql = "INSERT INTO sanitario(nombre,sexo,nacionalidad,dip_pasaporte,especialidad,direccion,telefono,email,usuario,contrasena)"
                + "VALUES(?,?,?,?,?,?,?,?,?,?)";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, s.getNombre());
            ps.setObject(2, s.getSexo());
            ps.setObject(3, s.getNacion());
            ps.setObject(4, s.getDocumento());
            ps.setObject(5, s.getEspecialidad());
            ps.setObject(6, s.getDireccion());
            ps.setObject(7, s.getTelefono());
            ps.setObject(8, s.getEmail());
            ps.setObject(9, s.getUsuario());
            ps.setObject(10, s.getContrasena());
            ps.execute();
            System.out.println("Sanitario registrado");
        } catch (SQLException e) {
            System.out.println("Error al rgistrar sanitario: "+e.getMessage());
            return false;
        }
        
        return true;
    }
    
    public boolean actualizarSanitario(Sanitario s){
        
        String sql = "UPDATE sanitario SET nombre=?,sexo=?,nacionalidad=?,direccion=?,telefono=?,email=?,usuario=?,contrasena=? WHERE dip_pasaporte=?";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, s.getNombre());
            ps.setObject(2, s.getSexo());
            ps.setObject(3, s.getNacion());
            ps.setObject(4, s.getDireccion());
            ps.setObject(5, s.getTelefono());
            ps.setObject(6, s.getEmail());
            ps.setObject(7, s.getUsuario());
            ps.setObject(8, s.getContrasena());
            ps.setObject(9, s.getDocumento());
            ps.execute();
            System.out.println("Sanitario "+s.getDocumento()+" actualizado");
        } catch (SQLException e) {
            System.out.println("Error al actualizar sanitario: "+e.getMessage());
            return false;
        }
        
        return true;
    }
    
    public List<Sanitario> listarSanitarios(int offset,int numeroFilas){
        List<Sanitario> lista = new ArrayList<>();
        
        String sql = "SELECT SQL_CALC_FOUND_ROWS * FROM sanitario LIMIT " + offset + ", " + numeroFilas;
        try {
            ps = conectar().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {                
                Sanitario s = new Sanitario(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4), 
                        rs.getString(5), 
                        rs.getString(6), 
                        rs.getString(7), 
                        rs.getString(8), 
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
                );
                lista.add(s);
            }
            rs = ps.executeQuery("SELECT FOUND_ROWS()");
            if (rs.next()) {
                this.numeroFilas = rs.getInt(1);
            }
            System.out.println("Listando sanitarios con exito");
        } catch (SQLException e) {
            System.out.println("Error al listar sanitarios: "+e.getMessage());
            return null;
        }
        
        return lista;
    }
    
    public Sanitario validarSanitario(String usu,String clave){
         Sanitario s = new Sanitario();
        String sql = "SELECT * FROM sanitario WHERE usuario = ? AND contrasena = ?";
        
        try {
            
            ps = conectar().prepareStatement(sql);
            ps.setString(1, usu);
            ps.setString(2, clave);
            
            rs = ps.executeQuery();
            
            if (rs.next()) {
                  s.setCodigo(rs.getInt("idMedico"));
                  s.setNombre(rs.getString("nombre"));
                  s.setSexo(rs.getString("sexo"));
                  s.setNacion(rs.getString("nacionalidad"));
                  s.setDocumento(rs.getString("dip_pasaporte"));
                  s.setEspecialidad(rs.getString("especialidad"));
                  s.setDireccion(rs.getString("direccion"));
                  s.setTelefono(rs.getString("telefono"));
                  s.setEmail(rs.getString("email"));
                  s.setUsuario(rs.getString("usuario"));
                  s.setContrasena(rs.getString("contrasena"));
            }
            System.out.println("Sanitario encontrado "+s.getNombre());
        } catch (SQLException e) {
            try {
                conectar().close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
            System.out.println("Error al validar sanitario "+e.getMessage());
            return null;
        }
        return s;
    }
    
    public Sanitario getSanitario(String codigo){
        Sanitario s=null;
        String sql = "SELECT * FROM sanitario WHERE idMedico=?";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, codigo);
            rs = ps.executeQuery();
            if(rs.next()){
                s = new Sanitario(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4), 
                        rs.getString(5), 
                        rs.getString(6), 
                        rs.getString(7), 
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11)
                );
            }
        } catch (SQLException e) {
            System.out.println("Error al consultar medico ");
        }
        return s;
    }
    
    public boolean asignarHorario(Horario h){
        
        String sql = "INSERT INTO horario(sanitario_id,dia_semana,inicio,fin) VALUES(?,?,?,?)";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, h.getSanitatio_id());
            ps.setObject(2, h.getDia());
            ps.setObject(3, h.getInicio());
            ps.setObject(4, h.getFin());
            ps.executeUpdate();
            System.out.println("Horario asignado al personal "+h.getSanitatio_id());
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        
        return true;
    }
    
}
