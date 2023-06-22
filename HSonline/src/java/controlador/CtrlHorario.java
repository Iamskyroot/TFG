/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.HorarioDAO;

/**
 *
 * @author Skyroot
 */
public class CtrlHorario extends HttpServlet {

    HorarioDAO hdao = new HorarioDAO();
    String estado = "", alert = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int page = 1;
        int filasPorPagina = 15;

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        if (menu.equalsIgnoreCase("Horario")) {

            switch (accion) {
                case "Listar":
                    if (request.getParameter("page") != null) {
                        List horario = hdao.listar((page - 1) * filasPorPagina, filasPorPagina);
                        request.setAttribute("horarios", horario);
                        int noFilas = hdao.getNumFilas();
                        int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
                        request.setAttribute("noPag", noPaginas);
                        request.setAttribute("pagActual", page);
                        request.setAttribute("noFilas", noFilas);
                        request.setAttribute("estado", "<h3 style='color:green'>Gestion de horarios</h3>");
                    }

                    request.getRequestDispatcher("vista/gestion_horarios.jsp").forward(request, response);

                    break;
                case "editar":
                    String resp = request.getParameter("r");
                    if (resp.equals("OK")) {
                        List horario = hdao.listar((page - 1) * filasPorPagina, filasPorPagina);
                        request.setAttribute("horarios", horario);
                        int noFilas = hdao.getNumFilas();
                        int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
                        request.setAttribute("noPag", noPaginas);
                        request.setAttribute("pagActual", page);
                        request.setAttribute("noFilas", noFilas);
                        request.setAttribute("estado", "<h3 style='color:green'>Gestion de horarios</h3>");
                        estado = "Datos guardados con exito";
                        alert = "<div class='alert alert-success animate'>"
                                + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                                + "<p><strong>Info!</strong> " + estado + "</p>"
                                + "</div>";
                        request.setAttribute("alert", alert);

                    } else {
                        List horario = hdao.listar((page - 1) * filasPorPagina, filasPorPagina);
                        request.setAttribute("horarios", horario);
                        int noFilas = hdao.getNumFilas();
                        int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
                        request.setAttribute("noPag", noPaginas);
                        request.setAttribute("pagActual", page);
                        request.setAttribute("noFilas", noFilas);
                        request.setAttribute("estado", "<h3 style='color:green'>Gestion de horarios</h3>");
                        estado = "No se pudo guardar los datos";
                        alert = "<div class='alert alert-danger animate'>"
                                + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                                + "<p><strong>Error!</strong> " + estado + "</p>"
                                + "</div>";
                        request.setAttribute("alert", alert);
                    }
                    request.getRequestDispatcher("vista/gestion_horarios.jsp").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
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
