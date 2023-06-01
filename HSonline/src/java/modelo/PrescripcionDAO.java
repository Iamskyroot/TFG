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
public class PrescripcionDAO extends Conexion {

    private PreparedStatement ps = null;

    public int insertarPrescripcion(String enf, String cat, List<Prescripcion> listaP) {

        String sql = "INSERT INTO prescripciones(enfermedad,categoria,medicamento,cantidad,dosis,frecuencia,tratamiento_id) VALUES(?,?,?,?,?,?,?)";
        try {
            ps = conectar().prepareStatement(sql);
            for (Prescripcion p : listaP) {
                ps.setObject(1, enf);
                ps.setObject(2, cat);
                ps.setObject(3, p.getMedicamento());
                ps.setObject(4, p.getCantidad());
                ps.setObject(5, p.getDosis());
                ps.setObject(6, p.getFrecuencia());
                ps.setObject(7, p.getTratamiento_id());
                ps.execute();

            }
            System.out.println("Se han insertado " + listaP.size() + " prescripciones");
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al insertar prescripciones " + e.getMessage());
            return 0;
        }
        return listaP.size();
    }

    public List<Prescripcion> listarPrescripciones(int id) {
        List<Prescripcion> p = new ArrayList<>();

        String sql = "SELECT * FROM prescripciones WHERE idTratamiento=?";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Prescripcion pres = new Prescripcion(
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5), rs.getInt(6));
                if (id == rs.getInt(1)) {

                    p.add(pres);
                }
            }
            System.out.println("Datos de tratamientos encontrados");
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al listar prescripciones " + e.getMessage());
        }

        return p;
    }

    public boolean editarPrescripcion(String med, String cant, String dos, String fr, String cat, String id) {

        String sql = "UPDATE prescripciones SET medicamento=?,cantidad=?,dosis=?,frecuencia=?,categoria=? WHERE idPrescripcion=?";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, med);
            ps.setObject(2, cant);
            ps.setObject(3, dos);
            ps.setObject(4, fr);
            ps.setObject(5, cat);
            ps.setObject(6, id);

            ps.execute();
            System.out.println("Prescripcion actualizado con exito");
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al actualizar prescripcion " + e.getMessage());
            return false;
        }

        return true;
    }
    public boolean eliminarPrescripcion(String id) {

        String sql = "DELETE FROM prescripciones WHERE idPrescripcion=?";
        try {
            ps = conectar().prepareStatement(sql);
            ps.setObject(1, id);

            ps.execute();
            System.out.println("Prescripcion eliminada con exito");
            conectar().close();
        } catch (SQLException e) {
            System.out.println("Error al eliminar prescripcion " + e.getMessage());
            return false;
        }

        return true;
    }

}
