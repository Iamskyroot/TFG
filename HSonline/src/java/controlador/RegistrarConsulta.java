/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Consulta;
import modelo.ConsultaDAO;
import modelo.PacienteDAO;
import modelo.Sanitario;

/**
 *
 * @author Skyroot
 */
public class RegistrarConsulta extends HttpServlet {

    PacienteDAO pdao = new PacienteDAO();
    ConsultaDAO cdao = new ConsultaDAO();
    Sanitario sanitario = new Sanitario();
    String estado = "", error = "", alert = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegistrarConsulta</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistrarConsulta at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    public String fecha() {

        LocalDateTime myDateObj = LocalDateTime.now();
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String formattedDate = myDateObj.format(myFormatObj);
        return formattedDate;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        if (request.getParameter("accion") != null) {

            sanitario = (Sanitario) session.getAttribute("usuario");

            String motivo = request.getParameter("motivo");
            double altura = Double.parseDouble(request.getParameter("altura"));
            double peso = Double.parseDouble(request.getParameter("peso"));
            double temp = Double.parseDouble(request.getParameter("temperatura"));
            String sintomas = request.getParameter("sintomas");

            String notas = request.getParameter("notas");

            String dianosticos = request.getParameter("dianostico");
//            String tratamiento = request.getParameter("tratamiento");
            String pacienteId = request.getParameter("id");

            String datosSintomas = "";
            String dPruebas = "";

            if (motivo.equals("Malestar") && (request.getParameterValues("s") == null && sintomas.isEmpty())) {

                error = "Seleccione los sintomas o rellene el campo otros sintomas";
//                alert = "<div id='alert_error' class='alert warning animate'>"
//                            + "<span onclick='closeAlert()' class='closealert'>&times;</span>"
//                            + "<p>" + error + "</p>"
//                            + "</div>";
//                request.setAttribute("alert", alert);
//                request.getRequestDispatcher("Controlador?menu=Pacientes&accion=nc").forward(request, response);
                response.sendRedirect("Controlador?menu=Pacientes&accion=Listar&page=1&r=" + error);

            } else if (request.getParameterValues("p") == null) {

                error = "Seleccione al menos una prueba";
//                alert = "<div id='alert_error' class='alert warning animate'>"
//                            + "<span onclick='closeAlert()' class='closealert'>&times;</span>"
//                            + "<p>" + error + "</p>"
//                            + "</div>";
//                request.setAttribute("alert", alert);
//                request.getRequestDispatcher("Controlador?menu=Pacientes&accion=nc").forward(request, response);
                response.sendRedirect("Controlador?menu=Pacientes&accion=Listar&page=1&r=" + error);

            } else {
                String s[] = request.getParameterValues("s");
                String pruebas[] = request.getParameterValues("p");
                for (String item : s) {
                    datosSintomas += item + ", ";
                }
                datosSintomas += sintomas;

                for (String prueba : pruebas) {
                    dPruebas += prueba + ", ";
                }

                Consulta c = new Consulta(Integer.parseInt(pacienteId), motivo, altura, peso, temp, datosSintomas, notas, dPruebas, dianosticos, fecha(), sanitario.getCodigo());
                if (cdao.guardarDatosConsulta(c, pacienteId)) {
                    cdao.obtenerUltimaConsulta();
                    for (String dato : pruebas) {
                        cdao.registrarPruebas(cdao.getCodigo_consulta(), dato, Integer.parseInt(pacienteId));
                    }
//                    estado = "Datos de consulta guardados con exito.";
//                    alert = "<div id='alert_error' class='alert success animate'>"
//                            + "<span onclick='closeAlert()' class='closealert'>&times;</span>"
//                            + "<p>" + estado + "</p>"
//                            + "</div>";
//                    request.setAttribute("alert", alert);
//                    request.getRequestDispatcher("Controlador?menu=Pacientes&accion=nc").forward(request, response);
                    response.sendRedirect("Controlador?menu=Pacientes&accion=Listar&page=1&r=OK");
                } else {
                    error = "Error al guardar informacion de consulta";
//                    alert = "<div id='alert_error' class='alert warning animate'>"
//                            + "<span onclick='closeAlert()' class='closealert'>&times;</span>"
//                            + "<p>" + error + "</p>"
//                            + "</div>";
//                    request.setAttribute("alert", alert);
//                    request.getRequestDispatcher("Controlador?menu=Pacientes&accion=nc").forward(request, response);
                    response.sendRedirect("Controlador?menu=Pacientes&accion=Listar&page=1&r=" + error);
                }

            }

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
