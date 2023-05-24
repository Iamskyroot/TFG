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
import modelo.Sanitario;
import modelo.SanitarioDAO;

/**
 *
 * @author Skyroot
 */
public class RegistrarSanitario extends HttpServlet {
    SanitarioDAO sdao = new SanitarioDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("accion") != null) {

            String nom = request.getParameter("nombre");
            String sexo = request.getParameter("sexo");
            String nacion = request.getParameter("nacion");
            String doc = request.getParameter("doc");
            String dir = request.getParameter("dir");
            String tel = request.getParameter("tel");
            String email = request.getParameter("email");
            String especialidad = request.getParameter("espe");
            String user = request.getParameter("user");
            String passw = request.getParameter("passw");
            Sanitario s = new Sanitario(0, nom, sexo, nacion, doc, especialidad, dir, tel, email, user, passw);

            String accion = request.getParameter("accion");
            switch (accion) {
                case "registro":

                    if (sdao.registrarSanitario(s)) {
                        response.sendRedirect("CtrlDoctores?menu=Doctores&accion=Listar&page=1&r=OK");
                    } else {
                        request.setAttribute("alert", "<h2 style='color:red'>Error al guardar datos</h2>");
                        request.getRequestDispatcher("CtrlDoctores?menu=Doctores&accion=Listar&page=1").forward(request, response);
                    }
                    break;
                case "edit":

                    if (sdao.actualizarSanitario(s)) {
                        response.sendRedirect("CtrlDoctores?menu=Doctores&accion=Editar&page=1&r=OK");
                    } else {
                        request.setAttribute("alert", "<h2 style='color:red'>Error al guardar datos</h2>");
                        request.getRequestDispatcher("CtrlDoctores?menu=Doctores&accion=Listar&page=1").forward(request, response);
                    }
                    break;
                case "horario":

                    Horario h = new Horario();
                    h.setSanitatio_id(Integer.parseInt(request.getParameter("idSan")));
                    h.setInicio(request.getParameter("inicio"));
                    h.setDia(request.getParameter("dia"));
                    h.setFin(request.getParameter("fin"));
                    if (sdao.asignarHorario(h)) {
                        response.sendRedirect("CtrlDoctores?menu=Doctores&accion=Listar&page=1&r=OK");
                    } else {
                        request.setAttribute("alert", "<h2 style='color:red'>Error al guardar datos</h2>");
                        request.getRequestDispatcher("CtrlDoctores?menu=Doctores&accion=Listar&page=1").forward(request, response);
                    }
                    break;
                default:
                    throw new AssertionError();
            }
        }
    }

    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
