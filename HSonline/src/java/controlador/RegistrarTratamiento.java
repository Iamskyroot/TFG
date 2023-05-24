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
import modelo.Sanitario;
import modelo.Tratamiento;
import modelo.TratamientoDAO;
import modelo.Usuario;

/**
 *
 * @author Skyroot
 */
public class RegistrarTratamiento extends HttpServlet {

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
            out.println("<title>Servlet RegistrarTratamiento</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistrarTratamiento at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    TratamientoDAO tdao = new TratamientoDAO();
    PrescripcionDAO pdao = new PrescripcionDAO();
    Usuario usu = new Usuario();
    Sanitario sanitario;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Prescripcion> listaPres = new ArrayList<>();
        HttpSession session = request.getSession();

//        String accion = request.getParameter("accion");
        if (request.getParameter("accion") != null) {
            String enfermedad = request.getParameter("enfermedad");
            String tipo = request.getParameter("tipo");
            String med[] = request.getParameterValues("medicamento");
            String cant[] = request.getParameterValues("cantidad");
            String dosis[] = request.getParameterValues("dosis");
            String frec[] = request.getParameterValues("frecuencia");
            sanitario = (Sanitario) session.getAttribute("usuario");

            
                Tratamiento t = new Tratamiento();
                t.setEnfermedad(enfermedad);
                t.setCategoria(tipo);
                t.setMedico_id(sanitario.getCodigo());
                tdao.insertarTratamiento(t);
            for (int i = 0; i < med.length; i++) {
//                t.setEnfermedad(enfermedad)
                Prescripcion pres = new Prescripcion();
                pres.setMedicamento(med[i]);
                pres.setCantidad(cant[i]);
                pres.setDosis(dosis[i]);
                pres.setFrecuencia(frec[i]);
                pres.setTratamiento_id(t.getCodigo_tratamiento());
                listaPres.add(pres);
            }
            pdao.insertarPrescripcion(enfermedad,tipo,listaPres);
            response.sendRedirect("CtrlTratamiento?menu=Tratamiento&accion=Insertar&r=OK");
            

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
