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
import modelo.SanitarioDAO;

/**
 *
 * @author Skyroot
 */
public class CtrlDoctores extends HttpServlet {

    SanitarioDAO sdao = new SanitarioDAO();

    private int page = 1;
    private int filasPorPagina = 10;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        String estado = "", alert = "";

        if (menu.equalsIgnoreCase("Doctores")) {
            List sanitarios = sdao.listarSanitarios((page - 1) * filasPorPagina, filasPorPagina);
            switch (accion) {
                case "Listar":
                    if (request.getParameter("page") != null) {
                        page = Integer.parseInt(request.getParameter("page"));
                        String resp = request.getParameter("r");
                        if (resp != null && resp.equals("OK")) {
                            int noFilas = sdao.getNumeroFilas();
                            int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
                            request.setAttribute("datos", sanitarios);
                            request.setAttribute("noPag", noPaginas);
                            request.setAttribute("pagActual", page);
                            request.setAttribute("noFilas", noFilas);
                            estado = "Datos guardados con exito";
                            alert = "<div class='alert alert-success animate'>"
                                    + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                                    + "<p><strong>Info!</strong> " + estado + "</p>"
                                    + "</div>";
                            request.setAttribute("alert", alert);
                        } else {

                            int noFilas = sdao.getNumeroFilas();
                            int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
                            request.setAttribute("datos", sanitarios);
                            request.setAttribute("noPag", noPaginas);
                            request.setAttribute("pagActual", page);
                            request.setAttribute("noFilas", noFilas);
                        }
                        request.setAttribute("estado", "<h3 style='color:green'>Lista de personal sanitario</h3>");
                        request.getRequestDispatcher("vista/gestion_doctores.jsp").forward(request, response);
                    }
                    break;
                case "Editar":

                    if (request.getParameter("page") != null) {
                        page = Integer.parseInt(request.getParameter("page"));

                        if (request.getParameter("r").equals("OK")) {
                            int noFilas = sdao.getNumeroFilas();
                            int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
                            request.setAttribute("datos", sanitarios);
                            request.setAttribute("noPag", noPaginas);
                            request.setAttribute("pagActual", page);
                            request.setAttribute("noFilas", noFilas);
                            estado = "Datos guardados con exito";
                            alert = "<div class='alert alert-success animate'>"
                                    + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                                    + "<p><strong>Info!</strong> " + estado + "</p>"
                                    + "</div>";
                            request.setAttribute("alert", alert);
                        } else {

                            int noFilas = sdao.getNumeroFilas();
                            int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
                            request.setAttribute("datos", sanitarios);
                            request.setAttribute("noPag", noPaginas);
                            request.setAttribute("pagActual", page);
                            request.setAttribute("noFilas", noFilas);
                        }
                    }
                    request.setAttribute("estado", "<h3 style='color:green'>Lista de personal sanitario</h3>");

                    request.getRequestDispatcher("vista/editar_doctor.jsp").forward(request, response);
                    break;
                case "Detalle":
                    String id = request.getParameter("id");
//                    sdao.getSanitario(id);
                    request.setAttribute("sanitario", sdao.getSanitario(id));
                    request.getRequestDispatcher("vista/perfil3.jsp").forward(request, response);
                    break;
            }

        }
        if (menu.equalsIgnoreCase("Horarios")) {
            request.getRequestDispatcher("vista/gestion_horarios.jsp").forward(request, response);
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
