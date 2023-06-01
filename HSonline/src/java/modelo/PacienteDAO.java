/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Skyroot
 */
public class PacienteDAO extends Conexion {
    
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    private int numeroFilas;

    public int getNumeroFilas() {
        return numeroFilas;
    }

    public void setNumeroFilas(int numeroFilas) {
        this.numeroFilas = numeroFilas;
    }
    
    //-------------------------------------------------
    
    //guardar paciente
    public boolean guardarPaciente(Paciente p){
//        Paciente p = new Paciente();
        String sql = "INSERT INTO paciente(nombre,edad,sexo,documento,direccion,telefono) VALUES(?,?,?,?,?,?)";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, p.getNombre());
            ps.setObject(2, p.getEdad());
            ps.setObject(3, p.getSexo());
            ps.setObject(4, p.getDocumento());
            ps.setObject(5, p.getDireccion());
            ps.setObject(6, p.getTelefono());
            ps.executeUpdate();
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al guardar paciente:\n"+e.getMessage());
        }
        
        return true;
    }
    //guardar paciente
    public boolean guardarPaciente2(Paciente p){
//        Paciente p = new Paciente();
        String sql = "INSERT INTO paciente(nombre,edad,sexo,documento,direccion,telefono,usuario,contrasena) VALUES(?,?,?,?,?,?,?,?)";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, p.getNombre());
            ps.setObject(2, p.getEdad());
            ps.setObject(3, p.getSexo());
            ps.setObject(4, p.getDocumento());
            ps.setObject(5, p.getDireccion());
            ps.setObject(6, p.getTelefono());
            ps.setObject(7, p.getUsuario());
            ps.setObject(8, p.getContrasena());
            ps.executeUpdate();
            System.out.println("Paciente registrado");
        } catch (SQLException e) {
            System.out.println("Error al guardar paciente:\n"+e.getMessage());
        }
        
        return true;
    }
    //actualizar paciente
    public boolean actualizarPaciente(Paciente p){
        String sql = "UPDATE paciente SET nombre=?,edad=?,sexo=?,direccion=?,telefono=?,usuario=?,contrasena=? WHERE documento=?";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, p.getNombre());
            ps.setObject(2, p.getEdad());
            ps.setObject(3, p.getSexo());
            ps.setObject(4, p.getDireccion());
            ps.setObject(5, p.getTelefono());
            ps.setObject(6, p.getUsuario());
            ps.setObject(7, p.getContrasena());
            ps.setObject(8, p.getDocumento());
            ps.executeUpdate();
            System.out.println("Datos de paciente "+p.getDocumento()+" actualizados");
