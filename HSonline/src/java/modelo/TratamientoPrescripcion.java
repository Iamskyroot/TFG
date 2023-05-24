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
public class TratamientoPrescripcion {
    private int codigo;
    private String enfermedad;
    private String categoria;
    private String medicamento;
    private String cantidad;
    private String dosis;
    private String frecuencia;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
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

    public void setCategoria(String categoria) {
        this.categoria = categoria;
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

    public TratamientoPrescripcion(int codigo, String enfermedad, String categoria, String medicamento, String cantidad, String dosis, String frecuencia) {
        this.codigo = codigo;
        this.enfermedad = enfermedad;
        this.categoria = categoria;
        this.medicamento = medicamento;
        this.cantidad = cantidad;
        this.dosis = dosis;
        this.frecuencia = frecuencia;
    }

    public TratamientoPrescripcion() {
    }

    

    
    
}
