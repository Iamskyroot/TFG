/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import config.Conexion;

/**
 *
 * @author Skyroot
 */
public class Consulta extends Conexion{
    
    private int codigo;
    private int paciente_id;
    private String motivo;
    private double altura;
    private double peso;
    private double temperatura;
    private String sintomas;
    private String notas;
    private String pruebas;
    private String dianosticos;
    private String fecha_consulta;
    private int medico_id;

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }
    

    public String getNotas() {
        return notas;
    }

    public void setNotas(String notas) {
        this.notas = notas;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }


    public String getPruebas() {
        return pruebas;
    }

    public void setPruebas(String pruebas) {
        this.pruebas = pruebas;
    }


    public int getPaciente_id() {
        return paciente_id;
    }

    public void setPaciente_id(int paciente_id) {
        this.paciente_id = paciente_id;
    }

    public String getSintomas() {
        return sintomas;
    }

    public void setSintomas(String sintomas) {
        this.sintomas = sintomas;
    }

    public String getDianosticos() {
        return dianosticos;
    }

    public void setDianosticos(String dianosticos) {
        this.dianosticos = dianosticos;
    }
    

    public int getMedico_id() {
        return medico_id;
    }

    public void setMedico_id(int medico_id) {
        this.medico_id = medico_id;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public double getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(double temperatura) {
        this.temperatura = temperatura;
    }

    public String getFecha_consulta() {
        return fecha_consulta;
    }

    public void setFecha_consulta(String fecha_consulta) {
        this.fecha_consulta = fecha_consulta;
    }
    
    
    
    public Consulta() {
    }

    public Consulta(int codigo, int paciente_id, String motivo, double altura, double peso, double temperatura, String sintomas, String notas, String pruebas, String dianosticos, String fecha_consulta, int medico_id) {
        this.codigo = codigo;
        this.paciente_id = paciente_id;
        this.motivo = motivo;
        this.altura = altura;
        this.peso = peso;
        this.temperatura = temperatura;
        this.sintomas = sintomas;
        this.notas = notas;
        this.pruebas = pruebas;
        this.dianosticos = dianosticos;
        this.fecha_consulta = fecha_consulta;
        this.medico_id = medico_id;
    }


    public Consulta(int paciente_id, String motivo, double altura, double peso, double temperatura, String sintomas, String notas, String pruebas, String dianosticos, String fecha_consulta, int medico_id) {
        this.paciente_id = paciente_id;
        this.motivo = motivo;
        this.altura = altura;
        this.peso = peso;
        this.temperatura = temperatura;
        this.sintomas = sintomas;
        this.notas = notas;
        this.pruebas = pruebas;
        this.dianosticos = dianosticos;
        this.fecha_consulta = fecha_consulta;
        this.medico_id = medico_id;
    }

    

   
    
    
}
