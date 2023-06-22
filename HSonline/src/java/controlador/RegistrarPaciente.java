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
import modelo.Consulta;
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

//        String motivo = request.getParameter("motivo");
//        double altura = Double.parseDouble(request.getParameter("altura"));
//        double peso = Double.parseDouble(request.getParameter("peso"));
//        double temp = Double.parseDouble(request.getParameter("temperatura"));
//        double tension = 0;
//        double pulso = 0;
//        if (request.getParameter("tension") != "") {
//            tension = Double.parseDouble(request.getParameter("tension"));
//        } else if (request.getParameter("pulso") != "") {
//            pulso = Double.parseDouble(request.getParameter("pulso"));
//        }
//        String prioridad = request.getParameter("estado");
//        String sintomas = request.getParameter("sintomas");
//        String s[] = request.getParameterValues("s");
//        String servicio = request.getParameter("servicio");
//
//        String datosSintomas = "";
//        for (String datos : s) {
//            datosSintomas += datos + ", ";
//        }
//        datosSintomas += sintomas;
        Consulta c = new Consulta();
        ConsultaDAO cdao = new ConsultaDAO();

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

                    if (pdao.guardarPaciente2(p)) {
//                        c.setMotivo(motivo);
//                        c.setAltura(altura);
//                        c.setPeso(peso);
//                        c.setTemperatura(temp);
//                        c.setTension(tension);
//                        c.setPulso(pulso);
//                        c.setSintomas(datosSintomas);
//                        c.setServicio(servicio);
//                        c.setEstado(prioridad);
                        response.sendRedirect("Controlador?menu=Pacientes&accion=Listar&page=1&r=OK");
                        /*if (cdao.registroTriaje(c, String.valueOf(p.getCodigo()))) {

                        } else {
                            error = "Error al guardar datos del triaje";
                            alert = "<div class='alert alert-warning animate'>"
                                    + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                                    + "<p><strong>Info!</strong> " + error + "</p>"
                                    + "</div>";
                            request.setAttribute("alert", alert);
                            request.getRequestDispatcher("Controlador?menu=Pacientes&accion=Listar&page=1").forward(request, response);
                        }*/
                    } else {
                        error = "No se pudo guardar los datos";
                        alert = "<div class='alert alert-warning animate'>"
                                + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                                + "<p><strong>Info!</strong> " + error + "</p>"
                                + "</div>";
                        request.setAttribute("alert", alert);
                        request.getRequestDispatcher("Controlador?menu=Pacientes&accion=Listar&page=1").forward(request, response);
                    }

                } else {
                    error = "El paciente con el documento " + documento + " ya existe";
                    alert = "<div class='alert alert-warning animate'>"
                            + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                            + "<p><strong>Info!</strong> " + error + "</p>"
                            + "</div>";
                    request.setAttribute("alert", alert);
                    request.getRequestDispatcher("Controlador?menu=Pacientes&accion=Listar&page=1").forward(request, response);
                }

            }
            if (accion.equalsIgnoreCase("Actualizar")) {
                p.setCodigo(Integer.parseInt(request.getParameter("idPaci")));
                if (pdao.actualizarPaciente(p)) {
                    response.sendRedirect("Controlador?menu=Pacientes&accion=Listar&page=1&r=OK");
                } else {
                    error = "No se pudo actualizar los datos";
                    alert = "<div class='alert alert-warning animate'>"
                            + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                            + "<p><strong>Info!</strong> " + error + "</p>"
                            + "</div>";
                    request.setAttribute("alert", alert);
                    request.getRequestDispatcher("Controlador?menu=Pacientes&accion=Listar&page=1").forward(request, response);
                }
            }

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
// </editor-fold>

}
