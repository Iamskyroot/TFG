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
public class HorarioDAO extends Conexion {
    private Statement st = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    private int numFilas;

    public int getNumFilas() {
        return numFilas;
    }

    public void setNumFilas(int numFilas) {
        this.numFilas = numFilas;
    }
    
    public List<Horario> lunes(){
        List<Horario> datos = new ArrayList<>();
        String sql = "SELECT * FROM sanitario s, horario h WHERE s.idMedico=h.sanitario_id AND dia_semana='lunes'";
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Horario h = new Horario();
                h.setNombre_sanitario(rs.getString("nombre"));
                h.setInicio(rs.getString("inicio"));
                h.setFin(rs.getString("fin"));
                datos.add(h);
            }
            conectar().close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return datos;
    }
    public List<Horario> martes(){
        List<Horario> datos = new ArrayList<>();
        String sql = "SELECT * FROM sanitario s, horario h WHERE s.idMedico=h.sanitario_id AND dia_semana='martes'";
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Horario h = new Horario();
                h.setNombre_sanitario(rs.getString("nombre"));
                h.setInicio(rs.getString("inicio"));
                h.setFin(rs.getString("fin"));
                datos.add(h);
            }
            conectar().close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return datos;
    }
    public List<Horario> miercoles(){
        List<Horario> datos = new ArrayList<>();
        String sql = "SELECT * FROM sanitario s, horario h WHERE s.idMedico=h.sanitario_id AND dia_semana='miercoles'";
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Horario h = new Horario();
                h.setNombre_sanitario(rs.getString("nombre"));
                h.setInicio(rs.getString("inicio"));
                h.setFin(rs.getString("fin"));
                datos.add(h);
            }
            conectar().close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return datos;
    }
    
    public List<Horario> jueves(){
        List<Horario> datos = new ArrayList<>();
        String sql = "SELECT * FROM sanitario s, horario h WHERE s.idMedico=h.sanitario_id  AND dia_semana='jueves'";
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Horario h = new Horario();
                h.setNombre_sanitario(rs.getString("nombre"));
                h.setInicio(rs.getString("inicio"));
                h.setFin(rs.getString("fin"));
                datos.add(h);
            }
            conectar().close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return datos;
    }
    
    public List<Horario> viernes(){
        List<Horario> datos = new ArrayList<>();
        String sql = "SELECT * FROM sanitario s, horario h WHERE s.idMedico=h.sanitario_id AND dia_semana='viernes'";
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Horario h = new Horario();
                h.setNombre_sanitario(rs.getString("nombre"));
                h.setInicio(rs.getString("inicio"));
                h.setFin(rs.getString("fin"));
                datos.add(h);
            }
            conectar().close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return datos;
    }
    
    public List<Horario> sabado(){
        List<Horario> datos = new ArrayList<>();
        String sql = "SELECT * FROM sanitario s, horario h WHERE s.idMedico=h.sanitario_id AND dia_semana='sabado'";
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Horario h = new Horario();
                h.setNombre_sanitario(rs.getString("nombre"));
                h.setInicio(rs.getString("inicio"));
                h.setFin(rs.getString("fin"));
                datos.add(h);
            }
            conectar().close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return datos;
    }
    
    public List<Horario> domingo(){
        List<Horario> datos = new ArrayList<>();
        String sql = "SELECT * FROM sanitario s, horario h WHERE s.idMedico=h.sanitario_id AND dia_semana='domingo'";
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Horario h = new Horario();
                h.setNombre_sanitario(rs.getString("nombre"));
                h.setInicio(rs.getString("inicio"));
                h.setFin(rs.getString("fin"));
                datos.add(h);
            }
            conectar().close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return datos;
    }
    
    public List<Horario> listar(int offset, int numFilas){
        List<Horario> datos = new ArrayList<>();
        String sql = "SELECT SQL_CALC_FOUND_ROWS * FROM horario LIMIT " + offset + ", " + numFilas;
        try {
            st = conectar().createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Horario h = new Horario();
                h.setCodigo(rs.getInt("idHorario"));
                h.setSanitatio_id(rs.getInt("sanitario_id"));
                h.setDia(rs.getString("dia_semana"));
                h.setInicio(rs.getString("inicio"));
                h.setFin(rs.getString("fin"));
                datos.add(h);
            }
            rs = st.executeQuery("SELECT FOUND_ROWS()");
            if (rs.next()) {
                this.numFilas = rs.getInt(1);
            }
            System.out.println("Inprimiendo "+getNumFilas()+" registros de horarios");
            conectar().close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return datos;
    }
    
    //edit
    public boolean editarHorario(Horario h){
        boolean editado = false;
        String sql = "UPDATE horario SET dia_semana=?,inicio=?,fin=? WHERE idHorario=?";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, h.getDia());
            ps.setObject(2, h.getInicio());
            ps.setObject(3, h.getFin());
            ps.setObject(4, h.getCodigo());
            if(ps.executeUpdate()==1){
                editado = true;
                System.out.println("Horario modificado");
            }
        } catch (SQLException e) {
            System.out.println("Error al actualizar horario "+e.getMessage());
        }
        return editado;
    }
    
}
