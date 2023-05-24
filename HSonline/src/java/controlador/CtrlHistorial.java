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
import modelo.HC;
import modelo.PacienteConsultaDAO;
import modelo.SanitarioDAO;

/**
 *
 * @author Skyroot
 */
public class CtrlHistorial extends HttpServlet {

    PacienteConsultaDAO pcdao = new PacienteConsultaDAO();
    SanitarioDAO sdao = new SanitarioDAO();
    HC hc = new HC();
    private int page = 1;
    private int filasPorPagina = 10;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        if (menu.equalsIgnoreCase("Historial")) {

            switch (accion) {
                case "Listar":
                    if (request.getParameter("page") != null) {
                        List historias = hc.listarHC((page - 1) * filasPorPagina, filasPorPagina);
                        request.setAttribute("historias", historias);
                        int noFilas = hc.getNumeroFilas();
                        int noPaginas = (int) Math.ceil(noFilas * 1.0 / filasPorPagina);
                        request.setAttribute("noPag", noPaginas);
                        request.setAttribute("pagActual", page);
                        request.setAttribute("noFilas", noFilas);
                        request.setAttribute("estado", "<h3 style='color:green'>Lista de historias clinicas</h3>");
                    }

                    request.getRequestDispatcher("vista/hc.jsp").forward(request, response);

                    break;
                case "Mostrar":
                    String codPaciente = request.getParameter("codPaciente");
                    String codConsulta = request.getParameter("codConsulta");
                    String codMed = request.getParameter("mId");
                    String hId = request.getParameter("hId");

                    request.setAttribute("datos", pcdao.datosPacienteConsulta(Integer.parseInt(codPaciente), Integer.parseInt(codConsulta)));
                    request.setAttribute("sanitario", sdao.getSanitario(codMed));
                    request.setAttribute("prescripciones", pcdao.listarPrescripciones(Integer.parseInt(codConsulta)));
                    request.setAttribute("id", hId);
                    request.getRequestDispatcher("vista/detalles_hc.jsp").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }

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
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
