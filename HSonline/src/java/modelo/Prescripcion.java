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
public class Prescripcion {
    
    private String medicamento;
    private String cantidad;
    private String dosis;
    private String frecuencia;
    private int tratamiento_id;

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

    public int getTratamiento_id() {
        return tratamiento_id;
    }

    public void setTratamiento_id(int tratamiento_id) {
        this.tratamiento_id = tratamiento_id;
    }

    public Prescripcion(String medicamento, String cantidad, String dosis, String frecuencia, int tratamiento_id) {
        this.medicamento = medicamento;
        this.cantidad = cantidad;
        this.dosis = dosis;
        this.frecuencia = frecuencia;
        this.tratamiento_id = tratamiento_id;
    }

    

    public Prescripcion() {
    }
    
    
}
