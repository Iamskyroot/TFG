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
import javax.servlet.http.HttpSession;
import modelo.Consulta;
import modelo.ConsultaDAO;
import modelo.Sanitario;

/**
 *
 * @author Skyroot
 */
public class AsignarPruebas extends HttpServlet {

    ConsultaDAO cdao = new ConsultaDAO();
    Sanitario sanitario = new Sanitario();
    String estado = "", error = "", alert = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        sanitario = (Sanitario) session.getAttribute("usuario");
        if (request.getParameter("accion") != null) {
            String codPaciente = request.getParameter("pId");
            String codConsulta = request.getParameter("cId");
            String sintomas = request.getParameter("sintomas");
            String notas = request.getParameter("notas");
            String p[] = request.getParameterValues("p");
            String pruebas = "";
            for (String data : p) {
                pruebas += data + ", ";
            }

            Consulta ct = new Consulta();
            ct.setCodigo(Integer.parseInt(codConsulta));
            ct.setSintomas(sintomas);
            ct.setPruebas(pruebas);
            ct.setNotas(notas);
            ct.setMedico_id(sanitario.getCodigo());
            if (cdao.guardarDatosConsulta(ct)) {
                if (request.getParameterValues("p") != null) {
                    for (String data : p) {
                        String prueba = data;
                        cdao.registrarPruebas(Integer.parseInt(codConsulta), prueba, Integer.parseInt(codPaciente));
                    }
                }
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
        processRequest(request, response);
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
