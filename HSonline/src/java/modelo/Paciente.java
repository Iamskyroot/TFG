/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Skyroot
 */
public class Paciente extends Conexion {
    
    private int codigo;
    private String nombre;
    private int edad;
    private String sexo;
    private String documento;
    private String direccion;
    private String telefono;
    private String usuario;
    private String contrasena;


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

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
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
    
    public Paciente() {
    }

    

    public Paciente(String nombre, int edad, String sexo, String documento, String direccion, String telefono) {
        this.nombre = nombre;
        this.edad = edad;
        this.sexo = sexo;
        this.documento = documento;
        this.direccion = direccion;
        this.telefono = telefono;
    }

    public Paciente(String nombre, int edad, String sexo, String documento, String direccion, String telefono, String usuario, String contrasena) {
        this.nombre = nombre;
        this.edad = edad;
        this.sexo = sexo;
        this.documento = documento;
        this.direccion = direccion;
        this.telefono = telefono;
        this.usuario = usuario;
        this.contrasena = contrasena;
    }

    public Paciente(int codigo, String nombre, int edad, String sexo, String documento, String direccion, String telefono, String usuario, String contrasena) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.edad = edad;
        this.sexo = sexo;
        this.documento = documento;
        this.direccion = direccion;
        this.telefono = telefono;
        this.usuario = usuario;
        this.contrasena = contrasena;
    }
    
    

    @Override
    public String toString() {
        return "Paciente{" + "codigo=" + codigo + ", nombre=" + nombre + ", edad=" + edad + ", sexo=" + sexo + ", documento=" + documento + ", direccion=" + direccion + ", telefono=" + telefono + '}';
    }

    
}
