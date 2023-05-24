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
public class Horario {
    private int codigo;
    private int sanitatio_id;
    private String dia;
    private String inicio;
    private String fin;
    private String etiquera;
    private String nombre_sanitario;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getSanitatio_id() {
        return sanitatio_id;
    }

    public void setSanitatio_id(int sanitatio_id) {
        this.sanitatio_id = sanitatio_id;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public String getInicio() {
        return inicio;
    }

    public void setInicio(String inicio) {
        this.inicio = inicio;
    }

    public String getFin() {
        return fin;
    }

    public void setFin(String fin) {
        this.fin = fin;
    }

    public String getEtiquera() {
        return etiquera;
    }

    public void setEtiquera(String etiquera) {
        this.etiquera = etiquera;
    }

    public String getNombre_sanitario() {
        return nombre_sanitario;
    }

    public void setNombre_sanitario(String nombre_sanitario) {
        this.nombre_sanitario = nombre_sanitario;
    }

    public Horario() {
    }
    

    public Horario(int codigo, int sanitatio_id, String dia, String inicio, String fin, String etiquera, String nombre_sanitario) {
        this.codigo = codigo;
        this.sanitatio_id = sanitatio_id;
        this.dia = dia;
        this.inicio = inicio;
        this.fin = fin;
        this.etiquera = etiquera;
        this.nombre_sanitario = nombre_sanitario;
    }
    
    
    
}
