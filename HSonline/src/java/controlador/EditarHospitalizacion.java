/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
public class EditarHospitalizacion extends HttpServlet {

    HospitalizacionDAO hdao = new HospitalizacionDAO();

    public String fecha() {
        LocalDateTime myDateObj = LocalDateTime.now();
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String formattedDate = myDateObj.format(myFormatObj);
        return formattedDate;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        String accion = request.getParameter("accion");
        if (request.getParameter("accion") != null) {
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            String sala = request.getParameter("sala");
            int habitacion = Integer.parseInt(request.getParameter("habitacion"));
            int cama = Integer.parseInt(request.getParameter("cama"));
            String estado = request.getParameter("estado");

            if (estado.equalsIgnoreCase("alta")) {
                hdao.actualizarHospitalizacion(codigo, sala, habitacion, cama, estado, fecha());
            } else {
                hdao.actualizarHospitalizacion(codigo, sala, habitacion, cama, estado, null);
            }
            response.sendRedirect("CtrlHospitalizacion?menu=Hospitalizacion&accion=Editar&r=OK&page=1");
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
