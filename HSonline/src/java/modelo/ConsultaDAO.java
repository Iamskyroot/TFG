/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import config.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Skyroot
 */
public class ConsultaDAO extends Conexion {

    PreparedStatement ps = null;
    ResultSet rs = null;

    private int codigo_consulta;

    public int getCodigo_consulta() {
        return codigo_consulta;
    }

    public void setCodigo_consulta(int codigo_consulta) {
        this.codigo_consulta = codigo_consulta;
    }

    private int numeroFilas;

    public int getNumeroFilas() {
        return numeroFilas;
    }

    public void setNumeroFilas(int numeroFilas) {
        this.numeroFilas = numeroFilas;
    }

    private String prueba_ordenada;

    public String getPrueba_ordenada() {
        return prueba_ordenada;
    }

    public void setPrueba_ordenada(String prueba_ordenada) {
        this.prueba_ordenada = prueba_ordenada;
    }

    //guardar paciente
    public boolean guardarDatosConsulta(Consulta c, String codPaciente) {

        String sql = "INSERT INTO consulta(paciente_id,motivo,altura,peso,temperatura,sintomas,notas,pruebas,dianostico,medico_id,fecha_consulta) "
                + "VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, codPaciente);
            ps.setObject(2, c.getMotivo());
            ps.setObject(3, c.getAltura());
            ps.setObject(4, c.getPeso());
            ps.setObject(5, c.getTemperatura());
            ps.setObject(6, c.getSintomas());
            ps.setObject(7, c.getNotas());
            ps.setObject(8, c.getPruebas());
            ps.setObject(9, c.getDianosticos());
            ps.setObject(10, c.getMedico_id());
            ps.setObject(11, c.getFecha_consulta());
            ps.executeUpdate();
//            System.out.println("IdP="+codPaciente);
        } catch (SQLException e) {
            System.out.println("Error al guardar consulta:\n" + e.getMessage());
            return false;
        }

