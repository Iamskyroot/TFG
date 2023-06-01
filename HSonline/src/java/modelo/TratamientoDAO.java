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
public class TratamientoDAO extends Conexion {
    
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private int numeroFilas;

    public int getNumeroFilas() {
        return numeroFilas;
    }

    public void setNumeroFilas(int numeroFilas) {
        this.numeroFilas = numeroFilas;
    }
    
    
    public boolean insertarTratamiento(Tratamiento t){
        
        String sql = "INSERT INTO tratamiento(enfermedad,categoria,medico_id) VALUES(?,?,?)";
        try {
            ps = conectar().prepareStatement(sql);
                ps.setObject(1, t.getEnfermedad());
                ps.setObject(2, t.getCategoria());
                
                ps.setObject(3, t.getMedico_id());
            
            ps.execute();
            rs = ps.executeQuery("SELECT * FROM tratamiento");
            if(rs.last()){
                t.setCodigo_tratamiento(rs.getInt(1));
            }
            System.out.println("Tratamiento creado con exito");
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al crear tratamiento "+e.getMessage());
            return false;
        }
        
        return true;
    }
    
    
//    public Tratamiento buscarTratamiento(String titulo){
//        Tratamiento tratamiento = new Tratamiento();
//        String sql = "SELECT * FROM tratamiento WHERE titulo=?";
//        try {
//            ps = conectar().prepareStatement(sql);
//            ps.setObject(1, titulo);
//            rs = ps.executeQuery();
//            while (rs.next()) {                
//                tratamiento.setCodigo_tratamiento(rs.getInt(1));
//            }
//            return tratamiento;
//        } catch (SQLException e) {
//            System.out.println(e.getMessage());
//            return null;
//        }
//    }
    
    
    
     public List<TratamientoPrescripcion> listarTratamientos(int offset,int numeroFilas){
         
        List<TratamientoPrescripcion> datos = new ArrayList<>();
        
        String sql = "SELECT SQL_CALC_FOUND_ROWS * FROM prescripciones LIMIT "+offset+", "+numeroFilas;
        try {
            ps = conectar().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {                

               TratamientoPrescripcion tp = new TratamientoPrescripcion(
                       rs.getInt("idPrescripcion"),
                       rs.getString("enfermedad"),
                       rs.getString("categoria"),
                       rs.getString("medicamento"),
                       rs.getString("cantidad"),
                       rs.getString("dosis"),
                       rs.getString("frecuencia")
               );
               
               datos.add(tp);

            }
            rs = ps.executeQuery("SELECT FOUND_ROWS()");
            if (rs.next()) {
                setNumeroFilas(rs.getInt(1));
            }
            System.out.println("Datos de tratamientos encontrados "+datos.size());
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al listar tratamientos "+e.getMessage());
        }
        
        return datos;
    }
     

    
}
