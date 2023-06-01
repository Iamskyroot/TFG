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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Skyroot
 */
public class PacienteConsultaDAO extends Conexion {

    PreparedStatement ps = null;
    ResultSet rs = null;
    Paciente p = new Paciente();
    Consulta c = new Consulta();

    public List<Object> datosPacienteConsulta(int codPaciente, int codConsulta) {
        List<Object> datos = new ArrayList<Object>();
        String sql = "SELECT * FROM paciente p,consulta c WHERE (p.idPaciente=? AND c.paciente_id=?) AND idConsulta=?";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setInt(1, codPaciente);
            ps.setInt(2, codPaciente);
            ps.setInt(3, codConsulta);
            rs = ps.executeQuery();
            while (rs.next()) {
                //enviando datos a la entidad paciente
                p.setCodigo(rs.getInt("idPaciente"));
                p.setNombre(rs.getString("nombre"));
                p.setEdad(rs.getInt("edad"));
                p.setDocumento(rs.getString("documento"));
                p.setDireccion(rs.getString("direccion"));
                p.setSexo(rs.getString("sexo"));
                p.setTelefono(rs.getString("telefono"));
                //enviando datos a la entidad consulta
                c.setCodigo(rs.getInt("idConsulta"));
                c.setPaciente_id(rs.getInt("paciente_id"));
                c.setMotivo(rs.getString("motivo"));
                c.setAltura(rs.getDouble("altura"));
                c.setPeso(rs.getDouble("peso"));
                c.setTemperatura(rs.getDouble("temperatura"));
                c.setSintomas(rs.getString("sintomas"));
                c.setNotas(rs.getString("notas"));
                c.setPruebas(rs.getString("pruebas"));
                c.setDianosticos(rs.getString("dianostico"));
                c.setMedico_id(rs.getInt("medico_id"));
                c.setFecha_consulta(rs.getString("fecha_consulta"));

                datos.add(p);
                datos.add(c);

            }
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al listar paciente:\n" + e.getMessage());
        }
        return datos;
    }

    //actualizar consulta
    public boolean actualizarConsulta(String pruebas, String dianostico, String tratamiento, String fecha, int medico, String codigo) {
        String sql = "UPDATE consulta SET dianostico=?,tratamiento=?,fecha_consulta=?,medico_id=? WHERE idConsulta=?";
        try {
            ps = conectar().prepareStatement(sql);
            
            ps.setObject(1, dianostico);
            ps.setObject(2, tratamiento);
            ps.setObject(3, fecha);
            ps.setObject(4, medico);
            ps.setObject(5, codigo);
            ps.executeUpdate();
            System.out.println("Actualizacion de consulta con exito");
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al actualizar consulta:\n" + e.getMessage());
        }
        return true;
    }

    //actualizar paciente
//    public boolean actualizarPaciente(String nombre, int edad, String sexo, String direccion, String documento, String telefono, String codigo) {
//        String sql = "UPDATE paciente SET nombre=?,edad=?,sexo=?,documento=?,direccion=?,telefono=? WHERE idConsulta=?";
//        try {
//            ps = conectar().prepareStatement(sql);
//            ps.setObject(1, nombre);
//            ps.setObject(2, edad);
//            ps.setObject(3, sexo);
//            ps.setObject(4, documento);
//            ps.setObject(5, direccion);
//            ps.setObject(6, telefono);
//            ps.setObject(7, codigo);
//            ps.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println("Error al actualizar paciente:\n" + e.getMessage());
//        }
//        return true;
//    }

    //buscar consulta por nombre o codigo
//    public List<Consulta> buscarPacienteConsulta(String campo) {
//        List<Consulta> datos = new ArrayList<>();
//        String sql = "SELECT DISTINCT * FROM consulta c WHERE c.idConsulta='" + campo + "' OR c.paciente_id='" + campo + "'";
//        try {
//            Statement st = conectar().createStatement();
//            rs = st.executeQuery(sql);
//            while (rs.next()) {
//
//                //enviando datos a la entidad consulta
//                Consulta consulta = new Consulta(
//                        rs.getInt("idConsulta"),
//                        rs.getInt("paciente_id"),
//                        rs.getString("motivo"),
//                        rs.getDouble("altura"),
//                        rs.getString("peso"),
//                        rs.getString("temperatura"),
//                        rs.getString("sintomas"),
//                        rs.getString("notas"),
//                        rs.getString("pruebas"),
//                        rs.getString("dianostico"),
//                        rs.getString("tratamiento"),
//                        rs.getString("fecha_consulta"),
//                        rs.getInt("medico_id")
//                        );
//
//                datos.add(consulta);
//            }
//            for (Object dato : datos) {
//                System.out.println(dato.toString());
//            }
//        } catch (SQLException e) {
//            System.out.println("Error al buscar consulta:\n" + e.getMessage());
//        }
//        return datos;
//    }
    
//    public Sanitario getSanitario(String codigo){
//        Sanitario s=null;
//        String sql = "SELECT * FROM sanitario";
//        try {
//            ps = conectar().prepareStatement(sql);
//            rs = ps.executeQuery();
//            if(rs.next()){
//                s = new Sanitario(rs.getInt(1), 
//                        rs.getString(2), 
//                        rs.getString(3), 
//                        rs.getString(4), 
//                        rs.getString(5), 
//                        rs.getString(6), 
//                        rs.getString(7), 
//                        rs.getString(8),
//                        rs.getString(9),
//                        rs.getString(10),
//                        rs.getString(11)
//                );
//            }
//        } catch (SQLException e) {
//            System.out.println("Error al consultar medico ");
//        }
//        return s;
//    }
    public List<Prescripcion> listarPrescripciones(int idConsulta){
        List<Prescripcion> prescripciones = new ArrayList<>();
        
        String sql = "SELECT medicamento,cantidad,dosis,frecuencia FROM prescripciones p, tratamiento_paciente tp "
                + "WHERE ((tp.consulta_id=?) AND (tp.tratamiento_id=p.tratamiento_id))";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, idConsulta);
            rs = ps.executeQuery();
            while (rs.next()) {                
                Prescripcion pres = new Prescripcion(rs.getString("medicamento"), 
                        rs.getString("cantidad"),
                        rs.getString("dosis"), 
                        rs.getString("frecuencia"), 0);
                prescripciones.add(pres);
            }
            System.out.println("Datos de tratamientos encontrados");
            conectar().close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        
        return prescripciones;
    }

}
