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
public class Usuario {
    
    private String nombre;
    private String usuario;
    private String contrasena;
//    private int tipo_usuario;
//    private int cod_registro;
//    private String especialidad;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

//    public int getTipo_usuario() {
//        return tipo_usuario;
//    }
//
//    public void setTipo_usuario(int tipo_usuario) {
//        this.tipo_usuario = tipo_usuario;
//    }
//
//    public int getCod_registro() {
//        return cod_registro;
//    }
//
//    public void setCod_registro(int cod_registro) {
//        this.cod_registro = cod_registro;
//    }

//    public String getEspecialidad() {
//        return especialidad;
//    }
//
//    public void setEspecialidad(String especialidad) {
//        this.especialidad = especialidad;
//    }

    public Usuario() {
    }

    public Usuario(String nombre, String usuario, String contrasena) {
        this.nombre = nombre;
        this.usuario = usuario;
        this.contrasena = contrasena;
        
    }
    
}
