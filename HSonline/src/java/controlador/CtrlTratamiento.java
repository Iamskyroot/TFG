/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Prescripcion;
import modelo.PrescripcionDAO;
import modelo.Tratamiento;
import modelo.TratamientoDAO;
import modelo.TratamientoPrescripcion;
import modelo.Usuario;

/**
 *
 * @author Skyroot
 */
public class CtrlTratamiento extends HttpServlet {

    TratamientoDAO tdao = new TratamientoDAO();
    PrescripcionDAO pdao = new PrescripcionDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<TratamientoPrescripcion> listaPrescripcions = new ArrayList<>();
        int page = 1;
        int filasPorPag = 10;

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        switch (menu) {
            case "Tratamiento":

                if (accion.equalsIgnoreCase("Listar")) {
                    page = Integer.parseInt(request.getParameter("page"));
                    listaPrescripcions = tdao.listarTratamientos((page - 1) * filasPorPag, filasPorPag);
                    int noFilas = tdao.getNumeroFilas();
                    int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPag);
                    request.setAttribute("datos", listaPrescripcions);
                    request.setAttribute("pagActual", page);
                    request.setAttribute("noPaginas", noPaginas);
                    request.setAttribute("total", noFilas);
                    request.setAttribute("estado", "<h3 style='color:green'>Lista de tratamientos</h3>");

                }
                if (accion.equalsIgnoreCase("Insertar")) {
                    String r = request.getParameter("r");
                    if (r.equals("OK")) {
                        request.setAttribute("estado", "<h3 style='color:green'>Tratamiento creado con éxito!</h3>");
                        request.setAttribute("datos", tdao.listarTratamientos((page - 1) * filasPorPag, filasPorPag));
                        int noFilas = tdao.getNumeroFilas();
                        int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPag);
                        request.setAttribute("pagActual", page);
                        request.setAttribute("noPaginas", noPaginas);
                        request.setAttribute("noFilas", noFilas);
                    }
                    if (r.equals("error")) {
                        request.setAttribute("estado", "<h3 style='color:red;text-align:center'>Error al crear tratamiento</h3>");
                    }
//                    request.setAttribute("p", pdao.listarPrescripciones(id));
                }

                if (accion.equals("edit")) {
                    String resp = request.getParameter("r");
                    request.setAttribute("datos", tdao.listarTratamientos((page - 1) * filasPorPag, filasPorPag));
                    int noFilas = tdao.getNumeroFilas();
                    int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPag);
                    request.setAttribute("pagActual", page);
                    request.setAttribute("noPaginas", noPaginas);
                    request.setAttribute("noFilas", noFilas);
                    if (resp.equals("OK")) {
                        request.setAttribute("estado", "<h3 style='color:green'>Datos modificados con éxito!</h3>");
                    } else {
                        request.setAttribute("estado", "<h3 style='color:red'>Error al modificar datos</h3>");
                    }
                }

                if (accion.equals("eliminar")) {
                    String id = request.getParameter("id");
                    if (pdao.eliminarPrescripcion(id)) {
                        request.setAttribute("datos", tdao.listarTratamientos((page - 1) * filasPorPag, filasPorPag));
                        int noFilas = tdao.getNumeroFilas();
                        int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPag);
                        request.setAttribute("pagActual", page);
                        request.setAttribute("noPaginas", noPaginas);
                        request.setAttribute("noFilas", noFilas);
                        request.setAttribute("estado", "<h3 style='color:green'>Datos eliminados con éxito!</h3>");
                    } else {
                        request.setAttribute("estado", "<h3 style='color:red'>Error al eliminar datos</h3>");
                    }
                }

                request.getRequestDispatcher("vista/gestion_tratamientos.jsp").forward(request, response);
                break;
            default:
                request.getRequestDispatcher("vista/gestion_tratamientos.jsp").forward(request, response);
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
