/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Date;

/**
 *
 * @author Skyroot
 */
public class DianosticoPaciente {
    
    private int id;
    private String enfermedad;
    private int consulta_id;
    private Date fecha;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEnfermedad() {
        return enfermedad;
    }

    public void setEnfermedad(String enfermedad) {
        this.enfermedad = enfermedad;
    }

    public int getConsulta_id() {
        return consulta_id;
    }

    public void setConsulta_id(int consulta_id) {
        this.consulta_id = consulta_id;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public DianosticoPaciente() {
    }

    public DianosticoPaciente(int id, String enfermedad, int consulta_id, Date fecha) {
        this.id = id;
        this.enfermedad = enfermedad;
        this.consulta_id = consulta_id;
        this.fecha = fecha;
    }
    
    
    
}
