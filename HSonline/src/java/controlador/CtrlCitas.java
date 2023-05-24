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
import modelo.Cita;
import modelo.CitaDAO;

/**
 *
 * @author Skyroot
 */
public class CtrlCitas extends HttpServlet {

    Cita c = new Cita();
    CitaDAO cdao = new CitaDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int page = 1;
        int filasPorPagina = 10;

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if (menu.equalsIgnoreCase("Citas")) {
            switch (accion) {
                case "listar":
                    if (request.getParameter("page") != null) {
                        request.setAttribute("estado", "<h3 style='color:green'>Gestion de citas</h3>");
                        page = Integer.parseInt(request.getParameter("page"));
                        List<Cita> citas = cdao.listarCitas((page - 1) * filasPorPagina, filasPorPagina);
                        int noFilas = cdao.getNumeroFilas();
                        int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
                        request.setAttribute("citas", citas);
                        request.setAttribute("noPag", noPaginas);
                        request.setAttribute("pagActual", page);
                        request.setAttribute("noFilas", noFilas);
//                        request.setAttribute("pruebas", cdao.pruebasOrdenadas());
                    }
                    request.getRequestDispatcher("vista/gestion_citas.jsp").forward(request, response);
                    break;

                case "editar":

                    String id = request.getParameter("id");
                    request.setAttribute("solicitud", cdao.getSolicitud(id));
                    request.getRequestDispatcher("vista/editar_solicitud.jsp").forward(request, response);
                    break;
                case "nc":

                    String resp = request.getParameter("r");
                    switch (resp) {
                        case "OK": {
                            request.setAttribute("estado", "<h3 style='color:green'>Datos guardados con exito!</h3>");
                            page = Integer.parseInt(request.getParameter("page"));
                            List<Cita> citas = cdao.listarCitas((page - 1) * filasPorPagina, filasPorPagina);
                            int noFilas = cdao.getNumeroFilas();
                            int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
                            request.setAttribute("citas", citas);
                            request.setAttribute("noPag", noPaginas);
                            request.setAttribute("pagActual", page);
                            request.setAttribute("noFilas", noFilas);
                            break;
                        }
                        case "errorCampos": {
                            request.setAttribute("estado", "<h3 style='color:red'>Error. Completa todos los campos obligatorios</h3>");
                            page = Integer.parseInt(request.getParameter("page"));
                            List<Cita> citas = cdao.listarCitas((page - 1) * filasPorPagina, filasPorPagina);
                            int noFilas = cdao.getNumeroFilas();
                            int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
                            request.setAttribute("citas", citas);
                            request.setAttribute("noPag", noPaginas);
                            request.setAttribute("pagActual", page);
                            request.setAttribute("noFilas", noFilas);
                            break;
                        }
                        default: {
                            request.setAttribute("estado", "<h3 style='color:red'>Error al guardar datos</h3>");
                            page = Integer.parseInt(request.getParameter("page"));
                            List<Cita> citas = cdao.listarCitas((page - 1) * filasPorPagina, filasPorPagina);
                            int noFilas = cdao.getNumeroFilas();
                            int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
                            request.setAttribute("citas", citas);
                            request.setAttribute("noPag", noPaginas);
                            request.setAttribute("pagActual", page);
                            request.setAttribute("noFilas", noFilas);
                            break;
                        }
                    }
                    request.getRequestDispatcher("vista/gestion_citas.jsp").forward(request, response);
                    break;

                default:
                    throw new AssertionError();
            }

        }
        
        if (menu.equals("Agenda")) {
            request.setAttribute("estado", "<h3 style='color:green'>Agenda de citas.</h3>");
            request.getRequestDispatcher("vista/agenda.jsp").forward(request, response);
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
