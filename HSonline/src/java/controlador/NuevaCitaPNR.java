/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cita;
import modelo.CitaDAO;
import modelo.Fecha;
import modelo.Paciente;
import modelo.PacienteDAO;

/**
 *
 * @author Skyroot
 */
public class NuevaCitaPNR extends HttpServlet {

    Cita c = new Cita();
    CitaDAO cdao = new CitaDAO();
    Fecha f = new Fecha();
    PacienteDAO pdao = new PacienteDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NuevaCitaPNR</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NuevaCitaPNR at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Paciente p = null;

        if (request.getParameter("accion") != null) {

            String nombre = request.getParameter("nombre");
            String edad = request.getParameter("edad");
            String sexo = request.getParameter("sexo");
            String documento = request.getParameter("doc");
            String direccion = request.getParameter("dir");
            String telefono = request.getParameter("tel");

            String usuario = request.getParameter("user");
            String contrasena = request.getParameter("passw");

            String motivo = request.getParameter("motivo");
            String servicio = request.getParameter("servicio");
            String notas = request.getParameter("notas");

            if (nombre.equals("") || edad.equals("") || sexo.equals("") || documento.equals("") || direccion.equals("")
                    || motivo.equals("") || servicio.equals("")) {
                response.sendRedirect("CtrlCitas?menu=Citas&accion=nc&page=1&r=errorCampos");
            } else {

                p = new Paciente(nombre, Integer.parseInt(edad), sexo, documento, direccion, telefono, usuario, contrasena);

                if (pdao.guardarPaciente2(p) == true && cdao.registrarCita(documento, nombre, motivo, servicio, notas, f.getFecha()) == true) {

                    response.sendRedirect("CtrlCitas?menu=Citas&accion=nc&page=1&r=OK");
                } else {
                    response.sendRedirect("CtrlCitas?menu=Citas&accion=nc&page=1&r=error");
                }
            }

        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
