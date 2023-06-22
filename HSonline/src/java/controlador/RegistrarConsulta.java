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

        String motivo = request.getParameter("motivo");
        double altura = Double.parseDouble(request.getParameter("altura"));
        double peso = Double.parseDouble(request.getParameter("peso"));
        double temp = Double.parseDouble(request.getParameter("temperatura"));
        double tension = 0;
        double pulso = 0;
        if (request.getParameter("tension") != "") {
            tension = Double.parseDouble(request.getParameter("tension"));
        } else if (request.getParameter("pulso") != "") {
            pulso = Double.parseDouble(request.getParameter("pulso"));
        }
        String prioridad = request.getParameter("estado");
        String sintomas = request.getParameter("sintomas");
        String s[] = request.getParameterValues("s");
        String servicio = request.getParameter("servicio");
        String pacienteId = request.getParameter("id");
        String datosSintomas = "";
        for (String datos : s) {
            datosSintomas += datos + ", ";
        }
        datosSintomas += sintomas;

        if (request.getParameter("accion") != null) {

            if (motivo.equals("Malestar") && (request.getParameterValues("estado") == null) || datosSintomas.equals("")) {

                error = "Error al guardar datos. No se completó el formulario.";
                alert = "<div class='alert alert-warning animate'>"
                        + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                        + "<p><strong>Info!</strong> " + error + "</p>"
                        + "</div>";
                request.setAttribute("alert", alert);
                request.getRequestDispatcher("Controlador?menu=Pacientes&accion=Listar&page=1&").forward(request, response);

            } else {

                Consulta c = new Consulta();
                c.setMotivo(motivo);
                c.setAltura(altura);
                c.setPeso(peso);
                c.setTemperatura(temp);
                c.setTension(tension);
                c.setPulso(pulso);
                c.setEstado(prioridad);
                c.setSintomas(datosSintomas);
                c.setServicio(servicio);
                c.setFecha_consulta(fecha());
                if (cdao.registroTriaje(c, pacienteId)) {

                    response.sendRedirect("Controlador?menu=Pacientes&accion=Listar&page=1&r=OK");
                } else {
                    error = "Error al guardar los datos";
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
    }// </editor-fold>

}
