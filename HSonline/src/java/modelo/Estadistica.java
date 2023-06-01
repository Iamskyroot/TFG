/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import config.Conexion;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Skyroot
 */
public class Estadistica extends Conexion {
    
    private Statement st = null;
    private ResultSet rs = null;
    
    public int getCitas(){
        String sql = "SELECT COUNT(idCita) FROM citas";
        int numFilas = 0;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                numFilas = rs.getInt(1);
            }
            conectar().close();
        } catch (Exception e) {
            System.out.println("Error al consultar citas "+e.getMessage());
        }
        return numFilas;
    }
    public int getPacientes(){
        String sql = "SELECT COUNT(idPaciente) FROM paciente";
        int numFilas = 0;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                numFilas = rs.getInt(1);
            }
            conectar().close();
        } catch (Exception e) {
            System.out.println("Error al consultar pacientes "+e.getMessage());
        }
        return numFilas;
    }
    
    public int getPersonal(){
        String sql = "SELECT COUNT(idMedico) FROM sanitario";
        int numFilas = 0;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                numFilas = rs.getInt(1);
            }
            conectar().close();
        } catch (Exception e) {
            System.out.println("Error al consultar sanitarios "+e.getMessage());
        }
        return numFilas;
    }
    
    public int getTratamientos(){
        String sql = "SELECT COUNT(idTratamiento) FROM tratamiento";
        int numFilas = 0;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                numFilas = rs.getInt(1);
            }
            conectar().close();
        } catch (Exception e) {
            System.out.println("Error al consultar tratamientos "+e.getMessage());
        }
        return numFilas;
    }
    
    public int getHospitalizados(){
        String sql = "SELECT COUNT(idHospitalizacion) FROM hospitalizacion";
        int numFilas = 0;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                numFilas = rs.getInt(1);
            }
            conectar().close();
        } catch (Exception e) {
            System.out.println("Error al consultar hospitalizados "+e.getMessage());
        }
        return numFilas;
    }
    
    public int getConsultas(){
        String sql = "SELECT COUNT(idConsulta) FROM consulta";
        int numFilas = 0;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                numFilas = rs.getInt(1);
            }
            conectar().close();
        } catch (Exception e) {
            System.out.println("Error al consultar consultas "+e.getMessage());
        }
        return numFilas;
    }
    
    public int getHc(){
        String sql = "SELECT COUNT(idHc) FROM hc";
        int numFilas = 0;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                numFilas = rs.getInt(1);
            }
            conectar().close();
        } catch (Exception e) {
            System.out.println("Error al consultar hc "+e.getMessage());
        }
        return numFilas;
    }
    
}
