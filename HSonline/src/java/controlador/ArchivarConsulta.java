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
import modelo.ConsultaDAO;
import modelo.HC;

/**
 *
 * @author Skyroot
 */
public class ArchivarConsulta extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ArchivarConsulta</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ArchivarConsulta at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String consultasId[] = request.getParameterValues("codConsulta");
        String pacientesId[] = request.getParameterValues("codPaciente");
        int medico = Integer.parseInt(request.getParameter("mId"));
        //eliminar consulta
        int resp =0;
        ConsultaDAO cdao = new ConsultaDAO();
        for (int i = 0; i < consultasId.length; i++) {
            HC hc = new HC();
            cdao.cabiarEstado(Integer.parseInt(consultasId[i]), "archivado");
            resp = hc.archivarConsulta(Integer.parseInt(pacientesId[i]), Integer.parseInt(consultasId[i]),medico);

        }
        if (resp != 0) {
            response.sendRedirect("Controlador?menu=Consultas&accion=Archivar&r=OK&num="+consultasId.length+"&page=1");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
