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
public class TratamientoPaciente {
    
    private int id;
    private int tratamiento_id;
    private int paciente_id;
    private int consulta_id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTratamiento_id() {
        return tratamiento_id;
    }

    public void setTratamiento_id(int tratamiento_id) {
        this.tratamiento_id = tratamiento_id;
    }

    public int getPaciente_id() {
        return paciente_id;
    }

    public void setPaciente_id(int paciente_id) {
        this.paciente_id = paciente_id;
    }

    public int getConsulta_id() {
        return consulta_id;
    }

    public void setConsulta_id(int consulta_id) {
        this.consulta_id = consulta_id;
    }

    public TratamientoPaciente() {
    }

    public TratamientoPaciente(int id, int tratamiento_id, int paciente_id, int consulta_id) {
        this.id = id;
        this.tratamiento_id = tratamiento_id;
        this.paciente_id = paciente_id;
        this.consulta_id = consulta_id;
    }
    
    
    
}
