/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Skyroot
 */
public class Tratamiento {
    
    private int codigo_tratamiento;
    private String enfermedad;
    private String categoria;
    private String medicamento;
    private String cantidad;
    private String dosis;
    private String frecuencia;
    private int medico_id;

    public int getCodigo_tratamiento() {
        return codigo_tratamiento;
    }

    public void setCodigo_tratamiento(int codigo_tratamiento) {
        this.codigo_tratamiento = codigo_tratamiento;
    }
    
    
     public String getEnfermedad() {
        return enfermedad;
    }

    public void setEnfermedad(String enfermedad) {
        this.enfermedad = enfermedad;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categotia) {
        this.categoria = categotia;
    }

    public String getMedicamento() {
        return medicamento;
    }

    public void setMedicamento(String medicamento) {
        this.medicamento = medicamento;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getDosis() {
        return dosis;
    }

    public void setDosis(String dosis) {
        this.dosis = dosis;
    }

    public String getFrecuencia() {
        return frecuencia;
    }

    public void setFrecuencia(String frecuencia) {
        this.frecuencia = frecuencia;
    }


    public int getMedico_id() {
        return medico_id;
    }

    public void setMedico_id(int medico_id) {
        this.medico_id = medico_id;
    }

    public Tratamiento(int codigo_tratamiento, String enfermedad, String categoria, String medicamento, String cantidad, String dosis, String frecuencia, int medico_id) {
        this.codigo_tratamiento = codigo_tratamiento;
        this.enfermedad = enfermedad;
        this.categoria = categoria;
        this.medicamento = medicamento;
        this.cantidad = cantidad;
        this.dosis = dosis;
        this.frecuencia = frecuencia;
        this.medico_id = medico_id;
    }

    public Tratamiento() {
    }
    
    
}
