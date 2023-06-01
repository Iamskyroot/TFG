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
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author Skyroot
 */
public class CitaDAO extends Conexion {
    
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    private int numeroFilas;

    public int getNumeroFilas() {
        return numeroFilas;
    }

    public void setNumeroFilas(int numeroFilas) {
        this.numeroFilas = numeroFilas;
    }
    
    
    public boolean registrarCita(String doc,String nom,String motivo,String serv,String notas, String fecha){
        
        String sql = "INSERT INTO citas(documento,nombre,motivo,servicio,notas,fecha_solicitud) VALUES(?,?,?,?,?,?)";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, doc);
            ps.setObject(2, nom);
            ps.setObject(3, motivo);
            ps.setObject(4, serv);
            ps.setObject(5, notas);
            ps.setObject(6, fecha);
            ps.execute();
            System.out.println("Datos de cita guardados con exito");
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al registrar datos de cita "+e.getMessage());
            return false;
        }
        
        return true;
    }
    
    
    //listar citas
    public List<Cita> listarCitasPaciente(String id){
        Cita cita = null;
        List<Cita> listaCitas = new ArrayList<>();
        String sql = "SELECT * FROM citas WHERE documento=?";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                cita = new Cita();
                cita.setCodigo(rs.getInt("idCita"));
                cita.setDocumento(rs.getString("documento"));
                cita.setNombre(rs.getString("nombre"));
                cita.setMotivo(rs.getString("motivo"));
                cita.setServicio(rs.getString("servicio"));
                cita.setNotas(rs.getString("notas"));
                cita.setEstado(rs.getString("estado"));
                cita.setFecha_solicitud(rs.getString("fecha_solicitud"));
                cita.setFecha_inicio(rs.getString("fecha_inicio"));
                cita.setFecha_fin(rs.getString("fecha_fin"));
                cita.setMedico(rs.getString("medico"));
                listaCitas.add(cita);
            }
            rs = ps.executeQuery("SELECT FOUND_ROWS()");
            if (rs.next()) {
                this.numeroFilas = rs.getInt(1);
            }
            System.out.println("Numero de registros en citas="+getNumeroFilas());
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al listar citas:\n"+e.getMessage());
        }
        
        return listaCitas;
    }
    
    public List<Cita> listarCitas(int offset,int numeroFilas){
        Cita cita = null;
        List<Cita> listaCitas = new ArrayList<>();
        String sql = "SELECT SQL_CALC_FOUND_ROWS * FROM citas LIMIT "+offset+", "+numeroFilas;
        try {
            ps = conectar().prepareStatement(sql);
            rs = ps.executeQuery();
            rs.afterLast();
            while (rs.previous()) {
                cita = new Cita();
                cita.setCodigo(rs.getInt("idCita"));
                cita.setDocumento(rs.getString("documento"));
                cita.setNombre(rs.getString("nombre"));
                cita.setMotivo(rs.getString("motivo"));
                cita.setServicio(rs.getString("servicio"));
                cita.setNotas(rs.getString("notas"));
                cita.setEstado(rs.getString("estado"));
                cita.setFecha_solicitud(rs.getString("fecha_solicitud"));
                cita.setFecha_inicio(rs.getString("fecha_inicio"));
                cita.setFecha_fin(rs.getString("fecha_fin"));
                cita.setMedico(rs.getString("medico"));
                listaCitas.add(cita);
            }
            rs = ps.executeQuery("SELECT FOUND_ROWS()");
            if (rs.next()) {
                this.numeroFilas = rs.getInt(1);
            }
            System.out.println("Numero de registros en citas="+getNumeroFilas());
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al listar citas:\n"+e.getMessage());
        }
        
        return listaCitas;
    }
    
    public JSONArray listarCitas2(){
        JSONObject object = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        
        String sql = "SELECT * FROM citas ";
        try {
            ps = conectar().prepareStatement(sql);
            rs = ps.executeQuery();
            rs.afterLast();
            while (rs.previous()) {
                object.put("id", rs.getInt("idCita"));
                object.put("nombre", rs.getString("nombre"));
                object.put("motivo", rs.getString("motivo"));
                object.put("servicio", rs.getString("servicio"));
                object.put("fecha_solicitud", rs.getString("fecha_solicitud"));
                object.put("fecha_inicio", rs.getString("fecha_inicio"));
                object.put("fecha_fin", rs.getString("fecha_fin"));
                object.put("medico", rs.getString("medico"));
                object.put("acc", "");
                jsonArray.add(object);
                
            }
            rs = ps.executeQuery("SELECT COUNT(idCita) FROM citas");
            if (rs.next()) {
                this.numeroFilas = rs.getInt(1);
            }
            System.out.println("Numero de registros en citas="+getNumeroFilas());
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al listar citas:\n"+e.getMessage());
        }
        
        return jsonArray;
    }
    
    public JSONArray listarCitasAgendadas(){
        JSONObject object = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        
        String sql = "SELECT * FROM citas WHERE estado='OK'";
        try {
            ps = conectar().prepareStatement(sql);
            rs = ps.executeQuery();
            rs.afterLast();
            while (rs.previous()) {
                object.put("id", rs.getInt("idCita"));
                object.put("nombre", rs.getString("nombre"));
                object.put("motivo", rs.getString("motivo"));
                object.put("servicio", rs.getString("servicio"));
                object.put("fecha_solicitud", rs.getString("fecha_solicitud"));
                object.put("fecha_inicio", rs.getString("fecha_inicio"));
                object.put("fecha_fin", rs.getString("fecha_fin"));
                object.put("medico", rs.getString("medico"));
                object.put("acc", "");
                jsonArray.add(object);
                
            }
            rs = ps.executeQuery("SELECT COUNT(idCita) FROM citas");
            if (rs.next()) {
                this.numeroFilas = rs.getInt(1);
            }
            System.out.println("Numero de registros en citas="+getNumeroFilas());
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al listar citas:\n"+e.getMessage());
        }
        
        return jsonArray;
    }
    
    public JSONArray listarCitasNoAgendadas(){
        JSONObject object = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        
        String sql = "SELECT * FROM citas WHERE fecha_inicio='No asignado'";
        try {
            ps = conectar().prepareStatement(sql);
            rs = ps.executeQuery();
            rs.afterLast();
            while (rs.previous()) {
                object.put("id", rs.getInt("idCita"));
                object.put("nombre", rs.getString("nombre"));
                object.put("motivo", rs.getString("motivo"));
                object.put("servicio", rs.getString("servicio"));
                object.put("fecha_solicitud", rs.getString("fecha_solicitud"));
                object.put("fecha_inicio", rs.getString("fecha_inicio"));
                object.put("fecha_fin", rs.getString("fecha_fin"));
                object.put("medico", rs.getString("medico"));
                object.put("acc", "");
                jsonArray.add(object);
                
            }
            rs = ps.executeQuery("SELECT COUNT(idCita) FROM citas");
            if (rs.next()) {
                this.numeroFilas = rs.getInt(1);
            }
            System.out.println("Numero de registros en citas="+getNumeroFilas());
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al listar citas:\n"+e.getMessage());
        }
        
        return jsonArray;
    }
    
    public Cita getSolicitud(String id){
        Cita c = new Cita();
        String sql = "SELECT * FROM citas WHERE idCita=?";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                c.setCodigo(rs.getInt("idCita"));
                c.setNombre(rs.getString("nombre"));
//                c.setDocumento(rs.getString(3));
                c.setMotivo(rs.getString("motivo"));
                c.setServicio(rs.getString("servicio"));
                c.setNotas(rs.getString("notas"));
            }
            System.out.println("Imprimiendo datos de solicitud ID="+id);
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al buscar solicitud "+e.getMessage());
        }
        return c;
    }
    
    public boolean agendarSolicitud(Cita c){
        
        String sql = "UPDATE citas SET fecha_inicio=?,fecha_fin=?,estado=?,medico=? WHERE idCita=?";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, c.getFecha_inicio());
            ps.setObject(2, c.getFecha_fin());
            ps.setObject(3, c.getEstado());
            ps.setObject(4, c.getMedico());
            ps.setObject(5, c.getCodigo());
            ps.execute();
            System.out.println("Solicitud agendada con exito");
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al agendar solicitud "+e.getMessage());
            return false;
        }
        
        return true;
    }
    
    
    
}
