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
public class Cita {
    
    private int codigo;
    private String nombre;
    private String documento;
    private String motivo;
    private String servicio;
    private String notas;
    private String estado;
    private String fecha_solicitud;
    private String fecha_inicio;
    private String fecha_fin;
    private String medico;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMotivo() {
        return motivo;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }
    

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getServicio() {
        return servicio;
    }

    public void setServicio(String servicio) {
        this.servicio = servicio;
    }

    public String getNotas() {
        return notas;
    }

    public void setNotas(String notas) {
        this.notas = notas;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getFecha_solicitud() {
        return fecha_solicitud;
    }

    public void setFecha_solicitud(String fecha_solicitud) {
        this.fecha_solicitud = fecha_solicitud;
    }

    public String getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(String fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }
    public String getFecha_fin() {
        return fecha_fin;
    }

    public void setFecha_fin(String fecha_fin) {
        this.fecha_fin = fecha_fin;
    }

    public String getMedico() {
        return medico;
    }

    public void setMedico(String medico) {
        this.medico = medico;
    }

    public Cita(int codigo, String nombre, String documento, String motivo, String servicio, String notas, String estado, String fecha_solicitud, String fecha_inicio, String fecha_fin, String medico) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.documento = documento;
        this.motivo = motivo;
        this.servicio = servicio;
        this.notas = notas;
        this.estado = estado;
        this.fecha_solicitud = fecha_solicitud;
        this.fecha_inicio = fecha_inicio;
        this.fecha_fin = fecha_fin;
        this.medico = medico;
    }


    public Cita() {
    }
    
    
    
}