//            con.close();
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al actualizar paciente:\n"+e.getMessage());
            
        }
        return true;
        
    }
    
    //buscar paciente
    public Paciente buscarPaciente(String id){
        Paciente p=new Paciente();
//        List<Paciente> datos = new ArrayList<>();
        String sql = "SELECT * FROM paciente WHERE  idPaciente ="+id+"";
        try {
            Statement st = conectar().createStatement();
//            ps.setObject(2, cod);
            rs = st.executeQuery(sql);
            if (rs.next()) {  
//                p = new Paciente(rs.getInt("idPaciente"), 
//                        rs.getString("nombre"), 
//                        rs.getInt("edad"), 
//                        rs.getString("sexo"), 
//                        rs.getString("documento"), 
//                        rs.getString("direccion"), 
//                        rs.getString("telefono"));
                p.setCodigo(rs.getInt("idPaciente"));
                p.setNombre(rs.getString("nombre"));
                p.setEdad(rs.getInt("edad"));
                p.setDocumento(rs.getString("documento"));
                p.setDireccion(rs.getString("direccion"));
                p.setTelefono(rs.getString("telefono"));
//                datos.add(p);
            }
            System.out.println("Busqueda exitosa ID="+p.getDocumento());
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al buscar paciente:\n"+e.getMessage());
            return null;
        }
        
        return p;
    }
    
    //listar paciente
    public List<Paciente> listarPacientes(int offset,int numeroFilas){
        Paciente paciente = null;
        List<Paciente> listaPaciente = new ArrayList<>();
        String sql = "SELECT SQL_CALC_FOUND_ROWS * FROM paciente LIMIT "+offset+", "+numeroFilas;
        try {
            ps = conectar().prepareStatement(sql);
            rs = ps.executeQuery();
            rs.afterLast();
            while (rs.previous()) {                
                paciente = new Paciente(
                        rs.getInt("idPaciente"),
                        rs.getString("nombre"), 
                        rs.getInt("edad"), 
                        rs.getString("sexo"), 
                        rs.getString("documento"), 
                        rs.getString("direccion"), 
                        rs.getString("telefono"),
                        rs.getString("usuario"),
                        rs.getString("contrasena")
                );
                listaPaciente.add(paciente);
            }
            rs = ps.executeQuery("SELECT FOUND_ROWS()");
            if (rs.next()) {
                this.numeroFilas = rs.getInt(1);
            }
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al listar paciente:\n"+e.getMessage());
        }
        
        return listaPaciente;
    }
    
    //listar por orden alfabetico
    public List<Paciente> listarOrdenAlfabetico(int offset,int numeroFilas){
        Paciente paciente = null;
        List<Paciente> listaPaciente = new ArrayList<>();
        String sql = "SELECT SQL_CALC_FOUND_ROWS * FROM paciente ORDER BY nombre ";
        try {
            ps = conectar().prepareStatement(sql);
            rs = ps.executeQuery();
//            rs.afterLast();
            while (rs.next()) {                
                paciente = new Paciente(
                        rs.getInt("idPaciente"),
                        rs.getString("nombre"), 
                        rs.getInt("edad"), 
                        rs.getString("sexo"), 
                        rs.getString("documento"), 
                        rs.getString("direccion"), 
                        rs.getString("telefono"),
                        rs.getString("usuario"),
                        rs.getString("contrasena")
                );
                listaPaciente.add(paciente);
            }
            rs = ps.executeQuery("SELECT FOUND_ROWS()");
            if (rs.next()) {
                this.numeroFilas = rs.getInt(1);
            }
            System.out.println("Filas: "+getNumeroFilas());
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al filtrar paciente:\n"+e.getMessage());
        }
        
        return listaPaciente;
    }
    
    //buscar si existe paciente
    public boolean existePaciente(String doc){
        //Paciente paciente = new Paciente();
        boolean existe=false;
        String sql = "SELECT * FROM paciente WHERE documento=?";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, doc);
            rs = ps.executeQuery();
            while(rs.next()) {
                if (rs.getString("documento") != null) {
                    existe=true;
                }
            }
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al buscar paciente:\n"+e.getMessage());
            
        }
        System.out.println("Resultado existe: "+existe);
        return existe;
    }
    
    
    
    
    //selecciona los datos del usuario al que le pasemos como parametro(usuario y contrasena)
    public Paciente validarUsuario(String usuario, String contra){
        
        Paciente p = new Paciente();
        String sql = "SELECT * FROM paciente WHERE usuario = ? AND contrasena = ?";
        
        try {
            
            ps = conectar().prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, contra);
            
            rs = ps.executeQuery();
            
            if (rs.next()) {
                p.setCodigo(rs.getInt("idPaciente"));
                p.setNombre(rs.getString("nombre"));
                p.setEdad(rs.getInt("edad"));
                p.setSexo(rs.getString("sexo"));
                p.setDocumento(rs.getString("documento"));
                p.setDireccion(rs.getString("direccion"));
                p.setTelefono(rs.getString("telefono"));
                p.setUsuario(rs.getString("usuario"));
                p.setContrasena(rs.getString("contrasena"));
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
        
        return p;
    }
    
    public String getNombre(int id){
        String nombre="";
        String sql = "SELECT nombre FROM paciente WHERE idPaciente=?";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                nombre = rs.getString("nombre");
            }
            System.out.println("Paciente: "+nombre);
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al obtener el nombre "+e.getMessage());
        }
        return nombre;
    }
    
}
