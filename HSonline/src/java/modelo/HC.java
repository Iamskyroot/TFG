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
public class HC extends Conexion {
    
    private int codigo;
    private int paciente_id;
    private int consulta_id;
    private int medico_id;
    private String nombre_hc;
    private String fecha;
    
    private int numeroFilas;

    public int getNumeroFilas() {
        return numeroFilas;
    }

    public void setNumeroFilas(int numeroFilas) {
        this.numeroFilas = numeroFilas;
    }

    public int getPaciente_id() {
        return paciente_id;
    }

    public void setPaciente_id(int paciente_id) {
        this.paciente_id = paciente_id;
    }
    

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getConsulta_id() {
        return consulta_id;
    }

    public void setConsulta_id(int consulta_id) {
        this.consulta_id = consulta_id;
    }

    public int getMedico_id() {
        return medico_id;
    }

    public void setMedico_id(int medico_id) {
        this.medico_id = medico_id;
    }

    public String getNombre_hc() {
        return nombre_hc;
    }

    public void setNombre_hc(String nombre_hc) {
        this.nombre_hc = nombre_hc;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    
    
    private PreparedStatement ps =null;
    private ResultSet rs =null;
    
    
    //archiva consulta
    public int archivarConsulta(int consulta,int paciente,int medico) {
        String sql = "INSERT INTO hc(paciente_id,consulta_id,medico_id) VALUES(?,?,?)";
        try {
            ps = conectar().prepareStatement(sql);
            
                ps.setObject(1, consulta);
                ps.setObject(2, paciente);
                ps.setObject(3, medico);
                ps.executeUpdate();

            System.out.println("una o varias consultas archivadas");
        } catch (SQLException e) {
            System.out.println("Error al archivar consulta:\n" + e.getMessage());
            return 0;
        }
        return 1;
    }
    
    public List<HC> listarHC(int offset, int numeroFilas) {

        List<HC> lista = new ArrayList<>();
        String sql = "SELECT SQL_CALC_FOUND_ROWS * FROM hc LIMIT " + offset + ", " + numeroFilas;
        try {
            ps = conectar().prepareStatement(sql);
            rs = ps.executeQuery();
            rs.afterLast();
            while (rs.previous()) {
                HC hc = new HC();
                hc.setCodigo(rs.getInt(1));
                hc.setPaciente_id(rs.getInt(2));
                hc.setConsulta_id(rs.getInt(3));
                hc.setMedico_id(rs.getInt(4));
                hc.setNombre_hc(String.valueOf("H"+rs.getInt(2)+rs.getInt(3)));
                hc.setFecha(rs.getString(5));
                
                lista.add(hc);

            }

            rs = ps.executeQuery("SELECT FOUND_ROWS()");
            if (rs.next()) {
                this.numeroFilas = rs.getInt(1);
            }
            System.out.println("Inprimiendo historias clinicas");

        } catch (SQLException e) {
            System.out.println("Error al listar historias clinicas:\n" + e.getMessage());
        }

        return lista;
    }
    
}
