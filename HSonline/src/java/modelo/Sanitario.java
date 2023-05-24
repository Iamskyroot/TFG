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
public class Sanitario {
    
    private int codigo;
    private String nombre;
    private String sexo;
    private String nacion;
    private String documento;
    private String especialidad;
    private String direccion;
    private String telefono;
    private String email;
    private String usuario;
    private String contrasena;

    public Sanitario() {
    }

    public Sanitario(int codigo, String nombre, String sexo, String nacion, String documento, String especialidad, String direccion, String telefono, String email, String usuario, String contrasena) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.sexo = sexo;
        this.nacion = nacion;
        this.documento = documento;
        this.especialidad = especialidad;
        this.direccion = direccion;
        this.telefono = telefono;
        this.email = email;
        this.usuario = usuario;
        this.contrasena = contrasena;
    }


    public Sanitario(String nombre, String sexo, String nacion, String documento, String especialidad, String direccion, String telefono, String email, String usuario, String contrasena) {
        this.nombre = nombre;
        this.sexo = sexo;
        this.nacion = nacion;
        this.documento = documento;
        this.especialidad = especialidad;
        this.direccion = direccion;
        this.telefono = telefono;
        this.email = email;
        this.usuario = usuario;
        this.contrasena = contrasena;
    }
    
    
    

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

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getNacion() {
        return nacion;
    }

    public void setNacion(String nacion) {
        this.nacion = nacion;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
    
    

    @Override
    public String toString() {
        return "Sanitario{" + "codigo=" + codigo + ", nombre=" + nombre + ", sexo=" + sexo + ", nacion=" + nacion + ", documento=" + documento + ", direccion=" + direccion + ", telefono=" + telefono + ", email=" + email + '}';
    }
    
    
}
