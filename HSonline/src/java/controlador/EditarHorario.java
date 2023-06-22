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
import modelo.Horario;
import modelo.HorarioDAO;
import modelo.SanitarioDAO;

/**
 *
 * @author Skyroot
 */
public class EditarHorario extends HttpServlet {

    HorarioDAO hdao = new HorarioDAO();
    Horario h = new Horario();
    SanitarioDAO sdao = new SanitarioDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String dia = request.getParameter("dia");
        String inicio = request.getParameter("inicio");
        String fin = request.getParameter("fin");

        if (request.getParameter("accion") != null) {
            String accion = request.getParameter("accion");
            if (accion.equals("edit")) {
                h.setCodigo(id);
                h.setDia(dia);
                h.setInicio(inicio);
                h.setFin(fin);
                if (hdao.editarHorario(h)) {
                    response.sendRedirect("Horario?menu=Horario&accion=editar&r=OK");
                } else {
                    response.sendRedirect("Horario?menu=Horario&accion=editar&r=error");
                }
            }
            
            if(accion.equals("new")){
                    h.setSanitatio_id(id);
                    h.setInicio(inicio);
                    h.setDia(dia);
                    h.setFin(fin);
                    if (sdao.asignarHorario(h)) {
                        response.sendRedirect("Horario?menu=Horario&accion=editar&r=OK");
                    } else {
                       response.sendRedirect("Horario?menu=Horario&accion=editar&r=error");
                    }
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
