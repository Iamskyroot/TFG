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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Skyroot
 */
public class HospitalizacionDAO extends Conexion {
    
    private int numeroFilas;

    public int getNumeroFilas() {
        return numeroFilas;
    }

    public void setNumeroFilas(int numeroFilas) {
        this.numeroFilas = numeroFilas;
    }
    
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    Hospitalizacion hospi;
    
    public boolean hospitalizarPaciente(int paciente,String nombre,String estado){
        
        String sql = "INSERT INTO hospitalizacion(paciente_id,nombre,estado) VALUES(?,?,?)";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, paciente);
            ps.setObject(2, nombre);
            ps.setObject(3, estado);
            ps.execute();
            System.out.println("Paciente "+nombre+" hospitalizado con exito");
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al hospitalizar "+e.getMessage());
            return false;
        }
        
        return true;
    }
    
     //actualizar hospitalizacion
    public boolean actualizarHospitalizacion(int paciente,String sala,int habita,int cama,String estado,String fa){
        String sql = "UPDATE hospitalizacion SET sala=?,habitacion=?,cama=?,estado=?,fecha_alta=? WHERE idHospitalizacion=?";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, sala);
            ps.setObject(2, habita);
            ps.setObject(3, cama);
            ps.setObject(4, estado);
            ps.setObject(5, fa);
            ps.setObject(6, paciente);
            ps.executeUpdate();
            System.out.println("Datos de hospitalizacion actualizados");
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al actualizar hospitalizacion:\n"+e.getMessage());
            return false;
        }
        return true;
    }
     //buscar hospitalizacion
    public Hospitalizacion buscarHospitalizado(int paciente){
        Hospitalizacion h = null;
        String sql = "SELECT * FROM hospitalizacion WHERE paciente_id=?";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, paciente);
            rs = ps.executeQuery();
            while (rs.next()) {                
                h = new Hospitalizacion(
                        rs.getInt("idHospitalizacion"),
                        rs.getInt("paciente_id"), 
                        rs.getString("nombre"), 
                        rs.getString("sala"), 
                        rs.getInt("habitacion"), 
                        rs.getInt("cama"), 
                        rs.getString("estado"), 
                        rs.getString("fecha_ingreso"), 
                        rs.getString("fecha_alta"));
            }
            System.out.println("Datos de hospitalizacion actualizados");
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al actualizar hospitalizacion:\n"+e.getMessage());
        }
        return h;
    }
     //buscar hospitalizacion
    public List<Hospitalizacion> busqueda(String datos){
        List<Hospitalizacion> lista = new ArrayList<>();
        Hospitalizacion h = null;
        String sql = "SELECT * FROM hospitalizacion WHERE paciente_id='"+datos+"' OR nombre LIKE '%"+datos+"%'";
        try {
            Statement st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {                
                h = new Hospitalizacion(
                        rs.getInt("idHospitalizacion"),
                        rs.getInt("paciente_id"), 
                        rs.getString("nombre"), 
                        rs.getString("sala"), 
                        rs.getInt("habitacion"), 
                        rs.getInt("cama"), 
                        rs.getString("estado"), 
                        rs.getString("fecha_ingreso"), 
                        rs.getString("fecha_alta"));
                lista.add(h);
            }
            System.out.println("Busqueda exitosa");
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al buscar datos:\n"+e.getMessage());
            return null;
        }
        return lista;
    }
    
    public List<Hospitalizacion> listarHospitalizados(int offset,int numeroFilas){
        List<Hospitalizacion> listaH = new ArrayList<>();
        String sql = "SELECT SQL_CALC_FOUND_ROWS * FROM hospitalizacion WHERE estado != 'alta' LIMIT "+offset+", "+numeroFilas;
        try {
            ps = conectar().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {                
                Hospitalizacion h = new Hospitalizacion(
                        rs.getInt("idHospitalizacion"),
                        rs.getInt("paciente_id"), 
                        rs.getString("nombre"), 
                        rs.getString("sala"), 
                        rs.getInt("habitacion"), 
                        rs.getInt("cama"), 
                        rs.getString("estado"), 
                        rs.getString("fecha_ingreso"), 
                        rs.getString("fecha_alta"));
                listaH.add(h);
            }
            rs = ps.executeQuery("SELECT FOUND_ROWS()");
            if (rs.next()) {
                this.numeroFilas = rs.getInt(1);
            }
            System.out.println("Imprimiendo hospitalizados con exito");
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al listar hospitalizados: "+e.getMessage());
            return null;
        }
        
        return listaH;
    }
    
}
