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
import modelo.ConsultaDAO;
import modelo.Hospitalizacion;
import modelo.Paciente;
import modelo.PacienteConsultaDAO;
import modelo.PacienteDAO;
import modelo.Sanitario;
import modelo.Usuario;

/**
 *
 * @author Skyroot
 */
public class RegistrarPaciente extends HttpServlet {

    PacienteDAO pdao = new PacienteDAO();
    Paciente p = new Paciente();
    Usuario usu = new Usuario();

    String estado = "", error = "", alert = "<div id='alert_error' class='closealert warning animate'>"
            + "<span onclick='closeAlert()' class='closebtn'>&times;</span>"
            + "<p>" + error + " " + estado + "</p>"
            + "</div>";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegistrarPaciente</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistrarPaciente at " + request.getContextPath() + "</h1>");
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String sexo = request.getParameter("sexo");
        String documento = request.getParameter("doc");
        String direccion = request.getParameter("dir");
        String telefono = request.getParameter("tel");
        String usuario = request.getParameter("user");
        String passw = request.getParameter("psw");

        if (request.getParameter("accion") != null) {
            String accion = request.getParameter("accion");

            p.setNombre(nombre);
            p.setEdad(edad);
            p.setSexo(sexo);
            p.setDocumento(documento);
            p.setDireccion(direccion);
            p.setTelefono(telefono);
            p.setUsuario(usuario);
            p.setContrasena(passw);

//            Paciente p = new Paciente(nombre, Integer.parseInt(edad), sexo, documento, direccion, telefono);
            if (accion.equalsIgnoreCase("Guardar")) {
                if (!pdao.existePaciente(documento)) {

                    pdao.guardarPaciente2(p);

//                estado = "Datos guardados con exito";
//                alert = "<div id='alert_error' class='alert success animate'>"
//                        + "<span onclick='closeAlert()' class='closealert'>&times;</span>"
//                        + "<p>" + estado + "</p>"
//                        + "</div>";
//                request.setAttribute("alert", alert);
                    response.sendRedirect("Controlador?menu=Pacientes&accion=Listar&page=1&r=OK");
//                request.getRequestDispatcher("Controlador?menu=Interconsulta&accion=Registro").forward(request, response);

                } else {

                    error = "El paciente ya esta registrado en el sistema.";
//                alert = "<div id='alert_error' class='alert warning animate'>"
//                        + "<span onclick='closeAlert()' class='closealert'>&times;</span>"
//                        + "<p>" + error + "</p>"
//                        + "</div>";
//                request.setAttribute("paciente", p);
//                request.setAttribute("alert", alert);
//                //pcdao.datosPacienteConsulta(0, 0)
//                request.getRequestDispatcher("Controlador?menu=Interconsulta&accion=Registro").forward(request, response);
                    response.sendRedirect("Controlador?menu=Pacientes&accion=Listar&page=1&r=" + error);
                }
            } else if (accion.equalsIgnoreCase("Actualizar")) {
                p.setCodigo(Integer.parseInt(request.getParameter("idPaci")));
                pdao.actualizarPaciente(p);
                response.sendRedirect("Controlador?menu=Pacientes&accion=Listar&page=1&r=OK");
            } else {
                error = "Error al actualizar paciente";
                response.sendRedirect("Controlador?menu=Pacientes&accion=Listar&page=1&r=" + error);
            }

//            error = "No se pudo realizar la operacion";
//            response.sendRedirect("Controlador?menu=Pacientes&accion=Listar&page=1");
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
    }
// </editor-fold>

}
