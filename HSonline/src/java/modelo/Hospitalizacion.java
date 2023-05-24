
package modelo;

import config.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Skyroot
 */
public class Hospitalizacion  {
    
    private int codigo;
    private int paciente_id;
    private String nombre;
    private String sala;
    private int habitacion;
    private int cama;
    private String estado;
    private String fecha_ingreso;
    private String fecha_alta;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getPaciente_id() {
        return paciente_id;
    }

    public void setPaciente_id(int paciente_id) {
        this.paciente_id = paciente_id;
    }


    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    

    public String getSala() {
        return sala;
    }

    public void setSala(String sala) {
        this.sala = sala;
    }

    public int getHabitacion() {
        return habitacion;
    }

    public void setHabitacion(int habitacion) {
        this.habitacion = habitacion;
    }

    public int getCama() {
        return cama;
    }

    public void setCama(int cama) {
        this.cama = cama;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(String fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }

    public String getFecha_alta() {
        return fecha_alta;
    }

    public void setFecha_alta(String fecha_alta) {
        this.fecha_alta = fecha_alta;
    }
    
    public Hospitalizacion(){}

    public Hospitalizacion(int codigo, int paciente_id, String nombre, String sala, int habitacion, int cama, String estado, String fecha_ingreso, String fecha_alta) {
        this.codigo = codigo;
        this.paciente_id = paciente_id;
        this.nombre = nombre;
        this.sala = sala;
        this.habitacion = habitacion;
        this.cama = cama;
        this.estado = estado;
        this.fecha_ingreso = fecha_ingreso;
        this.fecha_alta = fecha_alta;
    }

    
    
    
    
}