        return true;
    }

    //actualizar consulta
    public boolean actualizarConsulta(Consulta c) {

        String sql = "UPDATE consulta SET motivo=?,altura=?, peso=?,temperatura=?,notas=?,sintomas=?,pruebas=?,dianostico=?,fecha_consulta=?,medico_id=? WHERE idConsulta=?";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, c.getMotivo());
            ps.setObject(2, c.getAltura());
            ps.setObject(3, c.getPeso());
            ps.setObject(4, c.getTemperatura());
            ps.setObject(5, c.getNotas());
            ps.setObject(6, c.getSintomas());
            ps.setObject(7, c.getPruebas());
            ps.setObject(8, c.getDianosticos());
            ps.setObject(9, c.getFecha_consulta());
            ps.setObject(10, c.getMedico_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al actualizar consulta:\n" + e.getMessage());
        }
        return true;
    }
    //eliminar consulta

    public boolean eliminarConsulta(int codigo) {
        String sql = "DELETE FROM consulta WHERE idConsulta=?";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, codigo);

            ps.executeUpdate();
            System.out.println("Consulta " + codigo + " eliminada");
        } catch (SQLException e) {
            System.out.println("Error al eliminar consulta:\n" + e.getMessage());
            return false;
        }
        return true;
    }

    //buscar y obtener valores de consulta recien insertada
    public Consulta obtenerUltimaConsulta() {
        Consulta c = new Consulta();

        String sql = "SELECT * FROM consulta";
        try {
            ps = conectar().prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.last()) {
                setCodigo_consulta(rs.getInt("idConsulta"));
                c.setPaciente_id(rs.getInt("paciente_id"));
                c.setAltura(rs.getDouble("altura"));
                c.setTemperatura(rs.getDouble("temperatura"));
                c.setPeso(rs.getDouble("peso"));
                c.setNotas(rs.getString("notas"));
                c.setPruebas(rs.getString("pruebas"));
                c.setSintomas(rs.getString("sintomas"));
                c.setDianosticos(rs.getString("dianostico"));
                c.setFecha_consulta(rs.getString("fecha_consulta"));
                c.setMedico_id(rs.getInt("medico_id"));
            }
            return c;
        } catch (SQLException e) {
            System.out.println("Error al buscar paciente:\n" + e.getMessage());
            return null;
        }

    }
    
    //cambiar estado de la consulta
    public boolean cabiarEstado(int id,String estado){
        String sql = "UPDATE consulta SET estado=? WHERE idConsulta=?";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, estado);
            ps.setObject(2, id);
            ps.execute();
            System.out.println("Estado de la consulta "+id+" cambiado");
        } catch (SQLException e) {
            System.out.println("Error al cambiar estado "+e.getMessage());
        }
        return true;
    }

    //listar consulta
    public List<Consulta> listarConsultas(int offset, int numeroFilas) {

        List<Consulta> lista = new ArrayList<>();
        String sql = "SELECT SQL_CALC_FOUND_ROWS * FROM consulta WHERE estado IS NULL LIMIT " + offset + ", " + numeroFilas;
        try {
            ps = conectar().prepareStatement(sql);
            rs = ps.executeQuery();
            rs.afterLast();
            while (rs.previous()) {
                Consulta c = new Consulta(
                        rs.getInt("idConsulta"),
                        rs.getInt("paciente_id"),
                        rs.getString("motivo"),
                        rs.getDouble("altura"),
                        rs.getDouble("peso"),
                        rs.getDouble("temperatura"),
                        rs.getString("sintomas"),
                        rs.getString("notas"),
                        rs.getString("pruebas"),
                        rs.getString("dianostico"),
                        rs.getString("fecha_consulta"),
                        rs.getInt("medico_id")
                );

                lista.add(c);

            }

            rs = ps.executeQuery("SELECT FOUND_ROWS()");
            if (rs.next()) {
                this.numeroFilas = rs.getInt(1);
            }
            System.out.println("Inprimiendo consultas");

        } catch (SQLException e) {
            System.out.println("Error al listar consultas:\n" + e.getMessage());
        }

        return lista;
    }
    
    public List<Consulta> listarConsultasPaciente(int offset, int numeroFilas, String id) {

        List<Consulta> lista = new ArrayList<>();
        String sql = "SELECT SQL_CALC_FOUND_ROWS * FROM consulta WHERE paciente_id=? LIMIT " + offset + ", " + numeroFilas;
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, id);
            rs = ps.executeQuery();
            rs.afterLast();
            while (rs.previous()) {
                Consulta c = new Consulta(
                        rs.getInt("idConsulta"),
                        rs.getInt("paciente_id"),
                        rs.getString("motivo"),
                        rs.getDouble("altura"),
                        rs.getDouble("peso"),
                        rs.getDouble("temperatura"),
                        rs.getString("sintomas"),
                        rs.getString("notas"),
                        rs.getString("pruebas"),
                        rs.getString("dianostico"),
                        rs.getString("fecha_consulta"),
                        rs.getInt("medico_id")
                );

                lista.add(c);

            }

            rs = ps.executeQuery("SELECT FOUND_ROWS()");
            if (rs.next()) {
                this.numeroFilas = rs.getInt(1);
            }
            System.out.println("Inprimiendo consultas");

        } catch (SQLException e) {
            System.out.println("Error al listar consultas:\n" + e.getMessage());
        }

        return lista;
    }

    //obtener pruebas ordenadas
    public List<PruebasPaciente> listarPruebasOrdenadas(String codigo) {

        List<PruebasPaciente> lista = new ArrayList<>();
        String sql = "SELECT * FROM pruebas_paciente WHERE consulta_id=?";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, codigo);
            rs = ps.executeQuery();
            while (rs.next()) {
                PruebasPaciente pruebas = new PruebasPaciente(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getDate(5)
                );

                lista.add(pruebas);

            }

            System.out.println("Inprimiendo pruebas ordenadas");

        } catch (SQLException e) {
            System.out.println("Error al listar pruebas:\n" + e.getMessage());
        }

        return lista;
    }
    
    //listar tratamientos
    public List<Tratamiento> listarTratamientos() {

        List<Tratamiento> lista = new ArrayList<>();
        String sql = "SELECT DISTINCT * FROM tratamiento t, prescripciones p WHERE t.idTratamiento=p.tratamiento_id";
        try {
            ps = conectar().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Tratamiento trata = new Tratamiento();
                trata.setCodigo_tratamiento(rs.getInt("idTratamiento"));
                trata.setEnfermedad(rs.getString("enfermedad"));
                trata.setCategoria(rs.getString("categoria"));
                lista.add(trata);

            }

            System.out.println("Inprimiendo tratamientos");

        } catch (SQLException e) {
            System.out.println("Error al listar tratamientos:\n" + e.getMessage());
        }

        return lista;
    }

    //buscar si existe consulta
    public Consulta existeConsulta(int id) {
        Consulta consulta = new Consulta();

        String sql = "SELECT COUNT(id) FROM consulta WHERE idConsulta=?";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, id);
            rs = ps.executeQuery();
            return consulta;
        } catch (SQLException e) {
            System.out.println("Error al buscar paciente:\n" + e.getMessage());
            return null;
        }

    }

    //actualizar consulta
    public boolean actualizarConsulta(String dianostico, String fecha, int medico, String codigo) {
        String sql = "UPDATE consulta SET dianostico=?,fecha_dianostico=?,medico_id=? WHERE idConsulta=?";
        try {
            ps = conectar().prepareStatement(sql);

            ps.setObject(1, dianostico);
            ps.setObject(2, fecha);
            ps.setObject(3, medico);
            ps.setObject(4, codigo);
            ps.executeUpdate();
            System.out.println("Actualizacion de consulta con exito");

        } catch (SQLException e) {
            System.out.println("Error al actualizar consulta:\n" + e.getMessage());
        }
        return true;
    }


    public int registrarPruebas(int consultaId, String prueba, int paciente) {

        String sql = "INSERT INTO pruebas_paciente(paciente_id,enfermedad,consulta_id) VALUES(?,?,?)";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, paciente);
            ps.setObject(2, prueba);
            ps.setObject(3, consultaId);
            ps.executeUpdate();

            System.out.println(" pruebas asignadas con exito");
        } catch (SQLException e) {
            System.out.println("Error al insertar pruebas " + e.getMessage());
            return 0;
        }

        return 1;
    }
    
    public boolean registrarTratamiento(int idConsulta, int idPaciente, int idTrata){
        
        String sql = "INSERT INTO tratamiento_paciente(tratamiento_id,paciente_id,consulta_id) VALUES(?,?,?)";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, idTrata);
            ps.setObject(2, idPaciente);
            ps.setObject(3, idConsulta);
            ps.executeUpdate();
            System.out.println("Tratamiento registrado");
        } catch (SQLException e) {
            System.out.println("Error al registrar tratamiento "+e.getMessage());
            return false;
        }
        
        return true;
    }

}
