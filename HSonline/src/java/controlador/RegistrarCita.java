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
public class RegistrarCita extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegistrarCita</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistrarCita at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PacienteDAO pdao = new PacienteDAO();
        CitaDAO cdao = new CitaDAO();
        Fecha f = new Fecha();
        Paciente p = new Paciente();

        if (request.getParameter("accion") != null) {

            String documento = request.getParameter("doc");
            String nombre = request.getParameter("nombre");
            String motivo = request.getParameter("motivo");
            String servicio = request.getParameter("servicio");
            String notas = request.getParameter("notas");

            if (cdao.registrarCita(documento,nombre, motivo, servicio, notas, f.getFecha())) {

                response.sendRedirect("Controlador?menu=Inicio&accion=sc&r=OK");
            } else {

                response.sendRedirect("Controlador?menu=Inicio&accion=sc&r=error");
            }
//            if (pdao.guardarPaciente(p)) {
//
//            } else {
//                response.sendRedirect("Controlador?menu=Inicio&accion=sc&r=error");
//            }

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
