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
import modelo.Cita;
import modelo.CitaDAO;

/**
 *
 * @author Skyroot
 */
public class EditarSolicitud extends HttpServlet {

    Cita c = new Cita();
    CitaDAO cdao = new CitaDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditarSolicitud</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditarSolicitud at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        if (request.getParameter("accion") != null) {
            int id = Integer.parseInt(request.getParameter("cod"));
            String nombre = request.getParameter("nombre");
            String motivo = request.getParameter("motiv");
            String servicio = request.getParameter("serv");
            String fechaIni = request.getParameter("fechaInicio");
            String fechaFin = request.getParameter("fechaFin");
            String medico = request.getParameter("medico");
            
            c.setCodigo(id);
            c.setNombre(nombre);
            c.setMotivo(motivo);
            c.setServicio(servicio);
            c.setFecha_inicio(fechaIni);
            c.setFecha_fin(fechaFin);
            c.setMedico(medico);
            c.setEstado("OK");
            
            if (fechaIni.equals("") || fechaFin.equals("") || medico.equals("")) {
                request.setAttribute("estado", "<h3 style='color:red'>Error. Rellene los campos vacios</h3>");
                request.setAttribute("solicitud", c);
                request.getRequestDispatcher("CtrlCitas?menu=Citas&accion=editar&id="+id).forward(request, response);
            }else{
                cdao.agendarSolicitud(c);
//                request.setAttribute("estado", "<h3 style='color:green'>Cita agendada con exito!</h3>");
                response.sendRedirect("CtrlCitas?menu=Citas&accion=nc&page=1&r=OK");
            }
        }
        
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
