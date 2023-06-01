/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import config.Conexion;
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
    private ResultSet rs = null;
    
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
    
}
