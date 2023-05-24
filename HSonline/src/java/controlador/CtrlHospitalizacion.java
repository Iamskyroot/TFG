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
import modelo.Hospitalizacion;
import modelo.HospitalizacionDAO;

/**
 *
 * @author Skyroot
 */
public class CtrlHospitalizacion extends HttpServlet {

    HospitalizacionDAO hdao = new HospitalizacionDAO();
    private String estado = "", alert = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int page = 1;
        int filasPorPagina = 10;

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        switch (menu) {
            case "Hospitalizacion":
                if (accion.equalsIgnoreCase("Listar")) {

                    request.setAttribute("ingreso", hdao.listarHospitalizados((page - 1) * filasPorPagina, filasPorPagina));
                    int noFilas = hdao.getNumeroFilas();
                    int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
//                        request.setAttribute("consultas", consultas);
                    request.setAttribute("noPag", noPaginas);
                    request.setAttribute("pagActual", page);
                    request.setAttribute("noFilas", noFilas);
                    request.setAttribute("estado", "<h3 style='green'>Lista de hospitalizaciones</h3>");
                    //response.sendRedirect("vista/gestion_hospitalizacion.jsp");
                }
                if (accion.equalsIgnoreCase("Editar")) {
//                    int paciente = Integer.parseInt(request.getParameter("paciente"));
//                    request.setAttribute("ingreso", hdao.listarHospitalizados((page - 1) * filasPorPagina, filasPorPagina));
//                    request.setAttribute("datos", hdao.buscarHospitalizado(paciente));
//                    int noFilas = hdao.getNumeroFilas();
//                    int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
//                    request.setAttribute("noPag", noPaginas);
//                    request.setAttribute("pagActual", page);
//                    request.setAttribute("noFilas", noFilas);
                    if (request.getParameter("r").equals("OK")) {
                        request.setAttribute("ingreso", hdao.listarHospitalizados((page - 1) * filasPorPagina, filasPorPagina));
                        int noFilas = hdao.getNumeroFilas();
                        int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
                        request.setAttribute("noPag", noPaginas);
                        request.setAttribute("pagActual", page);
                        request.setAttribute("noFilas", noFilas);
                        request.setAttribute("estado", "<h3 style='green'>Lista de hospitalizaciones</h3>");
                        estado = "Datos guardados con exito";
                        alert = "<div class='alert alert-success animate'>"
                                + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                                + "<p><strong>Info!</strong> " + estado + "</p>"
                                + "</div>";
                        request.setAttribute("alert", alert);
                    } else {
                        request.setAttribute("ingreso", hdao.listarHospitalizados((page - 1) * filasPorPagina, filasPorPagina));
                        int noFilas = hdao.getNumeroFilas();
                        int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
                        request.setAttribute("noPag", noPaginas);
                        request.setAttribute("pagActual", page);
                        request.setAttribute("noFilas", noFilas);
                        request.setAttribute("estado", "<h3 style='green'>Lista de hospitalizaciones</h3>");
                        estado = "Error al guardar datos";
                        alert = "<div class='alert alert-warning animate'>"
                                + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                                + "<p><strong>Info!</strong> " + estado + "</p>"
                                + "</div>";
                        request.setAttribute("alert", alert);
                    }
                }
//                if (accion.equalsIgnoreCase("Buscar")) {
//                    String datos = request.getParameter("datos");
//
//                    request.setAttribute("ingreso", hdao.busqueda(datos));
//                }
//                if (accion.equalsIgnoreCase("bp")) {
//                    String paciente = request.getParameter("codigo");
//                    request.setAttribute("ingreso", hdao.listarHospitalizados((page - 1) * filasPorPagina, filasPorPagina));
//                    request.setAttribute("datos", hdao.buscarHospitalizado(Integer.parseInt(paciente)));
//                    int noFilas = hdao.getNumeroFilas();
//                    int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
//                    request.setAttribute("noPag", noPaginas);
//                    request.setAttribute("pagActual", page);
//                    request.setAttribute("noFilas", noFilas);
//                }
                request.getRequestDispatcher("vista/gestion_hospitalizacion.jsp").forward(request, response);
                break;
            default:
                throw new AssertionError();
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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
